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
  module Raw

    TIMESLICE        = 10
    TIMER_RESOLUTION = 10

    attach_function :SDL_GetTicks, [  ], :uint32
    attach_function :SDL_Delay, [ :uint32 ], :void

    callback(:timer_cb, [ :uint32 ], :uint32)
    attach_function :SDL_SetTimer, [ :uint32, :timer_cb ], :int

    callback(:newtimer_cb, [ :uint32, :pointer ], :uint32)
    attach_function :SDL_AddTimer, [ :uint32, :newtimer_cb, :pointer ], :pointer
    attach_function :SDL_RemoveTimer, [ :pointer ], SDL::Raw::BOOL

  end
end
