class CouponRedemption < ActiveRecord::Base
	belongs_to :client
	belongs_to :coupon
end
