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


    attach_function :Linked_Version, "TTF_Linked_Version", [  ], :pointer


    UNICODE_BOM_NATIVE  = 0xFEFF
    UNICODE_BOM_SWAPPED = 0xFFFE


    attach_function :ByteSwappedUNICODE, "TTF_ByteSwappedUNICODE",
                    [ :int ], :void


    attach_function :Init, "TTF_Init", [  ], :int


    attach_function :OpenFont,        "TTF_OpenFont",
                    [ :string, :int        ], :pointer

    attach_function :OpenFontIndex,   "TTF_OpenFontIndex",
                    [ :string, :int, :long ], :pointer

    attach_function :OpenFontRW,      "TTF_OpenFontRW",
                    [ :pointer, :int, :int ], :pointer

    attach_function :OpenFontIndexRW, "TTF_OpenFontIndexRW",
                    [ :pointer, :int, :int, :long ], :pointer


    STYLE_NORMAL    = 0x00
    STYLE_BOLD      = 0x01
    STYLE_ITALIC    = 0x02
    STYLE_UNDERLINE = 0x04


    attach_function :GetFontStyle, "TTF_GetFontStyle", [ :pointer ], :int
    attach_function :SetFontStyle, "TTF_SetFontStyle", [ :pointer,:int ], :void
    attach_function :FontHeight,   "TTF_FontHeight",   [ :pointer ], :int
    attach_function :FontAscent,   "TTF_FontAscent",   [ :pointer ], :int
    attach_function :FontDescent,  "TTF_FontDescent",  [ :pointer ], :int
    attach_function :FontLineSkip, "TTF_FontLineSkip", [ :pointer ], :int
    attach_function :FontFaces,    "TTF_FontFaces",    [ :pointer ], :long


    attach_function :FontFaceIsFixedWidth, "TTF_FontFaceIsFixedWidth", 
                    [ :pointer ], :int
    attach_function :FontFaceFamilyName,   "TTF_FontFaceFamilyName",   
                    [ :pointer ], :string
    attach_function :FontFaceStyleName,    "TTF_FontFaceStyleName",    
                    [ :pointer ], :string


    attach_function :GlyphMetrics, "TTF_GlyphMetrics", 
                    [ :pointer, :uint16, :pointer, 
                      :pointer, :pointer, :pointer, :pointer ], :int

    attach_function :SizeText,     "TTF_SizeText",
                    [ :pointer, :string, :pointer, :pointer ], :int

    attach_function :SizeUTF8,     "TTF_SizeUTF8",
                    [ :pointer, :string, :pointer, :pointer ], :int

    attach_function :SizeUNICODE,  "TTF_SizeUNICODE",
                    [ :pointer, :pointer, :pointer, :pointer ], :int


    attach_function :RenderText_Solid,      "TTF_RenderText_Solid",
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :RenderUTF8_Solid,      "TTF_RenderUTF8_Solid",
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :RenderUNICODE_Solid,   "TTF_RenderUNICODE_Solid",
                    [ :pointer, :pointer, SDL::Color ], :pointer

    attach_function :RenderGlyph_Solid,     "TTF_RenderGlyph_Solid",
                    [ :pointer, :uint16, SDL::Color ], :pointer


    attach_function :RenderText_Shaded,     "TTF_RenderText_Shaded",
                    [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    attach_function :RenderUTF8_Shaded,     "TTF_RenderUTF8_Shaded",
                    [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    attach_function :RenderUNICODE_Shaded,  "TTF_RenderUNICODE_Shaded",
                    [ :pointer, :pointer, SDL::Color, SDL::Color ], :pointer

    attach_function :RenderGlyph_Shaded,    "TTF_RenderGlyph_Shaded",
                    [ :pointer, :uint16, SDL::Color, SDL::Color ], :pointer


    attach_function :RenderText_Blended,    "TTF_RenderText_Blended",
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :RenderUTF8_Blended,    "TTF_RenderUTF8_Blended",
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :RenderUNICODE_Blended, "TTF_RenderUNICODE_Blended",
                    [ :pointer, :pointer, SDL::Color ], :pointer

    attach_function :RenderGlyph_Blended,   "TTF_RenderGlyph_Blended",
                    [ :pointer, :uint16, SDL::Color ], :pointer


    attach_function :CloseFont, "TTF_CloseFont", [ :pointer ], :void
    attach_function :Quit,      "TTF_Quit",      [          ], :void
    attach_function :WasInit,   "TTF_WasInit",   [          ], :int

  end
end
