module ClientsProfilesHelper
	def first_name(clientprofile)
		clientprofile.client.first_name
	end

	def last_name(clientprofile)
		clientprofile.client.last_name
	end

	def my_coupons(clientprofile)
		if client_signed_in? && clientprofile.id == current_client.clientprofile.id
			return true
		else
			return false
		end
	end
end
