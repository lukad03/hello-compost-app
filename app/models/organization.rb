class Organization < ActiveRecord::Base
  has_many :admins, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :facilitators, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :locations, dependent: :destroy
end
