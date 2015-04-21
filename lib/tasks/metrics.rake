require 'metrics'

desc "Publish metrics"
task :metrics => :environment do
  Metrics.total_addresses
  Metrics.inferred_addresses
  Metrics.raw_addresses
  Metrics.by_council  
end
