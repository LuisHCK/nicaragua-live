class AddUserToFollows < ActiveRecord::Migration
  def change
  	remove_foreign_key :follows, :client
    add_reference :follows, :user, index: true, foreign_key: true
  end
end
