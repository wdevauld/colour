# Hue Saturation and Value.  Hue can range from [0,360). Saturation and
# Value are [0,1]

class HSV
	attr_accessor :h, :s, :v
	include Colour
  
	def initialize(h=0.0, s=0.0, v=0.0)
		@h = h.abs.to_f % 360
		@s = s.abs.to_f
		@v = v.abs.to_f 
	end
  
	def to_rgb
		if (@s == 0) then #Shade of grey
			RGB.new(@v, @v, @v)
		else
			@h /= 60
			i = @h.floor
			f = @h - i
			p = @v * (1 - @s)
			q = @v * (1 - @s * f)
			t = @v * (1 - @s * (1 - f))
			case i
				when 0:
					RGB.new(v,t,p)
				when 1:
					RGB.new(q,v,p)
				when 2:
					RGB.new(p,v,t)
				when 3:
					RGB.new(p,q,v)
				when 4:
					RGB.new(t,p,v)
				else
					RGB.new(v,p,q)
			end
		end
	end

	def to_cmyk
		self.to_rgb.to_cmyk
	end
end
