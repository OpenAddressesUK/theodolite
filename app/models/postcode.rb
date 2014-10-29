class Postcode < ActiveRecord::Base

  belongs_to :address
  has_one :town
  has_one :locality

end
