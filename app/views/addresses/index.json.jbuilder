json.addresses do
  json.array! @addresses do |address|
    json.partial! 'addresses/address', address: address
    json.url polymorphic_url(address)
  end
end
