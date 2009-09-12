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
require 'need'
need { "sdl" }


module SDL
  module Image
    extend NiceFFI::Library
    load_library "SDL_image"


    def self.img_func( name, args, ret )
      func name, "IMG_#{name}", args, ret
    end


    img_func  :Linked_Version, [], SDL::Version.typed_pointer


    img_func  :LoadTyped_RW, [ :pointer, :int, :string ],
              SDL::Surface.typed_pointer

    img_func  :Load,    [ :string        ], SDL::Surface.typed_pointer
    img_func  :Load_RW, [ :pointer, :int ], SDL::Surface.typed_pointer


    img_func  :InvertAlpha, [ :int     ], :int


    img_func  :isBMP, [ :pointer ], :int
    img_func  :isGIF, [ :pointer ], :int
    img_func  :isJPG, [ :pointer ], :int
    img_func  :isLBM, [ :pointer ], :int
    img_func  :isPCX, [ :pointer ], :int
    img_func  :isPNG, [ :pointer ], :int
    img_func  :isPNM, [ :pointer ], :int
    img_func  :isTIF, [ :pointer ], :int
    img_func  :isXCF, [ :pointer ], :int
    img_func  :isXPM, [ :pointer ], :int
    img_func  :isXV,  [ :pointer ], :int


    img_func  :LoadBMP_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadGIF_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadJPG_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadLBM_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadPCX_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadPNG_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadPNM_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadTGA_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadTIF_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadXCF_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadXPM_RW, [ :pointer ], SDL::Surface.typed_pointer
    img_func  :LoadXV_RW,  [ :pointer ], SDL::Surface.typed_pointer


    img_func  :ReadXPMFromArray, [ :pointer ], SDL::Surface.typed_pointer

  end
end
