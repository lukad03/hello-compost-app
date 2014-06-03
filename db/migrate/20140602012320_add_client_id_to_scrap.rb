class AddClientIdToScrap < ActiveRecord::Migration
  def change
    add_column :scraps, :client_id, :integer
  end
end
