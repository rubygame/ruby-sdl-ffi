#--
#
# This file is one part of:
#
# Ruby-SDL-FFI - Ruby-FFI bindings to SDL
#
# Copyright (c) 2009 John Croisant
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#++


module SDL
  module Gfx

    SMOOTHING_OFF = 0
    SMOOTHING_ON  = 1


    class TColorRGBA < NiceFFI::Struct
      layout( :r, :uint8,
              :g, :uint8,
              :b, :uint8,
              :a, :uint8 )
    end


    class TColorY < NiceFFI::Struct
      layout( :y, :uint8 )
    end



    func  :rotozoomSurface,
          [ :pointer, :double, :double, :int ],
          SDL::Surface.typed_pointer

    func  :__rotozoomSurfaceSize, :rotozoomSurfaceSize,
          [ :int, :int, :double, :double, :buffer_out, :buffer_out ], :void

    def self.rotozoomSurfaceSize( width, height, angle, zoom )
      w = FFI::Buffer.new( :int )
      h = FFI::Buffer.new( :int )
      __rotozoomSurfaceSize( width, height, angle, zoom, w, h )
      return [w.get_int(0), h.get_int(0)]
    end


    func  :rotozoomSurfaceXY,
          [ :pointer, :double, :double, :double, :int ],
          SDL::Surface.typed_pointer

    func  :__rotozoomSurfaceSizeXY, :rotozoomSurfaceSizeXY,
          [ :int, :int, :double, :double, :double,
            :buffer_out, :buffer_out ], :void

    def self.rotozoomSurfaceSizeXY( width, height, angle, zoomx, zoomy )
      w = FFI::Buffer.new( :int )
      h = FFI::Buffer.new( :int )
      __rotozoomSurfaceSizeXY( width, height, angle, zoomx, zoomy, w, h )
      return [w.get_int(0), h.get_int(0)]
    end



    func  :zoomSurface, [ :pointer, :double, :double, :int ],
          SDL::Surface.typed_pointer


    func  :__zoomSurfaceSize, :zoomSurfaceSize,
          [ :int, :int, :double, :double, :buffer_out, :buffer_out ], :void

    def self.zoomSurfaceSize( width, height, zoomx, zoomy )
      w = FFI::Buffer.new( :int )
      h = FFI::Buffer.new( :int )
      __zoomSurfaceSize( width, height, zoomx, zoomy, w, h )
      return [w.get_int(0), h.get_int(0)]
    end



    optfunc  :shrinkSurface, [ :pointer, :int, :int ],
             SDL::Surface.typed_pointer


    optfunc  :rotateSurface90Degrees, [ :pointer, :int ],
             SDL::Surface.typed_pointer

  end
end
