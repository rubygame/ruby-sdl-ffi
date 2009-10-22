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


  if RUBY_PLATFORM =~ /java/
    # 2009-10-21: JRuby FFI does not support pointer arrays in structs.
    # Attempting it can raise an un-rescuable NotImplementedError! :(
    puts "Warning: Skipping class SDL::CD due to JRuby limitations."
  else

    class CD < NiceFFI::Struct
      layout( :id,        :int,
              :status,    SDL::ENUM,
              :numtracks, :int,
              :cur_track, :int,
              :cur_frame, :int,
              :track,     [:pointer, # CDtrack
                           SDL::MAX_TRACKS+1] )
    end

  end

  CD_FPS = 75

  sdl_func  :CDNumDrives,  [                                  ], :int
  sdl_func  :CDName,       [ :int                             ], :string
  sdl_func  :CDOpen,       [ :int                             ], :pointer
  sdl_func  :CDStatus,     [ :pointer                         ], SDL::ENUM
  sdl_func  :CDPlayTracks, [ :pointer, :int, :int, :int, :int ], :int
  sdl_func  :CDPlay,       [ :pointer, :int, :int             ], :int
  sdl_func  :CDPause,      [ :pointer                         ], :int
  sdl_func  :CDResume,     [ :pointer                         ], :int
  sdl_func  :CDStop,       [ :pointer                         ], :int
  sdl_func  :CDEject,      [ :pointer                         ], :int
  sdl_func  :CDClose,      [ :pointer                         ], :void

end
