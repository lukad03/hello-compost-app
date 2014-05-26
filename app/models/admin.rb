class Admin < ActiveRecord::Base
  has_one :user, as: :rolable, dependent: :destroy
  belongs_to :organization
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :organization
end
