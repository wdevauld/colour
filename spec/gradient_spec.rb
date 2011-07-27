require File.join(File.dirname(__FILE__), %w[spec_helper])

# All of the colour representations will set @green for the tests to run through

include StandardColoursRGB

describe Gradient do
    it "should be initialized with two colours" do
        Gradient.new(red, white)
    end

    it "should provide a colour at distance between two colours" do
        c = Gradient.new(red,white).colour_at(0.5)
        c.to_rgb.g.should eql(0.5)
        c.to_rgb.b.should eql(0.5)
        c.to_rgb.r.should eql(1.0)
    end
end
