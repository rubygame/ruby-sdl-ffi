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
  module Raw
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

      attach_function :IMG_Linked_Version, [  ], :pointer
      attach_function :IMG_LoadTyped_RW, [ :pointer, :int, :string ], :pointer
      attach_function :IMG_Load,           [ :string        ], :pointer
      attach_function :IMG_Load_RW,        [ :pointer, :int ], :pointer
      attach_function :IMG_InvertAlpha,    [ :int     ], :int
      attach_function :IMG_isBMP,          [ :pointer ], :int
      attach_function :IMG_isGIF,          [ :pointer ], :int
      attach_function :IMG_isJPG,          [ :pointer ], :int
      attach_function :IMG_isLBM,          [ :pointer ], :int
      attach_function :IMG_isPCX,          [ :pointer ], :int
      attach_function :IMG_isPNG,          [ :pointer ], :int
      attach_function :IMG_isPNM,          [ :pointer ], :int
      attach_function :IMG_isTIF,          [ :pointer ], :int
      attach_function :IMG_isXCF,          [ :pointer ], :int
      attach_function :IMG_isXPM,          [ :pointer ], :int
      attach_function :IMG_isXV,           [ :pointer ], :int
      attach_function :IMG_LoadBMP_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadGIF_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadJPG_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadLBM_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadPCX_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadPNG_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadPNM_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadTGA_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadTIF_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadXCF_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadXPM_RW,     [ :pointer ], :pointer
      attach_function :IMG_LoadXV_RW,      [ :pointer ], :pointer
      attach_function :IMG_ReadXPMFromArray, [ :pointer ], :pointer

    end
  end
end
