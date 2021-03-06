require 'rails_helper'
require 'support/shared_contexts/authenticated_user_context.rb'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before { get :index }

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
            books, each_serializer: BookSerializer
        ).to_json
        expect(response.body) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before { get :show, params: { id: book.id } }

      it 'responses with the book json' do
        expect(response.body).to eq BookSerializer.new(book).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
