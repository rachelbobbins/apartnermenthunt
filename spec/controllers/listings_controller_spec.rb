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
		context "all required params are given" do
			let(:listing_attrs) { {url: "www.cl.org", monthly_rent: 1000, address: 'sesame street'} }
			it "saves the listing" do
				post :create, listing: listing_attrs
				Listing.last.url.should == 'www.cl.org'
			end
		end

		context "only url is given" do
			before do 
				Listing.any_instance.should_receive(:parse_rent).and_return(1000)
				Listing.any_instance.should_receive(:parse_address).and_return('Sesame St')
			end
			let(:listing_attrs) { {url: "www.cl.org"} }
			
			it "parses the price/location and re-renders the form" do
				post :create, listing: listing_attrs
				
				assigns[:listing].monthly_rent.should == 1000
				assings[:listing].address.should == 'Sesame St'
			end
		end

	end
end
