require 'rspec'
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

    it "should accept a gradient walk for two steps and return the endpoints" do
        blue = StandardColoursRGB.blue
        gradient = green.gradient_to(blue, steps = 2)
        gradient.size.should eql(2)
        gradient[0].hex.should eql(green.hex)
        gradient[1].hex.should eql(blue.hex)
    end

    it "should default to a 10 step gradient" do
        blue = StandardColoursRGB.blue
        gradient = green.gradient_to(blue)
        gradient.size.should eql(10)
    end

    it "should provide a complementary colour" do
        c = green.complementary
        c.nil?.should eql(false)
        c.hex.should eql(0xFF00FF)
    end

    it "should provide a split complementary set of colours" do
        colours = green.split_complementary
        colours.size.should eql(2)
        colours[0].hex.should eql(0x7F00FF)
        colours[1].hex.should eql(0xFF007F)
    end


    it "should apply a block when generating a split complementary set of colours if one is provided" do
        i = 0
        #TODO it would be nice to use the .should_recieve(:blah).and_yeild(:check) 
        # but because this is a shared test, one time we will get RGB, another we get HSV
        green.split_complementary do |c| 
            if c.hex == 0x7F00FF or c.hex == 0xFF007F then
               i += 1
            end
        end 
        i.should eql(2) 
    end

    it "should provide a series of colours rotating around the Hue wheel" do
         colours = green.rotate_hue(degrees = 36, steps = 11)
         colours.size.should eql(11)
         colours[0].hex.should eql(colours[10].hex)
         colours[4].hex.should eql(0xFF00FF)
    end
end


