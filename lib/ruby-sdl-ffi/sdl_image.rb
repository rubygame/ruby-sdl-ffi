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

module SDL
  module IMG
    extend FFI::Library

    case FFI::Platform::OS
    when /linux/
      ffi_lib "libSDL_image.so"
    else
      raise( "SDL_image is not supported on #{FFI::Platform::OS} yet.\n" +
             "Please report this and help us support more platforms." )
    end

    class << self
      private 

      # A convenience method to create a method :Whatever which
      # attaches to the C function "IMG_Whatever".
      # 
      # This is so the final result is IMG::Whatever(), instead of
      # IMG::IMG_Whatever().
      # 
      def img_function( sym, *rest )
        self.attach_function( sym, "IMG_#{sym}", *rest )
      end
    end

    img_function  :Linked_Version,   [                         ], :pointer
    img_function  :LoadTyped_RW,     [ :pointer, :int, :string ], :pointer
    img_function  :Load,             [ :string                 ], :pointer
    img_function  :Load_RW,          [ :pointer, :int          ], :pointer
    img_function  :InvertAlpha,      [ :int                    ], :int
    img_function  :isBMP,            [ :pointer                ], :int
    img_function  :isGIF,            [ :pointer                ], :int
    img_function  :isJPG,            [ :pointer                ], :int
    img_function  :isLBM,            [ :pointer                ], :int
    img_function  :isPCX,            [ :pointer                ], :int
    img_function  :isPNG,            [ :pointer                ], :int
    img_function  :isPNM,            [ :pointer                ], :int
    img_function  :isTIF,            [ :pointer                ], :int
    img_function  :isXCF,            [ :pointer                ], :int
    img_function  :isXPM,            [ :pointer                ], :int
    img_function  :isXV,             [ :pointer                ], :int
    img_function  :LoadBMP_RW,       [ :pointer                ], :pointer
    img_function  :LoadGIF_RW,       [ :pointer                ], :pointer
    img_function  :LoadJPG_RW,       [ :pointer                ], :pointer
    img_function  :LoadLBM_RW,       [ :pointer                ], :pointer
    img_function  :LoadPCX_RW,       [ :pointer                ], :pointer
    img_function  :LoadPNG_RW,       [ :pointer                ], :pointer
    img_function  :LoadPNM_RW,       [ :pointer                ], :pointer
    img_function  :LoadTGA_RW,       [ :pointer                ], :pointer
    img_function  :LoadTIF_RW,       [ :pointer                ], :pointer
    img_function  :LoadXCF_RW,       [ :pointer                ], :pointer
    img_function  :LoadXPM_RW,       [ :pointer                ], :pointer
    img_function  :LoadXV_RW,        [ :pointer                ], :pointer
    img_function  :ReadXPMFromArray, [ :pointer                ], :pointer

  end
end
