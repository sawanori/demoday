class RemoveUserIdFromSpots < ActiveRecord::Migration
  def change
    remove_column :spots, :user_id, :integer
  end
end
