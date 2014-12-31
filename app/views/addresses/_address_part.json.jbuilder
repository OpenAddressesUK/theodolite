json.set! type do
  if type == "postcode"
    json.name part.try(:name)
    json.geo do
      json.latitude part.try(:lat_lng).try(:y)
      json.longitude part.try(:lat_lng).try(:x)
    end
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
