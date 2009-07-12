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

  attach_function  :NumJoysticks,       "SDL_NumJoysticks",
                   [ ], :int

  attach_function  :JoystickName,       "SDL_JoystickName",
                   [ :int ], :string

  attach_function  :JoystickOpen,       "SDL_JoystickOpen",
                   [ :int ], :pointer

  attach_function  :JoystickOpened,     "SDL_JoystickOpened",
                   [ :int ], :int

  attach_function  :JoystickIndex,      "SDL_JoystickIndex",
                   [ :pointer ], :int



  attach_function  :JoystickNumAxes,    "SDL_JoystickNumAxes",
                   [ :pointer ], :int

  attach_function  :JoystickNumBalls,   "SDL_JoystickNumBalls",
                   [ :pointer ], :int

  attach_function  :JoystickNumHats,    "SDL_JoystickNumHats",
                   [ :pointer ], :int

  attach_function  :JoystickNumButtons, "SDL_JoystickNumButtons",
                   [ :pointer ], :int



  attach_function  :JoystickUpdate,     "SDL_JoystickUpdate",
                   [ ], :void

  attach_function  :JoystickEventState, "SDL_JoystickEventState",
                   [ :int ], :int

  attach_function  :JoystickGetAxis,    "SDL_JoystickGetAxis",
                   [ :pointer, :int ], :int16


  HAT_CENTERED  = 0x00
  HAT_UP        = 0x01
  HAT_RIGHT     = 0x02
  HAT_DOWN      = 0x04
  HAT_LEFT      = 0x08
  HAT_RIGHTUP   = (HAT_RIGHT|HAT_UP)
  HAT_RIGHTDOWN = (HAT_RIGHT|HAT_DOWN)
  HAT_LEFTUP    = (HAT_LEFT |HAT_UP)
  HAT_LEFTDOWN  = (HAT_LEFT |HAT_DOWN)


  attach_function  :JoystickGetHat,    "SDL_JoystickGetHat",
                   [ :pointer, :int ], :uint8

  attach_function  :JoystickGetBall,   "SDL_JoystickGetBall",
                   [ :pointer, :int, :pointer, :pointer ], :int

  attach_function  :JoystickGetButton, "SDL_JoystickGetButton",
                   [ :pointer, :int ], :uint8



  attach_function  :JoystickClose,     "SDL_JoystickClose",
                   [ :pointer ], :void

end
