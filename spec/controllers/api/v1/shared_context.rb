RSpec.shared_context 'Authenticated User', :shared_context => :metadata do
  let(:user) { create(:user) }

  before do
    request.headers.merge! user.create_new_auth_token
  end
end