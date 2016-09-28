class DropPartners < ActiveRecord::Migration
  def change
  	remove_foreign_key :partners, :user
  	remove_index :partners, name: "index_partners_on_user_id"
  	drop_table :partners
  end
end
