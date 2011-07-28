require_relative 'spec_helper'

describe "RGB Colours" do
	it_behaves_like "every colour representation" 

	before(:each) do
	   @green = RGB.new(0,1.0,0)
	end
end
