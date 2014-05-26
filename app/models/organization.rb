class Organization < ActiveRecord::Base
  has_many :locations
  has_many :admins
end
