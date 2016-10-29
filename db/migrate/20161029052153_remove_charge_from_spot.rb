class RemoveChargeFromSpot < ActiveRecord::Migration
  def change
    remove_column :spots, :charge, :integer
  end
end
