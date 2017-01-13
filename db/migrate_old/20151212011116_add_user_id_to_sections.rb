class AddUserIdToSections < ActiveRecord::Migration
  def change
        add_reference :sections, :user, index: true
        add_foreign_key :sections, :users  
  end
end
