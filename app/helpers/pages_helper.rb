require 'json'
require 'securerandom'

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

	def get_json_from_mongo
		hero_name = get_hero_name
		if @mongo_client == nil
			uri = "mongodb://127.0.0.1:27017/test"
			#uri = "mongodb://cherya:cherya123@ds141128.mlab.com:41128/heroku_82ppsrn9"
			@mongo_client = Mongo::Client.new(uri)
		end
		collection = @mongo_client[:heroes]
		file = collection.find( {hero_id: "#{hero_name}"} ).first
		file.delete('_id')
		file
	end

	def hero_name
		data = get_json_from_mongo
		data['hero_name']
	end

	def hero_image
		data = get_json_from_mongo
		data['hero_image']
	end

	def talent_image(id)
		begin
		data = get_json_from_mongo
		data['talents'][id]['talent_image']
		rescue NoMethodError
		end
	end

	def generate_hero(name, image, link)
		content_tag(:a, '', class: 'hero', href: link) do 
			image_tag(image) +
			content_tag(:span, name)
      	end
	end

	def generate_random_id
	 	SecureRandom.hex
	end

	def generate_article(article)
			content_tag(:div, '', class: 'article') do 
			image_tag(article[:main_image], class: 'article_img') +
			content_tag(:div, '', class: 'article_desc') do 
				content_tag(:a, article[:summary], class: 'article_summary', href: "articles/#{article[:id]}") +
				content_tag(:div, article[:content].html_safe, class: 'article_content')
			end
     	end
 	end

 	def display_article(article)
 		content_tag(:div, '', class: 'article_all') do 
			image_tag(article[:main_image], class: 'article_img_all') +
			content_tag(:div, '', class: 'article_desc') do 
				content_tag(:span, article[:summary], class: 'article_summary') +
				content_tag(:div, article[:content].html_safe, class: 'article_content_all')
			end
     	end
 	end
end
