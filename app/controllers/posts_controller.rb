class PostsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @comments = @post.comments.all
    authorize! :read, @post
  end

  def index
    @posts = current_user.posts.all
  end

  def newsfeed
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    authorize! :create, @post
  end

  def edit
    authorize! :update, @post
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    authorize! :create, @post
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    authorize! :update, @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize! :destroy, @post
  end
  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
