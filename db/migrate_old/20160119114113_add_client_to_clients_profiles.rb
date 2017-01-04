class AddClientToClientsProfiles < ActiveRecord::Migration
  def change
    add_reference :clientprofiles, :client, index: true, foreign_key: true
  end
end
