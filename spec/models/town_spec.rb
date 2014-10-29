require "rails_helper"

RSpec.describe Town, :type => :model do

  it "has correct references" do
    streets = []
    postcodes = []

    5.times do |i|
      streets << FactoryGirl.create(:street, { name: "#{i} Street" })
    end

    10.times do |i|
      postcodes << FactoryGirl.create(:postcode, { name: "ABC 12#{i}" })
    end

    town = FactoryGirl.create(:town)
    town.postcodes = postcodes
    town.streets = streets
    town.save

    expect(town.postcodes.count).to eq 10
    expect(town.streets.count).to eq 5
  end

end
