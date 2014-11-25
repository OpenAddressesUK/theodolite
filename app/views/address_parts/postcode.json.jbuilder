json.postcode do
  json.name @postcode.name
  json.addresses do
    json.partial! 'addresses/address', collection: @addresses, as: :address
  end
end
