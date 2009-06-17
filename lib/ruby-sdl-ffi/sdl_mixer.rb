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


require "ffi"

module SDL
  module Mix
    extend FFI::Library

    case FFI::Platform::OS
    when /linux/
      ffi_lib "libSDL_mixer.so"
    else
      raise( "SDL_mixer is not supported on #{FFI::Platform::OS} yet.\n" +
             "Please report this and help us support more platforms." )
    end

    class << self
      private 

      # A convenience method to create a method :Whatever which
      # attaches to the C function "Mix_Whatever".
      # 
      # This is so the final result is Mix::Whatever(), instead of
      # Mix::Mix_Whatever().
      # 
      def mix_function( sym, *rest )
        self.attach_function( sym, "Mix_#{sym}", *rest )
      end
    end


    attach_function :Mix_Linked_Version, [  ], :pointer

    CHANNELS          = 8
    DEFAULT_FREQUENCY = 22050
    DEFAULT_CHANNELS  = 2
    MAX_VOLUME        = 128

    class MixChunk < FFI::Struct
      layout(
             :allocated, :int,
             :abuf,      :pointer,
             :alen,      :uint32,
             :volume,    :uint8
             )
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

    mix_function :OpenAudio, [ :int, :uint16, :int, :int ], :int
    mix_function :AllocateChannels, [ :int ], :int
    mix_function :QuerySpec, [ :pointer, :pointer, :pointer ], :int
    mix_function :LoadWAV_RW, [ :pointer, :int ], :pointer
    mix_function :LoadMUS, [ :string ], :pointer
    mix_function :LoadMUS_RW, [ :pointer ], :pointer
    mix_function :QuickLoad_WAV, [ :pointer ], :pointer
    mix_function :QuickLoad_RAW, [ :pointer, :uint32 ], :pointer
    mix_function :FreeChunk, [ :pointer ], :void
    mix_function :FreeMusic, [ :pointer ], :void
    mix_function :GetMusicType, [ :pointer ], :int
    mix_function :SetPostMix, [ callback( :setpostfix_cb, [ :pointer, :pointer, :int ], :void), :pointer ], :void
    mix_function :HookMusic, [ callback(:hookmusic_cb, [ :pointer, :pointer, :int ], :void), :pointer ], :void
    mix_function :HookMusicFinished, [ callback(:hookmusicfinished_cb, [  ], :void) ], :void
    mix_function :GetMusicHookData, [  ], :pointer
    mix_function :ChannelFinished, [ callback( :channelfinished_cb, [ :int ], :void) ], :void

    CHANNEL_POST = -2

    callback(:mix_effectfunc_cb, [ :int, :pointer, :int, :pointer ], :void)
    callback(:mix_effectdone_cb, [ :int, :pointer ], :void)
    mix_function :RegisterEffect, [ :int, :mix_effectfunc_cb, :mix_effectdone_cb, :pointer ], :int
    mix_function :UnregisterEffect, [ :int, :mix_effectfunc_cb ], :int
    mix_function :UnregisterAllEffects, [ :int ], :int

    EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"

    mix_function :SetPanning, [ :int, :uint8, :uint8 ], :int
    mix_function :SetPosition, [ :int, :int16, :uint8 ], :int
    mix_function :SetDistance, [ :int, :uint8 ], :int
    mix_function :SetReverseStereo, [ :int, :int ], :int
    mix_function :ReserveChannels, [ :int ], :int
    mix_function :GroupChannel, [ :int, :int ], :int
    mix_function :GroupChannels, [ :int, :int, :int ], :int
    mix_function :GroupAvailable, [ :int ], :int
    mix_function :GroupCount, [ :int ], :int
    mix_function :GroupOldest, [ :int ], :int
    mix_function :GroupNewer, [ :int ], :int
    mix_function :PlayChannelTimed, [ :int, :pointer, :int, :int ], :int
    mix_function :PlayMusic, [ :pointer, :int ], :int
    mix_function :FadeInMusic, [ :pointer, :int, :int ], :int
    mix_function :FadeInMusicPos, [ :pointer, :int, :int, :double ], :int
    mix_function :FadeInChannelTimed, [ :int, :pointer, :int, :int, :int ], :int
    mix_function :Volume, [ :int, :int ], :int
    mix_function :VolumeChunk, [ :pointer, :int ], :int
    mix_function :VolumeMusic, [ :int ], :int
    mix_function :HaltChannel, [ :int ], :int
    mix_function :HaltGroup, [ :int ], :int
    mix_function :HaltMusic, [  ], :int
    mix_function :ExpireChannel, [ :int, :int ], :int
    mix_function :FadeOutChannel, [ :int, :int ], :int
    mix_function :FadeOutGroup, [ :int, :int ], :int
    mix_function :FadeOutMusic, [ :int ], :int
    mix_function :FadingMusic, [  ], :int
    mix_function :FadingChannel, [ :int ], :int
    mix_function :Pause, [ :int ], :void
    mix_function :Resume, [ :int ], :void
    mix_function :Paused, [ :int ], :int
    mix_function :PauseMusic, [  ], :void
    mix_function :ResumeMusic, [  ], :void
    mix_function :RewindMusic, [  ], :void
    mix_function :PausedMusic, [  ], :int
    mix_function :SetMusicPosition, [ :double ], :int
    mix_function :Playing, [ :int ], :int
    mix_function :PlayingMusic, [  ], :int
    mix_function :SetMusicCMD, [ :string ], :int
    mix_function :SetSynchroValue, [ :int ], :int
    mix_function :GetSynchroValue, [  ], :int
    mix_function :GetChunk, [ :int ], :pointer
    mix_function :CloseAudio, [  ], :void

  end
end
