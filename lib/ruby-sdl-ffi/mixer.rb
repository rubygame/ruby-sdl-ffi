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


    def self.mix_func( name, args, ret )
      func name, "Mix_#{name}", args, ret
    end


    mix_func  :Linked_Version, [], SDL::Version.typed_pointer


    CHANNELS          = 8
    DEFAULT_FREQUENCY = 22050
    DEFAULT_CHANNELS  = 2

    DEFAULT_FORMAT    = if( FFI::Platform::BYTE_ORDER ==
                            FFI::Platform::LITTLE_ENDIAN)
                          AUDIO_S16LSB
                        else
                          AUDIO_S16MSB
                        end

    MAX_VOLUME        = 128


    class Chunk < NiceFFI::Struct
      layout( :allocated, :int,
              :abuf,      :pointer,
              :alen,      :uint32,
              :volume,    :uint8 )
    end



    class Music < NiceFFI::OpaqueStruct
      #--
      # Mix_Music struct (in C) has a hidden layout, which changes
      # depending on which sound format libraries were available
      # at compile time.
      #++
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


    mix_func  :OpenAudio,        [ :int, :uint16, :int, :int    ], :int
    mix_func  :AllocateChannels, [ :int                         ], :int
    mix_func  :QuerySpec,        [ :pointer, :pointer, :pointer ], :int


    def self.LoadWAV( file )
      LoadWAV_RW( SDL.RWFromFile(file, "rb"), 1 )
    end

    mix_func  :LoadWAV_RW,    [ :pointer, :int    ], Chunk.typed_pointer
    mix_func  :LoadMUS,       [ :string           ], Music.typed_pointer
    mix_func  :LoadMUS_RW,    [ :pointer          ], Music.typed_pointer
    mix_func  :QuickLoad_WAV, [ :pointer          ], Chunk.typed_pointer
    mix_func  :QuickLoad_RAW, [ :pointer, :uint32 ], Chunk.typed_pointer


    mix_func  :FreeChunk,     [ :pointer ], :void
    mix_func  :FreeMusic,     [ :pointer ], :void


    mix_func  :GetMusicType,  [ :pointer ], :int


    callback( :mix_hook_cb, [:pointer, :pointer, :int], :void)

    mix_func  :SetPostMix,        [ :mix_hook_cb, :pointer  ], :void
    mix_func  :HookMusic,         [ :mix_hook_cb, :pointer  ], :void
    mix_func  :HookMusicFinished, [ callback([], :void)     ], :void
    mix_func  :GetMusicHookData,  [                         ], :pointer
    mix_func  :ChannelFinished,   [ callback([:int], :void) ], :void


    CHANNEL_POST = -2


    callback(:mix_effectfunc_cb, [ :int, :pointer, :int, :pointer ], :void)
    callback(:mix_effectdone_cb, [ :int, :pointer ], :void)

    mix_func  :RegisterEffect,
          [ :int, :mix_effectfunc_cb, :mix_effectdone_cb, :pointer ], :int

    mix_func  :UnregisterEffect,     [ :int, :mix_effectfunc_cb ], :int
    mix_func  :UnregisterAllEffects, [ :int ], :int


    EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"


    mix_func  :SetPanning,         [ :int, :uint8, :uint8 ], :int
    mix_func  :SetPosition,        [ :int, :int16, :uint8 ], :int
    mix_func  :SetDistance,        [ :int, :uint8         ], :int
    mix_func  :SetReverseStereo,   [ :int, :int           ], :int

               
    mix_func  :ReserveChannels,    [ :int                 ], :int
    mix_func  :GroupChannel,       [ :int, :int           ], :int
    mix_func  :GroupChannels,      [ :int, :int, :int     ], :int
    mix_func  :GroupAvailable,     [ :int                 ], :int
    mix_func  :GroupCount,         [ :int                 ], :int
    mix_func  :GroupOldest,        [ :int                 ], :int
    mix_func  :GroupNewer,         [ :int                 ], :int


    mix_func  :PlayChannelTimed,   [ :int, :pointer, :int, :int       ], :int
    mix_func  :PlayMusic,          [ :pointer, :int                   ], :int
    mix_func  :FadeInMusic,        [ :pointer, :int, :int             ], :int
    mix_func  :FadeInMusicPos,     [ :pointer, :int, :int, :double    ], :int
    mix_func  :FadeInChannelTimed, [ :int, :pointer, :int, :int, :int ], :int


    mix_func  :Volume,             [ :int, :int     ], :int
    mix_func  :VolumeChunk,        [ :pointer, :int ], :int
    mix_func  :VolumeMusic,        [ :int           ], :int


    mix_func  :HaltChannel,        [ :int           ], :int
    mix_func  :HaltGroup,          [ :int           ], :int
    mix_func  :HaltMusic,          [                ], :int
    mix_func  :ExpireChannel,      [ :int, :int     ], :int


    mix_func  :FadeOutChannel,     [ :int, :int     ], :int
    mix_func  :FadeOutGroup,       [ :int, :int     ], :int
    mix_func  :FadeOutMusic,       [ :int           ], :int
    mix_func  :FadingMusic,        [                ], :int
    mix_func  :FadingChannel,      [ :int           ], :int


    mix_func  :Pause,              [ :int           ], :void
    mix_func  :Resume,             [ :int           ], :void
    mix_func  :Paused,             [ :int           ], :int
    mix_func  :PauseMusic,         [                ], :void
    mix_func  :ResumeMusic,        [                ], :void
    mix_func  :RewindMusic,        [                ], :void
    mix_func  :PausedMusic,        [                ], :int


    mix_func  :SetMusicPosition,   [ :double ], :int
    mix_func  :Playing,            [ :int    ], :int
    mix_func  :PlayingMusic,       [         ], :int
    mix_func  :SetMusicCMD,        [ :string ], :int

    mix_func  :SetSynchroValue,    [ :int    ], :int
    mix_func  :GetSynchroValue,    [         ], :int

    mix_func  :GetChunk,           [ :int    ], Chunk.typed_pointer

    mix_func  :CloseAudio,         [         ], :void

  end
end
