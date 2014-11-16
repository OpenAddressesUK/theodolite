class Address
  include Mongoid::Document

  ADDRESS_ELEMENTS = [
    :sao,
    :pao,
    :street,
    :locality,
    :town,
    :postcode
  ]

  before_create :create_slugs

  field :_id, type: String, default: ->{ SecureRandom.uuid }

  field :pao, type: String
  field :sao, type: String
  field :street, type: String
  field :locality, type: String
  field :town, type: String
  field :postcode, type: String

  field :pao_slug, type: String
  field :sao_slug, type: String
  field :street_slug, type: String
  field :locality_slug, type: String
  field :town_slug, type: String
  field :postcode_slug, type: String

  def full_address_lines
    address = ADDRESS_ELEMENTS.map { |element| 
      val = self.send(element)
      unless element == :pao && val =~ /\d/
        if element == :street && self.pao =~ /\d/ && !self.send(element).nil?
          self.pao + ' ' + self.send(element)
        else
          self.send(element) 
        end
      end
    }

    address.reject { |e| e.nil? }
  end

  def full_address
    self.full_address_lines.join(", ")
  end

  private

    def create_slugs
      ADDRESS_ELEMENTS.each do |element|
        self.send("#{element}_slug=".to_sym, self.send(element).to_s.to_url)
      end
    end

end
