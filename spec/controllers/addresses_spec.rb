require 'rails_helper'

RSpec.describe AddressesController, :type => :controller do
  describe 'GET #index' do
    render_views

    it 'responds successfully' do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct amount of adresses' do
      25.times do
        FactoryGirl.create(:address)
      end

      get :index, format: :json

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(25)
    end

    it 'shows the correct pagination information' do
      30.times do
        FactoryGirl.create(:address)
      end

      get :index, format: :json

      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=2>; rel=\"last\", <http://test.host/addresses.json?page=2>; rel=\"next\"")
      expect(response.header["Total"]).to eq("30")
    end

    it 'shows the correct data when page is specified' do
      30.times do
        FactoryGirl.create(:address)
      end

      get :index, page: 2, format: :json

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(5)
      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=1>; rel=\"first\", <http://test.host/addresses.json?page=1>; rel=\"prev\"")
    end

    it 'shows the correct pagination information when per_page is specified' do
      30.times do
        FactoryGirl.create(:address)
      end

      get :index, page: 2, per_page: 4, format: :json
      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=1&per_page=4>; rel=\"first\", <http://test.host/addresses.json?page=1&per_page=4>; rel=\"prev\", <http://test.host/addresses.json?page=8&per_page=4>; rel=\"last\", <http://test.host/addresses.json?page=3&per_page=4>; rel=\"next\"")
    end

    it 'shows the url for addresses' do
      FactoryGirl.create(:address)

      get :index, format: :json

      json = JSON.parse(response.body)

      expect(json['addresses'].first['url']).to match /http:\/\/test\.host\/addresses\/[0-9]+/
    end
  end

  describe 'GET #show' do
    render_views

    before :each do
      @postcode = "W12 8QT"
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
      @postcode = "W12 8QT"
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
      expect(response).to have_http_status(307)
    end

    it 'assigns correctly' do
      get :query,
          town: @town.to_url,
          locality: @locality.to_url,
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url

      expect(assigns(:addresses).first).to eq (@address)
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

    it 'redirects if parameters are missing' do
      get :query,
          town: @town.to_url,
          locality: '-',
          postcode: @postcode.to_url,
          street: @street.to_url,
          pao: @pao.to_url,
          sao: @sao.to_url,
          format: :json

      expect(response).to redirect_to("/addresses/#{@address.id}.json")
    end

    context 'with multiple results' do

      it 'lists all possible results if parameters are missing' do
        1.upto(4) do |i|
          FactoryGirl.create(:address, sao: i, pao: @pao, street: @street, locality: @locality, postcode: @postcode)
        end

        get :query,
            town: @town.to_url,
            locality: @locality.to_url,
            postcode: @postcode.to_url,
            street: @street.to_url,
            pao: @pao.to_url,
            sao: '-',
            format: :json

        json = JSON.parse(response.body)

        expect(json['addresses'].count).to eq(5)
      end

    end
  end
end
