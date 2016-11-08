require 'json'

module PagesHelper
	def read_json
		file = File.read('app/assets/jsons/thrall.json')
		JSON.parse(file)
	end	
	def hero_name
		data = read_json
		data['hero_name']
	end

	def talent_image(id)
		data = read_json
		data['talents'][id]['talent_image']
	end
end
