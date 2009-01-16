class Gradient 
    def initialize(origin, destination)
        @origin = origin
        @destination = destination
    end

    def colour_at(distance_percent)
        c = @origin.class.to_s.downcase

        origin_rgb = @origin.to_rgb
        destination_rgb = @destination.to_rgb

        delta_r = destination_rgb.r - origin_rgb.r
        delta_g = destination_rgb.g - origin_rgb.g
        delta_b = destination_rgb.b - origin_rgb.b

        approximation = RGB.new(delta_r * distance_percent + origin_rgb.r,
                                delta_g * distance_percent + origin_rgb.g,
                                delta_b * distance_percent + origin_rgb.b)
        approximation.send("to_" + c)
    end 

end
