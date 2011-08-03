# Colour is intended to be a mixin for all representations of colour.  It is not intended
# to be initialized on its own
module Colour
    def to_rgb
        self    
    end

    def to_hsv
        self
    end

    def web_hex
        self.to_rgb.web_hex
    end
  
    def hex
        self.to_rgb.hex
    end
  
    def web_safe(depth=1)
        self.to_rgb.web_safe(depth)
    end

    def to_s
        self.to_rgb.web_hex
    end

    # Return the complementary colour   
    def complementary
        rotate_hue(180)[0]
    end

    # Return two colours spread distance apart opposite
    # the colour wheel
    def split_complementary(spread=60)
        c = self.class.name.downcase
        hsv = self.to_hsv
        v = [HSV.new(((hsv.h + 540 - spread / 2) % 360),hsv.s,hsv.v).send("to_" + c), 
        HSV.new(((hsv.h + 540 + spread / 2) % 360),hsv.s,hsv.v).send("to_" + c)]
        if block_given? then
            v.each do |color| yield color end
        end
        v  
    end
  
    # Move the specified number of degrees, for the
    # specified number of steps
    def rotate_hue(degrees=180, steps=1)
        c = self.class.name.downcase
        hsv = self.to_hsv
        v = []
        (1..steps).each do |i|
            v << HSV.new((hsv.h + (degrees * i) + 360 * i) % 360, hsv.s, hsv.v).send("to_" + c)
        end
        if block_given? then
            v.each do |color| yield color end
        end
        v 
    end
  
    def analogous(degrees=30, steps=5, &block)
        if block_given? then
            rotate_hue(degrees, steps) do |c|
                block.call(c)
            end
        else
            rotate_hue(degrees, steps)
        end
    end
  
    def triadic(&block)
        if block_given? then
            rotate_hue(120, 2) do |c|
                block.call(c)
            end
        else
            rotate_hue(120,2)
        end
    end


    def gradient_to(colour, steps=10)
        c = self.class.name.downcase
        origin = self.to_rgb
        destination = colour.to_rgb
        gradient = []

        #Special Case, if some joker asks for a gradient of one step
        # the range calculation will result in NaN
        if steps == 1 then
           if block_given? then
             yield self
           end
           return [self] 
        end

        #TODO: *_range isn't really being used
        red_range = destination.r - origin.r
        red_increment = red_range / (steps - 1)
        green_range = destination.g - origin.g
        green_increment = green_range / (steps - 1)
        blue_range = destination.b - origin.b
        blue_increment = blue_range / (steps - 1) 

        steps.times do |i|
            intermediate = RGB.new(
                origin.r + red_increment * i,
                origin.g + green_increment * i,
                origin.b + blue_increment * i
            )
            gradient << intermediate.send("to_" + c)
            if block_given? then
                yield intermediate.send("to_" + c)
            end
        end
        gradient
    end
end 

require_relative 'rgb'
require_relative 'hsv'
require_relative 'standard_colours'
require_relative 'gradient'
