require 'httparty'
require 'analytics'

module Metrics

  def self.addresses_by_council
    addresses = {}

    councils.each do |council|
      addresses[council["council"].parameterize] = Address.where("postcode.authority" => council["id"]).count
    end

    create_metric("addresses-by-council", addresses)
  end

  def self.total_addresses
    addresses = Address.all.count
    create_metric("total-addresses", addresses)
  end

  def self.inferred_addresses
    addresses = Address.where("source" => "inference").count
    create_metric("inferred-addresses", addresses)
  end

  def self.raw_addresses
    ernest = JSON.parse HTTParty.get("http://ernest.openaddressesuk.org/addresses").body
    addresses = ernest['total']
    create_metric("raw-addresses", addresses)
  end

  def self.address_api_usage
    analytics = Analytics.new(profile: 'https://alpha.openaddressesuk.org', path: '\/addresses')
    count = analytics.result
    create_metric("address-api-usage", count)
  end

  def self.sorting_office_usage
    analytics = Analytics.new(property: 'Sorting Office', path: '\/address')
    count = analytics.result
    create_metric("sorting-office-usage", count)
  end

  def self.create_metric(metric_name, metric)
    json = create_json(metric_name, metric)
    post_metric(metric_name, json)
  end

  def self.create_json(metric_name, metric)
    {
      name: metric_name,
      time: DateTime.now,
      value: metric
    }.to_json
  end

  def self.post_metric(metric_name, json)
    HTTParty.post("http://metrics.openaddressesuk.org/metrics/#{metric_name}",
                  body: json,
                  basic_auth: { username: ENV['METRICS_API_USERNAME'], password: ENV['METRICS_API_PASSWORD'] }
                  )
  end

  def self.councils
    YAML.load(File.read File.join(Rails.root, 'config', 'councils.yml'))
  end

end
