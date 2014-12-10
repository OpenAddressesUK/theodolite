json.set! type do
  if type == "postcode"
    json.name part.try(:name)
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
