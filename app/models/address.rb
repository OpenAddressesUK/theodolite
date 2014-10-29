class Address < ActiveRecord::Base

  has_one :town
  has_one :locality
  has_one :postcode
  has_one :street

end
