require 'spec_helper'

describe Listing do
  describe "validations" do
  	it { should validate_presence_of :url }
  	it { should validate_presence_of :address }
  	it { should validate_presence_of :monthly_rent }
  	it { should validate_numericality_of :monthly_rent }
  end
end
