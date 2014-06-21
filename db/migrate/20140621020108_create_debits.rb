class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.belongs_to :client, index: true, null: false
      t.integer :value, null: false
      t.timestamps
    end
  end
end
