require 'rails_helper'
require 'address_fixer'

describe AddressFixer do

  [
    "street",
    "postcode",
    "locality"
  ].each do |part|    

    context "fixing #{part.pluralize}" do

      it "should fix lat-long errors" do
        FactoryGirl.create(:address,
          part.to_sym => FactoryGirl.create(part.to_sym, lat_lng: [57, -2])
        )
        result = AddressFixer.fix_lat_lng(Address.first)
        expect(result).to eq true
        expect(Address.first.send(part).lat_lng.lat).to eq 57
        expect(Address.first.send(part).lat_lng.long).to eq -2
      end

      it "should not fix correct lat-long" do
        FactoryGirl.create(:address,
          part.to_sym => FactoryGirl.create(part.to_sym, lat_lng: [-2, 57])
        )      
        result = AddressFixer.fix_lat_lng(Address.first)
        expect(result).to eq false
        expect(Address.first.send(part).lat_lng.lat).to eq 57
        expect(Address.first.send(part).lat_lng.long).to eq -2
      end
    
    end
    
  end

end