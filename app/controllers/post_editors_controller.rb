class PostEditorsController < ApplicationController
  before_action :set_post

  # GET /posts/:post_id/editors
  def index
    @editors = @post.editors
    render json: @editors
  end

  # POST /posts/:post_id/editors
  def create
    @editor = User.find(params[:user_id])
    @post_editor = @post.post_editors.new(user: @editor)

    if @post_editor.save
      render json: @editor, status: :created
    else
      render json: @post_editor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:post_id/editors/:id
  def destroy
    @post_editor = @post.post_editors.find_by(user_id: params[:id])
    @post_editor.destroy
    head :no_content
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end