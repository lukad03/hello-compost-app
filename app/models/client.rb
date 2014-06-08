class Client < ActiveRecord::Base
  belongs_to :location
  belongs_to :organization
  has_many :credits
  has_many :scraps
  has_one :user, :as => :rolable

  accepts_nested_attributes_for :user
end
