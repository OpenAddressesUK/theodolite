json.set! type do
  json.name do
    json.en [
      part.try(:name)
    ]
    json.cy []
  end
  json.url part.nil? ? nil : send("#{type}_url",part)
end
