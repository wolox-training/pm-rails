module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_user!

      def index
        render json: Book.all
      end

      def show
        book = Book.find params[:id]
        render json: book
      end
    end
  end
end
