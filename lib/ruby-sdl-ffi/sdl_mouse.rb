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


module SDL

  class Cursor < FFI::Struct
    layout(
           :area,      SDL::Rect,
           :hot_x,     :int16,
           :hot_y,     :int16,
           :data,      :pointer,
           :mask,      :pointer,
           :save,      [:pointer, 2],
           :wm_cursor, :pointer
    )
  end

  attach_sdl_function :GetMouseState, [ :pointer, :pointer ], :uint8
  attach_sdl_function :GetRelativeMouseState, [ :pointer, :pointer ], :uint8
  attach_sdl_function :WarpMouse, [ :uint16, :uint16 ], :void
  attach_sdl_function :CreateCursor, [ :pointer, :pointer, :int, :int, :int, :int ], :pointer
  attach_sdl_function :SetCursor, [ :pointer ], :void
  attach_sdl_function :GetCursor, [  ], :pointer
  attach_sdl_function :FreeCursor, [ :pointer ], :void
  attach_sdl_function :ShowCursor, [ :int ], :int

  BUTTON_LEFT      = 1
  BUTTON_MIDDLE    = 2
  BUTTON_RIGHT     = 3
  BUTTON_WHEELUP   = 4
  BUTTON_WHEELDOWN = 5
  BUTTON_X1        = 6
  BUTTON_X2        = 7

  BUTTON_LMASK  = (1 << ((1) -1))
  BUTTON_MMASK  = (1 << ((2) -1))
  BUTTON_RMASK  = (1 << ((3) -1))
  BUTTON_X1MASK = (1 << ((6) -1))
  BUTTON_X2MASK = (1 << ((7) -1))

end
