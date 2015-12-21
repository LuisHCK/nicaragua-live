class WelcomeController < ApplicationController
  before_action :authenticate_master_admin!, except: [:show,:index]
  def index
       @categories = Category.all
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
