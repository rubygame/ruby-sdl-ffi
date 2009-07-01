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


need { 'nicestruct' }


module SDL

  class Keysym < NiceStruct
    layout( :scancode, :uint8,
            :sym,      SDL::ENUM,
            :mod,      SDL::ENUM,
            :unicode,  :uint16 )
  end

  ALL_HOTKEYS = 0xFFFFFFFF

  attach_function  :SDL_EnableUNICODE,   [ :int ], :int

  DEFAULT_REPEAT_DELAY    = 500
  DEFAULT_REPEAT_INTERVAL = 30

  attach_function  :SDL_EnableKeyRepeat, [ :int, :int         ], :int
  attach_function  :SDL_GetKeyRepeat,    [ :pointer, :pointer ], :void


  attach_function  :__SDL_GetKeyState, "SDL_GetKeyState",
                   [ :pointer ], :pointer

  def self.SDL_GetKeyState()
    numkeys = FFI::MemoryPointer.new( :int )
    keys = __SDL_GetKeyState( numkeys )
    return keys.get_array_of_uint8( 0, numkeys.get_int(0) )
  end


  attach_function  :SDL_GetModState,     [               ], SDL::ENUM
  attach_function  :SDL_SetModState,     [ SDL::ENUM     ], :void
  attach_function  :SDL_GetKeyName,      [ SDL::ENUM     ], :string

end
