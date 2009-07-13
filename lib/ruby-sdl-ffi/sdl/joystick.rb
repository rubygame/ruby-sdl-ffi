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

  func  :NumJoysticks,       "SDL_NumJoysticks",       [          ], :int
  func  :JoystickName,       "SDL_JoystickName",       [ :int     ], :string
  func  :JoystickOpen,       "SDL_JoystickOpen",       [ :int     ], :pointer
  func  :JoystickOpened,     "SDL_JoystickOpened",     [ :int     ], :int
  func  :JoystickIndex,      "SDL_JoystickIndex",      [ :pointer ], :int

  func  :JoystickNumAxes,    "SDL_JoystickNumAxes",    [ :pointer ], :int
  func  :JoystickNumBalls,   "SDL_JoystickNumBalls",   [ :pointer ], :int
  func  :JoystickNumHats,    "SDL_JoystickNumHats",    [ :pointer ], :int
  func  :JoystickNumButtons, "SDL_JoystickNumButtons", [ :pointer ], :int

  func  :JoystickUpdate,     "SDL_JoystickUpdate",     [          ], :void
  func  :JoystickEventState, "SDL_JoystickEventState", [ :int     ], :int
  func  :JoystickGetAxis,    "SDL_JoystickGetAxis", [ :pointer, :int ], :int16


  HAT_CENTERED  = 0x00
  HAT_UP        = 0x01
  HAT_RIGHT     = 0x02
  HAT_DOWN      = 0x04
  HAT_LEFT      = 0x08
  HAT_RIGHTUP   = (HAT_RIGHT|HAT_UP)
  HAT_RIGHTDOWN = (HAT_RIGHT|HAT_DOWN)
  HAT_LEFTUP    = (HAT_LEFT |HAT_UP)
  HAT_LEFTDOWN  = (HAT_LEFT |HAT_DOWN)


  func  :JoystickGetHat,    "SDL_JoystickGetHat", [ :pointer, :int ], :uint8

  func  :JoystickGetBall,   "SDL_JoystickGetBall",
        [ :pointer, :int, :pointer, :pointer ], :int

  func  :JoystickGetButton, "SDL_JoystickGetButton", [ :pointer, :int ], :uint8


  func  :JoystickClose, "SDL_JoystickClose", [ :pointer ], :void

end
