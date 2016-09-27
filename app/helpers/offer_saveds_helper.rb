module OfferSavedsHelper
	def offer_actions(offer)
		if current_user.fav?(offer) then 
			link_to(icon('star'),offer_saved_path(id: current_user.offer_saveds.find_by_offer_id(offer.id),offer_id: offer.id),method: :delete, data:{confirm:'¿Eliminas esto de tus favoritos?'}, remote:true, class:"btn btn-default")
		else 
			link_to(icon('star-o'), offer_saveds_path(user_id: current_user.id, offer_id: offer.id, profile_id: offer.profile), method: :post, remote:true, class:"btn btn-success")
		end
	end
end
