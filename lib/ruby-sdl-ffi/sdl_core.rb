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

  attach_function  :SDL_Linked_Version, [  ], :pointer

  INIT_TIMER       = 0x00000001
  INIT_AUDIO       = 0x00000010
  INIT_VIDEO       = 0x00000020
  INIT_CDROM       = 0x00000100
  INIT_JOYSTICK    = 0x00000200
  INIT_NOPARACHUTE = 0x00100000
  INIT_EVENTTHREAD = 0x01000000
  INIT_EVERYTHING  = 0x0000FFFF

  attach_function  :SDL_Init,           [ :uint32 ], :int
  attach_function  :SDL_InitSubSystem,  [ :uint32 ], :int
  attach_function  :SDL_QuitSubSystem,  [ :uint32 ], :void
  attach_function  :SDL_WasInit,        [ :uint32 ], :uint32
  attach_function  :SDL_Quit,           [         ], :void



  # SDL_active.h

  APPMOUSEFOCUS = 0x01
  APPINPUTFOCUS = 0x02
  APPACTIVE     = 0x04

  attach_function  :SDL_GetAppState,  [  ], :uint8



  # SDL_cpuinfo.h

  attach_function  :SDL_HasRDTSC,     [  ], SDL::BOOL
  attach_function  :SDL_HasMMX,       [  ], SDL::BOOL
  attach_function  :SDL_HasMMXExt,    [  ], SDL::BOOL
  attach_function  :SDL_Has3DNow,     [  ], SDL::BOOL
  attach_function  :SDL_Has3DNowExt,  [  ], SDL::BOOL
  attach_function  :SDL_HasSSE,       [  ], SDL::BOOL
  attach_function  :SDL_HasSSE2,      [  ], SDL::BOOL
  attach_function  :SDL_HasAltiVec,   [  ], SDL::BOOL



  # SDL_error.h

  attach_function  :SDL_SetError,     [ :string, :varargs  ], :void
  attach_function  :SDL_GetError,     [                    ], :string
  attach_function  :SDL_ClearError,   [                    ], :void

  ENOMEM      = 0
  EFREAD      = 1
  EFWRITE     = 2
  EFSEEK      = 3
  UNSUPPORTED = 4
  LASTERROR   = 5

  attach_function  :SDL_Error,        [ SDL::ENUM          ], :void



  # SDL_loadso.h

  attach_function  :SDL_LoadObject,   [ :string            ], :pointer
  attach_function  :SDL_LoadFunction, [ :pointer, :string  ], :pointer
  attach_function  :SDL_UnloadObject, [ :pointer           ], :void



  # SDL_thread.h

  attach_function  :SDL_CreateThread,
                   [ callback( :createthread_cb, [:pointer], :int ),
                     :pointer ], :pointer

  attach_function  :SDL_ThreadID,     [                    ], :uint32
  attach_function  :SDL_GetThreadID,  [ :pointer           ], :uint32
  attach_function  :SDL_WaitThread,   [ :pointer, :pointer ], :void
  attach_function  :SDL_KillThread,   [ :pointer           ], :void

end
