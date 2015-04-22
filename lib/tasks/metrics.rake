require 'metrics'

desc "Publish metrics"
task :metrics => :environment do
  Metrics.total_addresses
  Metrics.inferred_addresses
  Metrics.raw_addresses
  Metrics.addresses_by_council
end
