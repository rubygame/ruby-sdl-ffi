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


require 'rubygems'
require 'ruby-sdl-ffi/sdl'


module SDL
  module Mixer
    extend NiceFFI::Library
    load_library "SDL_mixer"


    attach_function :Linked_Version, "Mix_Linked_Version",
                    [ ], NiceFFI::TypedPointer(SDL::Version)

    CHANNELS          = 8
    DEFAULT_FREQUENCY = 22050
    DEFAULT_CHANNELS  = 2
    MAX_VOLUME        = 128


    class Chunk < NiceFFI::Struct
      layout( :allocated, :int,
              :abuf,      :pointer,
              :alen,      :uint32,
              :volume,    :uint8 )
    end



    class Music < NiceFFI::Struct
      #--
      # Mix_Music struct (in C) has a hidden layout, which changes
      # depending on which sound format libraries were available
      # at compile time. Since we don't know the layout, we have to
      # jump through some hoops.
      #++

      def initialize( val )
        case val
        when FFI::Pointer
          send(:pointer=, val)
        when self.class
          send(:pointer=, val.pointer)
        else
          raise TypeError, 
                "cannot create new #{self.class} from #{val.inspect}"
        end
      end

      def []( key )
        raise ArgumentError, "No such field '#{key}'"
      end

      def []=( key, value )
        raise ArgumentError, "No such field '#{key}'"
      end

      def members
        []
      end

    end


    NO_FADING   = 0
    FADING_OUT  = 1
    FADING_IN   = 2

    MUS_NONE    = 0
    MUS_CMD     = 1
    MUS_WAV     = 2
    MUS_MOD     = 3
    MUS_MID     = 4
    MUS_OGG     = 5
    MUS_MP3     = 6
    MUS_MP3_MAD = 7


    attach_function :OpenAudio, "Mix_OpenAudio",
                    [ :int, :uint16, :int, :int ], :int

    attach_function :AllocateChannels, "Mix_AllocateChannels", [ :int ], :int

    attach_function :QuerySpec, "Mix_QuerySpec",
                    [ :pointer, :pointer, :pointer ], :int


    attach_function :LoadWAV_RW,    "Mix_LoadWAV_RW",
                    [ :pointer, :int ], NiceFFI::TypedPointer(Chunk)

    attach_function :LoadMUS,       "Mix_LoadMUS",
                    [ :string ], NiceFFI::TypedPointer(Music)

    attach_function :LoadMUS_RW,    "Mix_LoadMUS_RW",
                    [ :pointer ], NiceFFI::TypedPointer(Music)

    attach_function :QuickLoad_WAV, "Mix_QuickLoad_WAV",
                    [ :pointer ], NiceFFI::TypedPointer(Chunk)

    attach_function :QuickLoad_RAW, "Mix_QuickLoad_RAW",
                    [ :pointer, :uint32 ], NiceFFI::TypedPointer(Chunk)


    attach_function :FreeChunk, "Mix_FreeChunk", [ :pointer ], :void
    attach_function :FreeMusic, "Mix_FreeMusic", [ :pointer ], :void


    attach_function :GetMusicType, "Mix_GetMusicType", [ :pointer ], :int


    attach_function :SetPostMix, "Mix_SetPostMix",
                    [ callback( [ :pointer, :pointer, :int ], :void),
                      :pointer ], :void


    attach_function :HookMusic,         "Mix_HookMusic",
                    [ callback( [ :pointer, :pointer, :int ], :void ),
                      :pointer ], :void

    attach_function :HookMusicFinished, "Mix_HookMusicFinished",
                    [ callback( [ ], :void) ], :void

    attach_function :GetMusicHookData,  "Mix_GetMusicHookData", [ ], :pointer

    attach_function :ChannelFinished,   "Mix_ChannelFinished",
                    [ callback( [ :int ], :void) ], :void


    CHANNEL_POST = -2


    callback(:mix_effectfunc_cb, [ :int, :pointer, :int, :pointer ], :void)
    callback(:mix_effectdone_cb, [ :int, :pointer ], :void)

    attach_function :RegisterEffect,       "Mix_RegisterEffect",
                    [ :int, :mix_effectfunc_cb,
                      :mix_effectdone_cb, :pointer ], :int

    attach_function :UnregisterEffect,     "Mix_UnregisterEffect",
                    [ :int, :mix_effectfunc_cb ], :int

    attach_function :UnregisterAllEffects, "Mix_UnregisterAllEffects",
                    [ :int ], :int


    EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"


    attach_function :SetPanning,       "Mix_SetPanning",
                    [ :int, :uint8, :uint8 ], :int
    attach_function :SetPosition,      "Mix_SetPosition",
                    [ :int, :int16, :uint8 ], :int
    attach_function :SetDistance,      "Mix_SetDistance",
                    [ :int, :uint8 ], :int
    attach_function :SetReverseStereo, "Mix_SetReverseStereo",
                    [ :int, :int ], :int
                

    attach_function :ReserveChannels, "Mix_ReserveChannels", [ :int ], :int
    attach_function :GroupChannel,    "Mix_GroupChannel", [ :int, :int ], :int

    attach_function :GroupChannels,   "Mix_GroupChannels",
                    [ :int, :int, :int ], :int

    attach_function :GroupAvailable,  "Mix_GroupAvailable", [ :int ], :int
    attach_function :GroupCount,      "Mix_GroupCount",     [ :int ], :int
    attach_function :GroupOldest,     "Mix_GroupOldest",    [ :int ], :int
    attach_function :GroupNewer,      "Mix_GroupNewer",     [ :int ], :int


    attach_function :PlayChannelTimed, "Mix_PlayChannelTimed",
                    [ :int, :pointer, :int, :int ], :int
    
    attach_function :PlayMusic, "Mix_PlayMusic",
                    [ :pointer, :int ], :int


    attach_function :FadeInMusic,        "Mix_FadeInMusic",
                    [ :pointer, :int, :int ], :int

    attach_function :FadeInMusicPos,     "Mix_FadeInMusicPos",
                    [ :pointer, :int, :int, :double ], :int

    attach_function :FadeInChannelTimed, "Mix_FadeInChannelTimed",
                    [ :int, :pointer, :int, :int, :int ], :int


    attach_function :Volume,      "Mix_Volume",      [ :int, :int     ], :int
    attach_function :VolumeChunk, "Mix_VolumeChunk", [ :pointer, :int ], :int
    attach_function :VolumeMusic, "Mix_VolumeMusic", [ :int           ], :int


    attach_function :HaltChannel,   "Mix_HaltChannel",   [ :int       ], :int
    attach_function :HaltGroup,     "Mix_HaltGroup",     [ :int       ], :int
    attach_function :HaltMusic,     "Mix_HaltMusic",     [            ], :int
    attach_function :ExpireChannel, "Mix_ExpireChannel", [ :int, :int ], :int


    attach_function :FadeOutChannel, "Mix_FadeOutChannel", [ :int, :int ], :int
    attach_function :FadeOutGroup,   "Mix_FadeOutGroup",   [ :int, :int ], :int
    attach_function :FadeOutMusic,   "Mix_FadeOutMusic",   [ :int       ], :int
    attach_function :FadingMusic,    "Mix_FadingMusic",    [            ], :int
    attach_function :FadingChannel,  "Mix_FadingChannel",  [ :int       ], :int


    attach_function :Pause,       "Mix_Pause",       [ :int ], :void
    attach_function :Resume,      "Mix_Resume",      [ :int ], :void
    attach_function :Paused,      "Mix_Paused",      [ :int ], :int

    attach_function :PauseMusic,  "Mix_PauseMusic",  [ ], :void
    attach_function :ResumeMusic, "Mix_ResumeMusic", [ ], :void
    attach_function :RewindMusic, "Mix_RewindMusic", [ ], :void
    attach_function :PausedMusic, "Mix_PausedMusic", [ ], :int

    attach_function :SetMusicPosition, "Mix_SetMusicPosition",
                    [ :double ], :int


    attach_function :Playing,      "Mix_Playing",      [ :int ], :int
    attach_function :PlayingMusic, "Mix_PlayingMusic", [      ], :int


    attach_function :SetMusicCMD,  "Mix_SetMusicCMD",  [ :string ], :int


    attach_function :SetSynchroValue, "Mix_SetSynchroValue", [ :int ], :int
    attach_function :GetSynchroValue, "Mix_GetSynchroValue", [      ], :int


    attach_function :GetChunk, "Mix_GetChunk",
                    [ :int ], NiceFFI::TypedPointer(Chunk)


    attach_function :CloseAudio, "Mix_CloseAudio", [ ], :void

  end
end
