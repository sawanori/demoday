class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :title, null: false,default: ""
      t.text :description, null: false,default: ""
      t.integer :charge, null: false,default: ""
      t.text :place, null: false,default: ""
      t.integer :phone, null: false,default: ""
      t.integer :user_id, null: false,default: ""

      t.timestamps null: false
    end
  end
end
