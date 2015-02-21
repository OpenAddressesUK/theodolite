json.localities do
  json.array! @localities do |locality|
    json.partial! 'addresses/address_part', part: locality, type: "locality"
  end
end
