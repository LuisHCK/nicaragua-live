class AddUserToCouponRedemptions < ActiveRecord::Migration
  def change
  	remove_foreign_key :coupon_redemptions, :client
  	remove_foreign_key :coupons, :user
  	add_reference :coupons, :profile, index: true, foreign_key: true 
    add_reference :coupon_redemptions, :user, index: true, foreign_key: true
  end
end
