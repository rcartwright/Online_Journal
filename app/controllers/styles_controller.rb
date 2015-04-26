class StylesController < ApplicationController
  before_action :set_style, only: [:edit, :update]
  before_filter :signed_in_user
  before_action :correct_user
  before_action :set_layout
  layout :layout

  # GET /styles/1/edit
  def edit
  end


  # PATCH/PUT /styles/1
  # PATCH/PUT /styles/1.json
  def update
    respond_to do |format|
      if @style.update(style_params)
        format.html { redirect_to blog_path(@blog), notice: 'Style was successfully updated.' }
        format.json { render :show, status: :ok, location: @style }
      else
        format.html { render :edit }
        format.json { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_style
      @style = Style.find(params[:id])
    end

    def set_layout
      @blog = Blog.find(params[:blog_id])
      @style = @blog.style
      (@style && @style.layout) || 'blogs'
    end

    def layout
      @style.layout
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @blog = Blog.find(params[:blog_id])
      @user = @blog.user
      redirect_to(root_url) unless current_user?(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def style_params
      params.require(:style).permit(:layout, :header_image, :color_theme)
    end
end
