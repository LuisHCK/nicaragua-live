module ClientsProfilesHelper
	def my_coupons(clientprofile)
		if client_signed_in? && clientprofile.id == current_client.clientprofile.id
			return true
		else
			return false
		end
	end
end
