namespace :theodolite do
  desc "Import address data from Ernest"
  task :import, [:pages] => :environment do |t, args|
    require 'import'
    Import.perform(args[:pages])
  end
end
