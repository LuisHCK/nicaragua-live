class MarketsController < ApplicationController
  before_action :authenticate_client!, except:[:show,:index]
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def index
    @markets = Market.all
    @items = Item.all
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @items = Item.all
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @markets = Market.all
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to @market, notice: 'Market was successfully created.' }
        format.json { render :show, status: :created, location: @market }
        format.js
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
        format.js {  flash[:notice] = "Creado" }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to admin_panel_path, notice: 'Market was successfully updated.' }
        format.json { render :show, status: :ok, location: @market }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @market.errors, status: :unprocessable_entity }
        forma.js
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @markets = Market.all
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url, notice: 'Market was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:title, :icon, :description)
    end
end
