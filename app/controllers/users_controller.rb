class UsersController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]
  before_action :correct_user, except: [:index, :show]
  before_action :set_user, except: [:index]
  before_action :set_posts, only: [:show, :edit]
  before_action :set_post_months, only: [:show, :edit]
  before_action :set_layout
  layout :set_layout

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @blog = @user.blog
    @posts = @user.posts
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @blog = @user.blog
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @blog, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation, blog_attributes: [:blog_name])
    end
end
