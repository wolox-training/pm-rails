require 'sidekiq/web'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  api_version(module: 'api/v1', path: { value: 'api/v1' }) do
    resources :books, only: [:index, :show]
    resources :users, only: :rents do
      resources :rents, only: [:index, :create]
    end
    resources :book_suggestions, only: :create
    get 'open_library/books/:id', to: 'open_library#book'
  end

  mount Sidekiq::Web, at: "/sidekiq"
end
