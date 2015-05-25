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

	def full_title(page_title)
    base_title = "Online Journal"
    	if page_title.empty?
      		base_title
    	else
      		"#{page_title}"
    	end
  	end

  	def page_title
  	if defined?(@blog.blog_name)
      @blog.blog_name
		else
			""
		end
	end

end
