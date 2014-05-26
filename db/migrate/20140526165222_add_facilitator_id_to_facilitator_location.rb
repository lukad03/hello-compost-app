class AddFacilitatorIdToFacilitatorLocation < ActiveRecord::Migration
  def change
    add_column :facilitator_locations, :facilitator_id, :integer
  end
end
