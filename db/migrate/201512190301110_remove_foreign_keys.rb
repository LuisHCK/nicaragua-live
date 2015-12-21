class RemoveForeignKeys < ActiveRecord::Migration
  def change
  	add_reference :pictures, :post, index: true
    add_foreign_key :pictures, :posts 
  end
end
