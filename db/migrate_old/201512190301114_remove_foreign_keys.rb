class RemoveForeignKeys < ActiveRecord::Migration
  def change
  	add_reference :items, :market, index: true
    add_foreign_key :items, :markets
  end
end
