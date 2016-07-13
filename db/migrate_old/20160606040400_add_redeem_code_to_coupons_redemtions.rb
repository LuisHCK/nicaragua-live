class AddRedeemCodeToCouponsRedemtions < ActiveRecord::Migration
  def change
  	add_column :coupon_redemptions, :unique_code, :string
  end
end
