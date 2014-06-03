class AddClientIdToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :client_id, :integer
  end
end
