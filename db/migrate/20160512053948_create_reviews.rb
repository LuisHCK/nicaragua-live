class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.timestamps null: false
    end
    add_reference :reviews, :client, index: true
    add_foreign_key :reviews, :clients

    add_reference :reviews, :profile, index: true
    add_foreign_key :reviews, :profiles
  end
end
