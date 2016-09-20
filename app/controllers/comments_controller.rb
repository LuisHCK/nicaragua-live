class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]
  #before_action :validate_comment_owner, only: [:edit, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit

  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create(comment_params)
    

    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id), notice: 'El comentario fue enviado.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { redirect_to post_path(@comment.post_id), notice: 'Hubo un erro al enviar el comentario' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post_id), notice: 'El comentario fue actualizado' }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment.user_id = current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post_id), notice: 'El comentario se eliminó.' }
        format.json { head :no_content }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body,:post_id, :user_id, :post_id)
    end
  end
