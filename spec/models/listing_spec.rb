require 'spec_helper'

describe Listing do
  describe "validations" do
  	it { should validate_presence_of :url }
  	it { should validate_presence_of :address }
  	it { should validate_presence_of :monthly_rent }
  	it { should validate_numericality_of :monthly_rent }
  end

  # describe ".initialize" do
  # 	it "fetches and saves the raw html of the page" do
  # 		listing = Listing.create url: 'www.google.com'
  # 	end
  # end

  # describe "#raw_html" do
  # 	let(:listing) { double :listing, url: "craigslist.org/foo" }

  # 	it "fetches the body from a given craigslist url" do
  # 		open
  # 	end
  # end
end
