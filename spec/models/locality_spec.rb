require "rails_helper"

RSpec.describe Locality, :type => :model do

  it "has correct references" do
    town = FactoryGirl.create(:town)
    streets = []

    5.times do |i|
      streets << FactoryGirl.create(:street, { name: "#{i} Street" })
    end

    locality = FactoryGirl.create(:locality)
    locality.town = town
    locality.streets = streets
    locality.save

    expect(locality.town).to eq town
    expect(locality.streets.count).to eq 5
  end

end
