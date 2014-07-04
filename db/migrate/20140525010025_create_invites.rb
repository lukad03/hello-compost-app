class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|

      t.string :email, :string, null: false, unique: true
      t.string :invited_at, :string
      t.string :redeemed_at, :string
      t.references :organization, index: true, null: false
    end
  end
end
