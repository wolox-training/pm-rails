describe OpenLibrarySpec do
  it 'makes an external request' do
    expect(WebMock).to(have_requested(:method, path).with(body/query))
  end
end
