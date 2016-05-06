class AddCommentsToEvents < ActiveRecord::Migration
  def change
    add_reference :comments, :event, index: true
    add_foreign_key :comments, :events
  end
end
