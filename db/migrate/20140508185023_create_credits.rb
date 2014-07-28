class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :value, null: false
      t.references :client, index: true, null: false
      t.references :location, index: true

      t.timestamps
    end
  end
end
