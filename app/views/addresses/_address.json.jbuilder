json.url address_url(address)
json.sao address.sao
json.pao address.pao
json.partial! 'addresses/address_part', part: address.street, type: "street"
json.partial! 'addresses/address_part', part: address.locality, type: "locality"
json.partial! 'addresses/address_part', part: address.town, type: "town"
json.partial! 'addresses/address_part', part: address.postcode, type: "postcode"
