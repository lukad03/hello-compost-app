class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :users

  geocoded_by :address
  after_validation :geocode
end
