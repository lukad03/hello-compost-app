class AddUserIdToScraps < ActiveRecord::Migration
  def change
    add_column :scraps, :user_id, :integer
  end
end
