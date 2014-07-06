class CreateFacilitators < ActiveRecord::Migration
  def change
    create_table :facilitators do |t|

      t.string :name, null: false
      t.references :organization, index: true

      t.timestamps
    end
  end
end
