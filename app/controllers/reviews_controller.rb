class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_profile

  def new
    unless current_user.id == @profile.id
      if current_user.reviewed?(@profile)
        redirect_to @profile, notice:"Ya has dado una valoracion"
      else
        @review = Review.new
      end
      else
      redirect_to @profile, notice:"No puedes calificar tu propio perfil"      
    end
  end

  # GET /reviews/1/edit
  def edit
    profile = Profile.find(params[:profile_id])

    #2nd you retrieve the comment thanks to params[:id]
    @review = profile.reviews.where(user_id: current_user.id).find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    if user_signed_in?
      if current_user.reviewed?(@profile)
        redirect_to @profile, notice:"Ya has dado una valoración"
      else
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        @review.profile_id = @profile.id

        if @review.save
          redirect_to @profile
        else
          render 'new'
        end
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @profile }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @profile}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
