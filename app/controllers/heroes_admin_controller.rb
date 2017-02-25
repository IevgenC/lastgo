class HeroesAdminController < PagesController

	def admin_hero
	end

	def update
		puts "METHOD UPDATE CALLED AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
		collection = mongo_client[:heroes]
		puts "JSON #{JSON.parse(params[:hero_json])}"
		json = JSON.parse(params[:hero_json])
		hero_id = json['hero_id']
		collection.update_one( { 'hero_id' => hero_id }, {'$set' => json} )
	end
end
