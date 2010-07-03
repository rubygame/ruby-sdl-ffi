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

  ALPHA_OPAQUE      = 255
  ALPHA_TRANSPARENT = 0

  class Rect < NiceFFI::Struct
    layout( :x, :int16,
            :y, :int16,
            :w, :uint16,
            :h, :uint16 )
  end

  class Color < NiceFFI::Struct
    layout( :r,      :uint8,
            :g,      :uint8,
            :b,      :uint8,
            :unused, :uint8 )

    hidden( :unused )

  end


  class Palette < NiceFFI::Struct
    layout( :ncolors, :int,
            :colors,  :pointer )

    include Enumerable

    # Returns the color at the given index in the palette, as an
    # SDL::Color instance.
    def at( index )
      index = (0...ncolors).to_a.at(index)
      if index
        SDL::Color.new( self[:colors] + index * SDL::Color.size )
      end
    end

    # Yields an SDL::Color for each color in the palette.
    def each
      ncolors.times{ |i|  yield at(i)  }
    end

  end


  class PixelFormat < NiceFFI::Struct
    layout( :palette,       Palette.typed_pointer,
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
            :alpha,         :uint8 )
  end

  class Surface < NiceFFI::Struct
    layout( :flags,          :uint32,
            :format,         PixelFormat.typed_pointer,
            :w,              :int,
            :h,              :int,
            :pitch,          :uint16,
            :pixels,         :pointer,
            :offset,         :int,
            :hwdata,         :pointer,
            :clip_rect,      SDL::Rect,
            :unused1,        :uint32,
            :locked,         :uint32,
            :map,            :pointer,
            :format_version, :uint,
            :refcount,       :int )

    read_only( :flags, :format, :w, :h,
               :pitch, :clip_rect, :refcount )

    hidden( :offset, :hwdata, :unused1,
            :locked, :map, :format_version )

    def self.release( pointer )
      SDL.FreeSurface( pointer )
    end
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


  class VideoInfo < NiceFFI::Struct
    layout( :flags,         :uint32,

            ## flags contains:
            # :hw_available,  :uint32,  #bitfield: 1
            # :wm_available,  :uint32,  #bitfield: 1
            # :UnusedBits1,   :uint32,  #bitfield: 6
            # :UnusedBits2,   :uint32,  #bitfield: 1
            # :blit_hw,       :uint32,  #bitfield: 1
            # :blit_hw_CC,    :uint32,  #bitfield: 1
            # :blit_hw_A,     :uint32,  #bitfield: 1
            # :blit_sw,       :uint32,  #bitfield: 1
            # :blit_sw_CC,    :uint32,  #bitfield: 1
            # :blit_sw_A,     :uint32,  #bitfield: 1
            # :blit_fill,     :uint32,  #bitfield: 1
            # :UnusedBits3,   :uint32,  #bitfield: 16

            :video_mem,     :uint32,
            :vfmt,          PixelFormat.typed_pointer,
            :current_w,     :int,
            :current_h,     :int )

    hidden( :flags )

    def hw_available
      self[:flags][1]
    end

    def wm_available
      self[:flags][2]
    end

    def blit_hw
      self[:flags][9]
    end

    def blit_hw_CC
      self[:flags][10]
    end

    def blit_hw_A
      self[:flags][11]
    end

    def blit_sw
      self[:flags][12]
    end

    def blit_sw_CC
      self[:flags][13]
    end

    def blit_sw_A
      self[:flags][14]
    end

    def blit_fill
      self[:flags][15]
    end
  end


  YV12_OVERLAY = 0x32315659
  IYUV_OVERLAY = 0x56555949
  YUY2_OVERLAY = 0x32595559
  UYVY_OVERLAY = 0x59565955
  YVYU_OVERLAY = 0x55595659

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

    read_only( :format, :w, :h, :planes,
               :pitches, :hw_overlay )

    hidden( :hwfuncs, :hwdata, :UnusedBits )

    def self.release( pointer )
      SDL.FreeYUVOverlay( pointer )
    end
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


  sdl_func  :VideoInit, [ :string, :uint32 ], :int
  sdl_func  :VideoQuit, [  ], :void

  sdl_func  :VideoDriverName, [ :string, :int ], :string

  sdl_func  :GetVideoSurface, [],
            SDL::Surface.typed_pointer( :autorelease => false )

  sdl_func  :GetVideoInfo, [ ], SDL::VideoInfo.typed_pointer

  sdl_func  :VideoModeOK, [ :int, :int, :int, :uint32 ], :int

  ## Don't know how to implement this one. :-\
  # sdl_func  :ListModes, [ :pointer, :uint32 ], :pointer

  func  :__SetVideoMode, "SDL_SetVideoMode", [ :int, :int, :int, :uint32 ],
        SDL::Surface.typed_pointer( :autorelease => false )

  def self.SetVideoMode( *args )
    SDL::Mac::HIServices.make_current_front() if defined? SDL::Mac
    __SetVideoMode(*args)
  end



  func  :__UpdateRects, "SDL_UpdateRects", [ :pointer, :int, :pointer ], :void

  def self.UpdateRects( surf, rects )
    rects_mp = FFI::Buffer.new( Rect, rects.length )

    rects.each_with_index do |rect, i|
      rects_mp[i].put_bytes( 0, rect.to_bytes )
    end

    __UpdateRects( surf, rects.length, rects_mp )
  end


  sdl_func  :UpdateRect,  [ :pointer, :int32, :int32, :uint32, :uint32 ], :void
  sdl_func  :Flip,        [ :pointer                                   ], :int



  sdl_func  :SetGamma,     [ :float, :float, :float       ], :int
  sdl_func  :SetGammaRamp, [ :pointer, :pointer, :pointer ], :int


  func  :__SDL_GetGammaRamp, "SDL_GetGammaRamp",
        [ :buffer_out, :buffer_out, :buffer_out ], :int

  def self.GetGammaRamp()
    rtable = FFI::Buffer.new( :uint16, 256 )
    gtable = FFI::Buffer.new( :uint16, 256 )
    btable = FFI::Buffer.new( :uint16, 256 )

    n = __SDL_GetGammaRamp( rtable, gtable, btable )

    if( n == -1 )
      return nil
    else
      return [ rtable.get_array_of_uint16(0, 256),
               gtable.get_array_of_uint16(0, 256),
               btable.get_array_of_uint16(0, 256) ]
    end
  end


  sdl_func  :SetColors,  [ :pointer, :pointer, :int, :int           ], :int
  sdl_func  :SetPalette, [ :pointer, :int, :pointer, :int, :int     ], :int
  sdl_func  :MapRGB,     [ :pointer, :uint8, :uint8, :uint8         ], :uint32
  sdl_func  :MapRGBA,    [ :pointer, :uint8, :uint8, :uint8, :uint8 ], :uint32


  func  :__SDL_GetRGB, "SDL_GetRGB",
        [ :uint32, :pointer, :buffer_out, :buffer_out, :buffer_out ], :void

  def self.GetRGB( uint32, format )
    r = FFI::Buffer.new( :uint8 )
    g = FFI::Buffer.new( :uint8 )
    b = FFI::Buffer.new( :uint8 )
    __SDL_GetRGB( uint32, format, r, g, b )
    return [r.get_uint8(0), g.get_uint8(0), b.get_uint8(0)]
  end



  func  :__SDL_GetRGBA, "SDL_GetRGBA",
        [ :uint32, :pointer, :buffer_out,
          :buffer_out, :buffer_out, :buffer_out ], :void

  def self.GetRGBA( uint32, format )
    r = FFI::Buffer.new( :uint8 )
    g = FFI::Buffer.new( :uint8 )
    b = FFI::Buffer.new( :uint8 )
    a = FFI::Buffer.new( :uint8 )
    __SDL_GetRGBA( uint32, format, r, g, b, a )
    return [r.get_uint8(0), g.get_uint8(0), b.get_uint8(0), a.get_uint8(0)]
  end



  sdl_func  :CreateRGBSurface,
        [ :uint32, :int, :int, :int, :uint32, :uint32, :uint32, :uint32 ],
        SDL::Surface.typed_pointer

  sdl_func  :CreateRGBSurfaceFrom,
        [ :pointer, :int, :int, :int, :int,
          :uint32, :uint32, :uint32, :uint32 ],
        SDL::Surface.typed_pointer


  sdl_func  :FreeSurface,   [ :pointer ], :void
  sdl_func  :LockSurface,   [ :pointer ], :int
  sdl_func  :UnlockSurface, [ :pointer ], :void


  sdl_func  :LoadBMP_RW, [ :pointer, :int ], SDL::Surface.typed_pointer
  sdl_func  :SaveBMP_RW, [ :pointer, :pointer, :int   ], :int


  sdl_func  :SetColorKey, [ :pointer, :uint32, :uint32 ], :int
  sdl_func  :SetAlpha,    [ :pointer, :uint32, :uint8  ], :int



  sdl_func  :SetClipRect, [ :pointer, :pointer ], SDL::BOOL

  func  :__SDL_GetClipRect, "SDL_GetClipRect", [ :pointer, :buffer_out ], :void

  def self.GetClipRect( surface )
    mp = FFI::Buffer.new( Rect )
    __SDL_GetClipRect( surface, mp )
    return Rect.new( mp )
  end


  sdl_func  :ConvertSurface,
            [ :pointer, :pointer, :uint32 ], SDL::Surface.typed_pointer


  func  :BlitSurface, "SDL_UpperBlit",
        [ :pointer, :pointer, :pointer, :pointer ], :int


  sdl_func  :FillRect, [ :pointer, :pointer, :uint32 ], :int


  sdl_func  :DisplayFormat,      [ :pointer ], SDL::Surface.typed_pointer
  sdl_func  :DisplayFormatAlpha, [ :pointer ], SDL::Surface.typed_pointer


  sdl_func  :CreateYUVOverlay,  [ :int, :int, :uint32, :pointer ],
            SDL::Overlay.typed_pointer

  sdl_func  :LockYUVOverlay,    [ :pointer           ], :int
  sdl_func  :UnlockYUVOverlay,  [ :pointer           ], :void
  sdl_func  :DisplayYUVOverlay, [ :pointer, :pointer ], :int
  sdl_func  :FreeYUVOverlay,    [ :pointer           ], :void


  sdl_func  :GL_LoadLibrary,    [ :string               ], :int
  sdl_func  :GL_GetProcAddress, [ :string               ], :pointer
  sdl_func  :GL_SetAttribute,   [ SDL::GLATTR, :int     ], :int


  func  :__GL_GetAttribute, "SDL_GL_GetAttribute",
        [ SDL::GLATTR, :buffer_out ], :int

  def self.GL_GetAttribute( attrib )
    buffer = FFI::Buffer.new( :int )
    result = __GL_GetAttribute( attrib, buffer )
    if( result == -1 )
      return nil
    else
      return buffer.get_int(0)
    end
  end


  sdl_func  :GL_SwapBuffers,    [                       ], :void
  sdl_func  :GL_UpdateRects,    [ :int, :pointer        ], :void
  sdl_func  :GL_Lock,           [                       ], :void
  sdl_func  :GL_Unlock,         [                       ], :void



  sdl_func  :WM_SetCaption, [ :string, :string ], :void

  func  :__SDL_WM_GetCaption, "SDL_WM_GetCaption",
        [ :buffer_out, :buffer_out ], :void

  def self.WM_GetCaption()
    title = FFI::Buffer.new( :pointer )
    icont = FFI::Buffer.new( :pointer )
    __SDL_WM_GetCaption( title, icont )
    return [ title.get_pointer(0).get_string(0),
             icont.get_pointer(0).get_string(0) ]
  end



  sdl_func  :WM_SetIcon,          [ :pointer, :pointer ], :void
  sdl_func  :WM_IconifyWindow,    [                    ], :int
  sdl_func  :WM_ToggleFullScreen, [ :pointer           ], :int


  GRAB_QUERY      = -1
  GRAB_OFF        = 0
  GRAB_ON         = 1
  GRAB_FULLSCREEN = 2

  sdl_func  :WM_GrabInput, [ SDL::ENUM ], SDL::ENUM

end
