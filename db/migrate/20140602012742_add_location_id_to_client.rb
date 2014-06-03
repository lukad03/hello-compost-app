class AddLocationIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :location_id, :integer
  end
end
