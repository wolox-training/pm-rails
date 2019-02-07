require 'rails_helper'
# require 'shared_context'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  # describe 'GET #index' do
  #   context 'When fetching all the users rents' do
  #     let!(:rents) { create_list(:rent, 3, user: user) }
  #
  #     before do
  #       get :index, params: { id: user.id }
  #     end
  #
  #     it 'responses with the users rents json' do
  #       expected = ActiveModel::Serializer::CollectionSerializer.new(
  #           rents, each_serializer: RentSerializer
  #       ).to_json
  #       expect(response_body.to_json) =~ JSON.parse(expected)
  #     end
  #
  #     it 'responds with 200 status' do
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  # end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response_body.to_json).to eq BookSerializer.new(
            rent, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end