require 'metrics'

desc "Publish metrics"
task :metrics => :environment do
  Metrics.total_addresses
  Metrics.inferred_addresses
  Metrics.raw_addresses
  Metrics.address_api_usage
  Metrics.sorting_office_usage
end
