class AddSectToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :sect, :string
  end
end
