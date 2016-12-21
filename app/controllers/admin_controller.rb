class AdminController < PagesController

	def admin_hero
	end

	def update
		puts "METHOD UPDATE CALLED AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
		if @mongo_client == nil
			#uri = "mongodb://127.0.0.1:27017/test"
			uri = "mongodb://cherya:cherya123@ds141128.mlab.com:41128/heroku_82ppsrn9"
			@mongo_client = Mongo::Client.new(uri)
		end
		collection = @mongo_client[:heroes]
		puts "JSON #{JSON.parse(params[:hero_json])}"
		json = JSON.parse(params[:hero_json])
		hero_id = json['hero_id']
		collection.update_one( { 'hero_id' => hero_id }, {'$set' => json} )
	end
end
