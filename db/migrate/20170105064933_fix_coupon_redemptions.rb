class FixCouponRedemptions < ActiveRecord::Migration[5.0]
  def change
    #remove_foreign_key :coupon_redemptions, :profiles
    remove_column :coupon_redemptions, :profile_id
    add_reference :coupon_redemptions, :coupon, index: true, foreign_key: true 
  end
end
