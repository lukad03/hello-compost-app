class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :clients
  has_many :facilitator_locations
  has_many :facilitators, through: :facilitator_locations
  has_many :invite_locations
  has_many :invites, through: :invite_locations

  validates :name, :address, presence: true, uniqueness: true
  validates :latitude, :longitude, :organization, presence: true

end
