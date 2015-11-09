module ApplicationHelper

	def parent_layout(layout)
  		@view_flow.set(:layout,output_buffer)
  		self.output_buffer = render(file: "layouts/#{layout}")
	end

	def layout
  		if params[:blog_id].present? || params[:id].present?
  	  		if defined?(@style.color_theme)
      			@style.layout
			else
				"flat_layout"
			end
		elsif params[:controller] == "home"
			'home'
		else
			'admin'
		end
	end

	def color
		if params[:blog_id].present? || params[:id].present?
  			if defined?(@style.color_theme)
      			@style.color_theme
			else
				'blue-theme'
			end
		else
			'none'
		end
	end

	def font_family
  	if defined?(@style.font_family)
      @style.font_family
		else
			'nunito'
		end
	end

	def font_size
  	if defined?(@style.font_size)
      @style.font_size
		else
			'medium-font'
		end
	end

def etc_page
if params[:action] != "index"
	'etc_content'
else
	''
end
end

  def header_image?
    @style.header_image?
  end

	def header_image
  	if defined?(@style.header_image)
      @style.header_image
		else
			'none'
		end
	end

	def blog_post_header
		render :partial => "posts/blog_post_header"
	end

	def hide_if_header_image(blog_content)
		if header_image?
			''
		else
			blog_content
		end
	end

	def base_title
	  	if params[:blog_id].present?
	    	@blog.blog_name
		else
			"Uttify"
		end
	end

	def page_title
		if params[:title].empty?
			@blog.blog_name
		end
	end

	def full_title(page_title)
	"#{page_title} | #{base_title} "
    end




end

