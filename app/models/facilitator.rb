class Facilitator < ActiveRecord::Base
  belongs_to :organization
  has_many :facilitator_locations
  has_many :locations, through: :facilitator_locations
  has_one :user, :as => :rolable

  accepts_nested_attributes_for :user
end
