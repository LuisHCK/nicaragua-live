module CommentsHelper
	def delete_comment(comment)
		#concatenate
		if client_signed_in? 
			if comment.client_id == current_client.id && comment.user_id == nil
				link_to [comment.post, comment], method: :delete, data: { confirm: '¿Borrar tu comentario?' }, class:"right" do
					content_tag(:i,'delete',class:'red-text material-icons')
				end 
			end 

		elsif user_signed_in? 
			if comment.user_id == current_user.id && comment.client_id == nil

				link_to [comment.post, comment], method: :delete, data: { confirm: '¿Borrar tu comentario?' }, class:"right" do
					content_tag(:i,'delete',class:'red-text material-icons')
				end
			end
		end
	end 		
end
