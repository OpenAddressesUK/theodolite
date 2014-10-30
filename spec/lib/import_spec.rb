require 'rails_helper'
require 'import'

RSpec.describe Import do

  it "imports one page of addresses" do
    stub_request(:get, ENV['ERNEST_ADDRESS_ENDPOINT']).
      to_return(body: File.read(File.join(Rails.root, "spec", "fixtures", "one-page.json")),
                headers: {"Content-Type" => "application/json"})

    stub_request(:get, "#{ENV['ERNEST_ADDRESS_ENDPOINT']}?page=1").
      to_return(body: File.read(File.join(Rails.root, "spec", "fixtures", "one-page.json")),
                headers: {"Content-Type" => "application/json"})

    Import.perform

    expect(Address.count).to eq 25
  end

  it "imports multiple pages of addresses" do
    stub_request(:get, ENV['ERNEST_ADDRESS_ENDPOINT']).
      to_return(body: File.read(File.join(Rails.root, "spec", "fixtures", "multi-page.json")),
                headers: {"Content-Type" => "application/json"})

    stub_request(:get, /#{ENV['ERNEST_ADDRESS_ENDPOINT']}\?page=./).
      to_return(body: File.read(File.join(Rails.root, "spec", "fixtures", "multi-page.json")),
                headers: {"Content-Type" => "application/json"})

    Import.perform

    expect(Address.count).to eq 125
  end

end
