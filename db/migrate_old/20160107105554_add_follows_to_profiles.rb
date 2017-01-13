class AddFollowsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :followers, :int
    add_column :profiles, :following, :int
  end
end
