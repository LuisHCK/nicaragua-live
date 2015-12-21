class AddProfileIdToPosts < ActiveRecord::Migration
  def change
  	    add_reference :posts, :profile, index: true
        add_foreign_key :posts, :profiles  
  end
end
