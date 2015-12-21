class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :likes
      t.integer :visit_count

      t.timestamps null: false
    end
  end
end
