class AddLocationIdToFacilitator < ActiveRecord::Migration
  def change
    add_column :facilitators, :location_id, :integer
  end
end
