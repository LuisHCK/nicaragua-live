module WelcomeHelper
	def precio(offer)
		if offer.cordoba == true
			return "#{'C$'}#{offer.precio}"
		else
			return "#{'$'}#{offer.precio}"
		end
	end
end
