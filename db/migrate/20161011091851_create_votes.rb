class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :postarticle, null: false
      t.references :user, null: false
      t.timestamps null: false
    end

    add_index :votes, :postarticle_id
    add_index :votes, :user_id
  end
end
