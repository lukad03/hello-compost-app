class ChangeDataTypeForWeight < ActiveRecord::Migration
  def change
    change_column :scraps, :weight, :decimal, :precision => 5, :scale => 2
  end
end
