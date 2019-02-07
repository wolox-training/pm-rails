module Api
  class ApiController < ApplicationController
    respond_to :json
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def not_found
      render json: { error: "Record not found with id #{params[:id]}" }, status: :not_found
    end
  end
end
