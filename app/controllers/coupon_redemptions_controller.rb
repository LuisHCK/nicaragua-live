class CouponRedemptionsController < ApplicationController
  before_action :set_coupon_redemption, only: [:show, :edit, :update, :destroy]
  before_action :set_coupon
  
  # GET /coupon_redemptions
  # GET /coupon_redemptions.json
  def index
    @coupon_redemptions = CouponRedemption.all
  end

  # GET /coupon_redemptions/1
  # GET /coupon_redemptions/1.json
  def show
  end

  # GET /coupon_redemptions/new
  def new
    @coupon_redemption = CouponRedemption.new
  end

  # GET /coupon_redemptions/1/edit
  def edit
  end

  # POST /coupon_redemptions
  # POST /coupon_redemptions.json
  def create
    if current_client.redeemed?(@coupon)
        redirect_to coupons_path, notice: 'No puedes reclamar otra vez el mismo cupón'
      else
      @coupon_redemption = CouponRedemption.new(coupon_redemption_params)
      @coupon_redemption.unique_code = SecureRandom.hex(3)
      @coupon_redemption.coupon_id = @coupon.id
      @coupon_redemption.client_id = current_client.id
      #redemtion count
        count = @coupon.coupon_redemptions_count+1
        @coupon.update_attributes(coupon_redemptions_count: count)
      respond_to do |format|
        if @coupon_redemption.save
          format.html { redirect_to coupons_path, notice: '¡Has reclamado un cupón!' }
          format.json { render :show, status: :created, location: @coupon_redemption }
        else
          format.html { render :new }
          format.json { render json: @coupon_redemption.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /coupon_redemptions/1
  # PATCH/PUT /coupon_redemptions/1.json
  def update
    @coupon_redemption.state = 'exchanged'
    respond_to do |format|
      if @coupon_redemption.update(coupon_redemption_params)
        format.html { redirect_to '/tools#tab4', notice: 'El cupón fue cangeado con éxito' }
        format.json { render :show, status: :ok, location: @coupon_redemption }
      else
        format.html { render :edit }
        format.json { render json: @coupon_redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_redemptions/1
  # DELETE /coupon_redemptions/1.json
  def destroy
    @coupon_redemption.destroy
      #Free space
      count = @coupon.coupon_redemptions_count-1
      @coupon.update_attributes(coupon_redemptions_count: count)

    respond_to do |format|
      format.html { redirect_to coupons_path, notice: 'Coupon redemption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_coupon
      @coupon = Coupon.find(params[:coupon_id]) 
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_redemption
      @coupon_redemption = CouponRedemption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_redemption_params
      params.fetch(:coupon_redemption, {}).permit(:coupon_id,:unique_code,:state,:client_id)

    end
end
