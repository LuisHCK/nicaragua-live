class ValorationsController < ApplicationController
  before_action :set_valoration, only: [:show, :edit, :update, :destroy]

  # GET /valorations
  # GET /valorations.json
  def index
    @valorations = Valoration.all
    @valoration = Valoration.new
  end

  # GET /valorations/1
  # GET /valorations/1.json
  def show
  end

  # GET /valorations/new
  def new
      @valoration = Valoration.new
  end

  # GET /valorations/1/edit
  def edit
  end

  # POST /valorations
  # POST /valorations.json
  def create
    @valoration = current_client.valorations.new(valoration_params)

    respond_to do |format|
      if @valoration.save
        format.html { redirect_to valorations_path, notice: 'Grcias por tu comentario <3' }
        format.json { render :show, status: :created, location: @valoration }
      else
        format.html { render :new }
        format.json { render json: @valoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valorations/1
  # PATCH/PUT /valorations/1.json
  def update
    respond_to do |format|
      if @valoration.update(valoration_params)
        format.html { redirect_to @valoration, notice: 'Valoration was successfully updated.' }
        format.json { render :show, status: :ok, location: @valoration }
      else
        format.html { render :edit }
        format.json { render json: @valoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valorations/1
  # DELETE /valorations/1.json
  def destroy
    @valoration.destroy
    respond_to do |format|
      format.html { redirect_to valorations_url, notice: 'Valoration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valoration
      @valoration = Valoration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valoration_params
      params.require(:valoration).permit(:comment, :rating)
    end
end
