class AddCityToClientProfile < ActiveRecord::Migration
  def change
    add_column :clientprofiles, :biography, :string
  end
end
