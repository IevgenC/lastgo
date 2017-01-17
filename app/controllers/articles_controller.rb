class ArticlesController < PagesController

	def article
		collection = mongo_client[:news]
		@article_to_display = collection.find( { id: params[:article] } ).first
	end

end
