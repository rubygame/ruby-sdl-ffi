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

  class DisplayMode < NiceFFI::Struct
    layout( :format,       :uint32,
            :w,            :int,
            :h,            :int,
            :refresh_rate, :int,
            :driverdata,   :pointer )
  end

  WINDOW_FULLSCREEN    = 0x00000001
  WINDOW_OPENGL        = 0x00000002
  WINDOW_SHOWN         = 0x00000004
  WINDOW_BORDERLESS    = 0x00000008
  WINDOW_RESIZABLE     = 0x00000010
  WINDOW_MINIMIZED     = 0x00000020
  WINDOW_MAXIMIZED     = 0x00000040
  WINDOW_INPUT_GRABBED = 0x00000100
  WINDOW_INPUT_FOCUS   = 0x00000200
  WINDOW_MOUSE_FOCUS   = 0x00000400
  WINDOW_FOREIGN       = 0x00000800

  WINDOWPOS_UNDEFINED  = 0x7FFFFFF
  WINDOWPOS_CENTERED   = 0x7FFFFFE

  WINDOWEVENT_NONE         = 0
  WINDOWEVENT_SHOWN        = 1
  WINDOWEVENT_HIDDEN       = 2
  WINDOWEVENT_EXPOSED      = 3
  WINDOWEVENT_MOVED        = 4
  WINDOWEVENT_RESIZED      = 5
  WINDOWEVENT_MINIMIZED    = 6
  WINDOWEVENT_MAXIMIZED    = 7
  WINDOWEVENT_RESTORED     = 8
  WINDOWEVENT_ENTER        = 9
  WINDOWEVENT_LEAVE        = 10
  WINDOWEVENT_FOCUS_GAINED = 11
  WINDOWEVENT_FOCUS_LOST   = 12
  WINDOWEVENT_CLOSE        = 13

  RENDERER_SINGLEBUFFER   = 0x00000001
  RENDERER_PRESENTCOPY    = 0x00000002
  RENDERER_PRESENTFLIP2   = 0x00000004
  RENDERER_PRESENTFLIP3   = 0x00000008
  RENDERER_PRESENTDISCARD = 0x00000010
  RENDERER_PRESENTVSYNC   = 0x00000020
  RENDERER_ACCELERATED    = 0x00000040

  class RendererInfo < NiceFFI::Struct
    layout( :name,                :pointer,
            :flags,               :uint32,
            :mod_modes,           :uint32,
            :blend_modes,         :uint32,
            :scale_modes,         :uint32,
            :num_texture_formats, :uint32,
            :texture_formats,     [:uint32, 20],
            :max_texture_width,   :int,
            :max_texture_height,  :int )

    def name=(str)
      @name = FFI::MemoryPointer.from_string(str)
      self[:name] = @name
    end

    def name
      @name.get_string(0)
    end
  end


  TEXTUREACCESS_STATIC    = 0
  TEXTUREACCESS_STREAMING = 1

  TEXTUREMODULATE_NONE  = 0x00000000
  TEXTUREMODULATE_COLOR = 0x00000001
  TEXTUREMODULATE_ALPHA = 0x00000002

  BLENDMODE_NONE  = 0x00000000
  BLENDMODE_MASK  = 0x00000001
  BLENDMODE_BLEND = 0x00000002
  BLENDMODE_ADD   = 0x00000004
  BLENDMODE_MOD   = 0x00000008

  TEXTURESCALEMODE_NONE = 0x00000000
  TEXTURESCALEMODE_FAST = 0x00000001
  TEXTURESCALEMODE_SLOW = 0x00000002
  TEXTURESCALEMODE_BEST = 0x00000004

  GL_RED_SIZE              = 0
  GL_GREEN_SIZE            = 1
  GL_BLUE_SIZE             = 2
  GL_ALPHA_SIZE            = 3
  GL_BUFFER_SIZE           = 4
  GL_DOUBLEBUFFER          = 5
  GL_DEPTH_SIZE            = 6
  GL_STENCIL_SIZE          = 7
  GL_ACCUM_RED_SIZE        = 8
  GL_ACCUM_GREEN_SIZE      = 9
  GL_ACCUM_BLUE_SIZE       = 10
  GL_ACCUM_ALPHA_SIZE      = 11
  GL_STEREO                = 12
  GL_MULTISAMPLEBUFFERS    = 13
  GL_MULTISAMPLESAMPLES    = 14
  GL_ACCELERATED_VISUAL    = 15
  GL_RETAINED_BACKING      = 16
  GL_CONTEXT_MAJOR_VERSION = 17
  GL_CONTEXT_MINOR_VERSION = 18

  sdl_func :GetNumVideoDrivers, [      ], :int
  sdl_func :GetVideoDriver,     [ :int ], :string

  sdl_func :VideoInit, [ :string, :uint32 ], :int
  sdl_func :VideoQuit, [                  ], :void

  sdl_func :GetCurrentVideoDriver,  [      ], :string
  sdl_func :GetNumVideoDisplays,    [      ], :int
  sdl_func :SelectVideoDisplay,     [ :int ], :int
  sdl_func :GetCurrentVideoDisplay, [      ], :int

  sdl_func :GetNumDisplayModes,    [                ], :int
  sdl_func :GetDisplayMode,        [ :int, :pointer ], :int
  sdl_func :GetDesktopDisplayMode, [ :pointer       ], :int

  sdl_func :GetCurrentDisplayMode, [ :pointer           ], :int
  sdl_func :GetClosestDisplayMode, [ :pointer, :pointer ], :pointer

  sdl_func :SetFullscreenDisplayMode, [ :pointer ], :int
  sdl_func :GetFullscreenDisplayMode, [ :pointer ], :int

  sdl_func :SetDisplayPalette, [ :pointer, :int, :int ], :int
  sdl_func :GetDisplayPalette, [ :pointer, :int, :int ], :int

  sdl_func :SetGamma,     [ :float, :float, :float       ], :int
  sdl_func :SetGammaRamp, [ :pointer, :pointer, :pointer ], :int
  sdl_func :GetGammaRamp, [ :pointer, :pointer, :pointer ], :int

  sdl_func :CreateWindow, [ :string, :int, :int, :int, :int, :uint32 ], :uint32
  sdl_func :CreateWindowFrom, [ :pointer ], :uint32

  sdl_func :GetWindowFlags,    [ :uint32                     ], :uint32
  sdl_func :SetWindowTitle,    [ :uint32, :string            ], :void
  sdl_func :GetWindowTitle,    [ :uint32                     ], :string
  sdl_func :SetWindowIcon,     [ :uint32, :pointer           ], :void
  sdl_func :SetWindowData,     [ :uint32, :pointer           ], :void
  sdl_func :GetWindowData,     [ :uint32                     ], :pointer
  sdl_func :SetWindowPosition, [ :uint32, :int, :int         ], :void
  sdl_func :GetWindowPosition, [ :uint32, :pointer, :pointer ], :void
  sdl_func :SetWindowSize,     [ :uint32, :int, :int         ], :void
  sdl_func :GetWindowSize,     [ :uint32, :pointer, :pointer ], :void

  sdl_func :ShowWindow,          [ :uint32                ], :void
  sdl_func :HideWindow,          [ :uint32                ], :void
  sdl_func :RaiseWindow,         [ :uint32                ], :void
  sdl_func :MaximizeWindow,      [ :uint32                ], :void
  sdl_func :MinimizeWindow,      [ :uint32                ], :void
  sdl_func :RestoreWindow,       [ :uint32                ], :void
  sdl_func :SetWindowFullscreen, [ :uint32, :int          ], :int
  sdl_func :SetWindowGrab,       [ :uint32, :int          ], :void
  sdl_func :GetWindowGrab,       [ :uint32                ], :int
  sdl_func :GetWindowWMInfo,     [ :uint32, :pointer      ], BOOL
  sdl_func :DestroyWindow,       [ :uint32                ], :void
  sdl_func :GetNumRenderDrivers, [                        ], :int
  sdl_func :GetRenderDriverInfo, [ :int, :pointer         ], :int
  sdl_func :CreateRenderer,      [ :uint32, :int, :uint32 ], :int
  sdl_func :SelectRenderer,      [ :uint32                ], :int
  sdl_func :GetRendererInfo,     [ :pointer               ], :int

  sdl_func :CreateTexture,            [ :uint32, :int, :int, :int ], :uint32
  sdl_func :CreateTextureFromSurface, [ :uint32, :pointer         ], :uint32

  sdl_func :QueryTexture, [:uint32,:pointer,:pointer,:pointer,:pointer], :int
  sdl_func :QueryTexturePixels, [ :uint32, :pointer, :pointer ], :int

  sdl_func :SetTexturePalette,   [ :uint32, :pointer, :int, :int   ], :int
  sdl_func :GetTexturePalette,   [ :uint32, :pointer, :int, :int   ], :int
  sdl_func :SetTextureColorMod,  [ :uint32, :uint8, :uint8, :uint8 ], :int
  sdl_func :GetTextureColorMod,  [:uint32, :pointer, :pointer, :pointer], :int
  sdl_func :SetTextureAlphaMod,  [ :uint32, :uint8                 ], :int
  sdl_func :GetTextureAlphaMod,  [ :uint32, :pointer               ], :int
  sdl_func :SetTextureBlendMode, [ :uint32, :int                   ], :int
  sdl_func :GetTextureBlendMode, [ :uint32, :pointer               ], :int
  sdl_func :SetTextureScaleMode, [ :uint32, :int                   ], :int
  sdl_func :GetTextureScaleMode, [ :uint32, :pointer               ], :int

  sdl_func :UpdateTexture, [ :uint32, :pointer, :pointer, :int ], :int
  sdl_func :LockTexture,   [:uint32, :pointer, :int, :pointer, :pointer], :int
  sdl_func :UnlockTexture, [ :uint32                           ], :void
  sdl_func :DirtyTexture,  [ :uint32, :int, :pointer           ], :void

  sdl_func :SetRenderDrawColor, [ :uint8, :uint8, :uint8, :uint8       ], :int
  sdl_func :GetRenderDrawColor, [:pointer, :pointer, :pointer, :pointer], :int

  sdl_func :SetRenderDrawBlendMode, [ :int     ], :int
  sdl_func :GetRenderDrawBlendMode, [ :pointer ], :int

  sdl_func :RenderPoint,       [ :int, :int                  ], :int
  sdl_func :RenderLine,        [ :int, :int, :int, :int      ], :int
  sdl_func :RenderFill,        [ :pointer                    ], :int
  sdl_func :RenderCopy,        [ :uint32, :pointer, :pointer ], :int
  sdl_func :RenderReadPixels,  [ :pointer, :pointer, :int    ], :int
  sdl_func :RenderWritePixels, [ :pointer, :pointer, :int    ], :int
  sdl_func :RenderPresent,     [                             ], :void

  sdl_func :DestroyTexture,  [ :uint32 ], :void
  sdl_func :DestroyRenderer, [ :uint32 ], :void

  sdl_func :IsScreenSaverEnabled, [], BOOL
  sdl_func :EnableScreenSaver,    [], :void
  sdl_func :DisableScreenSaver,   [], :void

  sdl_func :GL_LoadLibrary,        [ :string           ], :int
  sdl_func :GL_GetProcAddress,     [ :string           ], :pointer
  sdl_func :GL_UnloadLibrary,      [                   ], :void
  sdl_func :GL_ExtensionSupported, [ :string           ], BOOL
  sdl_func :GL_SetAttribute,       [ :int, :int        ], :int
  sdl_func :GL_GetAttribute,       [ :int, :pointer    ], :int
  sdl_func :GL_CreateContext,      [ :uint32           ], :pointer
  sdl_func :GL_MakeCurrent,        [ :uint32, :pointer ], :int
  sdl_func :GL_SetSwapInterval,    [ :int              ], :int
  sdl_func :GL_GetSwapInterval,    [                   ], :int
  sdl_func :GL_SwapWindow,         [ :uint32           ], :void
  sdl_func :GL_DeleteContext,      [ :pointer          ], :void

end
