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


require 'ffi'
require 'need'
need { 'nicestruct' }

# For SDL::Color
need { 'sdl_video' }


module SDL
  module TTF
    extend FFI::Library
    SDL.load_library("SDL_ttf", self)


    attach_function :TTF_Linked_Version, [  ], :pointer


    UNICODE_BOM_NATIVE  = 0xFEFF
    UNICODE_BOM_SWAPPED = 0xFFFE


    attach_function :TTF_ByteSwappedUNICODE, [ :int ], :void


    attach_function :TTF_Init, [  ], :int


    attach_function :TTF_OpenFont,      [ :string, :int        ], :pointer
    attach_function :TTF_OpenFontIndex, [ :string, :int, :long ], :pointer
    attach_function :TTF_OpenFontRW,    [ :pointer, :int, :int ], :pointer

    attach_function :TTF_OpenFontIndexRW,
                    [ :pointer, :int, :int, :long ], :pointer


    STYLE_NORMAL    = 0x00
    STYLE_BOLD      = 0x01
    STYLE_ITALIC    = 0x02
    STYLE_UNDERLINE = 0x04


    attach_function :TTF_GetFontStyle,         [ :pointer       ], :int
    attach_function :TTF_SetFontStyle,         [ :pointer, :int ], :void
    attach_function :TTF_FontHeight,           [ :pointer       ], :int
    attach_function :TTF_FontAscent,           [ :pointer       ], :int
    attach_function :TTF_FontDescent,          [ :pointer       ], :int
    attach_function :TTF_FontLineSkip,         [ :pointer       ], :int
    attach_function :TTF_FontFaces,            [ :pointer       ], :long
    attach_function :TTF_FontFaceIsFixedWidth, [ :pointer       ], :int
    attach_function :TTF_FontFaceFamilyName,   [ :pointer       ], :string
    attach_function :TTF_FontFaceStyleName,    [ :pointer       ], :string


    attach_function :TTF_GlyphMetrics, 
                    [ :pointer, :uint16, :pointer, 
                      :pointer, :pointer, :pointer, :pointer ], :int

    attach_function :TTF_SizeText,
                    [ :pointer, :string, :pointer, :pointer ], :int

    attach_function :TTF_SizeUTF8,
                    [ :pointer, :string, :pointer, :pointer ], :int

    attach_function :TTF_SizeUNICODE,
                    [ :pointer, :pointer, :pointer, :pointer ], :int


    attach_function :TTF_RenderText_Solid,
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :TTF_RenderUTF8_Solid,
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :TTF_RenderUNICODE_Solid,
                    [ :pointer, :pointer, SDL::Color ], :pointer

    attach_function :TTF_RenderGlyph_Solid,
                    [ :pointer, :uint16, SDL::Color ], :pointer


    attach_function :TTF_RenderText_Shaded,
                    [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    attach_function :TTF_RenderUTF8_Shaded,
                    [ :pointer, :string, SDL::Color, SDL::Color ], :pointer

    attach_function :TTF_RenderUNICODE_Shaded,
                    [ :pointer, :pointer, SDL::Color, SDL::Color ], :pointer

    attach_function :TTF_RenderGlyph_Shaded,
                    [ :pointer, :uint16, SDL::Color, SDL::Color ], :pointer


    attach_function :TTF_RenderText_Blended,
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :TTF_RenderUTF8_Blended,
                    [ :pointer, :string, SDL::Color ], :pointer

    attach_function :TTF_RenderUNICODE_Blended,
                    [ :pointer, :pointer, SDL::Color ], :pointer

    attach_function :TTF_RenderGlyph_Blended,
                    [ :pointer, :uint16, SDL::Color ], :pointer


    attach_function :TTF_CloseFont, [ :pointer ], :void
    attach_function :TTF_Quit,      [          ], :void
    attach_function :TTF_WasInit,   [          ], :int

  end
end
