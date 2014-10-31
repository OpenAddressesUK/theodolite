class Postcode < AddressObject

  has_one :town
  has_one :locality

  belongs_to :town
  belongs_to :locality
end
