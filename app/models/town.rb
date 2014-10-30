class Town < AddressObject

  has_many :postcodes
  has_many :localities
  has_many :streets

end
