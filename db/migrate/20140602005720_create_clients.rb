class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :location, index: true, null: false
      t.references :organization, index: true, null: false
      t.string :username, null: false

      t.timestamps
    end
  end
end
