class RestaurantsController < ApplicationController
	def index
		# why does this go to restaurants/index.html.erb without being told
		@restaurants = Restaurant.all
	end
end
