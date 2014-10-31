require "rails_helper"

RSpec.describe Street, :type => :model do

  it "has correct references" do
    postcodes = []
    addresses = []
    town = FactoryGirl.create(:town)
    locality = FactoryGirl.create(:locality)

    5.times do
      addresses << FactoryGirl.create(:address)
    end

    10.times do |i|
      postcodes << FactoryGirl.create(:postcode, { name: "ABC 12#{i}" })
    end

    street = FactoryGirl.create(:street)
    street.postcodes = postcodes
  #  street.addresses = addresses
    street.town = town
    street.locality = locality
    street.save

    expect(street.postcodes.count).to eq 10
    expect(street.addresses.count).to eq 5
    expect(street.town).to eq town
    expect(street.locality).to eq locality
  end

end
