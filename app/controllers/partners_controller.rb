class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.all
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    if current_user.user_lvl >= 3
      @partner = Partner.new
    else
      redirect_to root_path, notice: "No tienes permiso para esta acción"
    end
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners
  # POST /partners.json
  def create
    if current_user.user_lvl >= 3
    @partner = Partner.new(partner_params)

      respond_to do |format|
        if @partner.save
          format.html { redirect_to '/admin_panel#tab2', notice: "#{@partner.profile.name}#{' ahora es socio'}" }
          format.json { render :show, status: :created, location: @partner }
        else
          format.html { render :new }
          format.json { render json: @partner.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to @partner, notice: 'Partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to partners_url, notice: 'Partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:partner).permit(:profile_id)
    end
  end
