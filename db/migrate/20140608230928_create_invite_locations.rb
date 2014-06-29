class CreateInviteLocations < ActiveRecord::Migration
  def change
    create_table :invite_locations do |t|

      t.references :location, index: true, null: false
      t.references :invite, index: true, null: false

      t.timestamps
    end
  end
end
