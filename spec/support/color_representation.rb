green = StandardColoursRGB.green

shared_examples "every colour representation", :shared => true do
   it "should convert to RGB" do
	green.should respond_to(:to_rgb)	
	green.to_rgb.g.should eql(1.0)
	green.to_rgb.b.should eql(0.0)
	green.to_rgb.r.should eql(0.0)
   end

   it "should convert to HSV" do
	green.should respond_to(:to_hsv)
	green.to_hsv.h.should eql(120.0)
    green.to_hsv.s.should eql(1.0)
    green.to_hsv.v.should eql(1.0)
   end

   it "should provide a Web Safe Hex" do
	    green.web_safe.should eql("#0F0")
   end

   it "should walk a gradient through the RGB space towards another colour" do
        gradient = green.gradient_to(RGB.new(1,0,1), steps=3)
        gradient.size.should eql(3)
        gradient[0].hex.should eql(green.hex)
        gradient[1].hex.should eql(RGB.new(0.5, 0.5, 0.5).hex)
        gradient[2].hex.should eql(RGB.new(1,0,1).hex)     
   end

   it "should accept a gradient walk of one step and return the origin" do
        gradient = green.gradient_to(RGB.new(1,0,1), steps = 1)
        gradient.size.should eql(1)
        gradient[0].hex.should eql(green.hex)
   end

   it "should accept a gradient walk for two steps and return the endpoints"

   it "should provide a complementary colour"

   it "should provide a split complemenatry set of colours"

   it "should apply a block when generating a split complementary set of colours if one is provided"

   it "should provide a series of colours rotating around the Hue wheel"

   it "should apply a block to the colours when generating the colours around the colour wheel if one is provided" 

   it "should generate triadic colours" 
end


