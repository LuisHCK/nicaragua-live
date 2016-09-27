module FollowsHelper
	def follow_bt_lg(profile)
		if user_signed_in?
			if current_user.follow?(profile)
				link_to 'Siguiendo', unfollow_path(profile_id: profile.id), remote: true,id:"follow", class:"btn btn-lg btn-default", method: :delete
			else
				button_to "Seguir", follow_path(profile_id: profile.id), class:"btn btn-lg btn-success",  remote: true, id:"follow"
			end
		else
			link_to 'Seguir', new_user_session_path, class:"btn btn-lg btn-success"
		end
	end

	def follow_small(profile)
		if user_signed_in?
			if current_user.follow?(profile)
				link_to 'Siguiendo', unfollow_path(profile_id: profile.id), remote: true,id:"follow", class:"btn btn-default", method: :delete
			else
				button_to "Seguir", follow_path(profile_id: profile.id), class:"btn btn-success",  remote: true, id:"follow"
			end
		else
			link_to 'Seguir', new_user_session_path, class:"btn btn-lg btn-success"
		end
	end
end
