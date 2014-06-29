class FacilitatorLocation < ActiveRecord::Base
  belongs_to :location, inverse_of: :facilitator_locations
  belongs_to :facilitator, inverse_of: :facilitator_locations

  validates :location, presence: true
  validates :facilitator, presence: true
end
