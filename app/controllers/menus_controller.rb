class MenusController < ApplicationController
	before_action :authenticate_user!, only:[:tools]
	#before_action :authenticate_client!, only:[:admin_panel,:user_welcome]
	def user_welcome
		@profiles = Profile.limit(3).all
	end

	def tools
		if user_signed_in?
			@posts = Post.where(profile_id: current_user.profile.id)
			@hearts = Heart.where(post_id: current_user.profile.posts.collect(&:id))
			@coupon = Coupon.new
			@event = Event.new
			@coupon_redemptions = CouponRedemption.where(coupon_id: current_user.coupons.collect(&:id))

			type = view_context.get_survey_type(params[:type])
			query = if type then Survey::Survey.where(survey_type: type) else Survey::Survey end
				@surveys = query.where(user_id: current_user.id).order(created_at: :desc).page(params[:page])end
				@survey = Survey::Survey.new(survey_type: view_context.get_survey_type(params[:type]))
			end

			def admin_panel
				if current_user.user_lvl >= 3
					@categories = Category.all
					@category = Category.new

					@markets = Market.all
					@market = Market.new

					@profiles = Profile.all
					@profile = Profile.new
			#search profiles for edit
			if params[:query].present?
				#Profile.search(params[:query], page: params[:page], per_page: 10)
			end
		else
			redirect_to root_path, notice:"No tienes permisos para realizar esta accion"
		end
	end

	def search
		@search = Searchkick.search(params[:query], page: params[:page], per_page: 10, index_name: [Offer,Profile])
		@search2 = Offer.search(params[:query], page: params[:page], per_page: 10)
	end

	def myprofile
		if current_user.profile.present?
			redirect_to profile_path(current_user.profile)
		else
			redirect_to clientprofile_path(current_user.clientprofile)
		end
	end
end
