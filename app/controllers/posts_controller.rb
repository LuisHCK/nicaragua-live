class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @pictures = @post.pictures
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    unless current_user.partner.present?
      redirect_to root_path, notice:"No tienes permiso para esta acción"
    else
      @post = Post.new
    end
  end

  # GET /posts/1/edit
  def edit
    #If the current user's ID doesn't mathc with the creator's ID redirect to root with a notification
    if current_user.id != @post.profile.user_id
      redirect_to root_path, notice: 'No estas autorizado para esta acción'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.profile.posts.new(post_params)

    respond_to do |format|
      if @post.save

        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @post.pictures.create(image: image)
          }
        end

        format.html { redirect_to root_path, notice: 'Se ha publicado correctamente.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path, notice: 'No puedes dejar el texto en blanco.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    #Users aren't allowed to delete the posts of other users
    if current_user.id == @post.profile.user_id
          respond_to do |format|
            if @post.update(post_params)

              if params[:images]
                # The magic is here ;)
                params[:images].each { |image|
                  @post.pictures.create(image: image)
              }
              end

              format.html { redirect_to @post, notice: 'La publicación fue actualizada correctamente' }
              format.json { render :show, status: :ok, location: @post }
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
        else
          redirect_to root_path, notice: 'No estas autorizado para esta acción'
        end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    #Users aren't allowed to delete the posts of other users
    if current_user.id == @post.profile.user_id
        @post.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'La publicación fue borrada' }
          format.json { head :no_content }
        end
      else
        redirect_to root_path, notice: 'No estas autorizado para esta acción'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :visit_count, :pictures, :video, :pin, :images)
    end
end
