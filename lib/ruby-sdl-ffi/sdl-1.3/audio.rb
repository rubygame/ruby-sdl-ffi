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

  AUDIO_MASK_BITSIZE  = 0xFF
  AUDIO_MASK_DATATYPE = 1 << 8
  AUDIO_MASK_ENDIAN   = 1 << 12
  AUDIO_MASK_SIGNED   = 1 << 15

  AUDIO_U8     = 0x0008
  AUDIO_S8     = 0x8008
  AUDIO_U16LSB = 0x0010
  AUDIO_S16LSB = 0x8010
  AUDIO_U16MSB = 0x1010
  AUDIO_S16MSB = 0x9010
  AUDIO_U16    = 0x0010
  AUDIO_S16    = 0x8010
  AUDIO_S32LSB = 0x8020
  AUDIO_S32MSB = 0x9020
  AUDIO_S32    = 0x8020
  AUDIO_F32LSB = 0x8120
  AUDIO_F32MSB = 0x9120
  AUDIO_F32    = 0x8120

  if FFI::Platform::BYTE_ORDER == FFI::Platform::LITTLE_ENDIAN
    AUDIO_U16SYS = AUDIO_U16LSB
    AUDIO_S16SYS = AUDIO_S16LSB
    AUDIO_S32SYS = AUDIO_S32LSB
    AUDIO_F32SYS = AUDIO_F32LSB
  else
    AUDIO_U16SYS = AUDIO_U16MSB
    AUDIO_S16SYS = AUDIO_U16MSB
    AUDIO_S32SYS = AUDIO_S32MSB
    AUDIO_F32SYS = AUDIO_F32MSB
  end

  AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001
  AUDIO_ALLOW_FORMAT_CHANGE    = 0x00000002
  AUDIO_ALLOW_CHANNELS_CHANGE  = 0x00000004

  AUDIO_ALLOW_ANY_CHANGE =
    AUDIO_ALLOW_FREQUENCY_CHANGE |
    AUDIO_ALLOW_FORMAT_CHANGE    |
    AUDIO_ALLOW_CHANNELS_CHANGE

  AUDIO_STOPPED = 0
  AUDIO_PLAYING = 1
  AUDIO_PAUSED  = 2

  MIX_MAXVOLUME = 128


  class AudioSpec < NiceFFI::Struct
    layout( :freq,     :int,
            :format,   :uint16,
            :channels, :uint8,
            :silence,  :uint8,
            :samples,  :uint16,
            :padding,  :uint16,
            :size,     :uint32,
            :callback, callback( [:pointer, :pointer, :int], :void),
            :userdata, :pointer )

    def callback=(cb)
      @callback = cb
      self[:callback] = @callback
    end
    def callback
      @callback
    end
  end


  callback( :SDL_AudioFilter, [:pointer, :uint16], :void )

  class AudioCVT < NiceFFI::Struct
    layout( :needed,       :int,
            :src_format,   :uint16,
            :dst_format,   :uint16,
            :rate_incr,    :double,
            :buf,          :pointer,
            :len,          :int,
            :len_cvt,      :int,
            :len_mult,     :int,
            :len_ratio,    :double,
            :filters,      [:SDL_AudioFilter, 10],
            :filter_index, :int )
  end


  sdl_func :GetNumAudioDrivers, [      ], :int
  sdl_func :GetAudioDriver,     [ :int ], :string

  sdl_func :AudioInit, [ :string ], :int
  sdl_func :AudioQuit, [         ], :void

  sdl_func :GetCurrentAudioDriver, [], :string

  sdl_func :OpenAudio, [ :pointer, :pointer ], :int

  sdl_func :GetNumAudioDevices, [ :int       ], :int
  sdl_func :GetAudioDeviceName, [ :int, :int ], :string

  sdl_func :OpenAudioDevice, [ :string, :int, :pointer,
                               :pointer, :int ], :uint32

  sdl_func :GetAudioStatus,       [         ], :int
  sdl_func :GetAudioDeviceStatus, [ :uint32 ], :int

  sdl_func :PauseAudio,       [ :int          ], :void
  sdl_func :PauseAudioDevice, [ :uint32, :int ], :void

  sdl_func :LoadWAV_RW, [ :pointer, :int, :pointer,
                          :pointer, :pointer ], :pointer

  sdl_func :FreeWAV, [ :pointer ], :void

  sdl_func :BuildAudioCVT, [ :pointer, :uint16, :uint8,
                             :int, :uint16, :uint8, :int ], :int

  sdl_func :ConvertAudio, [ :pointer ], :int


  sdl_func :MixAudio, [ :pointer, :pointer, :uint32, :int ], :void

  sdl_func :MixAudioFormat, [ :pointer, :pointer,
                              :uint16, :uint32, :int ], :void

  sdl_func :LockAudio,         [         ], :void
  sdl_func :LockAudioDevice,   [ :uint32 ], :void
  sdl_func :UnlockAudio,       [         ], :void
  sdl_func :UnlockAudioDevice, [ :uint32 ], :void

  sdl_func :CloseAudio,           [         ], :void
  sdl_func :CloseAudioDevice,     [ :uint32 ], :void

  optional {
    sdl_func :AudioDeviceConnected, [ :uint32 ], :int
  }

end
