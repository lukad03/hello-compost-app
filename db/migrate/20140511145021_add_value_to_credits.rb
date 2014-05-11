class AddValueToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :value, :integer
  end
end
