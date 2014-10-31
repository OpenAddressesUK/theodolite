class Address
  include Mongoid::Document

  field :pao, type: String
  field :sao, type: String
  field :street, type: String
  field :locality, type: String
  field :town, type: String
  field :postcode, type: String

end
