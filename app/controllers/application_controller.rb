class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def set_blog
    	if params[:blog_id].present?
  			@blog = Blog.find(params[:blog_id])
  		else
  			@blog = Blog.find(params[:id])
  		end
	end

    def set_post
    	if params[:post_id].present?
      		@post = Post.find(params[:post_id])
      	else
      		@post = Post.find(params[:id])
      	end
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      set_blog
      @user = @blog.user
      redirect_to(root_url) unless current_user?(@user)
    end

    def set_layout
      if params[:blog_id].present? || params[:id].present?
      set_blog
      @style = @blog.style
      @style.layout
    else
      "admin"
    end
    end

end
