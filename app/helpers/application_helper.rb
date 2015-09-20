module ApplicationHelper

	def parent_layout(layout)
  		@view_flow.set(:layout,output_buffer)
  		self.output_buffer = render(file: "layouts/#{layout}")
	end

	def layout
  	if defined?(@style.layout)
      @style.layout
		else
			'admin'
		end
	end

	def color
  	if defined?(@style.color_theme)
      @style.color_theme
		else
			'none'
		end
	end

	def header_image
  	if defined?(@style.header_image)
      @style.header_image
		else
			'none'
		end
	end

	def base_title
	  	if params[:blog_id].present?
	      base_title = @blog.blog_name
		else
			base_title = "Online Journal"
		end
	end

	def page_title
		if params[:title].empty?
			page_title = @blog.blog_name
		end
	end

	def full_title(page_title)
	"#{page_title} | #{base_title} "
    end




end

