class Facilitator < ActiveRecord::Base
  belongs_to :organization
  has_many :facilitator_locations
  has_many :locations, through: :facilitator_location
  has_one :user, :as => :rolable
end
