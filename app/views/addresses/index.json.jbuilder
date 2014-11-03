json.page @page
json.per_page @per_page
json.total @total
json.pages @pages
json.addresses do
  json.array! @addresses do |address|
    json.partial! 'addresses/address', address: address
    json.url url_for(address)
  end
end
