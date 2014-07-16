class Client < ActiveRecord::Base
  belongs_to :location
  belongs_to :organization
  has_many :credits, dependent: :destroy
  has_many :scraps
  has_one :user, :as => :rolable

  accepts_nested_attributes_for :user
  validates :username, presence: true, uniqueness: true
end
