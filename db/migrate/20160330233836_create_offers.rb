class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :titulo
      t.string :descripcion
      t.attachment :image
      t.decimal :precio
      t.timestamps null: false
    end
  end
end
