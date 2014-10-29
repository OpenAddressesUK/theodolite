FactoryGirl.define do

  factory :address do
    postcode { FactoryGirl.create(:postcode) }
    town { FactoryGirl.create(:town) }
    locality { FactoryGirl.create(:locality) }
    street { FactoryGirl.create(:street) }
    pao "123"
  end

end
