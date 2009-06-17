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

  attach_sdl_function :NumJoysticks, [  ], :int
  attach_sdl_function :JoystickName, [ :int ], :string
  attach_sdl_function :JoystickOpen, [ :int ], :pointer
  attach_sdl_function :JoystickOpened, [ :int ], :int
  attach_sdl_function :JoystickIndex, [ :pointer ], :int
  attach_sdl_function :JoystickNumAxes, [ :pointer ], :int
  attach_sdl_function :JoystickNumBalls, [ :pointer ], :int
  attach_sdl_function :JoystickNumHats, [ :pointer ], :int
  attach_sdl_function :JoystickNumButtons, [ :pointer ], :int
  attach_sdl_function :JoystickUpdate, [  ], :void
  attach_sdl_function :JoystickEventState, [ :int ], :int
  attach_sdl_function :JoystickGetAxis, [ :pointer, :int ], :int16

  HAT_CENTERED  = 0x00
  HAT_UP        = 0x01
  HAT_RIGHT     = 0x02
  HAT_DOWN      = 0x04
  HAT_LEFT      = 0x08
  HAT_RIGHTUP   = (0x02|0x01)
  HAT_RIGHTDOWN = (0x02|0x04)
  HAT_LEFTUP    = (0x08|0x01)
  HAT_LEFTDOWN  = (0x08|0x04)

  attach_sdl_function :JoystickGetHat, [ :pointer, :int ], :uint8
  attach_sdl_function :JoystickGetBall, [ :pointer, :int, :pointer, :pointer ], :int
  attach_sdl_function :JoystickGetButton, [ :pointer, :int ], :uint8
  attach_sdl_function :JoystickClose, [ :pointer ], :void

end
