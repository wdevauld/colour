require 'spec_helper'

red = StandardColoursRGB.red
white = StandardColoursRGB.white

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
