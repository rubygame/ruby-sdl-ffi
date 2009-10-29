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

    M_PI = 3.141592654


    func  :pixelColor, [ :pointer, :int16, :int16, :uint32 ], :int

    func  :pixelRGBA,
          [ :pointer, :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int



    func  :hlineColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int

    func  :hlineRGBA,
          [ :pointer, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :vlineColor, [ :pointer, :int16, :int16, :int16, :uint32 ], :int

    func  :vlineRGBA,
          [ :pointer, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int



    func  :rectangleColor,
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :rectangleRGBA,
          [ :pointer, :int16, :int16,
            :int16, :int16, :uint8, :uint8, :uint8, :uint8 ], :int

    func  :boxColor,
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :boxRGBA,
          [ :pointer, :int16, :int16, :int16,
            :int16, :uint8, :uint8, :uint8, :uint8 ], :int



    func  :lineColor,
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :lineRGBA,
          [ :pointer, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :aalineColor,
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :aalineRGBA,
          [ :pointer, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int



    func  :circleColor,
          [ :pointer, :int16, :int16, :int16, :uint32 ], :int

    func  :circleRGBA,
          [ :pointer, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :aacircleColor, 
          [ :pointer, :int16, :int16, :int16, :uint32 ], :int

    func  :aacircleRGBA, 
          [ :pointer, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :filledCircleColor, 
          [ :pointer, :int16, :int16, :int16, :uint32 ], :int

    func  :filledCircleRGBA, 
          [ :pointer, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int



    optfunc  :arcColor, 
             [ :pointer, :int16, :int16, :int16,
               :int16, :int16, :uint32 ], :int

    optfunc  :arcRGBA, 
             [ :pointer, :int16, :int16, :int16, :int16, :int16,
               :uint8, :uint8, :uint8, :uint8 ], :int



    func  :ellipseColor, 
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :ellipseRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :aaellipseColor, 
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :aaellipseRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :filledEllipseColor, 
          [ :pointer, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :filledEllipseRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int



    func  :pieColor, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :pieRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :filledPieColor, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16, :uint32 ], :int

    func  :filledPieRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16,
            :uint8, :uint8, :uint8, :uint8 ], :int



    func  :trigonColor, 
          [ :pointer, :int16, :int16, :int16, :int16,
            :int16, :int16, :uint32 ], :int

    func  :trigonRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16,
            :int16, :uint8, :uint8, :uint8, :uint8 ], :int

    func  :aatrigonColor, 
          [ :pointer, :int16, :int16, :int16, :int16,
            :int16, :int16, :uint32 ], :int

    func  :aatrigonRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16,
            :int16, :uint8, :uint8, :uint8, :uint8 ], :int

    func  :filledTrigonColor, 
          [ :pointer, :int16, :int16, :int16, :int16,
            :int16, :int16, :uint32 ], :int

    func  :filledTrigonRGBA, 
          [ :pointer, :int16, :int16, :int16, :int16, :int16,
            :int16, :uint8, :uint8, :uint8, :uint8 ], :int



    func  :polygonColor, [ :pointer, :pointer, :pointer, :int, :uint32 ], :int

    func  :polygonRGBA, 
          [ :pointer, :pointer, :pointer, :int,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :aapolygonColor, 
          [ :pointer, :pointer, :pointer, :int, :uint32 ], :int

    func  :aapolygonRGBA, 
          [ :pointer, :pointer, :pointer, :int,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :filledPolygonColor, 
          [ :pointer, :pointer, :pointer, :int, :uint32 ], :int

    func  :filledPolygonRGBA, 
          [ :pointer, :pointer, :pointer, :int,
            :uint8, :uint8, :uint8, :uint8 ], :int

    optfunc  :texturedPolygon, 
             [ :pointer, :pointer, :pointer,
               :int, :pointer, :int, :int ], :int


    optfunc  :filledPolygonColorMT, 
             [ :pointer, :pointer, :pointer,
               :int, :uint32, :pointer, :pointer ], :int

    optfunc  :filledPolygonRGBAMT, 
             [ :pointer, :pointer, :pointer, :int, :uint8,
               :uint8, :uint8, :uint8, :pointer, :pointer ], :int

    optfunc  :texturedPolygonMT, 
             [ :pointer, :pointer, :pointer, :int,
               :pointer, :int, :int, :pointer, :pointer ], :int



    func  :bezierColor, 
          [ :pointer, :pointer, :pointer, :int, :int, :uint32 ], :int

    func  :bezierRGBA, 
          [ :pointer, :pointer, :pointer, :int, :int,
            :uint8, :uint8, :uint8, :uint8 ], :int



    func  :characterColor, [ :pointer, :int16, :int16, :char, :uint32 ], :int

    func  :characterRGBA, 
          [ :pointer, :int16, :int16, :char,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :stringColor, [ :pointer, :int16, :int16, :string, :uint32 ], :int

    func  :stringRGBA, 
          [ :pointer, :int16, :int16, :string,
            :uint8, :uint8, :uint8, :uint8 ], :int

    func  :gfxPrimitivesSetFont, [ :pointer, :int, :int ], :void

  end
end
