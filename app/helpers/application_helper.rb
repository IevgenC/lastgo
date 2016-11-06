module ApplicationHelper
	
	def is_active?(link_path)
 		current_page?(link_path) ? "active" : ""
	end

	def is_calc_active?(link_path, link_path_two)
		if current_page?(link_path)
		 return "active" 
		elsif current_page?(link_path_two)
			return "active"
		else
			return ""
		end
	end
end
