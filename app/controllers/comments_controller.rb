class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
    before_action :set_post
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
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    if user_signed_in?
      @comment = current_user.comments.new(comment_params)
    elsif client_signed_in?
      @comment = current_client.comments.new(comment_params)
    end
    @comment.post = @post
    @comment.event = @event
    respond_to do |format|
      if @comment.save
        unless @event =! nil
          format.html { redirect_to @post, notice: 'El comentario fue enviado.' }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { redirect_to event_path(@comment.event_id), notice: 'El comentario fue enviado.' }
          format.json { render :show, status: :created, location: @comment }
        end

      else
        format.html { redirect_to event_path(@comment.event_id), notice: 'Hubo un erro al enviar el comentario' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        unless @event =! nil
          format.html { redirect_to @post, notice: 'El comentario fue actualizado' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { redirect_to event_path(@comment.event_id), notice: 'El comentario fue actualizado' }
          format.json { render :show, status: :ok, location: @post }
        end
      else
unless @event =! nil
  format.html { render :edit }
  format.json { render json: @post.errors, status: :unprocessable_entity }
else
  format.html { render :edit }
  format.json { render json: @event.errors, status: :unprocessable_entity }
end
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      unless @event =! nil
        format.html { redirect_to @post, notice: 'El comentario se eleminó.' }
        format.json { head :no_content }
      else
        format.html { redirect_to event_path(@comment.event_id), notice: 'El comentario se eleminó.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      unless @event =! nil
        @post = Post.find(params[:post_id])
      else
        @event =  Event.find(params[:event_id])
      end

    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body,:post_id, :client_id, :user_id, :event_id)
    end
end
