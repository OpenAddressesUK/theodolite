class Locality < ActiveRecord::Base

  belongs_to :address
  belongs_to :town
  has_many :postcodes
  has_many :streets

end
