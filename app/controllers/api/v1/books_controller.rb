class Api::V1::BooksController < Api::V1::BaseController
  def index
    return render status: 200, json: {status: 'Ok', data: 'This is the INDEX method'}
  end

  def show
    return render status: 200, json: {status: 'Ok', data: 'This is the SHOW method'}
  end
end
