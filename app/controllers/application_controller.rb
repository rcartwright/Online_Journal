class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @blog = Blog.find(params[:blog_id])
      @user = @blog.user
      redirect_to(root_url) unless current_user?(@user)
    end

    def set_layout
      set_blog
      @style = @blog.style
      @style.layout
    end
end
