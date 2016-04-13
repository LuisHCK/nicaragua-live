class MenusController < ApplicationController
  def search
    @offers = Offer.where(params[:search]).order("created_at DESC")
  end
end
