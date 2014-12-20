json.set! type do
  if type == "postcode"
    json.name part.try(:name)
    json.lat_lng part.try(:lat_lng)
  else
    json.name do
      json.en [
        part.try(:name)
      ]
      json.cy []
    end
  end
  json.url part.nil? ? nil : send("#{type}_url",part)
end
