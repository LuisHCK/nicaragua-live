class CreateCoupons < ActiveRecord::Migration
  def change
  	drop_table :coupons
  	drop_table :coupon_redemptions
    create_table :coupons do |t|
      t.string :code, null: false
      t.string :description, null: true
      t.date :valid_from, null: false
      t.date :valid_until, null: true
      t.integer :redemption_limit, default: 1, null: false
      t.integer :coupon_redemptions_count, default: 0, null: false
      t.integer :amount, null: false, default: 0
      t.string :type, null: false
      t.timestamps null: false

      case ActiveRecord::Base.connection.adapter_name
      when 'Mysql2'
        t.text :attachments
      else
        t.text :attachments, null: false, default: '{}'
      end
      t.timestamps null: false
    end
    create_table :coupon_redemptions do |t|
      t.belongs_to :coupon, null: false
      t.string :order_id, null: true
      t.timestamps null: false
    end
      add_reference :coupons, :user, index: true, foreign_key: true
	  add_reference :coupon_redemptions, :client, index: true, foreign_key: true
  end
end
