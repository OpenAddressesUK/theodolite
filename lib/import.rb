class Import

  def self.perform(pages = nil)
    response = HTTParty.get(ENV['ERNEST_ADDRESS_ENDPOINT']).parsed_response
    pages = pages || response["pages"].to_i

    1.upto(pages) do |i|
      response = HTTParty.get("#{ENV['ERNEST_ADDRESS_ENDPOINT']}?page=#{i}").parsed_response
      response['addresses'].each do |address|
        Address.create(
          sao: address['saon'],
          pao: address['paon'],
          street: address['street'],
          locality: address['locality'],
          town: address['town'],
          postcode: address['postcode']
        )
      end
    end

  end

end
