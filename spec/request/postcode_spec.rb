require 'rails_helper'

RSpec.describe 'Postcode Entry Point', type: :request do
  it 'redirects to a single address where appropriate' do
    address = FactoryGirl.create(:address)

    get "/postcode/#{address.postcode.to_url}.json"

    expect(response).to redirect_to("/addresses/#{address.id}.json")
  end

  it 'redirects to multiple address where appropriate' do
    1.upto(5) do |i|
      FactoryGirl.create(:address, sao: i)
    end

    FactoryGirl.create(:address, postcode: 'SW1A 1AA')

    get "/postcode/#{Address.first.postcode.to_url}.json"

    json = JSON.parse(response.body)
    expect(json['addresses'].count).to eq(5)
  end
end
