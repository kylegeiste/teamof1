class DashboardController < ApplicationController

  #Looks good, got rid of some whitespace and fixed some indentation

	def index
		@users = User.all
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
			  marker.lat user.latitude
			  marker.lng user.longitude
			end
	end

end
