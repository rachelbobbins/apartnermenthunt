require 'spec_helper'

describe Listing do
  describe "validations" do
  	it { validates presence_of :url }
  	it { validates presence_of :address }
  	it { validates presence_of :rent }
  	it { validates numericality_of :monthly_rent }
  end
end
