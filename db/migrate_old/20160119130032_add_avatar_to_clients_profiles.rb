class AddAvatarToClientsProfiles < ActiveRecord::Migration
  def change
    add_attachment :clientprofiles, :cover
  end
end
