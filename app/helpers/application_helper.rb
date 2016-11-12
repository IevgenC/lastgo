module ApplicationHelper
	
	def is_active?(link_path)
 		current_page?(link_path) ? "active" : ""
	end

    def is_calc_active?(link_path)
        params[:controller] == 'calculator' || current_page?(link_path) ? "active" : ""
    end

	def extends(layout, &block)
    # Make sure it's a string
    layout = layout.to_s

    # If there's no directory component, presume a plain layout name
    layout = "layouts/#{layout}" unless layout.include?('/')

    # Capture the content to be placed inside the extended layout
    @view_flow.get(:layout).replace capture(&block)

    render file: layout
  end
end
