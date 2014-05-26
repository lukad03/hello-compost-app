class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :facilitator_locations
  has_many :facilitators, through: :facilitator_locations

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :latitude, presence: true, uniqueness: true
  validates :longitude, presence: true, uniqueness: true

end
