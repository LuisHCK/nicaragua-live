module ProfilesHelper
	def get_post_count
		current_user.posts.count
	end 

	def editable?(profile)
		if client_signed_in? && profile.id == current_user.profile.id
		 return true
		end
	end
end
