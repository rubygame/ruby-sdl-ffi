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


require 'rubygems'

require 'nice-ffi'
require 'ruby-sdl-ffi/sdl'


module SDL
  module SPriG
    extend NiceFFI::Library
    load_library "sprig"

    def self.spg_func( name, args, ret )
      func name, "SPG_#{name}", args, ret
    end


    PI_8  = 0.392699082
    PI_4  = 0.785398163
    PI_2  = 1.57079633
    PI3_4 = 2.35619449
    PI    = 3.14159265
    PI5_4 = 3.92699082
    PI3_2 = 4.71238898
    PI7_4 = 5.49778714
    PI2   = 6.28318531

    DEGPERRAD = 57.2957795
    RADPERDEG = 0.0174532925


    class Point < NiceFFI::Struct
      layout( :x, :float,
              :y, :float )
    end


    class DirtyTable < NiceFFI::Struct
      layout( :size,  :uint16,
              :rects, :pointer,
              :count, :uint16,
              :best,  :uint16 )
    end


    DEST_ALPHA          = 0
    SRC_ALPHA           = 1
    COMBINE_ALPHA       = 2
    COPY_NO_ALPHA       = 3
    COPY_SRC_ALPHA      = 4
    SRC_MASK            = COPY_SRC_ALPHA
    COPY_DEST_ALPHA     = 5
    DEST_MASK           = COPY_DEST_ALPHA
    COPY_COMBINE_ALPHA  = 6
    COPY_ALPHA_ONLY     = 7
    COMBINE_ALPHA_ONLY  = 8
    REPLACE_COLORKEY    = 9


    NONE                = 0x00
    TAA                 = 0x01
    TSAFE               = 0x02
    TTMAP               = 0x04
    TSLOW               = 0x08
    TCOLORKEY           = 0x10
    TBLEND              = 0x20
    TSURFACE_ALPHA      = 0x40


    spg_func :InitSDL, [ :uint16, :uint16, :uint8, :uint32, :uint32 ],
             SDL::Surface.typed_pointer


    # Not available in the official SPriG (yet)
    begin 
      spg_func :LinkedVersion, [], SDL::Version.typed_pointer
    rescue FFI::NotFoundError
    end


    BOOL = :uint8


    spg_func :EnableAutolock, [ BOOL ], :void
    spg_func :GetAutolock,    [      ], BOOL


    spg_func :EnableRadians, [ BOOL ], :void
    spg_func :GetRadians,    [      ], BOOL


    spg_func :Error,        [ :string ], :void
    spg_func :EnableErrors, [ BOOL    ], :void
    spg_func :GetError,     [         ], :string
    spg_func :NumErrors,    [         ], :uint16


    spg_func :PushThickness, [ :uint16 ], :void
    spg_func :PopThickness,  [         ], :uint16
    spg_func :GetThickness,  [         ], :uint16


    spg_func :PushBlend, [ :uint8 ], :void
    spg_func :PopBlend,  [        ], :uint8
    spg_func :GetBlend,  [        ], :uint8


    spg_func :PushAA, [ :uint8 ], :void
    spg_func :PopAA,  [        ], BOOL
    spg_func :GetAA,  [        ], BOOL


    spg_func :PushSurfaceAlpha, [ :uint8 ], :void
    spg_func :PopSurfaceAlpha,  [        ], BOOL
    spg_func :GetSurfaceAlpha,  [        ], BOOL


    # spg_func :RectOR,  [ SDL::Rect, SDL::Rect, :pointer ], :void
    # spg_func :RectAND, [ SDL::Rect, SDL::Rect, :pointer ], BOOL


    spg_func :EnableDirty,  [ :uint8             ], :void
    spg_func :DirtyInit,    [ :uint16            ], :void
    spg_func :DirtyAdd,     [ :pointer           ], :void
    spg_func :DirtyUpdate,  [ :pointer           ], DirtyTable.typed_pointer
    spg_func :DirtySwap,    [                    ], :void
    spg_func :DirtyEnabled, [                    ], BOOL
    spg_func :DirtyMake,    [ :uint16            ], DirtyTable.typed_pointer
    spg_func :DirtyAddTo,   [ :pointer, :pointer ], :void
    spg_func :DirtyFree,    [ :pointer           ], :void
    spg_func :DirtyGet,     [                    ], DirtyTable.typed_pointer
    spg_func :DirtyClear,   [ :pointer           ], :void
    spg_func :DirtyLevel,   [ :uint16            ], :void
    spg_func :DirtyClip,    [ :pointer, :pointer ], :void


    spg_func :ColorPalette, [], :pointer
    spg_func :GrayPalette,  [], :pointer

    spg_func :FindPaletteColor, [ :pointer, :uint8, :uint8, :uint8 ], :uint32

    spg_func :PalettizeSurface, [ :pointer, :pointer ],
             SDL::Surface.typed_pointer

    spg_func :FadedPalette32, [ :pointer, :uint32, :uint32,
                                :pointer, :uint16, :uint16 ], :void

    spg_func :FadedPalette32Alpha,
             [ :pointer, :uint32, :uint8, :uint32, :uint8,
               :pointer, :uint16, :uint16 ], :void

    spg_func :RainbowPalette32,
             [ :pointer, :pointer, :uint8, :uint16, :uint16 ], :void

    spg_func :GrayPalette32, [ :pointer, :pointer, :uint16, :uint16 ], :void



    spg_func :CreateSurface8, [ :uint32, :uint16, :uint16 ],
             SDL::Surface.typed_pointer

    spg_func :GetPixel, [ :pointer, :int16, :int16 ], :uint32

    # spg_func :SetClip,  [ :pointer, SDL::Rect ], :void


    # spg_func :TransformX,
    #          [ :pointer, :pointer, :float, :float, :float,
    #            :uint16, :uint16, :uint16, :uint16, :uint8 ], SDL::Rect

    spg_func :Transform, [ :pointer, :uint32, :float, :float, :float, :uint8 ],
             SDL::Surface.typed_pointer

    spg_func :Rotate,   [ :pointer, :float, :uint32 ],
             SDL::Surface.typed_pointer

    spg_func :RotateAA, [ :pointer, :float, :uint32 ],
             SDL::Surface.typed_pointer


    spg_func :ReplaceColor, 
             [ :pointer, :pointer, :pointer, :pointer, :uint32 ],
             SDL::Surface.typed_pointer



    spg_func :Blit, [ :pointer, :pointer, :pointer, :pointer ], :int

    callback( :blit_cb, [:pointer,:pointer,:pointer,:pointer], :void )
    spg_func :SetBlit, [:blit_cb], :void

    # spg_func :GetBlit, [], :pointer

    spg_func :FloodFill, [ :pointer, :int16, :int16, :uint32 ], :void



    spg_func :Pixel, [ :pointer, :int16, :int16, :uint32 ], :void
    spg_func :PixelBlend, [ :pointer, :int16, :int16, :uint32, :uint8 ], :void

    # spg_func :PixelPattern, [:pointer, SDL::Rect, :pointer, :pointer ], :void

    # spg_func :PixelPatternBlend,
    #          [ :pointer, SDL::Rect, :pointer, :pointer, :pointer ], :void



    spg_func :LineH, [ :pointer, :int16, :int16, :int16, :uint32 ], :void

    spg_func :LineHBlend, [ :pointer, :int16, :int16, :int16,
                            :uint32, :uint8 ], :void

    spg_func :LineHFade, [ :pointer, :int16, :int16, :int16,
                           :uint32, :uint32 ], :void

    spg_func :LineHTex, [ :pointer, :int16, :int16, :int16,
                          :pointer, :int16, :int16, :int16, :int16 ], :void

    spg_func :LineV, [ :pointer, :int16, :int16, :int16, :uint32 ], :void

    spg_func :LineVBlend, [ :pointer, :int16, :int16, :int16,
                            :uint32, :uint8 ], :void


    callback( :linefn_cb, [ :pointer, :int16, :int16, :uint32 ], :void )
    spg_func :LineFn, [ :pointer, :int16, :int16, :int16,
                        :int16, :uint32, :linefn_cb ], :void

    spg_func :Line, [ :pointer, :int16, :int16,
                      :int16, :int16, :uint32 ], :void

    spg_func :LineBlend, [ :pointer, :int16, :int16, :int16, :int16,
                           :uint32, :uint8 ], :void


    callback( :linefadefn_cb, [ :pointer, :int16, :int16, :uint32 ], :void )
    spg_func :LineFadeFn, [ :pointer, :int16, :int16, :int16, :int16,
                            :uint32, :uint32, :linefadefn_cb ], :void

    spg_func :LineFade, [ :pointer, :int16, :int16, :int16, :int16,
                          :uint32, :uint32 ], :void

    spg_func :LineFadeBlend, [ :pointer, :int16, :int16, :int16, :int16,
                               :uint32, :uint8, :uint32, :uint8 ], :void



    spg_func :Rect, [ :pointer, :int16, :int16,
                      :int16, :int16, :uint32 ], :void

    spg_func :RectBlend, [ :pointer, :int16, :int16,
                           :int16, :int16, :uint32, :uint8 ], :void

    spg_func :RectFilled, [ :pointer, :int16, :int16,
                            :int16, :int16, :uint32 ], :void

    spg_func :RectFilledBlend, [ :pointer, :int16, :int16,
                                 :int16, :int16, :uint32, :uint8 ], :void

    spg_func :RectRound, [ :pointer, :int16, :int16,
                           :int16, :int16, :float, :uint32 ], :void

    spg_func :RectRoundBlend, [ :pointer, :int16, :int16, :int16,
                                :int16, :float, :uint32, :uint8 ], :void

    spg_func :RectRoundFilled, [ :pointer, :int16, :int16, 
                                 :int16, :int16, :float, :uint32 ], :void

    spg_func :RectRoundFilledBlend, [ :pointer, :int16, :int16, :int16,
                                      :int16, :float, :uint32, :uint8 ], :void



    callback( :ellipsefn_cb, [ :pointer, :int16, :int16, :uint32 ], :void )
    spg_func :EllipseFn, [ :pointer, :int16, :int16, :float, :float,
                           :uint32,  :ellipsefn_cb ], :void

    spg_func :Ellipse, [ :pointer, :int16, :int16,
                         :float, :float, :uint32 ], :void

    spg_func :EllipseBlend, [ :pointer, :int16, :int16,
                              :float, :float, :uint32, :uint8 ], :void

    spg_func :EllipseFilled, [ :pointer, :int16, :int16,
                               :float, :float, :uint32 ], :void

    spg_func :EllipseFilledBlend, [ :pointer, :int16, :int16,
                                    :float, :float, :uint32, :uint8 ], :void

    spg_func :EllipseArb, [ :pointer, :int16, :int16,
                            :float, :float, :float, :uint32 ], :void

    spg_func :EllipseBlendArb, [ :pointer, :int16, :int16, :float,
                                 :float, :float, :uint32, :uint8 ], :void

    spg_func :EllipseFilledArb, [ :pointer, :int16, :int16,
                                  :float, :float, :float, :uint32 ], :void

    spg_func :EllipseFilledBlendArb, [ :pointer, :int16, :int16, :float,
                                       :float, :float, :uint32, :uint8 ], :void



    callback( :circlefn_cb, [ :pointer, :int16, :int16, :uint32 ], :void )
    spg_func :CircleFn, [ :pointer, :int16, :int16,
                          :float, :uint32, :circlefn_cb ], :void

    spg_func :Circle, [ :pointer, :int16, :int16, :float, :uint32 ], :void

    spg_func :CircleBlend, [ :pointer, :int16, :int16,
                             :float, :uint32, :uint8 ], :void

    spg_func :CircleFilled, [ :pointer, :int16, :int16,
                              :float, :uint32 ], :void

    spg_func :CircleFilledBlend, [ :pointer, :int16, :int16,
                                   :float, :uint32, :uint8 ], :void



    callback( :arcfn_cb, [ :pointer, :int16, :int16, :uint32 ], :void )
    spg_func :ArcFn, [ :pointer, :int16, :int16, :float,
                       :float, :float, :uint32, :arcfn_cb ], :void

    spg_func :Arc, [ :pointer, :int16, :int16, 
                     :float, :float, :float, :uint32 ], :void

    spg_func :ArcBlend, [ :pointer, :int16, :int16,
                          :float, :float, :float, :uint32, :uint8 ], :void

    spg_func :ArcFilled, [ :pointer, :int16, :int16,
                           :float, :float, :float, :uint32 ], :void

    spg_func :ArcFilledBlend, [ :pointer, :int16, :int16, :float,
                                :float, :float, :uint32, :uint8 ], :void


    spg_func :Bezier, [ :pointer, :int16, :int16, :int16, :int16,
                        :int16, :int16, :int16, :int16,
                        :uint8, :uint32 ], :void

    spg_func :BezierBlend, [ :pointer, :int16, :int16, :int16, :int16,
                             :int16, :int16, :int16, :int16,
                             :uint8, :uint32, :uint8 ], :void


    spg_func :Trigon, [ :pointer, :int16, :int16, :int16, :int16,
                        :int16, :int16, :uint32 ], :void

    spg_func :TrigonBlend, [ :pointer, :int16, :int16, :int16, :int16,
                             :int16, :int16, :uint32, :uint8 ], :void

    spg_func :TrigonFilled, [ :pointer, :int16, :int16, :int16, :int16,
                              :int16, :int16, :uint32 ], :void

    spg_func :TrigonFilledBlend, [ :pointer, :int16, :int16, :int16, :int16,
                                   :int16, :int16, :uint32, :uint8 ], :void

    spg_func :TrigonFade, [ :pointer, :int16, :int16, :int16, :int16,
                            :int16, :int16, :uint32, :uint32, :uint32 ], :void

    spg_func :TrigonTex,
             [:pointer, :int16, :int16, :int16, :int16, :int16, :int16,
              :pointer, :int16, :int16, :int16, :int16, :int16, :int16], :void


    spg_func :QuadTex, [ :pointer, :int16, :int16, :int16, :int16,
                         :int16, :int16, :int16, :int16,
                         :pointer, :int16, :int16, :int16, :int16,
                         :int16, :int16, :int16, :int16 ], :void


    spg_func :Polygon, [ :pointer, :uint16, :pointer, :uint32 ], :void

    spg_func :PolygonBlend, [ :pointer, :uint16, :pointer,
                              :uint32, :uint8 ], :void

    spg_func :PolygonFilled, [ :pointer, :uint16, :pointer, :uint32 ], :void

    spg_func :PolygonFilledBlend, [ :pointer, :uint16,
                                    :pointer, :uint32, :uint8 ], :void

    spg_func :PolygonFade, [ :pointer, :uint16, :pointer, :pointer ], :void

    spg_func :PolygonFadeBlend, [ :pointer, :uint16, :pointer,
                                  :pointer, :uint8 ], :void


    spg_func :CopyPoints, [ :uint16, :pointer, :pointer ], :void

    spg_func :RotatePointsXY, [ :uint16, :pointer, 
                                :float, :float, :float ], :void

    spg_func :ScalePointsXY, [ :uint16, :pointer,
                               :float, :float, :float, :float ], :void

    spg_func :SkewPointsXY, [ :uint16, :pointer,
                              :float, :float, :float, :float ], :void

    spg_func :TranslatePoints, [ :uint16, :pointer, :float, :float ], :void

  end
end

