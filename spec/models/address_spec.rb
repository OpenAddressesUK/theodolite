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

end
