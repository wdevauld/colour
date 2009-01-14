require File.join(File.dirname(__FILE__), %w[spec_helper])

# All of the colour representations will set @green for the tests to run through

describe "every colour", :shared => true do
   it "should convert to RGB" do
	@green.should respond_to(:to_rgb)	
	@green.to_rgb.g.should eql(1.0)
	@green.to_rgb.b.should eql(0.0)
	@green.to_rgb.r.should eql(0.0)
   end

   it "should convert to HSV" do
	@green.should respond_to(:to_hsv)
	@green.to_hsv.h.should eql(120.0)
        @green.to_hsv.s.should eql(1.0)
        @green.to_hsv.v.should eql(1.0)
   end

   it "should convert to Lab"

   it "should provide a Web Safe Hex" do
	@green.web_safe.should eql("#0F0")
   end

   it "should gradient through the RGB space towards another colour" do
        gradient = @green.gradient_to(RGB.new(1,0,1), steps=3)
   end

   it "should provide a complementary colour" do
   end

   it "should provide a split complemenatry set of colours" do
   end

   it "should apply a block when generating a split complementary set of colours if one is provided" do
   end

   it "should provide a series of colours rotating around the Hue wheel" do
   end

   it "should apply a block to the colours when generating the colours around the colour wheel if one is provided" do
   end

   it "should generate triadic colours" do
   end
end

describe "HSV Colours" do
	it_should_behave_like "every colour"

	before(:each) do
	   @green = HSV.new(120, 1.0,1.0)
	end
end

describe "RGB Colours" do
	it_should_behave_like "every colour"

	before(:each) do
	   @green = RGB.new(0,1.0,0)
	end
end
