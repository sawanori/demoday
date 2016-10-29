class CreateSpotVotes < ActiveRecord::Migration
  def change
    create_table :spot_votes do |t|
      t.references :spot, null: false
      t.references :user, null: false
      t.timestamps null: false
    end
    add_index :spot_votes, :spot_id
    add_index :spot_votes, :user_id
  end
end
