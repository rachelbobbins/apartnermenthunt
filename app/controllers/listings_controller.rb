class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		params.permit!
		@listing = Listing.new(params[:listing])
		
		if @listing.save
			redirect_to root_path
		else
			@listing.parse_price
			@listing.parse_address
			flash[:notice] = "Parsed details, check they're correct"
			render "new"
		end
	end
end
