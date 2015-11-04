class HomeController < ApplicationController
    before_action :set_layout
  	layout :set_layout

  def index
  	    @blog = Blog.new
    @user = @blog.build_user
    @style = @blog.build_style
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

end

private
    def blog_params
      params.require(:blog).permit(:blog_name, :status, user_attributes: [:id, :name, :email, :avatar, :password, :password_confirmation])
    end