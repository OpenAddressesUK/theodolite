json.postcode do
  json.name @postcode.name
  json.geo do
  	json.latitude @postcode.lat_lng.lat
  	json.longitude @postcode.lat_lng.long
  end
  json.addresses do
    json.partial! 'addresses/address', collection: @addresses, as: :address
  end
  json.provenance @postcode.provenance
end
