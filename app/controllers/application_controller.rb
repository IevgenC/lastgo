class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def mongo_client
  	uri = "mongodb://127.0.0.1:27017/test"
  	mongo_client = Mongo::Client.new(uri)
  end
  
end
