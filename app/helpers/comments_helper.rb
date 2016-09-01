module CommentsHelper
	def delete_comment(comment)
		#concatenate
		if client_signed_in? 
			if comment.client_id == current_client.id && comment.user_id == nil
				link_to [comment.post, comment], method: :delete, data: { confirm: '¿Borrar tu comentario?' }, class:"btn btn-danger pull-right" do
					icon('trash-o')
				end 
			end 

		elsif user_signed_in? 
			if comment.user_id == current_user.id && comment.client_id == nil

				link_to [comment.post, comment], method: :delete, data: { confirm: '¿Borrar tu comentario?' }, class:"btn btn-danger pull-right" do
					icon('trash-o')
				end
			end
		end
	end

	def profile_name_post

	end 		
end
