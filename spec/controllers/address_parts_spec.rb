require 'rails_helper'

RSpec.describe AddressPartsController, :type => :controller do
  describe 'GET #street' do
    render_views

    before(:each) do
      @street = FactoryGirl.create(:street)
    end

    it 'responds successfully' do
      get :street, id: @street.token

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct JSON for a street' do
      get :street, id: @street.token,
                   format: :json

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.headers['Content-Type']).to match /application\/json/
      expect(json['street']['name']).to eq(@street.name)
    end

    it 'shows the correct JSON for containing addresses' do
      5.times do |i|
        FactoryGirl.create(:address, pao: i, street: @street)
      end

      get :street, id: @street.token,
                   format: :json

      json = JSON.parse(response.body)

      expect(json['street']['addresses'].count).to eq(5)
    end

    it 'shows the correct pagination information' do
      30.times do |i|
        FactoryGirl.create(:address, pao: i, street: @street)
      end

      get :street, id: @street.token,
                   format: :json

      expect(response.header["Link"]).to eq("<http://test.host/streets/#{@street.token}.json?page=2>; rel=\"last\", <http://test.host/streets/#{@street.token}.json?page=2>; rel=\"next\"")
      expect(response.header["Total"]).to eq("30")
    end

  end

  describe 'GET #locality' do
    render_views

    before(:each) do
      @locality = FactoryGirl.create(:locality)
    end

    it 'responds successfully' do
      get :locality, id: @locality.token

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct JSON for a locality' do
      get :locality, id: @locality.token,
                     format: :json

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.headers['Content-Type']).to match /application\/json/
      expect(json['locality']['name']).to eq(@locality.name)
    end

    it 'shows the correct JSON for containing addresses' do
      5.times do |i|
        FactoryGirl.create(:address, pao: i, locality: @locality)
      end

      get :locality, id: @locality.token,
                   format: :json

      json = JSON.parse(response.body)

      expect(json['locality']['addresses'].count).to eq(5)
    end

  end

  describe 'GET #town' do
    render_views

    before(:each) do
      @town = FactoryGirl.create(:town)
    end

    it 'responds successfully' do
      get :town, id: @town.token

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct JSON for a locality' do
      get :town, id: @town.token,
                     format: :json

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.headers['Content-Type']).to match /application\/json/
      expect(json['town']['name']).to eq(@town.name)
    end

    it 'shows the correct JSON for containing addresses' do
      5.times do |i|
        FactoryGirl.create(:address, pao: i, town: @town)
      end

      get :town, id: @town.token,
                   format: :json

      json = JSON.parse(response.body)

      expect(json['town']['addresses'].count).to eq(5)
    end

  end

  describe 'GET #postcode' do
    render_views

    before(:each) do
      @postcode = FactoryGirl.create(:postcode)
    end

    it 'responds successfully' do
      get :postcode, id: @postcode.token

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows the correct JSON for a locality' do
      get :postcode, id: @postcode.token,
                     format: :json

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.headers['Content-Type']).to match /application\/json/
      expect(json['postcode']['name']).to eq(@postcode.name)
    end

    it 'shows the correct JSON for containing addresses' do
      5.times do |i|
        FactoryGirl.create(:address, pao: i, postcode: @postcode)
      end

      get :postcode, id: @postcode.token,
                   format: :json

      json = JSON.parse(response.body)

      expect(json['postcode']['addresses'].count).to eq(5)
    end

    context 'with a postcode' do

      it 'shows the correct JSON for a locality' do
        get :postcode, id: @postcode.name,
                       format: :json

        json = JSON.parse(response.body)

        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response.headers['Content-Type']).to match /application\/json/
        expect(json['postcode']['name']).to eq(@postcode.name)
      end

    end

  end
end
