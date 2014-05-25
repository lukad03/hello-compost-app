class FacilitatorLocation < ActiveRecord::Base
  belongs_to :locations, inverse_of: :facilitator_locations
  belongs_to :facilitators, inverse_of: :facilitator_locations
end
