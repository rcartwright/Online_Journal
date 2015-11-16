class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # :set_posts To show archives in sidebar
  before_action :set_posts, only: [:edit, :password]
  before_action :set_post_months, only: [:edit, :update, :password, :update_password]
  before_filter :signed_in_user, except: [:index, :show, :new, :create]
  before_action :correct_user, except: [:index, :show, :new, :create]
  before_action :set_layout
  layout :set_layout

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

  end

  def password
  end

  def update_password
    respond_to do |format|
      if @blog.update(password_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :password }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(full_blog_params)
    @style = @blog.build_style

    respond_to do |format|
      if @blog.save
          log_in @blog.user
          remember @blog.user
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:blog_name, :status, :about, user_attributes: [:id, :name, :email, :avatar])
    end

    def password_params
      params.require(:blog).permit(user_attributes: [:password, :password_confirmation])
    end

      def full_blog_params
      params.require(:blog).permit(:blog_name, :status, user_attributes: [:id, :name, :email, :avatar, :password, :password_confirmation])
    end
end
