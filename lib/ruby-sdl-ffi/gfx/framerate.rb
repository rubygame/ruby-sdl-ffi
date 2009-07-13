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

    FPS_UPPER_LIMIT = 200
    FPS_LOWER_LIMIT = 1
    FPS_DEFAULT     = 30

    class FPSmanager < NiceFFI::Struct
      layout( :framecount, :uint32,
              :rateticks,  :float,
              :lastticks,  :uint32,
              :rate,       :uint32 )
    end

    func  :initFramerate,  "SDL_initFramerate",  [ :pointer       ], :void
    func  :setFramerate,   "SDL_setFramerate",   [ :pointer, :int ], :int
    func  :getFramerate,   "SDL_getFramerate",   [ :pointer       ], :int
    func  :framerateDelay, "SDL_framerateDelay", [ :pointer       ], :void

  end
end
