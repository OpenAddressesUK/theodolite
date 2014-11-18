require 'rails_helper'

RSpec.describe 'Postcode Entry Point', type: :request do
  it 'redirects to a single address where appropriate' do
    address = FactoryGirl.create(:address)

    get "/postcode/#{address.postcode.name.to_url}.json"

    expect(response).to redirect_to("/addresses/#{address.token}.json")
  end

  it 'redirects to multiple address where appropriate' do
    1.upto(5) do |i|
      FactoryGirl.create(:address, sao: i)
    end

    FactoryGirl.create(:address, postcode: FactoryGirl.create(:postcode, name: 'SW1A 1AA'))

    get "/postcode/#{Address.first.postcode.name.to_url}.json"

    json = JSON.parse(response.body)
    expect(json['addresses'].count).to eq(5)
  end

  it 'supports non-url encoded postcodes' do
    address = FactoryGirl.create(:address, postcode: FactoryGirl.create(:postcode, name: 'SW1A 1AA'))

    get "/postcode/SW1A%201AA.json"

    expect(response).to redirect_to("/addresses/#{address.token}.json")
  end
end
