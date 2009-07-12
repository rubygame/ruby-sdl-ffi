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


    attach_function :Linked_Version, "IMG_Linked_Version",
                    [ ], NiceFFI::TypedPointer( SDL::Version )


    attach_function :LoadTyped_RW, "IMG_LoadTyped_RW",
                    [ :pointer, :int, :string ],
                    NiceFFI::TypedPointer( SDL::Surface )

    attach_function :Load, "IMG_Load",
                    [ :string ], NiceFFI::TypedPointer( SDL::Surface )

    attach_function :Load_RW, "IMG_Load_RW", [ :pointer, :int ],
                    NiceFFI::TypedPointer( SDL::Surface )


    attach_function :InvertAlpha, "IMG_InvertAlpha", [ :int     ], :int


    attach_function :isBMP, "IMG_isBMP", [ :pointer ], :int
    attach_function :isGIF, "IMG_isGIF", [ :pointer ], :int
    attach_function :isJPG, "IMG_isJPG", [ :pointer ], :int
    attach_function :isLBM, "IMG_isLBM", [ :pointer ], :int
    attach_function :isPCX, "IMG_isPCX", [ :pointer ], :int
    attach_function :isPNG, "IMG_isPNG", [ :pointer ], :int
    attach_function :isPNM, "IMG_isPNM", [ :pointer ], :int
    attach_function :isTIF, "IMG_isTIF", [ :pointer ], :int
    attach_function :isXCF, "IMG_isXCF", [ :pointer ], :int
    attach_function :isXPM, "IMG_isXPM", [ :pointer ], :int
    attach_function :isXV,  "IMG_isXV",  [ :pointer ], :int


    attach_function :LoadBMP_RW, "IMG_LoadBMP_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadGIF_RW, "IMG_LoadGIF_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadJPG_RW, "IMG_LoadJPG_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadLBM_RW, "IMG_LoadLBM_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadPCX_RW, "IMG_LoadPCX_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadPNG_RW, "IMG_LoadPNG_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadPNM_RW, "IMG_LoadPNM_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadTGA_RW, "IMG_LoadTGA_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadTIF_RW, "IMG_LoadTIF_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadXCF_RW, "IMG_LoadXCF_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadXPM_RW, "IMG_LoadXPM_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

    attach_function :LoadXV_RW,  "IMG_LoadXV_RW",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)


    attach_function :ReadXPMFromArray, "IMG_ReadXPMFromArray",
                    [ :pointer ], NiceFFI::TypedPointer(SDL::Surface)

  end
end
