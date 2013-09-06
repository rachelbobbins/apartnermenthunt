class Listing < ActiveRecord::Base
	validates_presence_of :url, :address, :monthly_rent
	validates_numericality_of :monthly_rent

	def parse_price
		doc = Nokogiri::HTML(open(URI.parse(url)))
		title = doc.css("h2.postingtitle").text
		self.monthly_rent = title.scan(/\d+/).first.to_i
	end

	def parse_address
		
		precise_address = 
		if precise_address
			self.address = precise_address
		elsif approximate_address
			self.address = approximate_address
		end
	end

	private

	def precise_address
		doc.css('.mapaddress').text.split('(').first
	end

	def approximate_address
		doc = Nokogiri::HTML(open(URI.parse(url)))
		title = doc.css("h2.postingtitle").text
		things_in_parentheses = title.scan(/\(.*\)/)
		if things_in_parentheses
			things_in_parentheses.first[1..-2]
		end

	end

end
