class AddUserIdToElements < ActiveRecord::Migration
  def change
    add_reference :elements, :user, index: true, foreign_key: true
  end
end
