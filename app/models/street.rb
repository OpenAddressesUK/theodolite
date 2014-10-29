class Street < ActiveRecord::Base

  belongs_to :address
  has_many :postcodes
  has_many :addresses
  has_one :town
  has_one :locality

end
