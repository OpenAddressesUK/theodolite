json.postcode do
  json.name @postcode.name
  json.geo do
  	json.latitude @postcode.lat_lng.y
  	json.longitude @postcode.lat_lng.x
  end
  json.addresses do
    json.partial! 'addresses/address', collection: @addresses, as: :address
  end
  json.provenance @postcode.provenance
end
