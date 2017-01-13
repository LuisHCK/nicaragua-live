module OffersHelper
	def fav_counter(offer)
		return "#{offer.offer_saveds.count}#{' personas han agregado a favoritos!'}"		
	end
end
