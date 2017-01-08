module WelcomeHelper
	def precio(offer)
		if offer.cordoba == true
			return "#{'C$'}#{offer.precio}"
		else
			return "#{'$'}#{offer.precio}"
		end
	end

	def usr_avatar(user)
		if user.profile.present?
			return user.profile.avatar(:thumb)
		elsif user.clientprofile.present?
			return user.clientprofile.avatar(:thumb)
		else
			return "error"
		end
	end

	def usr_name(user)
		if user.profile.present?
			return user.profile.name
		elsif user.clientprofile.present?
			return "#{user.clientprofile.first_name} #{user.clientprofile.last_name}"
		else
			return "error"
		end		
	end

	def welcome_buttons
		if user_signed_in?
			content_tag(:li) do
				link_to('Mis cupones', '#', class:"btn btn-primary")
			end
			
		else
			content_tag(:li) do
				link_to('Entrar con Facebook', '#', class:"btn btn-primary")
			end
		end

	end
end
