class ChangeFollows < ActiveRecord::Migration
def change
	drop_table :follows
  create_table :follows do |t|
    t.belongs_to :profile, index: true
    t.belongs_to :client, index: true
    t.timestamps null: false
  end
end
end
