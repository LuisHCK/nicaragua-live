class AddHasSectionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_section, :boolean
  end
end
