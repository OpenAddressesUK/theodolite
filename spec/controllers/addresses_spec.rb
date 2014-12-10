require 'rails_helper'

RSpec.describe AddressesController, :type => :controller do
  describe 'GET #index' do
    render_views

    it 'responds successfully' do
      25.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end
      get :index, format: :json, town: Address.last.town.name

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct amount of adresses' do
      25.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end

      get :index, format: :json, town: Address.last.town.name

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(25)
    end

    it 'shows the correct pagination information' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end

      get :index, format: :json, town: Address.last.town.name

      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=2&town=GOTHAM+CITY>; rel=\"last\", <http://test.host/addresses.json?page=2&town=GOTHAM+CITY>; rel=\"next\"")
      expect(response.header["Total"]).to eq("30")
    end

    it 'shows the correct data when page is specified' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end

      get :index, page: 2, format: :json, town: Address.last.town.name

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(5)
      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=1&town=GOTHAM+CITY>; rel=\"first\", <http://test.host/addresses.json?page=1&town=GOTHAM+CITY>; rel=\"prev\"")
    end

    it 'shows the correct pagination information when per_page is specified' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end

      get :index, page: 2, per_page: 4, format: :json, town: Address.last.town.name
      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=1&per_page=4&town=GOTHAM+CITY>; rel=\"first\", <http://test.host/addresses.json?page=1&per_page=4&town=GOTHAM+CITY>; rel=\"prev\", <http://test.host/addresses.json?page=8&per_page=4&town=GOTHAM+CITY>; rel=\"last\", <http://test.host/addresses.json?page=3&per_page=4&town=GOTHAM+CITY>; rel=\"next\"")
    end

    it 'shows the url for addresses' do
      FactoryGirl.create(:address, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      FactoryGirl.create(:address, pao: "456", town: FactoryGirl.create(:town, name: "GOTHAM CITY"))

      get :index, format: :json, town: Address.last.town.name

      json = JSON.parse(response.body)

      expect(json['addresses'].first['url']).to match /http:\/\/test\.host\/addresses\/[0-9a-z]+/i
    end

    it 'shows a message when there are no addresses found for a query' do
      get :index, town: "Nowheretown"

      expect(response.body).to match(/Sorry, there were no results for your query/)
    end
  end

  describe 'GET #show' do
    render_views

    before :each do
      @postcode = FactoryGirl.create(:postcode, name: "W12 8QT")
      @town = FactoryGirl.create(:town, name: "Gotham City")
      @locality = FactoryGirl.create(:locality, name: "Arkham")
      @street = FactoryGirl.create(:street, name: "Bat Street")
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
      get :show, id: @address.id,
                 format: :json

      expect(response.headers['Content-Type']).to match /application\/json/
    end

    it 'responds with the correct JSON' do
      get :show, id: @address.id,
                 format: :json

      json = JSON.parse(response.body)

      expect(json['address']['sao']).to eq(@sao)
      expect(json['address']['pao']).to eq(@pao)
      expect(json['address']['street']['name']['en']).to eq([@address.street.name])
      expect(json['address']['street']['url']).to eq("http://test.host/streets/#{@address.street.token}")
      expect(json['address']['locality']['name']['en']).to eq([@address.locality.name])
      expect(json['address']['locality']['url']).to eq("http://test.host/localities/#{@address.locality.token}")
      expect(json['address']['town']['name']['en']).to eq([@address.town.name])
      expect(json['address']['town']['url']).to eq("http://test.host/towns/#{@address.town.token}")
      expect(json['address']['postcode']['name']).to eq(@address.postcode.name)
      expect(json['address']['postcode']['url']).to eq("http://test.host/postcodes/#{@address.postcode.token}")

    end

  end

  describe 'GET #query' do
    render_views

    before :each do
      @postcode = FactoryGirl.create(:postcode, name: "W12 8QT")
      @town = FactoryGirl.create(:town, name: "GOTHAM CITY")
      @locality = FactoryGirl.create(:locality, name: "ARKHAM")
      @street = FactoryGirl.create(:street, name: "BAT STREET")
      @pao = "STATELY WAYNE MANOR"
      @sao = "THE BATCAVE"

      @address = FactoryGirl.create(:address, sao: @sao, pao: @pao, street: @street, locality: @locality, town: @town, postcode: @postcode)
    end

    it 'redirects successfully' do
      get :index,
          town: @town.name.downcase,
          locality: @locality.name.downcase,
          postcode: @postcode.name.downcase,
          street: @street.name.downcase,
          pao: @pao.downcase,
          sao: @sao.downcase,
          format: :json

      expect(response).to be_redirect
      expect(response).to have_http_status(307)
    end

    it 'assigns correctly' do
      get :index,
          town: @town.name,
          locality: @locality.name,
          postcode: @postcode.name,
          street: @street.name,
          pao: @pao,
          sao: @sao,
          format: :json

      expect(assigns(:addresses).first).to eq (@address)
    end

    it 'retains the format of the original request' do
      get :index,
          town: @town.name,
          locality: @locality.name,
          postcode: @postcode.name,
          street: @street.name,
          pao: @pao,
          sao: @sao,
          format: :json

      expect(response.header["Location"]).to match /\.json/
    end

    it 'returns empty list if no addresses are found' do
      get :index,
          town: 'fake-town',
          locality: @locality.name,
          postcode: @postcode.name,
          street: @street.name,
          pao: @pao,
          sao: @sao,
          format: :json

      json = JSON.parse(response.body)
      expect(json['addresses'].count).to eq(0)
    end

    it 'redirects if parameters are missing' do
      get :index,
          town: @town.name,
          #locality: nil,
          postcode: @postcode.name,
          street: @street.name,
          pao: @pao,
          sao: @sao,
          format: :json

      expect(response).to redirect_to("/addresses/#{@address.token}.json")
    end

    it 'works when a postcode has no space' do
      get :index,
          postcode: @postcode.name.downcase.gsub(" ", "")

      expect(response).to redirect_to("/addresses/#{@address.token}.html")
    end

    context 'with multiple results' do

      it 'lists all possible results if parameters are missing' do
        1.upto(4) do |i|
          FactoryGirl.create(:address,
                            sao: i,
                            pao: @pao,
                            street: @street,
                            town: @town,
                            locality: @locality,
                            postcode: @postcode
                            )
        end

        get :index,
            town: @town.name,
            locality: @locality.name,
            postcode: @postcode.name,
            street: @street.name,
            format: :json

        json = JSON.parse(response.body)

        expect(json['addresses'].count).to eq(5)
      end

    end

    it 'redirects on non-URL-encoded strings' do
      get :index,
          town: @town.name,
          locality: @locality.name,
          postcode: @postcode.name,
          street: @street.name,
          pao: @pao,
          sao: @sao,
          format: :json

      expect(response).to redirect_to("/addresses/#{@address.token}.json")
    end
  end
end
