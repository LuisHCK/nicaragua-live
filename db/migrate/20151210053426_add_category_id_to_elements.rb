class AddCategoryIdToElements < ActiveRecord::Migration
  def change
    add_reference :elements, :category, index: true, foreign_key: true
  end
end
