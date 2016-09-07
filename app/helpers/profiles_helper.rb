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

	def reviewed?(profile)
		if profile.reviews.count > 0
			return true
		else
			return false
		end
	end

	def has_partner?(user)
		if user.partner.present?
			return true
		else
			return false
		end
	end
end
