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

    func  :imageFilterMMXdetect, "SDL_imageFilterMMXdetect", [ ], :int

    func  :imageFilterMMXoff, "SDL_imageFilterMMXoff", [ ], :void
    func  :imageFilterMMXon,  "SDL_imageFilterMMXon",  [ ], :void



    func  :imageFilterAdd,         "SDL_imageFilterAdd", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterMean,        "SDL_imageFilterMean", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterSub,         "SDL_imageFilterSub", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterAbsDiff,     "SDL_imageFilterAbsDiff", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterMult,        "SDL_imageFilterMult", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterMultNor,     "SDL_imageFilterMultNor", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterMultDivby2,  "SDL_imageFilterMultDivby2", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterMultDivby4,  "SDL_imageFilterMultDivby4", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterBitAnd,      "SDL_imageFilterBitAnd", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterBitOr,       "SDL_imageFilterBitOr", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterDiv,         "SDL_imageFilterDiv", 
          [ :pointer, :pointer, :pointer, :int ], :int

    func  :imageFilterBitNegation, "SDL_imageFilterBitNegation", 
          [ :pointer, :pointer, :int ], :int



    func  :imageFilterAddByte, "SDL_imageFilterAddByte", 
          [ :pointer, :pointer, :int, :uchar ], :int

    func  :imageFilterAddUint, "SDL_imageFilterAddUint", 
          [ :pointer, :pointer, :int, :uint ], :int

    func  :imageFilterAddByteToHalf,
          "SDL_imageFilterAddByteToHalf",
          [ :pointer, :pointer, :int, :uchar ], :int


    func  :imageFilterSubByte, "SDL_imageFilterSubByte", 
          [ :pointer, :pointer, :int, :uchar ], :int

    func  :imageFilterSubUint, "SDL_imageFilterSubUint", 
          [ :pointer, :pointer, :int, :uint ], :int



    func  :imageFilterShiftRight, "SDL_imageFilterShiftRight", 
          [ :pointer, :pointer, :int, :uchar ], :int

    func  :imageFilterShiftRightUint, "SDL_imageFilterShiftRightUint", 
          [ :pointer, :pointer, :int, :uchar ], :int



    func  :imageFilterMultByByte, "SDL_imageFilterMultByByte", 
          [ :pointer, :pointer, :int, :uchar ], :int

    func  :imageFilterShiftRightAndMultByByte,
          "SDL_imageFilterShiftRightAndMultByByte", 
          [ :pointer, :pointer, :int, :uchar, :uchar ], :int



    func  :imageFilterShiftLeftByte,
          "SDL_imageFilterShiftLeftByte", 
          [ :pointer, :pointer, :int, :uchar ], :int

    func  :imageFilterShiftLeftUint,
          "SDL_imageFilterShiftLeftUint", 
          [ :pointer, :pointer, :int, :uchar ], :int

    func  :imageFilterShiftLeft,
          "SDL_imageFilterShiftLeft", 
          [ :pointer, :pointer, :int, :uchar ], :int



    func  :imageFilterBinarizeUsingThreshold,
          "SDL_imageFilterBinarizeUsingThreshold", 
          [ :pointer, :pointer, :int, :uchar ], :int



    func  :imageFilterClipToRange,
          "SDL_imageFilterClipToRange", 
          [ :pointer, :pointer, :int, :uchar, :uchar ], :int



    func  :imageFilterNormalizeLinear,
          "SDL_imageFilterNormalizeLinear", 
          [ :pointer, :pointer, :int, :int, :int, :int, :int ], :int



    func  :imageFilterConvolveKernel3x3Divide,
          "SDL_imageFilterConvolveKernel3x3Divide", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    func  :imageFilterConvolveKernel5x5Divide,
          "SDL_imageFilterConvolveKernel5x5Divide", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    func  :imageFilterConvolveKernel7x7Divide,
          "SDL_imageFilterConvolveKernel7x7Divide", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    func  :imageFilterConvolveKernel9x9Divide,
          "SDL_imageFilterConvolveKernel9x9Divide", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int



    func  :imageFilterConvolveKernel3x3ShiftRight,
          "SDL_imageFilterConvolveKernel3x3ShiftRight", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    func  :imageFilterConvolveKernel5x5ShiftRight,
          "SDL_imageFilterConvolveKernel5x5ShiftRight", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    func  :imageFilterConvolveKernel7x7ShiftRight,
          "SDL_imageFilterConvolveKernel7x7ShiftRight", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    func  :imageFilterConvolveKernel9x9ShiftRight,
          "SDL_imageFilterConvolveKernel9x9ShiftRight", 
          [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int



    func  :imageFilterSobelX, "SDL_imageFilterSobelX", 
          [ :pointer, :pointer, :int, :int ], :int

    func  :imageFilterSobelXShiftRight, "SDL_imageFilterSobelXShiftRight", 
          [ :pointer, :pointer, :int, :int, :uchar ], :int



    func  :imageFilterAlignStack,   "SDL_imageFilterAlignStack", [ ], :void
    func  :imageFilterRestoreStack, "SDL_imageFilterRestoreStack", [ ], :void


  end
end
