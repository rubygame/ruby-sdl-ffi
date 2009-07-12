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

  class AudioSpec < NiceFFI::Struct

    SDL::callback(:audiospec_cb, [ :pointer, :pointer, :int ], :void)

    layout( :freq,     :int,
            :format,   :uint16,
            :channels, :uint8,
            :silence,  :uint8,
            :samples,  :uint16,
            :padding,  :uint16,
            :size,     :uint32,
            :callback, :audiospec_cb,
            :userdata, :pointer )

    def callback=(cb)
      @callback = cb
      self[:callback] = @callback
    end

    def callback
      @callback
    end

  end


  AUDIO_U8     = 0x0008
  AUDIO_S8     = 0x8008
  AUDIO_U16LSB = 0x0010
  AUDIO_S16LSB = 0x8010
  AUDIO_U16MSB = 0x1010
  AUDIO_S16MSB = 0x9010
  AUDIO_U16    = 0x0010
  AUDIO_S16    = 0x8010
  AUDIO_U16SYS = 0x0010
  AUDIO_S16SYS = 0x8010


#     callback( :filters_cb, [ :pointer, :uint16 ], :void)

#     class AudioCVT < NiceFFI::Struct
#       layout( :needed,       :int,
#               :src_format,   :uint16,
#               :dst_format,   :uint16,
#               :rate_incr,    :double,
#               :buf,          :pointer,
#               :len,          :int,
#               :len_cvt,      :int,
#               :len_mult,     :int,
#               :len_ratio,    :double,
#               :filters,      [:filters_cb, 10],
#               :filter_index, :int )
#     end


  attach_function  :SDL_AudioInit,       [ :string            ], :int
  attach_function  :SDL_AudioQuit,       [                    ], :void
  attach_function  :SDL_AudioDriverName, [ :string, :int      ], :string
  attach_function  :SDL_OpenAudio,       [ :pointer, :pointer ], :int


  AUDIO_STOPPED = 0
  AUDIO_PLAYING = 1
  AUDIO_PAUSED  = 2

  attach_function  :SDL_GetAudioStatus, [      ], SDL::ENUM
  attach_function  :SDL_PauseAudio,     [ :int ], :void


  attach_function  :SDL_LoadWAV_RW,
                   [ :pointer, :int, :pointer, 
                     :pointer, :pointer ], :pointer

  attach_function  :SDL_FreeWAV, [ :pointer ], :void


  attach_function  :SDL_BuildAudioCVT,
                   [ :pointer, :uint16, :uint8,
                     :int, :uint16, :uint8, :int ], :int

  attach_function  :SDL_ConvertAudio, [ :pointer ], :int


  MIX_MAXVOLUME = 128

  attach_function  :SDL_MixAudio,
                   [ :pointer, :pointer, :uint32, :int ], :void


  attach_function  :SDL_LockAudio,   [  ], :void
  attach_function  :SDL_UnlockAudio, [  ], :void
  attach_function  :SDL_CloseAudio,  [  ], :void

end
