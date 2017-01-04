class AddIonicIconToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories, :ionic_icon, :string
  end
end
