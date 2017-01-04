module ClientsProfilesHelper
	def first_name(clientprofile)
		clientprofile.user.name
	end

	def last_name(clientprofile)
		clientprofile.user.last_name
	end

	def my_coupons(clientprofile)
		if user_signed_in? && clientprofile.id == current_user.clientprofile.id
			return true
		else
			return false
		end
	end
end
