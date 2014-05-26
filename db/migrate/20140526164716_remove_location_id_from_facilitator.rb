class RemoveLocationIdFromFacilitator < ActiveRecord::Migration
  def change
    remove_column :facilitators, :location_id, :integer
  end
end
