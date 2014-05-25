class CreateFacilitators < ActiveRecord::Migration
  def change
    create_table :facilitators do |t|

      t.timestamps
    end
  end
end
