class HomeController < ApplicationController
    before_action :set_layout
  	layout :set_layout

  def index
  	@blog = Blog.new
    @user = @blog.build_user
    @style = @blog.build_style
  end

end

private
    def blog_params
      params.require(:blog).permit(:blog_name, :status, user_attributes: [:id, :name, :email, :avatar, :password, :password_confirmation])
    end