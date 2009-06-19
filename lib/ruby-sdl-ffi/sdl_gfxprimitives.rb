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


require 'ffi'


module SDL
  module Gfx

    M_PI = 3.141592654

    attach_function :pixelColor, [ :pointer, :int16, :int16, :uint32 ], :int
    attach_function :pixelRGBA, [ :pointer, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :hlineColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int
    attach_function :hlineRGBA, [ :pointer, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :vlineColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int
    attach_function :vlineRGBA, [ :pointer, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :rectangleColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :rectangleRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :boxColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :boxRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :lineColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :lineRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :aalineColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :aalineRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :circleColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int
    attach_function :circleRGBA, [ :pointer, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :arcColor, [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :arcRGBA, [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :aacircleColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int
    attach_function :aacircleRGBA, [ :pointer, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :filledCircleColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int
    attach_function :filledCircleRGBA, [ :pointer, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :ellipseColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :ellipseRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :aaellipseColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :aaellipseRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :filledEllipseColor, [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :filledEllipseRGBA, [ :pointer, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :pieColor, [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :pieRGBA, [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :filledPieColor, [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :filledPieRGBA, [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :trigonColor, [ :pointer, :int16, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :trigonRGBA, [ :pointer, :int16, :int16, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :aatrigonColor, [ :pointer, :int16, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :aatrigonRGBA, [ :pointer, :int16, :int16, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :filledTrigonColor, [ :pointer, :int16, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int
    attach_function :filledTrigonRGBA, [ :pointer, :int16, :int16, :int16, :int16, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :polygonColor, [ :pointer, :pointer, :pointer, :int, :uint32 ], :int
    attach_function :polygonRGBA, [ :pointer, :pointer, :pointer, :int, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :aapolygonColor, [ :pointer, :pointer, :pointer, :int, :uint32 ], :int
    attach_function :aapolygonRGBA, [ :pointer, :pointer, :pointer, :int, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :filledPolygonColor, [ :pointer, :pointer, :pointer, :int, :uint32 ], :int
    attach_function :filledPolygonRGBA, [ :pointer, :pointer, :pointer, :int, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :texturedPolygon, [ :pointer, :pointer, :pointer, :int, :pointer, :int, :int ], :int
    attach_function :filledPolygonColorMT, [ :pointer, :pointer, :pointer, :int, :uint32, :pointer, :pointer ], :int
    attach_function :filledPolygonRGBAMT, [ :pointer, :pointer, :pointer, :int, :uint8, :uint8, :uint8, :uint8, :pointer, :pointer ], :int
    attach_function :texturedPolygonMT, [ :pointer, :pointer, :pointer, :int, :pointer, :int, :int, :pointer, :pointer ], :int
    attach_function :bezierColor, [ :pointer, :pointer, :pointer, :int, :int, :uint32 ], :int
    attach_function :bezierRGBA, [ :pointer, :pointer, :pointer, :int, :int, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :characterColor, [ :pointer, :int16, :int16, :char, :uint32 ], :int
    attach_function :characterRGBA, [ :pointer, :int16, :int16, :char, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :stringColor, [ :pointer, :int16, :int16, :string, :uint32 ], :int
    attach_function :stringRGBA, [ :pointer, :int16, :int16, :string, :uint8, :uint8, :uint8, :uint8 ], :int
    attach_function :gfxPrimitivesSetFont, [ :pointer, :int, :int ], :void

  end
end
