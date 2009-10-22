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

  # Aliases for integer-like types
  ENUM        = :int            # :nodoc:
  BOOL        = :int            # :nodoc:
  GLATTR      = :int            # :nodoc:


  LIL_ENDIAN  = 1234
  BIG_ENDIAN  = 4321



  # SDL.h

  class Version < NiceFFI::Struct
    layout( :major, :uint8,
            :minor, :uint8,
            :patch, :uint8 )
  end

  sdl_func  :Linked_Version, [], Version.typed_pointer


  INIT_TIMER       = 0x00000001
  INIT_AUDIO       = 0x00000010
  INIT_VIDEO       = 0x00000020
  INIT_CDROM       = 0x00000100
  INIT_JOYSTICK    = 0x00000200
  INIT_NOPARACHUTE = 0x00100000
  INIT_EVENTTHREAD = 0x01000000
  INIT_EVERYTHING  = 0x0000FFFF

  sdl_func  :Init,          [ :uint32 ], :int
  sdl_func  :InitSubSystem, [ :uint32 ], :int
  sdl_func  :QuitSubSystem, [ :uint32 ], :void
  sdl_func  :WasInit,       [ :uint32 ], :uint32
  sdl_func  :Quit,          [         ], :void



  # SDL_active.h

  APPMOUSEFOCUS = 0x01
  APPINPUTFOCUS = 0x02
  APPACTIVE     = 0x04

  sdl_func  :GetAppState, [  ], :uint8



  # SDL_cpuinfo.h

  sdl_func  :HasRDTSC,    [  ], SDL::BOOL
  sdl_func  :HasMMX,      [  ], SDL::BOOL
  sdl_func  :HasMMXExt,   [  ], SDL::BOOL
  sdl_func  :Has3DNow,    [  ], SDL::BOOL
  sdl_func  :Has3DNowExt, [  ], SDL::BOOL
  sdl_func  :HasSSE,      [  ], SDL::BOOL
  sdl_func  :HasSSE2,     [  ], SDL::BOOL
  sdl_func  :HasAltiVec,  [  ], SDL::BOOL



  # SDL_error.h

  sdl_func  :SetError,   [ :string, :varargs  ], :void
  sdl_func  :GetError,   [ ], :string
  sdl_func  :ClearError, [ ], :void

  ENOMEM      = 0
  EFREAD      = 1
  EFWRITE     = 2
  EFSEEK      = 3
  UNSUPPORTED = 4
  LASTERROR   = 5

  sdl_func  :Error, [ SDL::ENUM ], :void



  # SDL_loadso.h

  sdl_func  :LoadObject,   [ :string           ], :pointer
  sdl_func  :LoadFunction, [ :pointer, :string ], :pointer
  sdl_func  :UnloadObject, [ :pointer          ], :void



  # SDL_thread.h

  sdl_func  :CreateThread, [ callback([:pointer], :int), :pointer ], :pointer

  sdl_func  :ThreadID,    [                    ], :uint32
  sdl_func  :GetThreadID, [ :pointer           ], :uint32
  sdl_func  :WaitThread,  [ :pointer, :pointer ], :void
  sdl_func  :KillThread,  [ :pointer           ], :void

end
