class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    @posts = Post.all

    #@pictures = @post.pictures
  end

  def search
    @profiles = Profile.search(parms[:search])
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @offers = Offer.where(profile_id: @profile.id)
    @reviews = Review.where(profile_id: @profile.id).order("created_at DESC")

      if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
      end

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    redirect_to(edit_user_registration_path)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    respond_to do |format|
      if @profile.save
        format.html { redirect_to edit_profile_path, notice: 'El perfil se creó correctamente' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'El perfil se actualizó correctamente' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Tu perfil fue borrado permanentemente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :cover, :avatar, :body, :direccion, :horario, :facebook, :twiter, :instagram, :youtube, :other, :category_id)
    end
end
