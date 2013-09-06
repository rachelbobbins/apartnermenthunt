class ListingsController < ApplicationController
	def index
		@listings = Listing.all
		# render ""
	end
end
