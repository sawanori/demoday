class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :title, null: false,default: ""
      t.text :description
      t.integer :charge
      t.text :place, null: false,default: ""
      t.integer :phone
      t.integer :user_id, null: false,default: ""

      t.timestamps null: false
    end
  end
end

rake db:migrate:redo version=20161002070837
