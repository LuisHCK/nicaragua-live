class CreateOfferSaveds < ActiveRecord::Migration
  def change
    create_table :offer_saveds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
