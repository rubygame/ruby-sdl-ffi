#--
#
# This file is one part of:
#
# FFI-SDL - Ruby-FFI bindings to SDL
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


module SDL
  extend FFI::Library

  case FFI::Platform::OS
  when /linux/
    ffi_lib "libSDL.so"
  else
    raise( "Your platform (#{FFI::Platform::OS}) is not supported yet.\n" +
           "Please report this and help us support more platforms." )
  end
end


# NOTE: sdl_keyboard and sdl_video are deliberately loaded early,
# because sdl_event and sdl_mouse depend on them, respectively.

%w{
  sdl_shared
  sdl_keyboard
  sdl_video
  sdl_core
  sdl_active
  sdl_audio
  sdl_cdrom
  sdl_cpuinfo
  sdl_error
  sdl_event
  sdl_joystick
  sdl_keysyms
  sdl_loadso
  sdl_mouse
  sdl_mutex
  sdl_rwops
  sdl_thread
  sdl_timer
}.each do |f|
  require File.join( File.dirname(__FILE__), f )
end
