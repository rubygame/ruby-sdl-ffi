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
  module Raw

    ALPHA_OPAQUE      = 255
    ALPHA_TRANSPARENT = 0

    class Rect < FFI::Struct
      layout(
             :x, :int16,
             :y, :int16,
             :w, :uint16,
             :h, :uint16
      )
    end

    class Color < FFI::Struct
      layout(
             :r,      :uint8,
             :g,      :uint8,
             :b,      :uint8,
             :unused, :uint8
      )
    end

    class Palette < FFI::Struct
      layout(
             :ncolors, :int,
             :colors,  :pointer
      )
    end

    class PixelFormat < FFI::Struct
      layout(
             :palette,       :pointer,
             :BitsPerPixel,  :uint8,
             :BytesPerPixel, :uint8,
             :Rloss,         :uint8,
             :Gloss,         :uint8,
             :Bloss,         :uint8,
             :Aloss,         :uint8,
             :Rshift,        :uint8,
             :Gshift,        :uint8,
             :Bshift,        :uint8,
             :Ashift,        :uint8,
             :Rmask,         :uint32,
             :Gmask,         :uint32,
             :Bmask,         :uint32,
             :Amask,         :uint32,
             :colorkey,      :uint32,
             :alpha,         :uint8
      )
    end

    class Surface < FFI::Struct
      layout(
             :flags,          :uint32,
             :format,         :pointer,
             :w,              :int,
             :h,              :int,
             :pitch,          :uint16,
             :pixels,         :pointer,
             :offset,         :int,
             :hwdata,         :pointer,
             :clip_rect,      SDL::Raw::Rect,
             :unused1,        :uint32,
             :locked,         :uint32,
             :map,            :pointer,
             :format_version, :uint,
             :refcount,       :int
      )
    end

    SWSURFACE   = 0x00000000
    HWSURFACE   = 0x00000001
    ASYNCBLIT   = 0x00000004
    ANYFORMAT   = 0x10000000
    HWPALETTE   = 0x20000000
    DOUBLEBUF   = 0x40000000
    FULLSCREEN  = 0x80000000
    OPENGL      = 0x00000002
    OPENGLBLIT  = 0x0000000A
    RESIZABLE   = 0x00000010
    NOFRAME     = 0x00000020
    HWACCEL     = 0x00000100
    SRCCOLORKEY = 0x00001000
    RLEACCELOK  = 0x00002000
    RLEACCEL    = 0x00004000
    SRCALPHA    = 0x00010000
    PREALLOC    = 0x01000000

    callback(:blit_cb, [ :pointer, :pointer, :pointer, :pointer ], :int)

    class VideoInfo < FFI::Struct
      layout(
             :hw_available,  :uint32,
             :wm_available,  :uint32,
             :UnusedBits1,   :uint32,
             :UnusedBits2,   :uint32,
             :blit_hw,       :uint32,
             :blit_hw_CC,    :uint32,
             :blit_hw_A,     :uint32,
             :blit_sw,       :uint32,
             :blit_sw_CC,    :uint32,
             :blit_sw_A,     :uint32,
             :blit_fill,     :uint32,
             :UnusedBits3,   :uint32,
             :video_mem,     :uint32,
             :vfmt,          :pointer,
             :current_w,     :int,
             :current_h,     :int
      )
    end

    YV12_OVERLAY = 0x32315659
    IYUV_OVERLAY = 0x56555949
    YUY2_OVERLAY = 0x32595559
    UYVY_OVERLAY = 0x59565955
    YVYU_OVERLAY = 0x55595659

    class Overlay < FFI::Struct
      layout(
             :format,     :uint32,
             :w,          :int,
             :h,          :int,
             :planes,     :int,
             :pitches,    :pointer,
             :pixels,     :pointer,
             :hwfuncs,    :pointer,
             :hwdata,     :pointer,
             :hw_overlay, :uint32,
             :UnusedBits, :uint32
      )
    end

    GL_RED_SIZE           = 0
    GL_GREEN_SIZE         = 1
    GL_BLUE_SIZE          = 2
    GL_ALPHA_SIZE         = 3
    GL_BUFFER_SIZE        = 4
    GL_DOUBLEBUFFER       = 5
    GL_DEPTH_SIZE         = 6
    GL_STENCIL_SIZE       = 7
    GL_ACCUM_RED_SIZE     = 8
    GL_ACCUM_GREEN_SIZE   = 9
    GL_ACCUM_BLUE_SIZE    = 10
    GL_ACCUM_ALPHA_SIZE   = 11
    GL_STEREO             = 12
    GL_MULTISAMPLEBUFFERS = 13
    GL_MULTISAMPLESAMPLES = 14
    GL_ACCELERATED_VISUAL = 15
    GL_SWAP_CONTROL       = 16

    LOGPAL  = 0x01
    PHYSPAL = 0x02

    attach_sdl_function :VideoInit, [ :string, :uint32 ], :int
    attach_sdl_function :VideoQuit, [  ], :void
    attach_sdl_function :VideoDriverName, [ :string, :int ], :string
    attach_sdl_function :GetVideoSurface, [  ], :pointer
    attach_sdl_function :GetVideoInfo, [  ], :pointer
    attach_sdl_function :VideoModeOK, [ :int, :int, :int, :uint32 ], :int
    attach_sdl_function :ListModes, [ :pointer, :uint32 ], :pointer
    attach_sdl_function :SetVideoMode, [ :int, :int, :int, :uint32 ], :pointer
    attach_sdl_function :UpdateRects, [ :pointer, :int, :pointer ], :void
    attach_sdl_function :UpdateRect, [ :pointer, :int32, :int32, :uint32, :uint32 ], :void
    attach_sdl_function :Flip, [ :pointer ], :int
    attach_sdl_function :SetGamma, [ :float, :float, :float ], :int
    attach_sdl_function :SetGammaRamp, [ :pointer, :pointer, :pointer ], :int
    attach_sdl_function :GetGammaRamp, [ :pointer, :pointer, :pointer ], :int
    attach_sdl_function :SetColors, [ :pointer, :pointer, :int, :int ], :int
    attach_sdl_function :SetPalette, [ :pointer, :int, :pointer, :int, :int ], :int
    attach_sdl_function :MapRGB, [ :pointer, :uint8, :uint8, :uint8 ], :pointer
    attach_sdl_function :MapRGBA, [ :pointer, :uint8, :uint8, :uint8, :uint8 ], :pointer
    attach_sdl_function :GetRGB, [ :uint32, :pointer, :pointer, :pointer, :pointer ], :void
    attach_sdl_function :GetRGBA, [ :uint32, :pointer, :pointer, :pointer, :pointer, :pointer ], :void
    attach_sdl_function :CreateRGBSurface, [ :uint32, :int, :int, :int, :uint32, :uint32, :uint32, :uint32 ], :pointer
    attach_sdl_function :CreateRGBSurfaceFrom, [ :pointer, :int, :int, :int, :int, :uint32, :uint32, :uint32, :uint32 ], :pointer
    attach_sdl_function :FreeSurface, [ :pointer ], :void
    attach_sdl_function :LockSurface, [ :pointer ], :int
    attach_sdl_function :UnlockSurface, [ :pointer ], :void
    attach_sdl_function :LoadBMP_RW, [ :pointer, :int ], :pointer
    attach_sdl_function :SaveBMP_RW, [ :pointer, :pointer, :int ], :int
    attach_sdl_function :SetColorKey, [ :pointer, :uint32, :uint32 ], :int
    attach_sdl_function :SetAlpha, [ :pointer, :uint32, :uint8 ], :int
    attach_sdl_function :SetClipRect, [ :pointer, :pointer ], SDL::Raw::BOOL
    attach_sdl_function :GetClipRect, [ :pointer, :pointer ], :void
    attach_sdl_function :ConvertSurface, [ :pointer, :pointer, :uint32 ], :pointer
    attach_sdl_function :UpperBlit, [ :pointer, :pointer, :pointer, :pointer ], :int
    attach_sdl_function :LowerBlit, [ :pointer, :pointer, :pointer, :pointer ], :int
    attach_sdl_function :FillRect, [ :pointer, :pointer, :uint32 ], :int
    attach_sdl_function :DisplayFormat, [ :pointer ], :pointer
    attach_sdl_function :DisplayFormatAlpha, [ :pointer ], :pointer
    attach_sdl_function :CreateYUVOverlay, [ :int, :int, :uint32, :pointer ], :pointer
    attach_sdl_function :LockYUVOverlay, [ :pointer ], :int
    attach_sdl_function :UnlockYUVOverlay, [ :pointer ], :void
    attach_sdl_function :DisplayYUVOverlay, [ :pointer, :pointer ], :int
    attach_sdl_function :FreeYUVOverlay, [ :pointer ], :void
    attach_sdl_function :GL_LoadLibrary, [ :string ], :int
    attach_sdl_function :GL_GetProcAddress, [ :string ], :pointer
    attach_sdl_function :GL_SetAttribute, [ SDL::Raw::GLATTR, :int ], :int
    attach_sdl_function :GL_GetAttribute, [ SDL::Raw::GLATTR, :pointer ], :int
    attach_sdl_function :GL_SwapBuffers, [  ], :void
    attach_sdl_function :GL_UpdateRects, [ :int, :pointer ], :void
    attach_sdl_function :GL_Lock, [  ], :void
    attach_sdl_function :GL_Unlock, [  ], :void
    attach_sdl_function :WM_SetCaption, [ :string, :string ], :void
    attach_sdl_function :WM_GetCaption, [ :pointer, :pointer ], :void
    attach_sdl_function :WM_SetIcon, [ :pointer, :pointer ], :void
    attach_sdl_function :WM_IconifyWindow, [  ], :int
    attach_sdl_function :WM_ToggleFullScreen, [ :pointer ], :int

    GRAB_QUERY      = -1
    GRAB_OFF        = 0
    GRAB_ON         = 1
    GRAB_FULLSCREEN = 2

    attach_sdl_function :WM_GrabInput, [ SDL::Raw::ENUM ], SDL::Raw::ENUM
    attach_sdl_function :SoftStretch, [ :pointer, :pointer, :pointer, :pointer ], :int

  end
end
