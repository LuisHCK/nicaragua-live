class AddAvatarToProfiles < ActiveRecord::Migration
  def change
    add_attachment :profiles, :avatar
  end
end
