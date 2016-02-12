class CreateFollows < ActiveRecord::Migration
  drop_table :follows
  def change
    create_table :follows do |t|
      t.belongs_to :profiles, index: true
      t.belongs_to :clientprofiles, index: true
      t.timestamps null: false
    end
  end
end
