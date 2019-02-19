module Api
  module V1
    class BookSuggestionsController < ApiController
      def create
        book_suggestion = BookSuggestion.create!(book_suggestion_params)
        render json: book_suggestion, status: :created
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion)
            .permit(:synopsis, :price, :author, :title, :link, :publisher, :year)
            .merge(user: current_user)
      end
    end
  end
end
