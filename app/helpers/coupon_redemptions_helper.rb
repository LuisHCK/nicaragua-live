module CouponRedemptionsHelper
	def sum_to_counter(coupon)
		count = coupon.coupon_redemptions_count+=1
		coupon.update(coupon_redemptions_count: :count)
	end
end
