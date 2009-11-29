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


this_dir = File.expand_path( File.dirname(__FILE__) )


require File.join( this_dir, "sdl" )


module SDL
  module SVG
    extend NiceFFI::Library
    load_library "SDL_svg", SDL::LOAD_PATHS

    def self.svg_func( name, args, ret )
      func name, "SVG_#{name}", args, ret
    end

    SVG_FLAG_DIRECT = 0
    SVG_FLAG_COMPOSITE = 1

    class SVGContext < NiceFFI::OpaqueStruct
      def self.release( pointer)
        SVG.Free(pointer)
      end
    end

    svg_func :Free, [:pointer], :void

    svg_func :Version, [], :int
    svg_func :Load, [:string], SVGContext.typed_pointer
    svg_func :LoadBuffer, [:string, :int], SVGContext.typed_pointer

    svg_func :Width, [:pointer], :float
    svg_func :Height, [:pointer], :float

    svg_func :SetOffset, [:pointer, :double,:double], :int
    svg_func :SetClipping, [:pointer, :int,:int,:int,:int], :void
    svg_func :Set_Flags, [:pointer, :ulong], :void

    svg_func :SetScale, [:pointer, :double,:double], :int
    svg_func :RenderToSurface, [:pointer, :int,:int, :pointer], :int

  end
end
=begin
???
SDL_svg_context *create_SDL_svg_context(void);
void destroy_SDL_svg_context(SDL_svg_context *c);
=end

