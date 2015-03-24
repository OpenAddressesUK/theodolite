module AddressFixer
  
  def self.fix_lat_lng(a)
    result = false
    ["postcode", "locality", "street"].each do |type|
      lat_lng = a.send(type).lat_lng rescue nil
      if !lat_lng.nil? && lat_lng.first > 4
        result = true
        a.send(type).lat_lng = [lat_lng[1], lat_lng[0]]
      end
    end
    a.save(validate: false)
    result
  end

end

