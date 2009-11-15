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

  SWSURFACE     = 0x00000000
  SRCALPHA      = 0x00010000
  SRCCOLORKEY   = 0x00020000
  ANYFORMAT     = 0x00100000
  HWPALETTE     = 0x00200000
  DOUBLEBUF     = 0x00400000
  FULLSCREEN    = 0x00800000
  RESIZABLE     = 0x01000000
  NOFRAME       = 0x02000000
  OPENGL        = 0x04000000
  HWSURFACE     = 0x08000001
  ASYNCBLIT     = 0x08000000
  RLEACCELOK    = 0x08000000
  HWACCEL       = 0x08000000

  APPMOUSEFOCUS = 0x01
  APPINPUTFOCUS = 0x02
  APPACTIVE     = 0x04
  LOGPAL        = 0x01
  PHYSPAL       = 0x02

  BUTTON_WHEELUP   = 4
  BUTTON_WHEELDOWN = 5

  DEFAULT_REPEAT_DELAY    = 500
  DEFAULT_REPEAT_INTERVAL = 30

  YV12_OVERLAY = 0x32315659
  IYUV_OVERLAY = 0x56555949
  YUY2_OVERLAY = 0x32595559
  UYVY_OVERLAY = 0x59565955
  YVYU_OVERLAY = 0x55595659

  GRAB_QUERY = -1
  GRAB_OFF   = 0
  GRAB_ON    = 1

  K_0 = char("0")
  K_1 = char("1")
  K_2 = char("2")
  K_3 = char("3")
  K_4 = char("4")
  K_5 = char("5")
  K_6 = char("6")
  K_7 = char("7")
  K_8 = char("8")
  K_9 = char("9")
  K_a = char("a")
  K_b = char("b")
  K_c = char("c")
  K_d = char("d")
  K_e = char("e")
  K_f = char("f")
  K_g = char("g")
  K_h = char("h")
  K_i = char("i")
  K_j = char("j")
  K_k = char("k")
  K_l = char("l")
  K_m = char("m")
  K_n = char("n")
  K_o = char("o")
  K_p = char("p")
  K_q = char("q")
  K_r = char("r")
  K_s = char("s")
  K_t = char("t")
  K_u = char("u")
  K_v = char("v")
  K_w = char("w")
  K_x = char("x")
  K_y = char("y")
  K_z = char("z")

  K_QUOTE      = char("'")
  K_MINUS      = char("-")
  K_BACKQUOTE  = char("`")
  K_EXCLAIM    = char("!")
  K_QUOTEDBL   = char("\"")
  K_HASH       = char("\#")
  K_DOLLAR     = char("$")
  K_AMPERSAND  = char("&")
  K_LEFTPAREN  = char("(")
  K_RIGHTPAREN = char(")")
  K_ASTERISK   = char("*")
  K_PLUS       = char("+")
  K_COLON      = char(":")
  K_LESS       = char("<")
  K_GREATER    = char(">")
  K_QUESTION   = char("?")
  K_AT         = char("@")
  K_CARET      = char("^")
  K_UNDERSCORE = char("_")

  K_KP0 = K_KP_0
  K_KP1 = K_KP_1
  K_KP2 = K_KP_2
  K_KP3 = K_KP_3
  K_KP4 = K_KP_4
  K_KP5 = K_KP_5
  K_KP6 = K_KP_6
  K_KP7 = K_KP_7
  K_KP8 = K_KP_8
  K_KP9 = K_KP_9

  K_NUMLOCK   = K_NUMLOCKCLEAR
  K_SCROLLOCK = K_SCROLLLOCK
  K_PRINT     = K_PRINTSCREEN

  KMOD_LMETA = KMOD_LGUI
  KMOD_RMETA = KMOD_RGUI
  KMOD_META  = KMOD_GUI

  # K_LSUPER  = K_LMETA
  # K_RSUPER  = K_RMETA
  K_COMPOSE = K_APPLICATION
  K_BREAK   = K_STOP
  K_EURO    = K_2


  class VideoInfo < NiceFFI::Struct

    layout( :hw_available, :uint32,
            :wm_available, :uint32,
            :UnusedBits1,  :uint32,
            :UnusedBits2,  :uint32,
            :blit_hw,      :uint32,
            :blit_hw_CC,   :uint32,
            :blit_hw_A,    :uint32,
            :blit_sw,      :uint32,
            :blit_sw_CC,   :uint32,
            :blit_sw_A,    :uint32,
            :blit_fill,    :uint32,
            :UnusedBits3,  :uint32,
            :video_mem,    :uint32,
            :vfmt,         :pointer,
            :current_w,    :int,
            :current_h,    :int )

    hidden :UnusedBits1, :UnusedBits2, :UnusedBits3

  end


  class Overlay < NiceFFI::Struct

    layout( :format,     :uint32,
            :w,          :int,
            :h,          :int,
            :planes,     :int,
            :pitches,    :pointer,
            :pixels,     :pointer,
            :hwfuncs,    :pointer,
            :hwdata,     :pointer,
            :hw_overlay, :uint32,
            :UnusedBits, :uint32 )

    hidden :UnusedBits

  end


  sdl_func :Linked_Version,  [], :pointer

  sdl_func :AudioDriverName, [ :string, :int ], :string
  sdl_func :VideoDriverName, [ :string, :int ], :string

  sdl_func :GetVideoInfo,    [                           ], :pointer
  sdl_func :VideoModeOK,     [ :int, :int, :int, :uint32 ], :int
  sdl_func :ListModes,       [ :pointer, :uint32         ], :pointer
  sdl_func :SetVideoMode,    [ :int, :int, :int, :uint32 ], :pointer
  sdl_func :GetVideoSurface, [                           ], :pointer

  sdl_func :UpdateRects, [ :pointer, :int, :pointer                   ], :void
  sdl_func :UpdateRect,  [ :pointer, :int32, :int32, :uint32, :uint32 ], :void
  sdl_func :Flip,        [ :pointer                                   ], :int

  sdl_func :SetAlpha,           [ :pointer, :uint32, :uint8 ], :int
  sdl_func :DisplayFormat,      [ :pointer                  ], :pointer
  sdl_func :DisplayFormatAlpha, [ :pointer                  ], :pointer

  sdl_func :WM_SetCaption,       [ :string, :string   ], :void
  sdl_func :WM_GetCaption,       [ :pointer, :pointer ], :void
  sdl_func :WM_SetIcon,          [ :pointer, :pointer ], :void
  sdl_func :WM_IconifyWindow,    [                    ], :int
  sdl_func :WM_ToggleFullScreen, [ :pointer           ], :int
  sdl_func :WM_GrabInput,        [ :int               ], :int

  sdl_func :SetPalette, [ :pointer, :int, :pointer, :int, :int ], :int
  sdl_func :SetColors,  [ :pointer, :pointer, :int, :int       ], :int

  sdl_func :GetWMInfo,   [ :pointer ], :int
  sdl_func :GetAppState, [          ], :uint8

  sdl_func :WarpMouse, [ :uint16, :uint16 ], :void

  sdl_func :CreateYUVOverlay,  [ :int, :int, :uint32, :pointer ], :pointer
  sdl_func :LockYUVOverlay,    [ :pointer                      ], :int
  sdl_func :UnlockYUVOverlay,  [ :pointer                      ], :void
  sdl_func :DisplayYUVOverlay, [ :pointer, :pointer            ], :int
  sdl_func :FreeYUVOverlay,    [ :pointer                      ], :void

  sdl_func :GL_SwapBuffers, [], :void

  sdl_func :EnableKeyRepeat, [ :int, :int         ], :int
  sdl_func :GetKeyRepeat,    [ :pointer, :pointer ], :void

  sdl_func :EnableUNICODE, [ :int ], :int

end
