require "rails_helper"

RSpec.describe Address, :type => :model do

  it "creates an address" do
    address = Address.new(
                          pao: "Flat 1",
                          sao: "123",
                          street: "Toy Street",
                          locality: "Toytown",
                          town: "Toyland",
                          postcode: "TOY 123"
                          )

    address.save

    expect(address.pao).to eq "Flat 1"
    expect(address.sao).to eq "123"
    expect(address.street).to eq "Toy Street"
    expect(address.locality).to eq "Toytown"
    expect(address.town).to eq "Toyland"
    expect(address.postcode).to eq "TOY 123"
  end

  it "creates an address with slugs" do
    address = Address.new(
                          pao: "Flat 19a",
                          sao: "Rubik's House",
                          street: "Other Street",
                          locality: "New Townsville",
                          town: "Newton-le-Willows",
                          postcode: "EC1A 1AA"
                          )

    address.save

    expect(address.pao_slug).to eq "flat-19a"
    expect(address.sao_slug).to eq "rubiks-house"
    expect(address.street_slug).to eq "other-street"
    expect(address.locality_slug).to eq "new-townsville"
    expect(address.town_slug).to eq "newton-le-willows"
    expect(address.postcode_slug).to eq "ec1a-1aa"
  end

end
