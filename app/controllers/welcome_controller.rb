class WelcomeController < ApplicationController
  before_action :authenticate_master_admin!, except: [:show,:index]
  def index
       @categories = Category.all
       @profiles = Profile.all
       @clientprofiles = Clientprofile.all

       @post = Post.new
       @follows = Follow.all
       @posts = Post.where(:profile_id => current_client.clientprofile.follows.collect(&:profile_id) ).order(created_at: :desc).all
       #this line collect the ids from followed users, then compare with the id of the post's owner and show in to welcome page. (an entire night for make this lol)
  end


  def show
    @category = Category.find(params[:id])
  end

  def order_posts

    @posts = follow.profile.order(created_at: :desc)
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
