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

  HAT_CENTERED  = 0x00
  HAT_UP        = 0x01
  HAT_RIGHT     = 0x02
  HAT_DOWN      = 0x04
  HAT_LEFT      = 0x08
  HAT_RIGHTUP   = HAT_RIGHT | HAT_UP
  HAT_RIGHTDOWN = HAT_RIGHT | HAT_DOWN
  HAT_LEFTUP    = HAT_LEFT  | HAT_UP
  HAT_LEFTDOWN  = HAT_LEFT  | HAT_DOWN

  sdl_func :NumJoysticks,       [                ], :int
  sdl_func :JoystickName,       [ :int           ], :string
  sdl_func :JoystickOpen,       [ :int           ], :pointer
  sdl_func :JoystickOpened,     [ :int           ], :int
  sdl_func :JoystickIndex,      [ :pointer       ], :int
  sdl_func :JoystickNumAxes,    [ :pointer       ], :int
  sdl_func :JoystickNumBalls,   [ :pointer       ], :int
  sdl_func :JoystickNumHats,    [ :pointer       ], :int
  sdl_func :JoystickNumButtons, [ :pointer       ], :int
  sdl_func :JoystickUpdate,     [                ], :void
  sdl_func :JoystickEventState, [ :int           ], :int
  sdl_func :JoystickGetAxis,    [ :pointer, :int ], :int16
  sdl_func :JoystickGetHat,     [ :pointer, :int ], :uint8
  sdl_func :JoystickGetBall,    [ :pointer, :int, :pointer, :pointer ], :int
  sdl_func :JoystickGetButton,  [ :pointer, :int ], :uint8
  sdl_func :JoystickClose,      [ :pointer       ], :void

end
