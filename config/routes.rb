Rails.application.routes.draw do
  api_version(module: 'api/v1', path: { value: 'api/v1' }) do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :books, only: [:index, :show]
  end
end
