#--
#
# This file is one part of:
#
# FFI-SDL - Ruby-FFI bindings to SDL
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

    attach_function :SDL_imageFilterMMXdetect, [  ], :int
    attach_function :SDL_imageFilterMMXoff, [  ], :void
    attach_function :SDL_imageFilterMMXon, [  ], :void
    attach_function :SDL_imageFilterAdd, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterMean, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterSub, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterAbsDiff, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterMult, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterMultNor, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterMultDivby2, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterMultDivby4, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterBitAnd, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterBitOr, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterDiv, [ :pointer, :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterBitNegation, [ :pointer, :pointer, :int ], :int
    attach_function :SDL_imageFilterAddByte, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterAddUint, [ :pointer, :pointer, :int, :uint ], :int
    attach_function :SDL_imageFilterAddByteToHalf, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterSubByte, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterSubUint, [ :pointer, :pointer, :int, :uint ], :int
    attach_function :SDL_imageFilterShiftRight, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterShiftRightUint, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterMultByByte, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterShiftRightAndMultByByte, [ :pointer, :pointer, :int, :uchar, :uchar ], :int
    attach_function :SDL_imageFilterShiftLeftByte, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterShiftLeftUint, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterShiftLeft, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterBinarizeUsingThreshold, [ :pointer, :pointer, :int, :uchar ], :int
    attach_function :SDL_imageFilterClipToRange, [ :pointer, :pointer, :int, :uchar, :uchar ], :int
    attach_function :SDL_imageFilterNormalizeLinear, [ :pointer, :pointer, :int, :int, :int, :int, :int ], :int
    attach_function :SDL_imageFilterConvolveKernel3x3Divide, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel5x5Divide, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel7x7Divide, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel9x9Divide, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel3x3ShiftRight, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel5x5ShiftRight, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel7x7ShiftRight, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterConvolveKernel9x9ShiftRight, [ :pointer, :pointer, :int, :int, :pointer, :uchar ], :int
    attach_function :SDL_imageFilterSobelX, [ :pointer, :pointer, :int, :int ], :int
    attach_function :SDL_imageFilterSobelXShiftRight, [ :pointer, :pointer, :int, :int, :uchar ], :int
    attach_function :SDL_imageFilterAlignStack, [  ], :void
    attach_function :SDL_imageFilterRestoreStack, [  ], :void

  end
end
