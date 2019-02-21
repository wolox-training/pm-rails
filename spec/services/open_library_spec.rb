require 'rails_helper'

describe OpenLibrary do
  before do
    stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data')
        .to_return(
            status: 200,
            body: load_fixture('get_response_success'),
            headers: { 'Content-Type': 'application/json' }
        )

    stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579abc&format=json&jscmd=data')
        .to_return(
            status: 200,
            body: load_fixture('get_response_not_found'),
            headers: { 'Content-Type': 'application/json' }
        )
  end

  it 'gets a book from open library' do
    response = OpenLibrary.new.find_by_isbn('0385472579')
    expect(response).equal?(load_fixture('get_response_success'))
  end

  it 'gets a book not found error from open library' do
    response = OpenLibrary.new.find_by_isbn('0385472579abc')
  rescue OpenLibraryException
  end

  def load_fixture(file_name)
    File.read(Rails.root.join('spec', 'support', 'fixtures', 'open_library', "#{file_name}.json"))
  end
end
