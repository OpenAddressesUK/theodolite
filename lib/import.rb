class Import

  def self.perform
    response = HTTParty.get(ENV['ERNEST_ADDRESS_ENDPOINT']).parsed_response
    pages = response["pages"].to_i

    1.upto(pages) do |i|
      response = HTTParty.get("#{ENV['ERNEST_ADDRESS_ENDPOINT']}?page=#{i}").parsed_response
      response['addresses'].each do |address|
        Address.create(
          sao: address['saon'],
          pao: address['paon'],
          street_name: address['street'],
          locality_name: address['locality'],
          town_name: address['town'],
          postcode_name: address['postcode']
        )
      end
    end

  end

end
