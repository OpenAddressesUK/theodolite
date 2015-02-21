json.towns do
  json.array! @towns do |town|
    json.partial! 'addresses/address_part', part: town, type: "town"
  end
end
