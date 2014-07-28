class Credit < ActiveRecord::Base
  belongs_to :client
  belongs_to :location
end
