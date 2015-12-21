class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.attachment :cover
      t.text :body
      t.string :direccion
      t.datetime :horario
      t.string :facebook
      t.string :twiter
      t.string :instagram
      t.string :youtube
      t.string :other

      t.timestamps null: false
    end
        add_reference :profiles, :user, index: true
        add_foreign_key :profiles, :users  
  end
end
