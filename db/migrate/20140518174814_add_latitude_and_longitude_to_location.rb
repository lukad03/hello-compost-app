class AddLatitudeAndLongitudeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :string
    add_column :locations, :float, :string
  end
end
