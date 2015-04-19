class StylesController < ApplicationController
  before_action :set_style, only: [:show, :edit, :update]

  # GET /styles/1
  # GET /styles/1.json
  def show
  end


  # GET /styles/1/edit
  def edit
    @blog = Blog.find(params[:blog_id])
  end


  # PATCH/PUT /styles/1
  # PATCH/PUT /styles/1.json
  def update
    @blog = Blog.find(params[:blog_id])
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def style_params
      params.require(:style).permit(:layout, :header_image, :color_theme)
    end
end
