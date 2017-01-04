class AddPinnableToPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :likes
  	add_column :posts, :pin, :boolean 
  end
end
