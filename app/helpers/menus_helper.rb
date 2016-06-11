module MenusHelper
	extend CouponsHelper
	def profile
		current_user.profile		
	end

	def follower_info(client_id)
		@clienprofile = Clientprofile.find_by_id(client_id)
	end

	def follow_date(client_id)
		@follow = Follow.where(profile_id: current_user.profile.id).limit(9)
	end

	def client_coupon(coupon_redemption)
		coupon_redemption.client.clientprofile.name
	end
end
