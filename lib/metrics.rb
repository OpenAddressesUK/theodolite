require 'httparty'

module Metrics

  def self.total_addresses
    addresses = Address.all.count
    create_metric("total-addresses", addresses)
  end

  def self.inferred_addresses
    addresses = Address.where("provenance.activity.derived_from.type" => "Inferred").count
    create_metric("inferred-addresses", addresses)
  end

  def self.raw_addresses
    ernest = JSON.parse HTTParty.get("http://ernest.openaddressesuk.org/addresses").body
    addresses = ernest['total']
    create_metric("raw-addresses", addresses)
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

end
