class RenameClientsProfilesToClientsprofiles < ActiveRecord::Migration
  def change
    rename_table :clientprofiles, :clientprofiles
  end
end
