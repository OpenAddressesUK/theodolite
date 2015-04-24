require 'rails_helper'
require 'analytics'

describe Analytics do

  it 'gets analytics for the main website' do |example|
    Timecop.freeze(Date.new(2015, 04, 23)) do
      VCR.use_cassette(example.metadata[:full_description]) do
        a = Analytics.new(property: 'Open Addresses', profile: 'https://alpha.openaddressesuk.org', path: 'json$')

        expect(a.result).to eq(29)
      end
    end
  end

end
