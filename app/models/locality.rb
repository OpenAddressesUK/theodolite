class Locality < AddressObject

  has_many :postcodes
  has_many :streets
  belongs_to :town

end
