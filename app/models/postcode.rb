class Postcode < AddressObject

  has_one :town
  has_one :locality

end
