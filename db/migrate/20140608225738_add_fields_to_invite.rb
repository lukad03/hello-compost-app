class AddFieldsToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :email, :string, null: false, unique: true
    add_reference :invites, :organization, index: true, null: false
  end
end
