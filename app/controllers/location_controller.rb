class LocationController < ActiveRecord::Base
	#respond_to :html, :json
	def new
		@location = Location.all

	end 
	def index
		@location = Location.all
		#respond_with @location
	end
end
