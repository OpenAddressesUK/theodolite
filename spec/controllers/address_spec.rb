require 'rails_helper'

RSpec.describe AddressController, :type => :controller do
  describe 'GET #show' do
    render_views

    before :each do
      @postcode = "BAT 123"
      @town = "Gotham City"
      @locality = "Arkham"
      @street = "Bat Street"
      @pao = "Stately Wayne Manor"
      @sao = "The Batcave"

      @address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)
    end

    it 'responds successfully' do
      get :show, id: @address.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'responds with something reasonable' do
      get :show, id: @address.id

      expect(assigns(:address)).to eq (@address)
    end

    it 'responds with JSON' do
      address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)

      get :show, id: @address.id,
                 format: :json

      expect(response.headers['Content-Type']).to match /application\/json/
    end

    it 'responds with the correct JSON' do
      address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)

      get :show, id: @address.id,
                 format: :json

      json = JSON.parse(response.body)

      expect(json['address']['sao']).to eq(@sao)
      expect(json['address']['pao']).to eq(@pao)
      expect(json['address']['street']).to eq(@street)
      expect(json['address']['locality']).to eq(@locality)
      expect(json['address']['postcode']).to eq(@postcode)

    end

  end

  describe 'GET #query' do
    render_views

    before :each do
      @postcode = "BAT 123"
      @town = "Gotham City"
      @locality = "Arkham"
      @street = "Bat Street"
      @pao = "Stately Wayne Manor"
      @sao = "The Batcave"

      @address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, postcode: @postcode)
    end

    it 'redirects successfully' do
      get :query,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url

      expect(response).to be_redirect
      expect(response).to have_http_status(302)
    end

    it 'assigns correctly' do
      get :query,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url

      expect(assigns(:address)).to eq (@address)
    end

    it 'retains the format of the original request' do
      get :query,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url,
          format: :json

      expect(response.header["Location"]).to match /\.json/
    end

    it 'returns 404 if address is not found' do
      expect {
          get :query,
              town: 'fake-town',
              locality: @locality.to_url,
              postcode: @postcode.to_url,
              street: @street.to_url,
              pao: @pao.to_url,
              sao: @sao.to_url
          }.to raise_error(ActionController::RoutingError)
    end
  end
end
