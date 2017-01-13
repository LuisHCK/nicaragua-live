class RecreateClientprofiles < ActiveRecord::Migration
  def change
    drop_table :clientprofiles
    create_table :clientprofiles do |t|
      t.string :name
      t.string :city
      t.text :biography
      t.timestamps null: false
    end
    add_attachment :clientprofiles, :cover
    add_attachment :clientprofiles, :avatar

    add_reference :clientprofiles, :client, index: true
    add_foreign_key :clientprofiles, :clients
  end
end
