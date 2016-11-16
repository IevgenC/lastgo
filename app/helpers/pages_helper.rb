require 'json'

module PagesHelper
	def get_hero_name 
		url = request.original_url
		url.split('/').last.remove(/#.*\+*/)
	end

	def read_json
		hero_name = get_hero_name
		file = File.read("app/assets/jsons/#{hero_name}.json")
		JSON.parse(file)
	end	
	def hero_name
		data = read_json
		data['hero_name']
	end

	def hero_image
		data = read_json
		data['hero_image']
	end

	def talent_image(id)
		data = read_json
		data['talents'][id]['talent_image']
	end

	def generate_hero(name, image, link)
		content_tag(:a, '', class: 'hero', href: link) do 
			image_tag(image) +
			content_tag(:span, name)
      	end
	end
end
