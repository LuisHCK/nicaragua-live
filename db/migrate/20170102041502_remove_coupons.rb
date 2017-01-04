class RemoveCoupons < ActiveRecord::Migration[5.0]
  def change
    drop_table :coupon_redemptions
    drop_table :coupons
  end
end
