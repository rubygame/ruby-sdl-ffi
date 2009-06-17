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


require "ffi"

# For SDL::Color
require File.join( File.dirname(__FILE__), "sdl_video" )

module SDL
  module TTF
    extend FFI::Library

    case FFI::Platform::OS
    when /linux/
      ffi_lib "libSDL_ttf.so"
    else
      raise( "SDL_ttf is not supported on #{FFI::Platform::OS} yet.\n" +
             "Please report this and help us support more platforms." )
    end

    class << self
      private 

      # A convenience method to create a method :Whatever which
      # attaches to the C function "TTF_Whatever".
      # 
      # This is so the final result is TTF::Whatever(), instead of
      # TTF::TTF_Whatever().
      # 
      def ttf_function( sym, *rest )
        self.attach_function( sym, "TTF_#{sym}", *rest )
      end
    end


    ttf_function :Linked_Version, [  ], :pointer

    UNICODE_BOM_NATIVE  = 0xFEFF
    UNICODE_BOM_SWAPPED = 0xFFFE

    ttf_function :ByteSwappedUNICODE, [ :int ], :void
    ttf_function :Init, [  ], :int
    ttf_function :OpenFont, [ :string, :int ], :pointer
    ttf_function :OpenFontIndex, [ :string, :int, :long ], :pointer
    ttf_function :OpenFontRW, [ :pointer, :int, :int ], :pointer
    ttf_function :OpenFontIndexRW, [ :pointer, :int, :int, :long ], :pointer

    STYLE_NORMAL    = 0x00
    STYLE_BOLD      = 0x01
    STYLE_ITALIC    = 0x02
    STYLE_UNDERLINE = 0x04

    ttf_function :GetFontStyle, [ :pointer ], :int
    ttf_function :SetFontStyle, [ :pointer, :int ], :void
    ttf_function :FontHeight, [ :pointer ], :int
    ttf_function :FontAscent, [ :pointer ], :int
    ttf_function :FontDescent, [ :pointer ], :int
    ttf_function :FontLineSkip, [ :pointer ], :int
    ttf_function :FontFaces, [ :pointer ], :long
    ttf_function :FontFaceIsFixedWidth, [ :pointer ], :int
    ttf_function :FontFaceFamilyName, [ :pointer ], :string
    ttf_function :FontFaceStyleName, [ :pointer ], :string
    ttf_function :GlyphMetrics, [ :pointer, :uint16, :pointer, :pointer, :pointer, :pointer, :pointer ], :int
    ttf_function :SizeText, [ :pointer, :string, :pointer, :pointer ], :int
    ttf_function :SizeUTF8, [ :pointer, :string, :pointer, :pointer ], :int
    ttf_function :SizeUNICODE, [ :pointer, :pointer, :pointer, :pointer ], :int
    ttf_function :RenderText_Solid, [ :pointer, :string, SDL::Color ], :pointer
    ttf_function :RenderUTF8_Solid, [ :pointer, :string, SDL::Color ], :pointer
    ttf_function :RenderUNICODE_Solid, [ :pointer, :pointer, SDL::Color ], :pointer
    ttf_function :RenderGlyph_Solid, [ :pointer, :uint16, SDL::Color ], :pointer
    ttf_function :RenderText_Shaded, [ :pointer, :string, SDL::Color, SDL::Color ], :pointer
    ttf_function :RenderUTF8_Shaded, [ :pointer, :string, SDL::Color, SDL::Color ], :pointer
    ttf_function :RenderUNICODE_Shaded, [ :pointer, :pointer, SDL::Color, SDL::Color ], :pointer
    ttf_function :RenderGlyph_Shaded, [ :pointer, :uint16, SDL::Color, SDL::Color ], :pointer
    ttf_function :RenderText_Blended, [ :pointer, :string, SDL::Color ], :pointer
    ttf_function :RenderUTF8_Blended, [ :pointer, :string, SDL::Color ], :pointer
    ttf_function :RenderUNICODE_Blended, [ :pointer, :pointer, SDL::Color ], :pointer
    ttf_function :RenderGlyph_Blended, [ :pointer, :uint16, SDL::Color ], :pointer
    ttf_function :CloseFont, [ :pointer ], :void
    ttf_function :Quit, [  ], :void
    ttf_function :WasInit, [  ], :int

  end
end
