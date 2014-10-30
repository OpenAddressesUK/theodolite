require 'rails_helper'

RSpec.describe AddressController, :type => :controller do
  describe 'GET #show' do
    it 'responds successfully' do
      get '/toytown/toyville/toy-123/toy-street/123/flat-1'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
