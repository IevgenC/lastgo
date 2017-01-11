class NewsAdminController < ApplicationController

	def admin_news
	end

	def create
		collection = mongo_client[:news]
		id = params[:id]
		main_image = params[:main_image]
		summary = params[:summary]
		content = params[:content]
		collection.insert_one( { id: id, main_image: main_image, summary: summary, content: content } )
	end

	def update
	end

end
