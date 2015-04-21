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

  it "Gets addresses by council" do
    Timecop.freeze

    expect(Metrics).to receive(:councils).twice {
      [
        {
          "council" => "Council 1",
          "id" => "1"
        },
        {
          "council" => "Council 2",
          "id" => "2"
        },
        {
          "council" => "Council 3",
          "id" => "3"
        },
        {
          "council" => "Council 4",
          "id" => "4"
        },
        {
          "council" => "Council 5",
          "id" => "5"
        }
      ]
    }

    Metrics.councils.each do |council|
      council["id"].to_i.times do |i|
        FactoryGirl.create(:address, pao: i, postcode: FactoryGirl.create(:postcode, name: "ABC 12#{council["id"]}", authority: council["id"]))
      end
    end

    h = {
      "council-1" => 1,
      "council-2" => 2,
      "council-3" => 3,
      "council-4" => 4,
      "council-5" => 5,
    }

    Metrics.addresses_by_council

    expect(WebMock).to have_requested(:post, "username:password@metrics.openaddressesuk.org/metrics/addresses-by-council").
                    with(:body => {
                      name: "addresses-by-council",
                      time: DateTime.now,
                      value: h
                    }.to_json).
                    once

    Timecop.return
  end

end
