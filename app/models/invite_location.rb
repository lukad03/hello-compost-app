class InviteLocation < ActiveRecord::Base
  belongs_to :invite, inverse_of: :invite_locations
  belongs_to :location, inverse_of: :invite_locations
end
