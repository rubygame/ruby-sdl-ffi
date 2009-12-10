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

  class Keysym < NiceFFI::Struct
    layout( :scancode, :uint8,
            :sym,      SDL::ENUM,
            :mod,      SDL::ENUM,
            :unicode,  :uint16 )
  end

  ALL_HOTKEYS = 0xFFFFFFFF


  sdl_func  :EnableUNICODE, [ :int ], :int


  DEFAULT_REPEAT_DELAY    = 500
  DEFAULT_REPEAT_INTERVAL = 30

  sdl_func  :EnableKeyRepeat, [ :int, :int ], :int


  func  :__SDL_GetKeyRepeat, "SDL_GetKeyRepeat",
        [ :buffer_out, :buffer_out ], :void

  def self.GetKeyRepeat()
    delay = FFI::Buffer.new( :int )
    interval = FFI::Buffer.new( :int )
    __SDL_GetKeyRepeat( delay, interval )
    return [delay.get_int(0), interval.get_int(0)]
  end


  func  :__SDL_GetKeyState, "SDL_GetKeyState", [ :buffer_out ], :pointer

  def self.GetKeyState()
    numkeys = FFI::Buffer.new( :int )
    keys = __SDL_GetKeyState( numkeys )
    return keys.get_array_of_uint8( 0, numkeys.get_int(0) )
  end


  sdl_func  :GetModState, [           ], SDL::ENUM
  sdl_func  :SetModState, [ SDL::ENUM ], :void
  sdl_func  :GetKeyName,  [ SDL::ENUM ], :string

end
