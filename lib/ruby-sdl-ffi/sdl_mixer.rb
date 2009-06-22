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


require 'need'
need { 'sdl' }


module SDL
  module Mix
    extend NiceLibrary
    SDL.load_library("SDL_mixer", self)


    attach_function :Mix_Linked_Version, [  ], :pointer

    CHANNELS          = 8
    DEFAULT_FREQUENCY = 22050
    DEFAULT_CHANNELS  = 2
    MAX_VOLUME        = 128


    class Chunk < NiceStruct
      layout( :allocated, :int,
              :abuf,      :pointer,
              :alen,      :uint32,
              :volume,    :uint8 )
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


    attach_function :Mix_OpenAudio,     [ :int, :uint16, :int, :int    ], :int
    attach_function :Mix_AllocateChannels, [ :int ], :int
    attach_function :Mix_QuerySpec,     [ :pointer, :pointer, :pointer ], :int


    attach_function :Mix_LoadWAV_RW,    [ :pointer, :int    ], :pointer
    attach_function :Mix_LoadMUS,       [ :string           ], :pointer
    attach_function :Mix_LoadMUS_RW,    [ :pointer          ], :pointer
    attach_function :Mix_QuickLoad_WAV, [ :pointer          ], :pointer
    attach_function :Mix_QuickLoad_RAW, [ :pointer, :uint32 ], :pointer
    attach_function :Mix_FreeChunk,     [ :pointer          ], :void
    attach_function :Mix_FreeMusic,     [ :pointer          ], :void


    attach_function :Mix_GetMusicType,  [ :pointer ], :int


    attach_function :Mix_SetPostMix,
      [ callback( :setpostfix_cb, [ :pointer, :pointer, :int ], :void),
        :pointer ], :void

    attach_function :Mix_HookMusic,
      [ callback(:hookmusic_cb, [ :pointer, :pointer, :int ], :void),
        :pointer ], :void

    attach_function :Mix_HookMusicFinished,
      [ callback(:hookmusicfinished_cb, [  ], :void) ], :void

    attach_function :Mix_GetMusicHookData, [  ], :pointer

    attach_function :Mix_ChannelFinished,
      [ callback( :channelfinished_cb, [ :int ], :void) ], :void


    CHANNEL_POST = -2


    callback(:mix_effectfunc_cb, [ :int, :pointer, :int, :pointer ], :void)
    callback(:mix_effectdone_cb, [ :int, :pointer ], :void)
    attach_function :Mix_RegisterEffect,
                    [ :int, :mix_effectfunc_cb,
                      :mix_effectdone_cb, :pointer ], :int

    attach_function :Mix_UnregisterEffect, [ :int, :mix_effectfunc_cb ], :int
    attach_function :Mix_UnregisterAllEffects, [ :int ], :int


    EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"


    attach_function :Mix_SetPanning,       [ :int, :uint8, :uint8 ], :int
    attach_function :Mix_SetPosition,      [ :int, :int16, :uint8 ], :int
    attach_function :Mix_SetDistance,      [ :int, :uint8         ], :int
    attach_function :Mix_SetReverseStereo, [ :int, :int           ], :int


    attach_function :Mix_ReserveChannels,  [ :int                 ], :int
    attach_function :Mix_GroupChannel,     [ :int, :int           ], :int
    attach_function :Mix_GroupChannels,    [ :int, :int, :int     ], :int
    attach_function :Mix_GroupAvailable,   [ :int                 ], :int
    attach_function :Mix_GroupCount,       [ :int                 ], :int
    attach_function :Mix_GroupOldest,      [ :int                 ], :int
    attach_function :Mix_GroupNewer,       [ :int                 ], :int


    attach_function :Mix_PlayChannelTimed, [ :int, :pointer, :int, :int ], :int
    attach_function :Mix_PlayMusic,        [ :pointer, :int       ], :int


    attach_function :Mix_FadeInMusic,      [ :pointer, :int, :int ], :int
    attach_function :Mix_FadeInMusicPos,
                    [ :pointer, :int, :int, :double ], :int

    attach_function :Mix_FadeInChannelTimed,
                    [ :int, :pointer, :int, :int, :int ], :int


    attach_function :Mix_Volume,           [ :int, :int     ], :int
    attach_function :Mix_VolumeChunk,      [ :pointer, :int ], :int
    attach_function :Mix_VolumeMusic,      [ :int           ], :int


    attach_function :Mix_HaltChannel,      [ :int           ], :int
    attach_function :Mix_HaltGroup,        [ :int           ], :int
    attach_function :Mix_HaltMusic,        [                ], :int
    attach_function :Mix_ExpireChannel,    [ :int, :int     ], :int


    attach_function :Mix_FadeOutChannel,   [ :int, :int     ], :int
    attach_function :Mix_FadeOutGroup,     [ :int, :int     ], :int
    attach_function :Mix_FadeOutMusic,     [ :int           ], :int
    attach_function :Mix_FadingMusic,      [                ], :int
    attach_function :Mix_FadingChannel,    [ :int           ], :int


    attach_function :Mix_Pause,            [ :int           ], :void
    attach_function :Mix_Resume,           [ :int           ], :void
    attach_function :Mix_Paused,           [ :int           ], :int
    attach_function :Mix_PauseMusic,       [                ], :void
    attach_function :Mix_ResumeMusic,      [                ], :void
    attach_function :Mix_RewindMusic,      [                ], :void
    attach_function :Mix_PausedMusic,      [                ], :int
    attach_function :Mix_SetMusicPosition, [ :double        ], :int
    attach_function :Mix_Playing,          [ :int           ], :int
    attach_function :Mix_PlayingMusic,     [                ], :int


    attach_function :Mix_SetMusicCMD,      [ :string        ], :int
    attach_function :Mix_SetSynchroValue,  [ :int           ], :int


    attach_function :Mix_GetSynchroValue,  [                ], :int
    attach_function :Mix_GetChunk,         [ :int           ], :pointer


    attach_function :Mix_CloseAudio,       [                ], :void

  end
end
