class AddNameToFacilitator < ActiveRecord::Migration
  def change
    add_column :facilitators, :name, :string
  end
end
