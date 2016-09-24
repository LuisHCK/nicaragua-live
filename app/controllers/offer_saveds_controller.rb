class OfferSavedsController < ApplicationController
  before_action :set_offer_saved, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]
  # GET /offer_saveds
  # GET /offer_saveds.json
  def index
    @offer_saveds = OfferSaved.all
  end

  # GET /offer_saveds/1
  # GET /offer_saveds/1.json
  def show
  end

  # GET /offer_saveds/new
  def new
    @offer_saved = OfferSaved.new
  end

  # GET /offer_saveds/1/edit
  def edit
  end

  # POST /offer_saveds
  # POST /offer_saveds.json
  def create
    @offer_saved = OfferSaved.new(offer_id: params[:offer_id])
    @offer_saved.user_id = current_user.id
    @profile = Profile.find(params[:profile_id])

    respond_to do |format|
      if @offer_saved.save
        format.html { redirect_to @offer_saved, notice: 'Offer saved was successfully created.' }
        format.json { render :show, status: :created, location: @offer_saved }
      else
        format.html { redirect_to @profile, notice: "Hubo un error en la solicitud"}
        format.json { render json: @offer_saved.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_saveds/1
  # PATCH/PUT /offer_saveds/1.json
  def update
    respond_to do |format|
      if @offer_saved.update(offer_saved_params)
        format.html { redirect_to @offer_saved, notice: 'Offer saved was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer_saved }
      else
        format.html { render :edit }
        format.json { render json: @offer_saved.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_saveds/1
  # DELETE /offer_saveds/1.json
  def destroy
    @offer_saved.destroy
    respond_to do |format|
      format.html { redirect_to offer_saveds_url, notice: 'Offer saved was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_saved
      @offer_saved = OfferSaved.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_saved_params
      params.require(:offer_saved).permit(:user_id, :offer_id)
    end
end
