json.streets do
  json.array! @streets do |street|
    json.partial! 'addresses/address_part', part: street, type: "street"
  end
end
