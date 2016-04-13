class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all

    @offers = Offer.where(nil)
      filtering_params(params).each do |key, value|
        @offers = @offers.public_send(key, value) if value.present?
      end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
    #If the current user's ID doesn't mathc with the creator's ID redirect to root with a notification
    if current_user.id != @offer.profile.user_id
      redirect_to root_path, notice: 'No estas autorizado para esta acción'
    end
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = current_user.profile.offers.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to current_user.profile, notice: '¡Tu oferta fue publicada!' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: '¡Tu oferta fue actualizada!' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: '¡Tu oferta fue borrada!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer,).permit(:titulo, :descripcion, :precio, :image, :cordoba)
    end

    def filtering_params(params)
      params.slice(:precio)
    end
end
