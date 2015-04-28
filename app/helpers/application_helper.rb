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

end
