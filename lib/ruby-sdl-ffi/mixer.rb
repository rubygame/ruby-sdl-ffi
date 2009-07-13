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


    func  :Linked_Version, "Mix_Linked_Version",
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


    func  :OpenAudio, "Mix_OpenAudio",
          [ :int, :uint16, :int, :int ], :int

    func  :AllocateChannels, "Mix_AllocateChannels", [ :int ], :int

    func  :QuerySpec, "Mix_QuerySpec", [ :pointer, :pointer, :pointer ], :int


    func  :LoadWAV_RW,    "Mix_LoadWAV_RW",
          [ :pointer, :int ], NiceFFI::TypedPointer(Chunk)

    func  :LoadMUS,       "Mix_LoadMUS",
          [ :string ], NiceFFI::TypedPointer(Music)

    func  :LoadMUS_RW,    "Mix_LoadMUS_RW",
          [ :pointer ], NiceFFI::TypedPointer(Music)

    func  :QuickLoad_WAV, "Mix_QuickLoad_WAV",
          [ :pointer ], NiceFFI::TypedPointer(Chunk)

    func  :QuickLoad_RAW, "Mix_QuickLoad_RAW",
          [ :pointer, :uint32 ], NiceFFI::TypedPointer(Chunk)


    func  :FreeChunk, "Mix_FreeChunk", [ :pointer ], :void
    func  :FreeMusic, "Mix_FreeMusic", [ :pointer ], :void


    func  :GetMusicType, "Mix_GetMusicType", [ :pointer ], :int


    func  :SetPostMix,        "Mix_SetPostMix",
          [ callback( [ :pointer, :pointer, :int ], :void), :pointer ], :void

    func  :HookMusic,         "Mix_HookMusic",
          [ callback( [ :pointer, :pointer, :int ], :void ), :pointer ], :void

    func  :HookMusicFinished, "Mix_HookMusicFinished",
          [ callback( [ ], :void) ], :void

    func  :GetMusicHookData,  "Mix_GetMusicHookData", [ ], :pointer

    func  :ChannelFinished,   "Mix_ChannelFinished",
          [ callback( [ :int ], :void) ], :void


    CHANNEL_POST = -2


    callback(:mix_effectfunc_cb, [ :int, :pointer, :int, :pointer ], :void)
    callback(:mix_effectdone_cb, [ :int, :pointer ], :void)

    func  :RegisterEffect,       "Mix_RegisterEffect",
          [ :int, :mix_effectfunc_cb, :mix_effectdone_cb, :pointer ], :int

    func  :UnregisterEffect,     "Mix_UnregisterEffect",
          [ :int, :mix_effectfunc_cb ], :int

    func  :UnregisterAllEffects, "Mix_UnregisterAllEffects", [ :int ], :int


    EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"


    func  :SetPanning,       "Mix_SetPanning",  [ :int, :uint8, :uint8 ], :int
    func  :SetPosition,      "Mix_SetPosition", [ :int, :int16, :uint8 ], :int
    func  :SetDistance,      "Mix_SetDistance", [ :int, :uint8         ], :int
    func  :SetReverseStereo, "Mix_SetReverseStereo", [ :int, :int ], :int
                

    func  :ReserveChannels, "Mix_ReserveChannels", [ :int             ], :int
    func  :GroupChannel,    "Mix_GroupChannel",    [ :int, :int       ], :int
    func  :GroupChannels,   "Mix_GroupChannels",   [ :int, :int, :int ], :int
    func  :GroupAvailable,  "Mix_GroupAvailable",  [ :int             ], :int
    func  :GroupCount,      "Mix_GroupCount",      [ :int             ], :int
    func  :GroupOldest,     "Mix_GroupOldest",     [ :int             ], :int
    func  :GroupNewer,      "Mix_GroupNewer",      [ :int             ], :int


    func  :PlayChannelTimed, "Mix_PlayChannelTimed",
          [ :int, :pointer, :int, :int ], :int
    
    func  :PlayMusic,   "Mix_PlayMusic",   [ :pointer, :int       ], :int
    func  :FadeInMusic, "Mix_FadeInMusic", [ :pointer, :int, :int ], :int

    func  :FadeInMusicPos,     "Mix_FadeInMusicPos",
          [ :pointer, :int, :int, :double ], :int

    func  :FadeInChannelTimed, "Mix_FadeInChannelTimed",
          [ :int, :pointer, :int, :int, :int ], :int


    func  :Volume,      "Mix_Volume",      [ :int, :int     ], :int
    func  :VolumeChunk, "Mix_VolumeChunk", [ :pointer, :int ], :int
    func  :VolumeMusic, "Mix_VolumeMusic", [ :int           ], :int


    func  :HaltChannel,   "Mix_HaltChannel",   [ :int       ], :int
    func  :HaltGroup,     "Mix_HaltGroup",     [ :int       ], :int
    func  :HaltMusic,     "Mix_HaltMusic",     [            ], :int
    func  :ExpireChannel, "Mix_ExpireChannel", [ :int, :int ], :int


    func  :FadeOutChannel, "Mix_FadeOutChannel", [ :int, :int ], :int
    func  :FadeOutGroup,   "Mix_FadeOutGroup",   [ :int, :int ], :int
    func  :FadeOutMusic,   "Mix_FadeOutMusic",   [ :int       ], :int
    func  :FadingMusic,    "Mix_FadingMusic",    [            ], :int
    func  :FadingChannel,  "Mix_FadingChannel",  [ :int       ], :int


    func  :Pause,       "Mix_Pause",       [ :int ], :void
    func  :Resume,      "Mix_Resume",      [ :int ], :void
    func  :Paused,      "Mix_Paused",      [ :int ], :int
    func  :PauseMusic,  "Mix_PauseMusic",  [      ], :void
    func  :ResumeMusic, "Mix_ResumeMusic", [      ], :void
    func  :RewindMusic, "Mix_RewindMusic", [      ], :void
    func  :PausedMusic, "Mix_PausedMusic", [      ], :int

    func  :SetMusicPosition, "Mix_SetMusicPosition", [ :double ], :int

    func  :Playing,      "Mix_Playing",      [ :int ], :int
    func  :PlayingMusic, "Mix_PlayingMusic", [      ], :int


    func  :SetMusicCMD,  "Mix_SetMusicCMD",  [ :string ], :int


    func  :SetSynchroValue, "Mix_SetSynchroValue", [ :int ], :int
    func  :GetSynchroValue, "Mix_GetSynchroValue", [      ], :int


    func  :GetChunk, "Mix_GetChunk", [ :int ], NiceFFI::TypedPointer(Chunk)


    func  :CloseAudio, "Mix_CloseAudio", [ ], :void

  end
end
