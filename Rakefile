# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Fix bad latlngs"
task :lat_lng_fix => :environment do
  Address.all.each do |a|
    ["postcode", "locality", "street"].each do |type|
      lat_lng = a.send(type).lat_lng rescue nil
      if !lat_lng.nil? && lat_lng.first > 4
        a.send(type).lat_lng = [lat_lng[1], lat_lng[0]]
      end
    end
    a.save
  end
end
