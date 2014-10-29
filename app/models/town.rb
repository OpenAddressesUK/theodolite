class Town < ActiveRecord::Base

  belongs_to :address
  has_many :postcodes
  has_many :localities
  has_many :streets

end
