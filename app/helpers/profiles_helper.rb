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
				return false
			else
				return true
			end
		end
	end

	def edit_review(profile)
		if user_signed_in?
			if current_user.reviewed?(profile)
				review = current_user.reviews.find_by_profile_id(profile.id)
				return link_to("Editar Valoración", edit_profile_review_path(profile.id,review.id) )
			end
		end
	end

	def my_profile?(profile)
		if user_signed_in?
			if current_user.profile == profile
				return true
			end
		end
	end

	def veryfied?(profile)
		if profile.verification.present?
			return icon('check-circle', class:'blue-text')
		end
	end

	def verify!(profile)
		if user_signed_in?
			if current_user.user_lvl >= 3 && profile.verification == nil
				link_to 'Verificar', verifications_path(profile_id: profile.id), 
				method: :post, class:"btn btn-warning"
			end
		end
	end
end

