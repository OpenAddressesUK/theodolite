json.street do
  json.name @street.name
  json.addresses do
    json.partial! 'addresses/address', collection: @addresses, as: :address
  end
  json.provenance @street.provenance
end
