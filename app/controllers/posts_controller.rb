class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :secret => 'secret_number',
                       :except => [:show, :index]
  layout "blogs"

  # GET /posts
  # GET /posts.json
  def index
    @blog = Blog.find(params[:blog_id])
    @posts = @blog.posts
    @user = @blog.user
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @blog = @post.blog
    @user = @blog.user
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @blog = @post.blog
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.build
  end

  # POST /posts
  # POST /posts.json
  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to blog_post_path(@blog, @post)
    else
      render blog_index_path
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @blog = @post.blog(post_params)
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to blog_post_path(@blog, @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :blog_id)
    end
end
