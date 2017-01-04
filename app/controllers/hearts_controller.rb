class HeartsController < ApplicationController
  respond_to :js

  def heart
    if user_signed_in?
      @user = current_user
      @post = Post.find(params[:post_id])
      @user.heart!(@post)
      
    elsif client_signed_in?
      @client = current_client
      @post = Post.find(params[:post_id])
      @client.heart!(@post)
    end
  end

  def unheart
    if user_signed_in?
      @user = current_user
      @heart = @user.hearts.find_by_post_id(params[:post_id])
      @post = Post.find(params[:post_id])
      @heart.destroy!

    elsif client_signed_in?
      @client = current_client
      @heart = @client.hearts.find_by_post_id(params[:post_id])
      @post = Post.find(params[:post_id])
      @heart.destroy!
    end
  end
end
