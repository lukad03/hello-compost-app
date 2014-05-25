class CreateFacilitatorLocations < ActiveRecord::Migration
  def change
    create_table :facilitator_locations do |t|

      t.timestamps
    end
  end
end
