class ClientprofilesController < ApplicationController
  before_action :set_clientprofile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]

  # GET /clientprofiles
  # GET /clientprofiles.json
  def index
    @clientprofiles = Clientprofile.all
  end

  # GET /clientprofiles/1
  # GET /clientprofiles/1.json
  def show
    if user_signed_in?
      @coupon_redemptions = CouponRedemption.where(client_id: current_user.id)
    end
    #find_hearts = current_user.hearts.limit(2).order(created_at: :asc).collect(&:post_id)
    find_hearts = @clientprofile.user.hearts.limit(2).map(&:post_id)
    @posts = Post.where(id: find_hearts).order(created_at: :asc)
    @profiles = Profile.limit(2).where(:id => @clientprofile.user.follows.collect(&:profile_id) )
  end

  # GET /clientprofiles/new
  def new
    unless current_user.clientprofile.present?
        @clientprofile = Clientprofile.new
      else
        redirect_to edit_clientprofile_path(current_user.clientprofile)
    end
  end

  # GET /clientprofiles/1/edit
  def edit
  end

  # POST /clientprofiles
  # POST /clientprofiles.json
  def create
    @clientprofile = Clientprofile.new
    @clientprofile.user_id =  current_user.id
    respond_to do |format|
      if @clientprofile.save
        format.html { redirect_to edit_clientprofile_path(@clientprofile), notice: 'Tu perfil se creó correctamente.' }
        format.json { render :show, status: :created, location: @clientprofile }
      else
        format.html { render :new }
        format.json { render json: @clientprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientprofiles/1
  # PATCH/PUT /clientprofiles/1.json
  def update
    respond_to do |format|
      if @clientprofile.update(clientprofile_params)
        format.html { redirect_to @clientprofile, notice: 'Se actualizó la información de tu perfil.' }
        format.json { render :show, status: :ok, location: @clientprofile }
      else
        format.html { render :edit }
        format.json { render json: @clientprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientprofiles/1
  # DELETE /clientprofiles/1.json
  def destroy
    @clientprofile.destroy
    respond_to do |format|
      format.html { redirect_to clientprofiles_url, notice: 'Se ha borrado tu perfil.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clientprofile
      @clientprofile = Clientprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clientprofile_params
      params.require(:clientprofile).permit(:name, :avatar, :ubication, :cover, :biography)
    end
end
