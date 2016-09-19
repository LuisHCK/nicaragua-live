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

	def can_review?(profile)
		if user_signed_in?
			unless current_user.id == profile.user_id
				return true
			else
				return false
			end
		end
	end

	def edit_review(profile)
		if user_signed_in?
			if current_user.reviewed?(profile)
				review = current_user.reviews.find_by_profile_id(profile.id)
				return link_to("Editar Valoración", edit_profile_review_path(review.id) )
			end
		end
	end
end

