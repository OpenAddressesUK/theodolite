require 'rails_helper'

ENV['METRICS_API_USERNAME'] = "username"
ENV['METRICS_API_PASSWORD'] = "password"

require 'metrics'

describe Metrics do

  before(:each) do
    stub_request(:post, /username:password@metrics.openaddressesuk.org\/metrics/)
  end

  it "sends the correct address count to metrics API" do
    Timecop.freeze

    25.times do |i|
      FactoryGirl.create(:address, pao: i, town: FactoryGirl.create(:town, name: "GOTHAM CITY"))
    end

    Metrics.total_addresses

    expect(WebMock).to have_requested(:post, "username:password@metrics.openaddressesuk.org/metrics/total-addresses").
                    with(:body => {
                      name: "total-addresses",
                      time: DateTime.now,
                      value: 25
                    }.to_json).
                    once

    Timecop.return
  end

  it "sends the corrrect inferred address count to the Metrics API" do
    Timecop.freeze

    25.times do |i|
      FactoryGirl.create(:address,
      pao: i,
      town: FactoryGirl.create(:town, name: "GOTHAM CITY"),
      provenance: {
        "activity" => {
          "derived_from" => [
            {
              type: "inference"
            }
          ]
        }
      })
    end

    Metrics.inferred_addresses

    expect(WebMock).to have_requested(:post, "username:password@metrics.openaddressesuk.org/metrics/inferred-addresses").
                    with(:body => {
                      name: "inferred-addresses",
                      time: DateTime.now,
                      value: 25
                    }.to_json).
                    once

    Timecop.return
  end

  it "sends the correct raw address count to the Metrics API" do
    Timecop.freeze

    stub_request(:get, "http://ernest.openaddressesuk.org/addresses").
              to_return(body: {
                current_page: 1,
                pages: 137055,
                total: 3426371,
                addresses: []
              }.to_json)

    Metrics.raw_addresses

    expect(WebMock).to have_requested(:post, "username:password@metrics.openaddressesuk.org/metrics/raw-addresses").
                    with(:body => {
                      name: "raw-addresses",
                      time: DateTime.now,
                      value: 3426371
                    }.to_json).
                    once

    Timecop.return
  end

end
