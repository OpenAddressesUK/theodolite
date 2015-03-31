module AddressFixer

  def self.fix_lat_lng(a)
    changed = false
    ["postcode", "locality", "street"].each do |type|
      lat_lng = a.send(type).lat_lng rescue nil
      if !lat_lng.nil? && lat_lng.first > 4
        changed = true
      end
    end

    a.rebuild_from_parts! if changed
    changed
  end
end
