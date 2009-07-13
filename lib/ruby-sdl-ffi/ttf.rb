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
require 'ruby-sdl-ffi/sdl'


module SDL
  module TTF
    extend NiceFFI::Library
    load_library "SDL_ttf"


    def self.ttf_func( name, args, ret )
      func name, "TTF_#{name}", args, ret
    end


    ttf_func  :Linked_Version, [  ], :pointer


    UNICODE_BOM_NATIVE  = 0xFEFF
    UNICODE_BOM_SWAPPED = 0xFFFE

    ttf_func  :ByteSwappedUNICODE, [ :int ], :void

    ttf_func  :Init, [ ], :int

    ttf_func  :OpenFont,        [ :string, :int               ], :pointer
    ttf_func  :OpenFontIndex,   [ :string, :int, :long        ], :pointer
    ttf_func  :OpenFontRW,      [ :pointer, :int, :int        ], :pointer
    ttf_func  :OpenFontIndexRW, [ :pointer, :int, :int, :long ], :pointer


    STYLE_NORMAL    = 0x00
    STYLE_BOLD      = 0x01
    STYLE_ITALIC    = 0x02
    STYLE_UNDERLINE = 0x04


    ttf_func  :GetFontStyle, [ :pointer       ], :int
    ttf_func  :SetFontStyle, [ :pointer, :int ], :void
    ttf_func  :FontHeight,   [ :pointer       ], :int
    ttf_func  :FontAscent,   [ :pointer       ], :int
    ttf_func  :FontDescent,  [ :pointer       ], :int
    ttf_func  :FontLineSkip, [ :pointer       ], :int
    ttf_func  :FontFaces,    [ :pointer       ], :long


    ttf_func  :FontFaceIsFixedWidth, [ :pointer ], :int
    ttf_func  :FontFaceFamilyName,   [ :pointer ], :string
    ttf_func  :FontFaceStyleName,    [ :pointer ], :string


    ttf_func  :GlyphMetrics, 
          [ :pointer, :uint16, :pointer, 
            :pointer, :pointer, :pointer, :pointer ], :int

    ttf_func  :SizeText,
          [ :pointer, :string, :pointer, :pointer ], :int

    ttf_func  :SizeUTF8,
          [ :pointer, :string, :pointer, :pointer ], :int

    ttf_func  :SizeUNICODE,
          [ :pointer, :pointer, :pointer, :pointer ], :int


    ttf_func  :RenderText_Solid,
          [ :pointer, :string, SDL::Color ], :pointer

    ttf_func  :RenderUTF8_Solid,
          [ :pointer, :string, SDL::Color ], :pointer

    ttf_func  :RenderUNICODE_Solid,
          [ :pointer, :pointer, SDL::Color ], :pointer

    ttf_func  :RenderGlyph_Solid,
          [ :pointer, :uint16, SDL::Color ], :pointer


    ttf_func  :RenderText_Shaded,
          [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    ttf_func  :RenderUTF8_Shaded,
          [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    ttf_func  :RenderUNICODE_Shaded,
          [ :pointer, :pointer, SDL::Color, SDL::Color ], :pointer

    ttf_func  :RenderGlyph_Shaded,
          [ :pointer, :uint16, SDL::Color, SDL::Color ], :pointer


    ttf_func  :RenderText_Blended,
          [ :pointer, :string, SDL::Color ], :pointer

    ttf_func  :RenderUTF8_Blended,
          [ :pointer, :string, SDL::Color ], :pointer

    ttf_func  :RenderUNICODE_Blended,
          [ :pointer, :pointer, SDL::Color ], :pointer

    ttf_func  :RenderGlyph_Blended,
          [ :pointer, :uint16, SDL::Color ], :pointer


    ttf_func  :CloseFont, [ :pointer ], :void
    ttf_func  :Quit,      [          ], :void
    ttf_func  :WasInit,   [          ], :int

  end
end
