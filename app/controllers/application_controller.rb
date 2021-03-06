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
      set_blog
    	if params[:post_id].present?
      		@post = @blog.posts.find(params[:post_id])
      	else
      		@post = @blog.posts.find(params[:id])
      	end
    end

    def set_posts
      set_blog
      @posts = @blog.posts
    end

    def set_post_comments
      set_post
      @comments = @post.comments
    end

    def set_post_months
      set_posts
      @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless logged_in?
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
      elsif params[:controller] == "home"
        "home"
      else
        "admin"
      end
    end
end
