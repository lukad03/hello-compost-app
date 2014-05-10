class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|

      t.timestamps
    end
  end
end
