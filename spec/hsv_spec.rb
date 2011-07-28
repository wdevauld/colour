describe "HSV Colours" do
	it_should_behave_like "every colour representation"

	before(:each) do
	   @green = HSV.new(120, 1.0,1.0)
	end
end
