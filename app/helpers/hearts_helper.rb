module HeartsHelper
	def heart_button(post)
		if user_signed_in?

			if current_user.heart?(post)
				return button_to unheart_path(post_id: post.id), remote: true, method: :delete, class:"col s4 btn-flat" do

					icon('heart',class:'red-text', style:'font-size:2.5rem;')

				end

			else

				return button_to heart_path(post_id: post.id), remote: true, class:"col s4 btn-flat" do
					icon('heart-o',style:'font-size:2.5rem')

				end
			end

		elsif client_signed_in?

			if current_client.heart?(post)
				return button_to unheart_path(post_id: post.id), remote: true, method: :delete, class:"btn-flat" do

					icon('heart',class:'red-text', style:'font-size:2.5rem;')

				end
			else

				return button_to heart_path(post_id: post.id), remote: true, class:"btn-flat" do
					icon('heart-o',style:'font-size:2.5rem')
				end
			end
		end

		if client_signed_in? or user_signed_in?
		else
			if post.hearts.count > 0
				icon('heart',class:'red-text', style:'font-size:2.5rem;')
			else
				icon('heart-o',style:'font-size:2.5rem')
			end
		end

end#end method
end
