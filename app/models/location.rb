class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :clients, dependent: :destroy
  has_many :facilitator_locations, dependent: :destroy
  has_many :facilitators, through: :facilitator_locations, dependent: :destroy
  has_many :invite_locations, dependent: :destroy
  has_many :invites, through: :invite_locations, dependent: :destroy

  validates :name, :address, presence: true, uniqueness: true
  validates :latitude, :longitude, :organization, presence: true

end
