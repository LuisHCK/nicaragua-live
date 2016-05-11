class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.text :body
      t.timestamps null: false
    end
    add_reference :event_comments, :event, index: true
    add_foreign_key :event_comments, :events
  end
end
