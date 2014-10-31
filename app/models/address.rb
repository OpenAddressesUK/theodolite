class Address
  include Mongoid::Document

  after_create :create_slugs

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

  private

    def create_slugs
      [
        :pao,
        :sao,
        :street,
        :locality,
        :town,
        :postcode
      ].each do |element|
        self.send("#{element}_slug=".to_sym, self.send(element).to_s.to_url)
      end
    end

end
