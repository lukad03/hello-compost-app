class AddWeightToScraps < ActiveRecord::Migration
  def change
    add_column :scraps, :weight, :integer
  end
end
