module ProfilesHelper
	def get_post_count
		current_user.posts.count
	end 
end
