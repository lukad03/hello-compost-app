class Admin < ActiveRecord::Base
  belongs_to :organization
  has_one :user, as: :rolable, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :organization
end
