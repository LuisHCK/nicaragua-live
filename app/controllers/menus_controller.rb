class MenusController < ApplicationController
  def index
    @offers = Offer.filter(params.slice(:precio))
  end
end
