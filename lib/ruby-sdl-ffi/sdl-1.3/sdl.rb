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

  INIT_TIMER       = 0x00000001
  INIT_AUDIO       = 0x00000010
  INIT_VIDEO       = 0x00000020
  INIT_JOYSTICK    = 0x00000200
  INIT_HAPTIC      = 0x00001000
  INIT_NOPARACHUTE = 0x00100000
  INIT_EVENTTHREAD = 0x01000000
  INIT_EVERYTHING  = 0x0000FFFF

  sdl_func :Init,          [ :uint32 ], :int
  sdl_func :InitSubSystem, [ :uint32 ], :int
  sdl_func :QuitSubSystem, [ :uint32 ], :void
  sdl_func :WasInit,       [ :uint32 ], :uint32
  sdl_func :Quit,          [         ], :void

end
