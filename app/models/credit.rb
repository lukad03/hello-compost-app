class Credit < ActiveRecord::Base
  belongs_to :client

  validates :value, presence: true
end
