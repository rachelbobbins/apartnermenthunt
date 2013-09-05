class Listing < ActiveRecord::Base
	validates_presence_of :url, :address, :monthly_rent
	validates_numericality_of :monthly_rent
end
