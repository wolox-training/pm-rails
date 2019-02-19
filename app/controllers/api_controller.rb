class ApiController < ApplicationController
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from OpenLibraryException, with: :open_library_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  private

  def not_found
    render json: { error: "Record not found with id #{params[:id]}" }, status: :not_found
  end

  def open_library_not_found
    render json: { error: "Book not found at OpenLibrary" }, status: :not_found
  end
  
  def invalid_record
    render json: { error: "Record is invalid" }, status: :unprocessable_entity
  end
end
