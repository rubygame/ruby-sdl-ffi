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


    ttf_func  :Linked_Version, [  ], SDL::Version.typed_pointer



    class Font < NiceFFI::OpaqueStruct
      #--
      # TTF_Font struct (in C) has a hidden layout.
      #++
    end



    UNICODE_BOM_NATIVE  = 0xFEFF
    UNICODE_BOM_SWAPPED = 0xFFFE

    ttf_func  :ByteSwappedUNICODE, [ :int ], :void

    ttf_func  :Init, [ ], :int


    ttf_func  :OpenFont,        [ :string, :int ],
              Font.typed_pointer

    ttf_func  :OpenFontIndex,   [ :string, :int, :long ],
              Font.typed_pointer

    ttf_func  :OpenFontRW,      [ :pointer, :int, :int ],
              Font.typed_pointer

    ttf_func  :OpenFontIndexRW, [ :pointer, :int, :int, :long ],
              Font.typed_pointer


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



    func  :__GlyphMetrics, "TTF_GlyphMetrics",
          [ :pointer, :uint16, :pointer, :pointer,
            :pointer, :pointer, :pointer ], :int

    # Returns:: [minx, maxx, miny, maxy, advance], or nil on failure.
    # 
    def self.GlyphMetrics( font, char )
      minx, maxx = FFI::MemoryPointer.new(:int), FFI::MemoryPointer.new(:int)
      miny, maxy = FFI::MemoryPointer.new(:int), FFI::MemoryPointer.new(:int)
      advance = FFI::MemoryPointer.new(:int)
      result = __GlyphMetrics( font, char, minx, maxx, miny, maxy, advance )
      if( result == 0 )
        return [minx.get_int(0), maxx.get_int(0),
                miny.get_int(0), maxy.get_int(0), advance.get_int(0)]
      else
        nil
      end
    end



    func  :__SizeText, "TTF_SizeText",
          [ :pointer, :string, :pointer, :pointer  ], :int

    def self.SizeText( font, text )
      w = FFI::MemoryPointer.new( :int )
      h = FFI::MemoryPointer.new( :int )
      __SizeText( font, text, w, h )
      return [w.get_int(0),h.get_int(0)]
    end



    func  :__SizeUTF8, "TTF_SizeUTF8",
          [ :pointer, :string, :pointer, :pointer  ], :int

    def self.SizeUTF( font, text )
      w = FFI::MemoryPointer.new( :int )
      h = FFI::MemoryPointer.new( :int )
      __SizeUTF( font, text, w, h )
      return [w.get_int(0),h.get_int(0)]
    end



    func  :__SizeUNICODE, "TTF_SizeUNICODE",
          [ :pointer, :pointer, :pointer, :pointer  ], :int

    def self.SizeUNICODE( font, text )
      w = FFI::MemoryPointer.new( :int )
      h = FFI::MemoryPointer.new( :int )
      __SizeUNICODE( font, text, w, h )
      return [w.get_int(0),h.get_int(0)]
    end



    %w{ Text UTF8 UNICODE Glyph }.each do |text_type|
      
      %w{ Solid Blended }.each do |render_mode|
        
        name = "Render#{text_type}_#{render_mode}"
        
        module_eval <<EOF
          func  :__#{name}, "TTF_#{name}", [ :pointer, :string, :uint32 ],
                SDL::Surface.typed_pointer
          
          def self.#{name}( font, text, color )
            color = color.pointer.get_uint32(0)
            __#{name}( font, text, color )
          end
EOF
      end
      
      
      name = "Render#{text_type}_Shaded"
      
      module_eval <<EOF
        func  :__#{name}, "TTF_#{name}",
              [ :pointer, :string, :uint32, :uint32 ],
              SDL::Surface.typed_pointer 
        
        def self.#{name}( font, text, color, back )
          color = color.pointer.get_uint32(0)
          back = back.pointer.get_uint32(0)
          __#{name}( font, text, color, back )
        end
EOF
    end
 
 
#     ttf_func  :RenderText_Solid,
#               [ :pointer, :string, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#
#     ttf_func  :RenderText_Solid,
#               [ :pointer, :string, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderUTF8_Solid,
#               [ :pointer, :string, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderUNICODE_Solid,
#               [ :pointer, :pointer, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderGlyph_Solid,
#               [ :pointer, :uint16, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#
#     ttf_func  :RenderText_Shaded,
#               [ :pointer, :string, SDL::Color, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderUTF8_Shaded,
#               [ :pointer, :string, SDL::Color, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderUNICODE_Shaded,
#               [ :pointer, :pointer, SDL::Color, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderGlyph_Shaded,
#               [ :pointer, :uint16, SDL::Color, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#
#     ttf_func  :RenderText_Blended,
#               [ :pointer, :string, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderUTF8_Blended,
#               [ :pointer, :string, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderUNICODE_Blended,
#               [ :pointer, :pointer, SDL::Color ],
#               SDL::Surface.typed_pointer
#
#     ttf_func  :RenderGlyph_Blended,
#               [ :pointer, :uint16, SDL::Color ],
#               SDL::Surface.typed_pointer


    ttf_func  :CloseFont, [ :pointer ], :void
    ttf_func  :Quit,      [          ], :void
    ttf_func  :WasInit,   [          ], :int

  end
end
