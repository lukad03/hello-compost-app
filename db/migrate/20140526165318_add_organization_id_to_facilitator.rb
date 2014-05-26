class AddOrganizationIdToFacilitator < ActiveRecord::Migration
  def change
    add_column :facilitators, :organization_id, :integer
  end
end
