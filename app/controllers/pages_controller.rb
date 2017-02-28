class PagesController < ApplicationController
  def about
  end

  def home
  end

  def contacts
  end

  def calculator
  end

  def articles
	collection = mongo_client[:news]
	@articles = collection.find
  end

end
