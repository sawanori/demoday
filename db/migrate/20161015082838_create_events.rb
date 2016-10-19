class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_title
      t.text :event_content
      t.integer :event_charge
      t.integer :member_count
      t.references :user, index: true, foreign_key: true
      t.references :spot, index: true, foreign_key: true
      t.date :event_day

      t.timestamps null: false
    end
  end
end
