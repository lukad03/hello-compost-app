class AddUsernameToClient < ActiveRecord::Migration
  def change
    add_column :clients, :username, :string
  end
end
