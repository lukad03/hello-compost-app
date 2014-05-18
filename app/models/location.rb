class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :latitude, presence: true, uniqueness: true
  validates :longitude, presence: true, uniqueness: true

end
