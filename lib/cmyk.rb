class CMYK
	attr_accessor :c, :m, :y, :k
	include Colour
	def initialize(c=0.0,m=0.0,y=0.0,k=0.0) 
		@c = c.abs.to_f
		@m = m.abs.to_f
		@y = y.abs.to_f
		@k = k.abs.to_f
	end
	
	def to_rgb
		RGB.new(
			1 - (@c * (1 - @k) + @k),
			1 - (@m * (1 - @k) + @k),
			1 - (@y * (1 - @k) + @k))	
	end

	def to_hsv
		self.to_rgb.to_hsv
	end
end
