describe "RGB Colours" do
	it_should_behave_like "every colour representation"

	before(:each) do
	   @green = RGB.new(0,1.0,0)
	end
end
