class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index,:privacity,:terms]
  def index
   @categories = Category.all
   @profiles = Profile.all

    partners = Partner.all
    @promoved_profiles = Profile.where(id: partners.collect(&:profile_id)).all

    @post = Post.new
    @follows = Follow.order(created_at: :desc).all
    @coupons = Coupon.order(created_at: :desc).all


    @comments = Comment.order(created_at: :desc).paginate(page: params[:page], per_page: 10).all


    if user_signed_in?
     @posts = Post.all.paginate(page: params[:page], per_page: 10)
   else
     @posts = Post.order(created_at: :desc).paginate(:page => params[:page], per_page: 10).all
   end

end


def show
  @category = Category.find(params[:id])
end

def favorites
  @posts = Post.where(:profile_id => current_user.follows.collect(&:profile_id) ).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
      #this line collect the ids from followed users, then compare with the id of the post's owner and show in to welcome page. (an entire night for make this lol)
      @offers = Offer.where(id: current_user.offer_saveds.collect(&:offer_id) ).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
      @offer_saveds = current_user.offer_saveds.all
      @profiles = Profile.where(id: current_user.follows.collect(&:profile_id)).order(created_at: :desc)
    end

    def privacity

    end

    def terms

    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end

  end
