require 'rails_helper'

RSpec.describe AddressController, :type => :controller do
  describe 'GET #show' do
    it 'responds successfully' do
      postcode = "BAT 123"
      town = "Gotham City"
      locality = "Arkham"
      street = "Bat Street"
      pao = "Stately Wayne Manor"
      sao = "The Batcave"

      FactoryGirl.create(:address, sao: sao, pao: pao, street: street, locality: locality, postcode: postcode)
      get :show, town: town.parameterize, locality: locality.parameterize, postcode: postcode.parameterize, street: street.parameterize, pao: pao.parameterize, sao: sao.parameterize
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
