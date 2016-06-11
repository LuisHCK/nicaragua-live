module CouponsHelper
	def redeem_code(coupon)
		@client_redemptions.find_by(coupon_id: coupon.id).unique_code
	end

	def is_on_date?(coupon_check)
		if coupon_check.valid_until>coupon_check.valid_from
			return true
		else
			return false
		end
	end

	def not_limited?(coupon_check)
		if coupon_check.redemption_limit = "0"
			return true
		else 
			return false
		end
	end


	def has_space?(coupon_check)
		if coupon_check.coupon_redemptions_count >= coupon_check.redemption_limit && coupon_check.redemption_limit > 0
			return false
		else
			return true
		end
	end

	def is_interchanged?
		
	end

	def is_valid?(coupon)
		if is_on_date?(coupon) && has_space?(coupon)
			return valid = "Válido"
		else
			return valid = "No es válido"
		end
	end

end
