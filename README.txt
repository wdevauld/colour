colour
    by Wes Devauld 
    http://devauld.ca
 
== DESCRIPTION:

A library to convert between various representation of colour (RGB, CMYK and HSV), as well as generate swatches based on some colour theory

== FEATURES/PROBLEMS:

* Representations: to_cmyk, to_rgb, to_hsv, web_hex, hex, web_safe  
* Swatch Generation: 
== SYNOPSIS:

irb(main):001:0> require 'colour'
=> true
irb(main):002:0> include StandardColoursRGB
=> Object
irb(main):003:0> red.split_complementary()
=> [#<RGB:0x3a7c8 @b=0.5, @g=1.0, @r=0.0>, #<RGB:0x3a174 @b=1.0, @g=0.5, @r=0.0>]
irb(main):004:0> red.to_cmyk.split_complementary()
=> [#<CMYK:0x1eac8 @m=0.0, @c=1.0, @k=0.0, @y=0.5>, #<CMYK:0x1e0b4 @m=0.5, @c=1.0, @k=0.0, @y=0.0>]

== REQUIREMENTS:

* None that I know of 

== INSTALL:

 sudo gem install colour

== LICENSE:

The MIT License

Copyright (c) 2008

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
