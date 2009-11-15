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

  ALPHA_TRANSPARENT    = 0
  ALPHA_OPAQUE         = 255

  PIXELTYPE_UNKNOWN    = 0
  PIXELTYPE_INDEX1     = 1
  PIXELTYPE_INDEX4     = 2
  PIXELTYPE_INDEX8     = 3
  PIXELTYPE_PACKED8    = 4
  PIXELTYPE_PACKED16   = 5
  PIXELTYPE_PACKED32   = 6
  PIXELTYPE_ARRAYU8    = 7
  PIXELTYPE_ARRAYU16   = 8
  PIXELTYPE_ARRAYU32   = 9
  PIXELTYPE_ARRAYF16   = 10
  PIXELTYPE_ARRAYF32   = 11

  BITMAPORDER_NONE     = 0
  BITMAPORDER_4321     = 1
  BITMAPORDER_1234     = 2

  PACKEDORDER_NONE     = 0
  PACKEDORDER_XRGB     = 1
  PACKEDORDER_RGBX     = 2
  PACKEDORDER_ARGB     = 3
  PACKEDORDER_RGBA     = 4
  PACKEDORDER_XBGR     = 5
  PACKEDORDER_BGRX     = 6
  PACKEDORDER_ABGR     = 7
  PACKEDORDER_BGRA     = 8

  ARRAYORDER_NONE      = 0
  ARRAYORDER_RGB       = 1
  ARRAYORDER_RGBA      = 2
  ARRAYORDER_ARGB      = 3
  ARRAYORDER_BGR       = 4
  ARRAYORDER_BGRA      = 5
  ARRAYORDER_ABGR      = 6

  PACKEDLAYOUT_NONE    = 0
  PACKEDLAYOUT_332     = 1
  PACKEDLAYOUT_4444    = 2
  PACKEDLAYOUT_1555    = 3
  PACKEDLAYOUT_5551    = 4
  PACKEDLAYOUT_565     = 5
  PACKEDLAYOUT_8888    = 6
  PACKEDLAYOUT_2101010 = 7
  PACKEDLAYOUT_1010102 = 8

  PIXELFORMAT_UNKNOWN = 0

  PIXELFORMAT_BGR24 = ((1 << 31)                 | 
                       (PIXELTYPE_ARRAYU8 << 24) |
                       (ARRAYORDER_BGR << 20)    |
                       (0 << 16)                 |
                       (24 << 8)                 |
                       (3 << 0))

  PIXELFORMAT_RGB24 = ((1 << 31)                 |
                       (PIXELTYPE_ARRAYU8 << 24) |
                       (ARRAYORDER_RGB << 20)    |
                       (0 << 16)                 |
                       (24 << 8)                 |
                       (3 << 0))

  PIXELFORMAT_INDEX1LSB = ((1 << 31)                |
                           (PIXELTYPE_INDEX1 << 24) |
                           (BITMAPORDER_1234 << 20) |
                           (0 << 16)                |
                           (1 << 8)                 |
                           (0 << 0))

  PIXELFORMAT_INDEX1MSB = ((1 << 31)                |
                           (PIXELTYPE_INDEX1 << 24) |
                           (BITMAPORDER_4321 << 20) |
                           (0 << 16)                |
                           (1 << 8)                 |
                           (0 << 0))

  PIXELFORMAT_INDEX4LSB = ((1 << 31)                |
                           (PIXELTYPE_INDEX4 << 24) |
                           (BITMAPORDER_1234 << 20) |
                           (0 << 16)                |
                           (4 << 8)                 |
                           (0 << 0))

  PIXELFORMAT_INDEX4MSB = ((1 << 31)                |
                           (PIXELTYPE_INDEX4 << 24) |
                           (BITMAPORDER_4321 << 20) |
                           (0 << 16)                |
                           (4 << 8)                 |
                           (0 << 0))

  PIXELFORMAT_INDEX8 = ((1 << 31)                |
                        (PIXELTYPE_INDEX8 << 24) |
                        (0 << 20)                |
                        (0 << 16)                |
                        (8 << 8)                 |
                        (1 << 0))

  PIXELFORMAT_ABGR1555 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED16 << 24) |
                          (PACKEDORDER_ABGR << 20)   |
                          (PACKEDLAYOUT_1555 << 16)  |
                          (16 << 8)                  |
                          (2 << 0))

  PIXELFORMAT_ABGR4444 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED16 << 24) |
                          (PACKEDORDER_ABGR << 20)   |
                          (PACKEDLAYOUT_4444 << 16)  |
                          (16 << 8)                  |
                          (2 << 0))

  PIXELFORMAT_ARGB1555 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED16 << 24) |
                          (PACKEDORDER_ARGB << 20)   |
                          (PACKEDLAYOUT_1555 << 16)  |
                          (16 << 8)                  |
                          (2 << 0))

  PIXELFORMAT_ARGB4444 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED16 << 24) |
                          (PACKEDORDER_ARGB << 20)   |
                          (PACKEDLAYOUT_4444 << 16)  |
                          (16 << 8)                  |
                          (2 << 0))

  PIXELFORMAT_BGR555 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED16 << 24) |
                        (PACKEDORDER_XBGR << 20)   |
                        (PACKEDLAYOUT_1555 << 16)  |
                        (15 << 8)                  |
                        (2 << 0))

  PIXELFORMAT_BGR565 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED16 << 24) |
                        (PACKEDORDER_XBGR << 20)   |
                        (PACKEDLAYOUT_565 << 16)   |
                        (16 << 8)                  |
                        (2 << 0))

  PIXELFORMAT_RGB555 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED16 << 24) |
                        (PACKEDORDER_XRGB << 20)   |
                        (PACKEDLAYOUT_1555 << 16)  |
                        (15 << 8)                  |
                        (2 << 0))

  PIXELFORMAT_RGB444 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED16 << 24) |
                        (PACKEDORDER_XRGB << 20)   |
                        (PACKEDLAYOUT_4444 << 16)  |
                        (12 << 8)                  |
                        (2 << 0))

  PIXELFORMAT_RGB565 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED16 << 24) |
                        (PACKEDORDER_XRGB << 20)   |
                        (PACKEDLAYOUT_565 << 16)   |
                        (16 << 8)                  |
                        (2 << 0))

  PIXELFORMAT_ABGR8888 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED32 << 24) |
                          (PACKEDORDER_ABGR << 20)   |
                          (PACKEDLAYOUT_8888 << 16)  |
                          (32 << 8)                  |
                          (4 << 0))

  PIXELFORMAT_ARGB2101010 = ((1 << 31)                    |
                             (PIXELTYPE_PACKED32 << 24)   |
                             (PACKEDORDER_ARGB << 20)     |
                             (PACKEDLAYOUT_2101010 << 16) |
                             (32 << 8)                    |
                             (4 << 0))

  PIXELFORMAT_ARGB8888 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED32 << 24) |
                          (PACKEDORDER_ARGB << 20)   |
                          (PACKEDLAYOUT_8888 << 16)  |
                          (32 << 8)                  |
                          (4 << 0))

  PIXELFORMAT_BGRA8888 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED32 << 24) |
                          (PACKEDORDER_BGRA << 20)   |
                          (PACKEDLAYOUT_8888 << 16)  |
                          (32 << 8)                  |
                          (4 << 0))

  PIXELFORMAT_RGBA8888 = ((1 << 31)                  |
                          (PIXELTYPE_PACKED32 << 24) |
                          (PACKEDORDER_RGBA << 20)   |
                          (PACKEDLAYOUT_8888 << 16)  |
                          (32 << 8)                  |
                          (4 << 0))

  PIXELFORMAT_BGR888 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED32 << 24) |
                        (PACKEDORDER_XBGR << 20)   |
                        (PACKEDLAYOUT_8888 << 16)  |
                        (24 << 8)                  |
                        (4 << 0))

  PIXELFORMAT_RGB888 = ((1 << 31)                  |
                        (PIXELTYPE_PACKED32 << 24) |
                        (PACKEDORDER_XRGB << 20)   |
                        (PACKEDLAYOUT_8888 << 16)  |
                        (24 << 8)                  |
                        (4 << 0))

  PIXELFORMAT_RGB332 = ((1 << 31)                 |
                        (PIXELTYPE_PACKED8 << 24) |
                        (PACKEDORDER_XRGB << 20)  |
                        (PACKEDLAYOUT_332 << 16)  |
                        (8 << 8)                  |
                        (1 << 0))

  PIXELFORMAT_IYUV = (char('I')         |
                      (char('Y') << 8)  |
                      (char('U') << 16) |
                      (char('V') << 24))

  PIXELFORMAT_UYVY = (char('U')         |
                      (char('Y') << 8)  |
                      (char('V') << 16) |
                      (char('Y') << 24))

  PIXELFORMAT_YUY2 = (char('Y')         |
                      (char('U') << 8)  |
                      (char('Y') << 16) |
                      (char('2') << 24))

  PIXELFORMAT_YV12 = (char('Y')         |
                      (char('V') << 8)  |
                      (char('1') << 16) |
                      (char('2') << 24))

  PIXELFORMAT_YVYU = (char('Y')         |
                      (char('V') << 8)  |
                      (char('Y') << 16) |
                      (char('U') << 24))


  class Color < NiceFFI::Struct
    layout( :r,      :uint8,
            :g,      :uint8,
            :b,      :uint8,
            :unused, :uint8 )
  end
  Colour = Color


  callback(:PaletteChangedFunc, [ :pointer, :pointer ], :int)

  class PaletteWatch < NiceFFI::Struct
    layout( :callback, :PaletteChangedFunc,
            :userdata, :pointer,
            :next,     :pointer )

    def callback=(cb)
      @callback = cb
      self[:callback] = @callback
    end

    def callback
      @callback
    end
  end


  class Palette < NiceFFI::Struct
    layout( :ncolors,  :int,
            :colors,   :pointer,
            :refcount, :int,
            :watch,    :pointer )
  end


  class PixelFormat < NiceFFI::Struct
    layout( :palette,       :pointer,
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
            :Amask,         :uint32 )
  end

  sdl_func :PixelFormatEnumToMasks, [ :uint32, :pointer, :pointer,
                                      :pointer, :pointer, :pointer ], BOOL

  sdl_func :MasksToPixelFormatEnum, [ :int, :uint32, :uint32,
                                      :uint32, :uint32 ], :uint32

  sdl_func :AllocPalette, [ :int ], :pointer

  sdl_func :AddPaletteWatch, [ :pointer, :PaletteChangedFunc,
                               :pointer ], :int

  sdl_func :DelPaletteWatch, [ :pointer, :PaletteChangedFunc,
                               :pointer ], :void

  sdl_func :SetPaletteColors, [ :pointer, :pointer, :int, :int ], :int
  sdl_func :FreePalette, [ :pointer ], :void

  sdl_func :MapRGB,  [ :pointer, :uint8, :uint8, :uint8         ], :uint32
  sdl_func :MapRGBA, [ :pointer, :uint8, :uint8, :uint8, :uint8 ], :uint32

  sdl_func :GetRGB,  [ :uint32, :pointer, :pointer,
                       :pointer, :pointer ], :void

  sdl_func :GetRGBA, [ :uint32, :pointer, :pointer,
                       :pointer, :pointer, :pointer ], :void

end
