module ClientsProfilesHelper
	def my_coupons(clientprofile)
		if clientprofile.id == current_client.clientprofile.id
			return true
		else
			return false
		end
	end
end
