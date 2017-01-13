class AddUserToClientprofile < ActiveRecord::Migration
  def change
  	remove_foreign_key :clientprofiles, :client
  	add_reference :clientprofiles, :user, index: true
  end
end
