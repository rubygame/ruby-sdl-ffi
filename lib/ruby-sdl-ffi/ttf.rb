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


    func  :Linked_Version, "TTF_Linked_Version", [  ], :pointer


    UNICODE_BOM_NATIVE  = 0xFEFF
    UNICODE_BOM_SWAPPED = 0xFFFE

    func  :ByteSwappedUNICODE, "TTF_ByteSwappedUNICODE", [ :int ], :void


    func  :Init, "TTF_Init", [ ], :int


    func  :OpenFont, "TTF_OpenFont", [ :string, :int ], :pointer

    func  :OpenFontIndex,   "TTF_OpenFontIndex",
          [ :string, :int, :long ], :pointer

    func  :OpenFontRW,      "TTF_OpenFontRW",
          [ :pointer, :int, :int ], :pointer

    func  :OpenFontIndexRW, "TTF_OpenFontIndexRW",
          [ :pointer, :int, :int, :long ], :pointer


    STYLE_NORMAL    = 0x00
    STYLE_BOLD      = 0x01
    STYLE_ITALIC    = 0x02
    STYLE_UNDERLINE = 0x04


    func  :GetFontStyle, "TTF_GetFontStyle", [ :pointer       ], :int
    func  :SetFontStyle, "TTF_SetFontStyle", [ :pointer, :int ], :void
    func  :FontHeight,   "TTF_FontHeight",   [ :pointer       ], :int
    func  :FontAscent,   "TTF_FontAscent",   [ :pointer       ], :int
    func  :FontDescent,  "TTF_FontDescent",  [ :pointer       ], :int
    func  :FontLineSkip, "TTF_FontLineSkip", [ :pointer       ], :int
    func  :FontFaces,    "TTF_FontFaces",    [ :pointer       ], :long


    func  :FontFaceIsFixedWidth, "TTF_FontFaceIsFixedWidth", [ :pointer ], :int
    func  :FontFaceFamilyName,   "TTF_FontFaceFamilyName", [ :pointer ], :string
    func  :FontFaceStyleName,    "TTF_FontFaceStyleName",  [ :pointer ], :string


    func  :GlyphMetrics, "TTF_GlyphMetrics", 
          [ :pointer, :uint16, :pointer, 
            :pointer, :pointer, :pointer, :pointer ], :int

    func  :SizeText,     "TTF_SizeText",
          [ :pointer, :string, :pointer, :pointer ], :int

    func  :SizeUTF8,     "TTF_SizeUTF8",
          [ :pointer, :string, :pointer, :pointer ], :int

    func  :SizeUNICODE,  "TTF_SizeUNICODE",
          [ :pointer, :pointer, :pointer, :pointer ], :int


    func  :RenderText_Solid,      "TTF_RenderText_Solid",
          [ :pointer, :string, SDL::Color ], :pointer

    func  :RenderUTF8_Solid,      "TTF_RenderUTF8_Solid",
          [ :pointer, :string, SDL::Color ], :pointer

    func  :RenderUNICODE_Solid,   "TTF_RenderUNICODE_Solid",
          [ :pointer, :pointer, SDL::Color ], :pointer

    func  :RenderGlyph_Solid,     "TTF_RenderGlyph_Solid",
          [ :pointer, :uint16, SDL::Color ], :pointer


    func  :RenderText_Shaded,     "TTF_RenderText_Shaded",
          [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    func  :RenderUTF8_Shaded,     "TTF_RenderUTF8_Shaded",
          [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    func  :RenderUNICODE_Shaded,  "TTF_RenderUNICODE_Shaded",
          [ :pointer, :pointer, SDL::Color, SDL::Color ], :pointer

    func  :RenderGlyph_Shaded,    "TTF_RenderGlyph_Shaded",
          [ :pointer, :uint16, SDL::Color, SDL::Color ], :pointer


    func  :RenderText_Blended,    "TTF_RenderText_Blended",
          [ :pointer, :string, SDL::Color ], :pointer

    func  :RenderUTF8_Blended,    "TTF_RenderUTF8_Blended",
          [ :pointer, :string, SDL::Color ], :pointer

    func  :RenderUNICODE_Blended, "TTF_RenderUNICODE_Blended",
          [ :pointer, :pointer, SDL::Color ], :pointer

    func  :RenderGlyph_Blended,   "TTF_RenderGlyph_Blended",
          [ :pointer, :uint16, SDL::Color ], :pointer


    func  :CloseFont, "TTF_CloseFont", [ :pointer ], :void
    func  :Quit,      "TTF_Quit",      [          ], :void
    func  :WasInit,   "TTF_WasInit",   [          ], :int

  end
end
