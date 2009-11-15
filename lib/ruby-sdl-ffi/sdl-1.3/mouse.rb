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

  BUTTON_LEFT   = 1
  BUTTON_MIDDLE = 2
  BUTTON_RIGHT  = 3
  BUTTON_X1     = 4
  BUTTON_X2     = 5

  BUTTON_LMASK  = 1 << (BUTTON_LEFT - 1)
  BUTTON_MMASK  = 1 << (BUTTON_MIDDLE - 1)
  BUTTON_RMASK  = 1 << (BUTTON_RIGHT - 1)
  BUTTON_X1MASK = 1 << (BUTTON_X1 - 1)
  BUTTON_X2MASK = 1 << (BUTTON_X2 - 1)


  sdl_func :GetNumMice,          [      ], :int
  sdl_func :GetMouseName,        [ :int ], :string
  sdl_func :SelectMouse,         [ :int ], :int
  sdl_func :GetMouseFocusWindow, [ :int ], WINDOWID

  sdl_func :SetRelativeMouseMode, [ :int, BOOL ], :int
  sdl_func :GetRelativeMouseMode, [ :int       ], BOOL

  sdl_func :GetMouseState,         [ :int, :pointer, :pointer ], :uint8
  sdl_func :GetRelativeMouseState, [ :int, :pointer, :pointer ], :uint8

  sdl_func :WarpMouseInWindow, [ WINDOWID, :int, :int ], :void

  sdl_func :CreateCursor, [ :pointer, :pointer, 
                           :int, :int, :int, :int ], :pointer

  sdl_func :SetCursor,        [ :pointer ], :void
  sdl_func :GetCursor,        [          ], :pointer
  sdl_func :FreeCursor,       [ :pointer ], :void
  sdl_func :ShowCursor,       [ :int     ], :int
  sdl_func :GetCursorsNumber, [ :int     ], :int
  sdl_func :GetCurrentCursor, [ :int     ], :int

end
