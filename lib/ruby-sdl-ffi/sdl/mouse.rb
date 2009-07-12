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

  class Cursor < NiceFFI::Struct
    layout( :area,      SDL::Rect,
            :hot_x,     :int16,
            :hot_y,     :int16,
            :data,      :pointer,
            :mask,      :pointer,
            :save,      [:pointer, 2],
            :wm_cursor, :pointer )
  end


  attach_function  :__SDL_GetMouseState, "SDL_GetMouseState",
                   [ :pointer, :pointer ], :uint8

  # Returns [buttons, x, y].
  #  buttons: buttons currently pressed (bitmask of BUTTON_*MASK constants).
  #  x, y: current position of the mouse cursor.
  def self.GetMouseState()
    xmp = FFI::MemoryPointer.new( :int )
    ymp = FFI::MemoryPointer.new( :int )
    buttons = __SDL_GetMouseState( xmp, ymp )
    return [buttons, xmp.get_int(0), ymp.get_int(0)]
  end


  attach_function  :__SDL_GetRelativeMouseState, "SDL_GetRelativeMouseState",
                   [ :pointer, :pointer ], :uint8

  # Returns [buttons, x, y].
  #  buttons: buttons currently pressed (bitmask of BUTTON_*MASK constants).
  #  x, y: movement of the mouse cursor since last call of this method.
  # 
  def self.GetRelativeMouseState()
    xmp = FFI::MemoryPointer.new( :int )
    ymp = FFI::MemoryPointer.new( :int )
    buttons = __SDL_GetRelativeMouseState( xmp, ymp )
    return [buttons, xmp.get_int(0), ymp.get_int(0)]
  end



  attach_function  :WarpMouse, "SDL_WarpMouse", [ :uint16, :uint16 ], :void


  attach_function  :CreateCursor, "SDL_CreateCursor",
                   [ :pointer, :pointer, :int, :int, :int, :int ], :pointer

  attach_function  :SetCursor,  "SDL_SetCursor",  [ :pointer ], :void
  attach_function  :GetCursor,  "SDL_GetCursor",  [          ], :pointer
  attach_function  :FreeCursor, "SDL_FreeCursor", [ :pointer ], :void
  attach_function  :ShowCursor, "SDL_ShowCursor", [ :int     ], :int


  BUTTON_LEFT      = 1
  BUTTON_MIDDLE    = 2
  BUTTON_RIGHT     = 3
  BUTTON_WHEELUP   = 4
  BUTTON_WHEELDOWN = 5
  BUTTON_X1        = 6
  BUTTON_X2        = 7

  BUTTON_LMASK     = 1 << (BUTTON_LEFT   - 1)
  BUTTON_MMASK     = 1 << (BUTTON_MIDDLE - 1)
  BUTTON_RMASK     = 1 << (BUTTON_RIGHT  - 1)
  BUTTON_X1MASK    = 1 << (BUTTON_X1     - 1)
  BUTTON_X2MASK    = 1 << (BUTTON_X2     - 1)

end
