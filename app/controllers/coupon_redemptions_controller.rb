class CouponRedemptionsController < ApplicationController
  before_action :set_coupon_redemption, only: [:show, :edit, :update, :destroy]

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
    @coupon_redemption = CouponRedemption.new(coupon_redemption_params)

    respond_to do |format|
      if @coupon_redemption.save
        format.html { redirect_to @coupon_redemption, notice: 'Coupon redemption was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_redemption }
      else
        format.html { render :new }
        format.json { render json: @coupon_redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_redemptions/1
  # PATCH/PUT /coupon_redemptions/1.json
  def update
    respond_to do |format|
      if @coupon_redemption.update(coupon_redemption_params)
        format.html { redirect_to @coupon_redemption, notice: 'Coupon redemption was successfully updated.' }
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
    respond_to do |format|
      format.html { redirect_to coupon_redemptions_url, notice: 'Coupon redemption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_redemption
      @coupon_redemption = CouponRedemption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_redemption_params
      params.require(:coupon_redemption).permit(:user_id, :profile_id)
    end
end
