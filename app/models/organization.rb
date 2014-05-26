class Organization < ActiveRecord::Base
  has_many :locations
  has_many :admins
  has_many :users
end
