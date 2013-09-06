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
			render "new"
		end
	end
end
