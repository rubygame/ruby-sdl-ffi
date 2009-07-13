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
  module Image
    extend NiceFFI::Library
    load_library "SDL_image"


    func  :Linked_Version, "IMG_Linked_Version", [], SDL::Version.typed_pointer


    func  :LoadTyped_RW, "IMG_LoadTyped_RW",
          [ :pointer, :int, :string ], SDL::Surface.typed_pointer

    func  :Load, "IMG_Load", [ :string ], SDL::Surface.typed_pointer

    func  :Load_RW, "IMG_Load_RW", [ :pointer, :int ],
          SDL::Surface.typed_pointer


    func  :InvertAlpha, "IMG_InvertAlpha", [ :int     ], :int


    func  :isBMP, "IMG_isBMP", [ :pointer ], :int
    func  :isGIF, "IMG_isGIF", [ :pointer ], :int
    func  :isJPG, "IMG_isJPG", [ :pointer ], :int
    func  :isLBM, "IMG_isLBM", [ :pointer ], :int
    func  :isPCX, "IMG_isPCX", [ :pointer ], :int
    func  :isPNG, "IMG_isPNG", [ :pointer ], :int
    func  :isPNM, "IMG_isPNM", [ :pointer ], :int
    func  :isTIF, "IMG_isTIF", [ :pointer ], :int
    func  :isXCF, "IMG_isXCF", [ :pointer ], :int
    func  :isXPM, "IMG_isXPM", [ :pointer ], :int
    func  :isXV,  "IMG_isXV",  [ :pointer ], :int


    func  :LoadBMP_RW, "IMG_LoadBMP_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadGIF_RW, "IMG_LoadGIF_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadJPG_RW, "IMG_LoadJPG_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadLBM_RW, "IMG_LoadLBM_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadPCX_RW, "IMG_LoadPCX_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadPNG_RW, "IMG_LoadPNG_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadPNM_RW, "IMG_LoadPNM_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadTGA_RW, "IMG_LoadTGA_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadTIF_RW, "IMG_LoadTIF_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadXCF_RW, "IMG_LoadXCF_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadXPM_RW, "IMG_LoadXPM_RW",
          [ :pointer ], SDL::Surface.typed_pointer

    func  :LoadXV_RW,  "IMG_LoadXV_RW",
          [ :pointer ], SDL::Surface.typed_pointer


    func  :ReadXPMFromArray, "IMG_ReadXPMFromArray",
          [ :pointer ], SDL::Surface.typed_pointer

  end
end
