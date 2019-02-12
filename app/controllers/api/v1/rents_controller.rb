module Api
  module V1
    class RentsController < Api::V1::BaseController
      before_action :set_user, only: %i[index create]

      def index
        render json: @user.rents.all
      end

      def create
        rent = @user.rents.create!(rent_params)
        render json: rent
      end

      private

      def rent_params
        params.permit(:book_id, :start_date, :end_date)
      end

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
