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

    attach_function :imageFilterMMXdetect, "SDL_imageFilterMMXdetect", 
                    [ ], :int

    attach_function :imageFilterMMXoff, "SDL_imageFilterMMXoff", [ ], :void
    attach_function :imageFilterMMXon,  "SDL_imageFilterMMXon",  [ ], :void



    attach_function :imageFilterAdd,         "SDL_imageFilterAdd", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterMean,        "SDL_imageFilterMean", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterSub,         "SDL_imageFilterSub", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterAbsDiff,     "SDL_imageFilterAbsDiff", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterMult,        "SDL_imageFilterMult", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterMultNor,     "SDL_imageFilterMultNor", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterMultDivby2,  "SDL_imageFilterMultDivby2", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterMultDivby4,  "SDL_imageFilterMultDivby4", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterBitAnd,      "SDL_imageFilterBitAnd", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterBitOr,       "SDL_imageFilterBitOr", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterDiv,         "SDL_imageFilterDiv", 
                    [ :pointer, :pointer, :pointer, :int ], :int

    attach_function :imageFilterBitNegation, "SDL_imageFilterBitNegation", 
                    [ :pointer, :pointer, :int ], :int



    attach_function :imageFilterAddByte, "SDL_imageFilterAddByte", 
                    [ :pointer, :pointer, :int, :uchar ], :int

    attach_function :imageFilterAddUint, "SDL_imageFilterAddUint", 
                    [ :pointer, :pointer, :int, :uint ], :int

    attach_function :imageFilterAddByteToHalf,
                    "SDL_imageFilterAddByteToHalf",
                    [ :pointer, :pointer, :int, :uchar ], :int


    attach_function :imageFilterSubByte, "SDL_imageFilterSubByte", 
                    [ :pointer, :pointer, :int, :uchar ], :int

    attach_function :imageFilterSubUint, "SDL_imageFilterSubUint", 
                    [ :pointer, :pointer, :int, :uint ], :int



    attach_function :imageFilterShiftRight,
                    "SDL_imageFilterShiftRight", 
                    [ :pointer, :pointer, :int, :uchar ], :int

    attach_function :imageFilterShiftRightUint,
                    "SDL_imageFilterShiftRightUint", 
                    [ :pointer, :pointer, :int, :uchar ], :int



    attach_function :imageFilterMultByByte,
                    "SDL_imageFilterMultByByte", 
                    [ :pointer, :pointer, :int, :uchar ], :int

    attach_function :imageFilterShiftRightAndMultByByte,
                    "SDL_imageFilterShiftRightAndMultByByte", 
                    [ :pointer, :pointer, :int, :uchar, :uchar ], :int



    attach_function :imageFilterShiftLeftByte,
                    "SDL_imageFilterShiftLeftByte", 
                    [ :pointer, :pointer, :int, :uchar ], :int

    attach_function :imageFilterShiftLeftUint,
                    "SDL_imageFilterShiftLeftUint", 
                    [ :pointer, :pointer, :int, :uchar ], :int

    attach_function :imageFilterShiftLeft,
                    "SDL_imageFilterShiftLeft", 
                    [ :pointer, :pointer, :int, :uchar ], :int



    attach_function :imageFilterBinarizeUsingThreshold,
                    "SDL_imageFilterBinarizeUsingThreshold", 
                    [ :pointer, :pointer, :int, :uchar ], :int



    attach_function :imageFilterClipToRange,
                    "SDL_imageFilterClipToRange", 
                    [ :pointer, :pointer, :int, :uchar, :uchar ], :int



    attach_function :imageFilterNormalizeLinear,
                    "SDL_imageFilterNormalizeLinear", 
                    [ :pointer, :pointer, :int, :int, :int, :int, :int ], :int



    attach_function :imageFilterConvolveKernel3x3Divide,
                    "SDL_imageFilterConvolveKernel3x3Divide", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    attach_function :imageFilterConvolveKernel5x5Divide,
                    "SDL_imageFilterConvolveKernel5x5Divide", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    attach_function :imageFilterConvolveKernel7x7Divide,
                    "SDL_imageFilterConvolveKernel7x7Divide", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    attach_function :imageFilterConvolveKernel9x9Divide,
                    "SDL_imageFilterConvolveKernel9x9Divide", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int



    attach_function :imageFilterConvolveKernel3x3ShiftRight,
                    "SDL_imageFilterConvolveKernel3x3ShiftRight", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    attach_function :imageFilterConvolveKernel5x5ShiftRight,
                    "SDL_imageFilterConvolveKernel5x5ShiftRight", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    attach_function :imageFilterConvolveKernel7x7ShiftRight,
                    "SDL_imageFilterConvolveKernel7x7ShiftRight", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int

    attach_function :imageFilterConvolveKernel9x9ShiftRight,
                    "SDL_imageFilterConvolveKernel9x9ShiftRight", 
                    [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int



    attach_function :imageFilterSobelX,
                    "SDL_imageFilterSobelX", 
                    [ :pointer, :pointer, :int, :int ], :int

    attach_function :imageFilterSobelXShiftRight,
                    "SDL_imageFilterSobelXShiftRight", 
                    [ :pointer, :pointer, :int, :int, :uchar ], :int



    attach_function :imageFilterAlignStack,
                    "SDL_imageFilterAlignStack", 
                    [ ], :void

    attach_function :imageFilterRestoreStack,
                    "SDL_imageFilterRestoreStack", 
                    [ ], :void


  end
end
