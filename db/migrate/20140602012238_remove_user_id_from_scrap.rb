class RemoveUserIdFromScrap < ActiveRecord::Migration
  def change
    remove_column :scraps, :user_id, :integer
  end
end
