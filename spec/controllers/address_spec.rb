require 'rails_helper'

RSpec.describe AddressController, :type => :controller do
  describe 'GET #show' do
    before :each do
      @postcode = "BAT 123"
      @town = "Gotham City"
      @locality = "Arkham"
      @street = "Bat Street"
      @pao = "Stately Wayne Manor"
      @sao = "The Batcave"
    end

    it 'responds successfully' do

      FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)
      get :show,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'responds with something reasonable' do
      address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)

      get :show,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url

      expect(assigns(:address)).to eq (address)
    end

    it 'responds with JSON' do
      address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)

      get :show,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url,
          format: :json

      expect(response.headers['Content-Type']).to match /application\/json/
    end
  end
end
