json.address do
  json.partial! 'addresses/address', address: @address
  json.provenance @address.provenance
end
