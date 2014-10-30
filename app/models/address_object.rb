class AddressObject
  include Mongoid::Document

  field :name, type: String
  field :slug, type: String

  has_many :addresses
  belongs_to :address
end
