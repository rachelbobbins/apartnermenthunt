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

	describe "GET :new" do
		it "renders the /listing/new page" do
			get :new

			response.should be_success
		end
	end

	describe "POST :create" do
		let(:listing_attrs) { {url: "www.cl.org", monthly_rent: 1000, address: 'sesame street'} }
		context "everything is valid" do

			it "saves the listing" do
				post :create, listing: listing_attrs
				Listing.last.url.should == 'www.cl.org'
			end
		end
	end
end
