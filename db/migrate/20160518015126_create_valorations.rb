class CreateValorations < ActiveRecord::Migration
  def change
    create_table :valorations do |t|
      t.text :comment
      t.integer :rating

      t.timestamps null: false
    end
    add_reference :valorations, :client, index: true
    add_foreign_key :valorations, :clients

  end
end
