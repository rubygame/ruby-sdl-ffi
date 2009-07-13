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

    sdl_func  :imageFilterMMXdetect, [ ], :int
    sdl_func  :imageFilterMMXoff,    [ ], :void
    sdl_func  :imageFilterMMXon,     [ ], :void


    sdl_func  :imageFilterAdd, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterMean, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterSub, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterAbsDiff, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterMult, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterMultNor, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterMultDivby2, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterMultDivby4, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterBitAnd, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterBitOr, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterDiv, 
              [ :pointer, :pointer, :pointer, :int ], :int

    sdl_func  :imageFilterBitNegation, 
              [ :pointer, :pointer, :int ], :int



    sdl_func  :imageFilterAddByte, 
              [ :pointer, :pointer, :int, :uchar ], :int

    sdl_func  :imageFilterAddUint, 
              [ :pointer, :pointer, :int, :uint ], :int

    sdl_func  :imageFilterAddByteToHalf,
              [ :pointer, :pointer, :int, :uchar ], :int


    sdl_func  :imageFilterSubByte, 
              [ :pointer, :pointer, :int, :uchar ], :int

    sdl_func  :imageFilterSubUint, 
              [ :pointer, :pointer, :int, :uint ], :int



    sdl_func  :imageFilterShiftRight, 
              [ :pointer, :pointer, :int, :uchar ], :int

    sdl_func  :imageFilterShiftRightUint, 
              [ :pointer, :pointer, :int, :uchar ], :int



    sdl_func  :imageFilterMultByByte, 
              [ :pointer, :pointer, :int, :uchar ], :int

    sdl_func  :imageFilterShiftRightAndMultByByte, 
              [ :pointer, :pointer, :int, :uchar, :uchar ], :int



    sdl_func  :imageFilterShiftLeftByte, 
              [ :pointer, :pointer, :int, :uchar ], :int

    sdl_func  :imageFilterShiftLeftUint, 
              [ :pointer, :pointer, :int, :uchar ], :int

    sdl_func  :imageFilterShiftLeft, 
              [ :pointer, :pointer, :int, :uchar ], :int



    sdl_func  :imageFilterBinarizeUsingThreshold, 
              [ :pointer, :pointer, :int, :uchar ], :int


    sdl_func  :imageFilterClipToRange, 
              [ :pointer, :pointer, :int, :uchar, :uchar ], :int


    sdl_func  :imageFilterNormalizeLinear, 
              [ :pointer, :pointer, :int, :int, :int, :int, :int ], :int



    sdl_func  :imageFilterConvolveKernel3x3Divide, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    sdl_func  :imageFilterConvolveKernel5x5Divide, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    sdl_func  :imageFilterConvolveKernel7x7Divide, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    sdl_func  :imageFilterConvolveKernel9x9Divide, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int



    sdl_func  :imageFilterConvolveKernel3x3ShiftRight, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    sdl_func  :imageFilterConvolveKernel5x5ShiftRight, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    sdl_func  :imageFilterConvolveKernel7x7ShiftRight, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    sdl_func  :imageFilterConvolveKernel9x9ShiftRight, 
              [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int



    sdl_func  :imageFilterSobelX, 
              [ :pointer, :pointer, :int, :int ], :int

    sdl_func  :imageFilterSobelXShiftRight, 
              [ :pointer, :pointer, :int, :int, :uchar ], :int



    sdl_func  :imageFilterAlignStack, [ ], :void
    sdl_func  :imageFilterRestoreStack, [ ], :void


  end
end
