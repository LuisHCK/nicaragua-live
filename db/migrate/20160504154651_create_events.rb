class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :description
      t.timestamps null: false
    end
    add_reference :events, :user, index: true
    add_foreign_key :events, :users
  end
end
