require 'address_fixer'

desc "Fix bad latlngs"
task :lat_lng_fix => :environment do

  Address.all.each do |a|
    r = AddressFixer.fix_lat_lng(a)
    print r ? '!' : '.'
  end
end
