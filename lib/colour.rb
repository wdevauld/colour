# $Id$

# Equivalent to a header guard in C/C++
# Used to prevent the class/module from being loaded more than once
unless defined? Colour

module Colour
	def to_rgb
		self	
	end

	def to_cmyk
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
		rotate_hue(180)
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

	#Bones specific stuff

	# :stopdoc:
	VERSION = '0.1.0'
	LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
	PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
	# :startdoc:

	# Returns the version string for the library.
	#
	def self.version
		VERSION
	end

	# Returns the library path for the module. If any arguments are given,
	# they will be joined to the end of the libray path using
	# <tt>File.join</tt>.
	#
	def self.libpath( *args )
		args.empty? ? LIBPATH : ::File.join(LIBPATH, *args)
	end

	# Returns the lpath for the module. If any arguments are given,
	# they will be joined to the end of the path using
	# <tt>File.join</tt>.
	#
	def self.path( *args )
	  args.empty? ? PATH : ::File.join(PATH, *args)
	end
	
	# Utility method used to rquire all files ending in .rb that lie in the
	# directory below this file that has the same name as the filename passed
	# in. Optionally, a specific _directory_ name can be passed in such that
	# the _filename_ does not have to be equivalent to the directory.
	#
	def self.require_all_libs_relative_to( fname, dir = nil )
	  dir ||= ::File.basename(fname, '.*')
	  search_me = ::File.expand_path(
	      ::File.join(::File.dirname(fname), dir, '**', '*.rb'))
	
	  Dir.glob(search_me).sort.each {|rb| require rb}
	end
end  # module Colour

Colour.require_all_libs_relative_to __FILE__
require 'rgb'
require 'cmyk'
require 'standard_colours'
require 'hsv'

end  # unless defined?

# EOF