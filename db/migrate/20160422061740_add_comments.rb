class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamps null: false
    end

    add_reference :comments, :post, index: true
    add_foreign_key :comments, :posts

    add_reference :comments, :client, index: true
    add_foreign_key :comments, :clients

    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users
  end
end
