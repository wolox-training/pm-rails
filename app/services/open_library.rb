class OpenLibrary
  include HTTParty

  base_uri 'https://openlibrary.org/api'

  def initialize
    @options = { query: { format: 'json', jscmd: 'data' } }
  end

  def find_by_isbn(isbn)
    @options[:query][:bibkeys] = "ISBN:#{isbn}"
    response = self.class.get('/books', @options)
    json = JSON.parse(response.body)

    raise OpenLibraryException.new if json.blank?

    json
  end
end
