class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_client!, except: [:show,:index]


  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_client.items.new(item_params)

    respond_to do |format|
      if @item.save
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @item.pictures.create(image: image)
          }
        end
        format.html { redirect_to market_path(@item.market_id), notice: 'La Publicación se creó con exito.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @item.pictures.create(image: image)
          }
        end

        format.html { redirect_to market_path(@item.market_id), notice: 'La Publicación se actualizó con exito.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:titulo, :descripcion, :precio, :moneda, :ubicacion,
      :estado, :valoracion, :pictures, :telefono, :email, :nombre, :market_id, :client_id)
    end
end
