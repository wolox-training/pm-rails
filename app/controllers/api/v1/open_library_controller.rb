module Api
  module V1
    class OpenLibraryController < ApiController
      def book
        ol = OpenLibrary.new
        result = ol.find_by_isbn(params[:id])

        raise ActiveRecord::RecordNotFound if result == {}

        data = result[result.keys.first]

        book = {
            isbn: data['identifiers']['isbn_10'].first,
            title: data['title'],
            subtitle: data['subtitle'],
            number_of_pages: data['number_of_pages'],
            authors: data['authors'].collect{|v| v['name']}
        }

        render json: book
      end
    end
  end
end
