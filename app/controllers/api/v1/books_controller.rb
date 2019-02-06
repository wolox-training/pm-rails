class Api::V1::BooksController < Api::V1::BaseController
  before_action :load_book, only: :show

  def index
    books = Book.all

    return render json: books, each_serializer: BookSerializer
  end

  def show
    return head 404 unless @book
    return render json: @book, serializer: BookSerializer
  end

  private
  def load_book
    @book = Book.find_by_id params[:id]
  end
end
