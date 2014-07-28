class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.decimal :weight, :precision => 5, :scale => 2
      t.references :client, index: true, null: false
      t.references :location, index: true, null:false

      t.timestamps
    end
  end
end
