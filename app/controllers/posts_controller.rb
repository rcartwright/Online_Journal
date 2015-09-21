class PostsController < ApplicationController
  before_action :set_blog, only: [:index, :new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_posts
  before_action :set_post_months
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :correct_user, except: [:index, :show]
  protect_from_forgery :secret => 'secret_number',
                       :except => [:show, :index]
  before_action :set_layout
  layout :set_layout


  # GET /posts
  # GET /posts.json
  def index
    @posts = @blog.posts
    @user = @blog.user
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @blog = @post.blog
    @user = @blog.user
    @comments = @post.comments
    @posts = @blog.posts
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
  end

  def month
    @posts = @blog.posts
    @user = @blog.user
    # Select only posts by month and year defined in url
    @posts_by_month = @posts.by_year_and_month(params[:month], params[:year])
    # Group posts above only by month and not by day so it only shows month once at the top
    @post_month = @posts_by_month.group_by { |post| post.created_at.strftime("%B") }
    # Group all posts from user by month - for showing all months that user has posts in archives sidebar
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
  end

  # GET /posts/1/edit
  def edit
    @blog = @post.blog
  end

  def new
    @post = @blog.posts.build
  end

  # POST /posts
  # POST /posts.json
  def create
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
      format.html { redirect_to blog_path(@blog), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_month
      @month = Post.find(params[:month])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :blog_id)
    end
end
