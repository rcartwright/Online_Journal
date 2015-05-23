class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user, except: [:index, :show]
  before_action :correct_user, except: [:index, :show]
  before_action :set_layout, only: [:edit, :update, :show]
  layout :set_layout, only: [:edit, :update, :show]
  layout "admin"

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @user = @blog.build_user
    @style = @blog.build_style
  end

  # GET /blogs/1/edit
  def edit
       @user = @blog.user
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @style = @blog.build_style

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_posts_path(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @blog = Blog.find(params[:id])
      @user = @blog.user
      redirect_to(root_url) unless current_user?(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:blog_name, user_attributes: [:name, :email, :avatar, :password, :password_confirmation])
    end
end
