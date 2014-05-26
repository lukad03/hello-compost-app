class AddLocationIdToFacilitatorLocation < ActiveRecord::Migration
  def change
    add_column :facilitator_locations, :location_id, :integer
  end
end
