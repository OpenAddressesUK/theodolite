require "rails_helper"

RSpec.describe Postcode, :type => :model do

  it "has correct references" do
    town = FactoryGirl.create(:town)
    locality = FactoryGirl.create(:locality)

    postcode = FactoryGirl.create(:postcode)
    postcode.town = town
    postcode.locality = locality
    postcode.save

    expect(postcode.town).to eq town
    expect(postcode.locality).to eq locality
  end

end
