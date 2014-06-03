class Organization < ActiveRecord::Base
  has_many :admins
  has_many :clients
  has_many :facilitators
  has_many :locations
end
