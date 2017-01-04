json.profiles @promoved_profiles.each do |profile| 
	json.id 			profile.id
	json.name 			profile.name
	json.avatar 		profile.avatar
	json.description 	profile.body	
	json.reviews 		profile.reviews.count
	json.stars 			profile.reviews.average(:rating)
	json.verified 		profile.verification.present?
end

json.offers @offers do |offer|
	json.id 			offer.id
	json.image 			offer.image
	json.title 			offer.titulo
	json.description 	offer.descripcion
	json.owner_name 	offer.profile.name
	json.owner_id 		offer.profile.id
	json.owner_verified offer.profile.verification.present?
	json.favs 			offer.offer_saveds.count
end

json.comments @comments do |comment|
	json.id 			comment.id
	json.owner_id 		comment.user.id
	json.owner_name 	usr_name(comment.user)
	json.user_avatar 	usr_avatar(comment.user)
	json.post 			comment.post.id
	json.content 		comment.body
end
