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

  PREALLOC = 0x00000001
  RLEACCEL = 0x00000002


  class Surface < NiceFFI::Struct
    layout( :flags,          :uint32,
            :format,         :pointer,
            :w,              :int,
            :h,              :int,
            :pitch,          :int,
            :pixels,         :pointer,
            :userdata,       :pointer,
            :locked,         :int,
            :lock_data,      :pointer,
            :clip_rect,      Rect,
            :map,            :pointer,
            :format_version, :uint,
            :refcount,       :int )
  end

  callback( :SDL_blit, [:pointer, :pointer, :pointer, :pointer], :int )

  sdl_func :CreateRGBSurface, [ :uint32, :int, :int, :int, :uint32,
                                :uint32, :uint32, :uint32 ], :pointer

  sdl_func :CreateRGBSurfaceFrom,
           [ :pointer, :int, :int, :int, :int,
             :uint32, :uint32, :uint32, :uint32 ], :pointer

  sdl_func :FreeSurface, [ :pointer ], :void

  sdl_func :SetSurfacePalette, [ :pointer, :pointer ], :int

  sdl_func :LockSurface, [ :pointer ], :int
  sdl_func :UnlockSurface, [ :pointer ], :void

  sdl_func :LoadBMP_RW, [ :pointer, :int           ], :pointer
  sdl_func :SaveBMP_RW, [ :pointer, :pointer, :int ], :int

  sdl_func :SetSurfaceRLE, [ :pointer, :int ], :int

  sdl_func :SetColorKey, [ :pointer, :uint32, :uint32 ], :int
  sdl_func :GetColorKey, [ :pointer, :pointer         ], :int

  sdl_func :SetSurfaceColorMod, [:pointer, :uint8, :uint8, :uint8      ], :int
  sdl_func :GetSurfaceColorMod, [:pointer, :pointer, :pointer, :pointer], :int
  sdl_func :SetSurfaceAlphaMod, [:pointer, :uint8                      ], :int
  sdl_func :GetSurfaceAlphaMod, [:pointer, :pointer                    ], :int

  sdl_func :SetSurfaceBlendMode, [ :pointer, :int     ], :int
  sdl_func :GetSurfaceBlendMode, [ :pointer, :pointer ], :int
  sdl_func :SetSurfaceScaleMode, [ :pointer, :int     ], :int
  sdl_func :GetSurfaceScaleMode, [ :pointer, :pointer ], :int

  sdl_func :SetClipRect, [ :pointer, :pointer ], BOOL
  sdl_func :GetClipRect, [ :pointer, :pointer ], :void

  sdl_func :ConvertSurface, [ :pointer, :pointer, :uint32 ], :pointer

  sdl_func :DrawPoint,  [ :pointer, :int, :int, :uint32 ], :int
  sdl_func :BlendPoint, [ :pointer, :int, :int, :int, 
                          :uint8, :uint8, :uint8, :uint8 ], :int

  sdl_func :DrawLine,  [ :pointer, :int, :int, :int, :int, :uint32 ], :int
  sdl_func :BlendLine, [ :pointer, :int, :int, :int, :int, :int,
                         :uint8, :uint8, :uint8, :uint8 ], :int

  sdl_func :FillRect,  [ :pointer, :pointer, :uint32 ], :int
  sdl_func :BlendRect, [ :pointer, :pointer, :int,
                         :uint8, :uint8, :uint8, :uint8 ], :int

  sdl_func :UpperBlit,   [ :pointer, :pointer, :pointer, :pointer ], :int
  sdl_func :LowerBlit,   [ :pointer, :pointer, :pointer, :pointer ], :int
  sdl_func :SoftStretch, [ :pointer, :pointer, :pointer, :pointer ], :int

end
