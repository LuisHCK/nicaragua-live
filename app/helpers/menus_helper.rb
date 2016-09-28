module MenusHelper
	extend CouponsHelper
	def profile_user
		current_user.profile
	end

	def follower_info(client_id)
		@clienprofile = Clientprofile.find_by_id(client_id)
	end

	def follow_date(client_id)
		@follow = Follow.where(profile_id: current_user.profile.id).limit(9)
	end

	def client_coupon(coupon_redemption)
		coupon_redemption.client.clientprofile.name
	end

	def is_on_date?(coupon_check)
		if coupon_check.valid_until>coupon_check.valid_from
			return true
		else
			return false
		end
	end

	def not_limited?(coupon_check)
		if coupon_check.redemption_limit = "0"
			return true
		else
			return false
		end
	end


	def has_space?(coupon_check)
		if coupon_check.coupon_redemptions_count >= coupon_check.redemption_limit &&
		coupon_check.redemption_limit > 0
			return false
		else
			return true
		end
	end

	def not_redeemed(redeem_check)
		if redeem_check.state == "active"
			return true
		else
			return false
		end
	end

	def is_valid?(coupon,redeem)
		if is_on_date?(coupon) && has_space?(coupon) && redeem.state == "active"
			return valid = "Válido"
		else
			return valid = "No es válido"
		end
	end

	def is_admin?(client)
		if client.role == 'admin'
			return true
		end
	end

	def category(profile)
		if profile.present?
			category = Category.find(profile.category_id)
			return category.name
		else
			return 'Vacio'
		end
	end

	def picture(follower)
		if follower.client.clientprofile.present?
			concat image_tag(follower.client.clientprofile.avatar(:thumb), class:"circle responsive-img")
			follower.client.clientprofile.name
		end
	end

	#search filter
	def is_profile?(result)
		if result.class == Profile
			return true
		else
			return false
		end
	end

	def is_offer?(result)
		if result.class == Offer
			return true
		else
			return false
		end
	end

	def profile_find(profile)
		Profile.find_by_id(profile)
	end

	def offer_find(offer)
		Offer.find_by_id(offer)		
	end

	def change_level(user,text,lvl)
		#link_to(text, edit_user_registration_path(id: user.id, 'user[user_lvl]'=> lvl), method: :put)
		#link_to text, registration_path(resource_name, :user => {:user_lvl => lvl}),
		#:method => :put, :confirm => "Are you sure?"
	end

	def partner!(profile)
		if current_user.user_lvl >= 3
			if profile.partner.present?
				return link_to('Quitar Socio',
					partner_path(id: profile.partner.id,profile_id: profile.id),method: :delete)
			else
				return link_to('Hacer Socio',partners_path(profile_id: profile.id),method: :post)
			end
		end		
	end
end
