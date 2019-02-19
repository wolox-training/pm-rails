def get_request_success
  stub_request(:path, path)
      .to_return(
          status: code,
          body: File.read('./spec/support/fixtures/get_response_success.json'),
          headers: { 'Content-Type': 'application/json' }
      )
end

def get_request_not_found
  stub_request(:path, path)
      .to_return(
          status: code,
          body: File.read('./spec/support/fixtures/get_response_not_found.json'),
          headers: { 'Content-Type': 'application/json' }
      )
end
