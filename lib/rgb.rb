# A representation of a colour in the RGB colour space
# 
# Stores the numbers internally as floats between 0 and 1
class RGB
	attr_accessor :r, :g, :b
	include Colour
  
	def initialize(r=0.0, g=0.0, b=0.0)
		@r = r.abs.to_f
		@g = g.abs.to_f
		@b = b.abs.to_f
	end
  
	def to_hsv
		min = [@r, @g, @b].min
		max = [@r, @g, @b].max
		delta = max - min
		
		if(max == 0) then
			s = 0 #Techically if s = 0, then v is undefined
		else
			s = delta / max
		end
		if(@r == max) then #Yellow and Magenta
			h = (@g - @b) / delta             
		elsif (g == max) then #Cyan and Yellow
			h = 2 + (@b - @r) / delta 
		else #Magenta and Cyan
			h = 4 + (@r - @g) / delta
		end
	  
		h *= 60
	  
		HSV.new((h + 360) % 360,s,max)
	end
	
	def web_hex
		sprintf("#%02X%02X%02X", r*255, g*255, b*255)
	end
	
	def hex
	  eval(sprintf("0x%02X%02X%02X", r*255, g*255, b*255))
  end
  
	def web_safe(depth=1)
		"#" + 
		sprintf("%X", r*15) * depth +
		sprintf("%X", g*15) * depth +
		sprintf("%X", b*15) * depth
	end
end
