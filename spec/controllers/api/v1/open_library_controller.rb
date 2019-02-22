require 'rails_helper'

describe Api::V1::OpenLibraryController, type: :controller do
  # describe 'GET #book' do
  #   context 'When fetching a book from open library' do
  #     before do
  #       stubbed_service = instance_double(OpenLibrary)
  #       allow(stubbed_service).to receive('find_by_isbn').and_return(JSON.parse('{}'))
  #       get :book
  #     end
  #
  #     # it 'responses with the book json' do
  #     #   expect(response.body).to eq JSON.parse('{}')
  #     # end
  #
  #     it 'responds with 200 status' do
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  # end

  describe 'GET #book' do
    context 'When looking for a non-existent book' do
      before { get :book, params: { id: 'asdf' } }

      it 'responses with an error' do
        body = JSON.parse(response.body)
        expect(body['error']).to eq 'Book not found at OpenLibrary'
      end

      it 'responds with 404 status' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'When looking for an existent book' do
      before { get :book, params: { id: '0385472579' } }

      it 'responses with the book json' do
        body = JSON.parse(response.body)
        expect(body['isbn']).to eq '0385472579'
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
