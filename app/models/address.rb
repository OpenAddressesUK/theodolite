class Address
  include Mongoid::Document

  field :pao, type: String
  field :sao, type: String

  embeds_one :street
  embeds_one :locality
  embeds_one :town
  embeds_one :postcode

end
