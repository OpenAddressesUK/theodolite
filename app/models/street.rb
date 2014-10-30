class Street < AddressObject

  has_many :postcodes
  has_many :addresses
  belongs_to :town
  belongs_to :locality

end
