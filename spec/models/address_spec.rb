require "rails_helper"

RSpec.describe Address, :type => :model do

  it "creates an address" do
    town = Town.create(name: "Toytown")
    postcode = Postcode.create(name: "TOY 123")
    street = Street.create(name: "Toy Street")

    address = Address.new(pao: "123")
    address.town = town
    address.postcode = postcode
    address.street = street

    address.save

    expect(address.postcode).to eq postcode
    expect(address.town).to eq town
    expect(address.street).to eq street
    expect(address.pao).to eq "123"
  end

  it "creates an address using virtual attributes" do
    address = Address.new
    address.street_name = "Toy Street"
    address.locality_name = "Toyville"
    address.town_name = "Toytown"
    address.postcode_name = "TOY 123"

    address.save

    expect(address.street.name).to eq "Toy Street"
  end

end
