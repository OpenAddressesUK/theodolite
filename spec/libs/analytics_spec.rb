require 'rails_helper'
require 'analytics'

describe Analytics do

  it 'gets me some analytics' do
    Timecop.freeze(Date.new(2015, 04, 23)) do
      VCR.use_cassette('analytics_gets_me_some_analytics') do
        a = Analytics.new

        expect(a.result).to eq(23)
      end
    end
  end

end
