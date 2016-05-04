class WelcomeController < ApplicationController
  before_action :authenticate_master_admin!, except: [:show,:index]
  def index
       @categories = Category.all
       @profiles = Profile.all
       @clientprofiles = Clientprofile.all

       @post = Post.new
       @follows = Follow.all

    if client_signed_in?
       @posts = Post.where(:profile_id => current_client.clientprofile.follows.collect(&:profile_id) ).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
       #this line collect the ids from followed users, then compare with the id of the post's owner and show in to welcome page. (an entire night for make this lol)
     else
       @posts = Post.paginate(:page => params[:page], :per_page => 10).all
     end

  end


  def show
    @category = Category.find(params[:id])
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
