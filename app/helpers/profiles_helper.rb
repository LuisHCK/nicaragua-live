module ProfilesHelper
	def get_post_count
		current_user.posts.count
	end 

	def editable?(profile)
		if user_signed_in?
			if profile.id == current_user.profile.id
			 return true
			end
		end
	end

end
