require 'rails_helper'

RSpec.describe 'Postcode Entry Point', type: :request do
  it 'redirects to a single address where appropriate' do
    address = FactoryGirl.create(:address)

    get "/postcode/#{address.postcode.to_url}.json"

    expect(response).to redirect_to("/addresses/#{address.id}.json")
  end
end
