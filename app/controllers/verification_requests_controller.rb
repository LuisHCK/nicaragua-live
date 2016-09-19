class VerificationRequestsController < ApplicationController
  before_action :set_verification_request, only: [:show, :edit, :update, :destroy]

  # GET /verification_requests
  # GET /verification_requests.json

  # GET /verification_requests/1
  # GET /verification_requests/1.json
  def show
  end

  # GET /verification_requests/new
  def new
    @verification_request = VerificationRequest.new
  end

  # GET /verification_requests/1/edit
  def edit
  end

  # POST /verification_requests
  # POST /verification_requests.json
  def create
    @verification_request = VerificationRequest.new(verification_request_params)

    respond_to do |format|
      if @verification_request.save
        format.html { redirect_to @verification_request, notice: 'Verification request was successfully created.' }
        format.json { render :show, status: :created, location: @verification_request }
      else
        format.html { render :new }
        format.json { render json: @verification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verification_requests/1
  # PATCH/PUT /verification_requests/1.json
  def update
    respond_to do |format|
      if @verification_request.update(verification_request_params)
        format.html { redirect_to @verification_request, notice: 'Verification request was successfully updated.' }
        format.json { render :show, status: :ok, location: @verification_request }
      else
        format.html { render :edit }
        format.json { render json: @verification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verification_requests/1
  # DELETE /verification_requests/1.json
  def destroy
    @verification_request.destroy
    respond_to do |format|
      format.html { redirect_to verification_requests_url, notice: 'Verification request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verification_request
      @verification_request = VerificationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verification_request_params
      params.require(:verification_request).permit(:user_id)
    end
end
