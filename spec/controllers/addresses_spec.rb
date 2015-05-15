require 'rails_helper'

RSpec.describe AddressesController, :type => :controller do
  describe 'GET #index' do
    render_views

    it 'responds successfully' do
      25.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end
      sleep(1)

      get :index, format: :json, town: Address.last.town.name

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct amount of adresses' do
      25.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end
      sleep(1)
      get :index, format: :json, town: Address.last.town.name

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(25)
    end

    it 'searches for UPRNs' do
      uprn = "10004546646"

      FactoryGirl.create(:address, uprn: uprn)
      sleep(1)
      get :index, format: :json, uprn: uprn

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(1)
    end

    it 'shows the correct pagination information' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end
      sleep(1)

      get :index, format: :json, town: Address.last.town.name

      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=2&town=GOTHAM+CITY>; rel=\"last\", <http://test.host/addresses.json?page=2&town=GOTHAM+CITY>; rel=\"next\"")
      expect(response.header["Total"]).to eq("30")
    end

    it 'shows the correct data when page is specified' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end
      sleep(1)

      get :index, page: 2, format: :json, town: Address.last.town.name

      json = JSON.parse(response.body)

      expect(json['addresses'].count).to eq(5)
      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=1&town=GOTHAM+CITY>; rel=\"first\", <http://test.host/addresses.json?page=1&town=GOTHAM+CITY>; rel=\"prev\"")
    end

    it 'shows the correct pagination information when per_page is specified' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      end
      sleep(1)

      get :index, page: 2, per_page: 4, format: :json, town: Address.last.town.name
      expect(response.header["Link"]).to eq("<http://test.host/addresses.json?page=1&per_page=4&town=GOTHAM+CITY>; rel=\"first\", <http://test.host/addresses.json?page=1&per_page=4&town=GOTHAM+CITY>; rel=\"prev\", <http://test.host/addresses.json?page=8&per_page=4&town=GOTHAM+CITY>; rel=\"last\", <http://test.host/addresses.json?page=3&per_page=4&town=GOTHAM+CITY>; rel=\"next\"")
    end

    it 'shows the url for addresses' do
      FactoryGirl.create(:address, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      FactoryGirl.create(:address, pao: "456", town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
      sleep(1)

      get :index, format: :json, town: Address.last.town.name

      json = JSON.parse(response.body)

      expect(json['addresses'].first['url']).to match /http:\/\/test\.host\/addresses\/[0-9a-z]+/i
    end

    it 'shows a message when there are no addresses found for a query' do
      get :index, town: "Nowheretown"

      expect(response.body).to match(/Sorry, there were no results for your query/)
    end

    it 'returns an error if content type is not supported' do
      expect {   get :index, format: :xml, town: "Gotham" }.to raise_error(ActionController::UnknownFormat)
    end

    it 'returns the results update since TIME' do
      FactoryGirl.create(
        :address,
        pao: 1,
        town: FactoryGirl.create(:town, name: "GOTHAM CITY")
      )

      FactoryGirl.create(
        :address,
        pao: 1,
        town: FactoryGirl.create(:town, name: "METROPOLIS"),
        created_at: 1.day.ago,
        updated_at: 1.day.ago
      )

      sleep(1)

      get :index, format: :json, updated_since: 1.hour.ago.xmlschema
      json = JSON.parse(response.body)
      expect(json['addresses'].count).to eq 1

      get :index, format: :json, updated_since: 2.years.ago.xmlschema
      json = JSON.parse(response.body)
      expect(json['addresses'].count).to eq 2

    end

    it 'leaves out inferred addresses' do
      5.times do |i|
        FactoryGirl.create(
          :address,
          pao: i,
          town: FactoryGirl.create(:town, name: "GOTHAM CITY"),
          source: "inference"
        )
      end

      FactoryGirl.create(
        :address,
        pao: 1,
        town: FactoryGirl.create(:town, name: "METROPOLIS"),
      )

      get :index, format: :json, no_inference: "true"
      json = JSON.parse(response.body)
      expect(json['addresses'].count).to eq 1
    end

    it 'leaves out inferred addresses since TIME' do
      5.times do |i|
        FactoryGirl.create(
          :address,
          pao: i,
          source: "inference"
        )
      end

      FactoryGirl.create(
        :address,
        pao: 12,
      )

      FactoryGirl.create(
        :address,
        pao: 1,
        town: FactoryGirl.create(:town, name: "METROPOLIS"),
        source: "inference",
        created_at: 1.day.ago,
        updated_at: 1.day.ago
      )

      FactoryGirl.create(
        :address,
        pao: 2,
        town: FactoryGirl.create(:town, name: "METROPOLIS"),
        created_at: 1.day.ago,
        updated_at: 1.day.ago
      )

      sleep(1)

      get :index, format: :json, updated_since: 1.hour.ago.xmlschema, no_inference: "true"
      json = JSON.parse(response.body)
      expect(json['addresses'].count).to eq 1
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
      expect(json['address']['postcode']['geo']['latitude']).to eq(@address.postcode.lat_lng.lat)
      expect(json['address']['postcode']['geo']['longitude']).to eq(@address.postcode.lat_lng.long)
      expect(json['address']['postcode']['url']).to eq("http://test.host/postcodes/#{@address.postcode.token}")

    end

    it 'returns a error if content type is not supported' do
      expect { get :show, id: @address.id, format: :xml }.to raise_error(ActionController::UnknownFormat)
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
      sleep(1)
    end

    it 'redirects successfully' do
      get :index,
          town: @town.name.downcase,
          locality: @locality.name.downcase,
          postcode: @postcode.name.downcase,
          street: @street.name.downcase,
          pao: @pao.downcase,
          sao: @sao.downcase,
          format: :html

      expect(response).to be_redirect
      expect(response).to have_http_status(307)
    end

    it "doesn't redirect when JSON" do
      get :index,
          town: @town.name.downcase,
          locality: @locality.name.downcase,
          postcode: @postcode.name.downcase,
          street: @street.name.downcase,
          pao: @pao.downcase,
          sao: @sao.downcase,
          format: :json

      expect(response).to have_http_status(200)
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
          format: :html

      expect(response.header["Location"]).to match /\.html/
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
          format: :html

      expect(response).to redirect_to("/addresses/#{@address.token}.html")
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

# I don't think this makes any sense, Stu?
#    it 'redirects on non-URL-encoded strings' do
#      get :index,
#          town: @town.name,
#          locality: @locality.name,
#          postcode: @postcode.name,
#          street: @street.name,
#          pao: @pao,
#          sao: @sao,
#          format: :html
#
#      expect(response).to redirect_to("/addresses/#{@address.token}.html")
#    end
  end

  describe 'GET #download' do

    [
      {
        options: {
          format: "csv",
          split: "false",
          provenance: "false"
        },
        name: "Addresses only as a single CSV file (direct download)",
        result: "2014-03-31-openaddressesuk-addresses-only.csv.zip"
      },
      {
        options: {
          format: "json",
          split: "false",
          provenance: "false"
        },
        name: "Addresses only as a single JSON file (direct download)",
        result: "2014-03-31-openaddressesuk-addresses-only.json.zip"
      },
      {
        options: {
          format: "csv",
          split: "false",
          provenance: "false",
          torrent: "true"
        },
        name: "Addresses only as a single CSV file (torrent)",
        result: "2014-03-31-openaddressesuk-addresses-only.csv.zip?torrent"
      },
      {
        options: {
          format: "json",
          split: "false",
          provenance: "false",
          torrent: "true"
        },
        name: "Addresses only as a single JSON file (torrent)",
        result: "2014-03-31-openaddressesuk-addresses-only.json.zip?torrent"
      },
      {
        options: {
          format: "csv",
          split: "true",
          provenance: "false",
        },
        name: "Addresses only split by postcode sector as a single CSV file (direct download)",
        result: "2014-03-31-openaddressesuk-addresses-only-split.csv.zip"
      },
      {
        options: {
          format: "json",
          split: "true",
          provenance: "false",
        },
        name: "Addresses only split by postcode sector as a single JSON file (direct download)",
        result: "2014-03-31-openaddressesuk-addresses-only-split.json.zip"
      },
      {
        options: {
          format: "csv",
          split: "true",
          provenance: "false",
          torrent: "true"
        },
        name: "Addresses only split by postcode sector as a single CSV file (torrent)",
        result: "2014-03-31-openaddressesuk-addresses-only-split.csv.zip?torrent"
      },
      {
        options: {
          format: "json",
          split: "true",
          provenance: "false",
          torrent: "true"
        },
        name: "Addresses only split by postcode sector as a single JSON file (torrent)",
        result: "2014-03-31-openaddressesuk-addresses-only-split.json.zip?torrent"
      },
      {
        options: {
          format: "csv",
          split: "false",
          provenance: "true"
        },
        name: "Addresses with provenance as a single CSV file (direct download)",
        result: "2014-03-31-openaddressesuk-full.csv.zip"
      },
      {
        options: {
          format: "json",
          split: "false",
          provenance: "true"
        },
        name: "Addresses with provenance as a single JSON file (direct download)",
        result: "2014-03-31-openaddressesuk-full.json.zip"
      },
      {
        options: {
          format: "csv",
          split: "false",
          provenance: "true",
          torrent: "true"
        },
        name: "Addresses with provenance as a single CSV file (torrent)",
        result: "2014-03-31-openaddressesuk-full.csv.zip?torrent"
      },
      {
        options: {
          format: "json",
          split: "false",
          provenance: "true",
          torrent: "true"
        },
        name: "Addresses with provenance as a single JSON file (torrent)",
        result: "2014-03-31-openaddressesuk-full.json.zip?torrent"
      },
      {
        options: {
          format: "csv",
          split: "true",
          provenance: "true",
        },
        name: "Addresses with provenance split by postcode sector as a single CSV file (direct download)",
        result: "2014-03-31-openaddressesuk-full-split.csv.zip"
      },
      {
        options: {
          format: "json",
          split: "true",
          provenance: "true",
        },
        name: "Addresses with provenance split by postcode sector as a single JSON file (direct download)",
        result: "2014-03-31-openaddressesuk-full-split.json.zip"
      },
      {
        options: {
          format: "csv",
          split: "true",
          provenance: "true",
          torrent: "true"
        },
        name: "Addresses with provenance split by postcode sector as a single CSV file (torrent)",
        result: "2014-03-31-openaddressesuk-full-split.csv.zip?torrent"
      },
      {
        options: {
          format: "json",
          split: "true",
          provenance: "true",
          torrent: "true"
        },
        name: "Addresses with provenance split by postcode sector as a single JSON file (torrent)",
        result: "2014-03-31-openaddressesuk-full-split.json.zip?torrent"
      }
    ].each do |example|
      it "redirects to #{example[:name]}" do
        VCR.use_cassette(example[:name]) do
          get :download, example[:options]

          expect(response).to redirect_to("https://s3-eu-west-1.amazonaws.com/#{JiffyBag['AWS_BUCKET']}/open_addresses_database/#{example[:result]}")
        end
      end
    end

  end
end
