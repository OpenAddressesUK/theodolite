require "rails_helper"

RSpec.describe Address, :type => :model do

  it "creates an address" do
    binding.pry
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

end
