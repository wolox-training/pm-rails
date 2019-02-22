require 'rails_helper'

describe Api::V1::OpenLibraryController, type: :controller do
  describe 'GET #book' do
    context 'When looking for a non-existent book' do
      before do
        allow_any_instance_of(OpenLibrary)
            .to receive(:find_by_isbn)
            .and_return(JSON.parse(load_fixture('get_response_not_found')))

        get :book, params: { id: 'asdf' }
      end

      it 'responses with an error' do
        body = JSON.parse(response.body)
        expect(body['error']).to eq 'Record not found with id asdf'
      end

      it 'responds with 404 status' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'When looking for an existent book' do
      before do
        allow_any_instance_of(OpenLibrary)
            .to receive(:find_by_isbn)
                    .and_return(JSON.parse(load_fixture('remote_response_success')))
        get :book, params: { id: '0385472579' }
      end

      it 'responses with the book json' do
        body = JSON.parse(response.body)
        expect(body['isbn']).to eq '0385472579'
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  def load_fixture(file_name)
    File.read(Rails.root.join('spec', 'support', 'fixtures', 'open_library', "#{file_name}.json"))
  end
end
