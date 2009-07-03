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


require 'nice-ffi'


module SDL
  module Gfx

    FPS_UPPER_LIMIT = 200
    FPS_LOWER_LIMIT = 1
    FPS_DEFAULT     = 30

    class FPSmanager < NiceStruct
      layout( :framecount, :uint32,
              :rateticks,  :float,
              :lastticks,  :uint32,
              :rate,       :uint32 )
    end

    attach_function :SDL_initFramerate,  [ :pointer       ], :void
    attach_function :SDL_setFramerate,   [ :pointer, :int ], :int
    attach_function :SDL_getFramerate,   [ :pointer       ], :int
    attach_function :SDL_framerateDelay, [ :pointer       ], :void

  end
end
