json.postcodes do
  json.array! @postcodes do |postcode|
    json.partial! 'addresses/address_part', part: postcode, type: "postcode"
  end
end
