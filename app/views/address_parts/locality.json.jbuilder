json.locality do
  json.name @locality.name
  json.addresses do
    json.partial! 'addresses/address', collection: @addresses, as: :address
  end
  json.provenance @locality.provenance
end
