json.town do
  json.name @town.name
  json.addresses do
    json.partial! 'addresses/address', collection: @addresses, as: :address
  end
  json.provenance @town.provenance
end
