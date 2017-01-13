class UpdateUsers < ActiveRecord::Migration
  def change
      remove_column :users, :user_type
      remove_column :users, :last_seen
      
      add_column :users, :user_lvl, :integer, default: 1
  end
end
