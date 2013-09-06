require 'spec_helper'

describe ListingsController do
	describe "GET :index" do
		before do
			Listing.create url: "www.foo.com", monthly_rent: 1000, address: "123 Sesame St"
		end
		it "renders the /listings page" do
			get :index

			response.should be_success
			assigns[:listings].count.should == 1
		end
	end
end
