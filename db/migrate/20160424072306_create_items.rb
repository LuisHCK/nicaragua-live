class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :titulo
      t.text :descripcion
      t.decimal :precio
      t.string :ubicacion
      t.string :estado
      t.integer :valoracion

      t.timestamps null: false
    end
    add_reference :items, :client, index: true
    add_foreign_key :items, :clients
  end
end
