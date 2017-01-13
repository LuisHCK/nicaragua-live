class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :title
      t.text :description
      t.decimal :ammount
      t.integer :max_redemptions, default: 0
      t.string :code
      t.string :state, default: 'available'
      t.date :start_date
      t.date :end_date
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
