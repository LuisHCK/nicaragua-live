class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_client!, except:[:show,:index]
  #before_action :authenticate_master_admin!, except: [:show,:index]
  # GET /categories
  # GET /categories.json
  respond_to
  def index
    @categories = Category.all
    @promoved_profiles = Profile.where.not(aasm_campaign: 'noone')
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @categories = Category.order(created_at: :asc).all
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_panel_path, notice: 'La categoria se creó correctamente' }
        format.json { render :show, status: :created, location: admin_panel_path }
        format.js
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_panel_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @categories = Category.all
    @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_panel_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :cover, :icon)
    end

    def check_admin
      if client_signed_in?
      end
    end
end
