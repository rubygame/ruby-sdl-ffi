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

  CD_ERROR     = -1
  CD_TRAYEMPTY = 0
  CD_STOPPED   = 1
  CD_PLAYING   = 2
  CD_PAUSED    = 3

  AUDIO_TRACK  = 0x00
  DATA_TRACK   = 0x04

  MAX_TRACKS   = 99

  class CDtrack < NiceFFI::Struct
    layout( :id,     :uint8,
            :type,   :uint8,
            :unused, :uint16,
            :length, :uint32,
            :offset, :uint32 )

    hidden( :unused )

  end

  class CD < NiceFFI::Struct
    layout( :id,        :int,
            :status,    SDL::ENUM,
            :numtracks, :int,
            :cur_track, :int,
            :cur_frame, :int,
            :track,     [SDL::CDtrack,
                         SDL::MAX_TRACKS+1] )
  end


  CD_FPS = 75

  func  :CDNumDrives,  "SDL_CDNumDrives", [          ], :int
  func  :CDName,       "SDL_CDName",      [ :int     ], :string
  func  :CDOpen,       "SDL_CDOpen",      [ :int     ], :pointer
  func  :CDStatus,     "SDL_CDStatus",    [ :pointer ], SDL::ENUM

  func  :CDPlayTracks, "SDL_CDPlayTracks",
       [ :pointer, :int, :int, :int, :int ], :int

  func  :CDPlay,   "SDL_CDPlay",   [ :pointer, :int, :int ], :int
  func  :CDPause,  "SDL_CDPause",  [ :pointer ], :int
  func  :CDResume, "SDL_CDResume", [ :pointer ], :int
  func  :CDStop,   "SDL_CDStop",   [ :pointer ], :int
  func  :CDEject,  "SDL_CDEject",  [ :pointer ], :int
  func  :CDClose,  "SDL_CDClose",  [ :pointer ], :void

end
