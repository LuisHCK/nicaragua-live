class ClientprofilesController < ApplicationController
  before_action :set_clientprofile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_client!, except: [:show,:index]

  # GET /clientprofiles
  # GET /clientprofiles.json
  def index
    @clientprofiles = Clientprofile.all
    @posts = Post.all
  end

  # GET /clientprofiles/1
  # GET /clientprofiles/1.json
  def show
    @posts = Post.all
  end

  # GET /clientprofiles/new
  def new
    @clientprofile = Clientprofile.new
  end

  # GET /clientprofiles/1/edit
  def edit
  end

  # POST /clientprofiles
  # POST /clientprofiles.json
  def create
    @clientprofile = Clientprofile.new(clientprofile_params)

    respond_to do |format|
      if @clientprofile.save
        format.html { redirect_to @clientprofile, notice: 'Clients profile was successfully created.' }
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
        format.html { redirect_to @clientprofile, notice: 'Clients profile was successfully updated.' }
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
      format.html { redirect_to clientprofiles_url, notice: 'Clients profile was successfully destroyed.' }
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
      params.require(:clientprofile).permit(:name, :avatar, :cover)
    end
end
