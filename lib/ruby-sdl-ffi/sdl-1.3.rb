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


require 'nice-ffi'


module SDL
  extend NiceFFI::Library

  unless defined? SDL::LOAD_PATHS
    # Check if the application has defined SDL_PATHS with some
    # paths to check first for SDL libraries.
    SDL::LOAD_PATHS = if defined? ::SDL_PATHS
                        NiceFFI::PathSet::DEFAULT.prepend( ::SDL_PATHS )
                      else
                        NiceFFI::PathSet::DEFAULT
                      end
  end

  load_library ["SDL-1.3"], SDL::LOAD_PATHS


  class << self
    def sdl_func( name, args, ret )
      func name, "SDL_#{name}", args, ret
    end

    def char( str )
      return str.unpack("C").at(0)
    end
    private :char
  end

  # Aliases for integer-like types
  ENUM        = :int            # :nodoc:
  BOOL        = :int            # :nodoc:
  GLATTR      = :int            # :nodoc:
  WINDOWID    = :uint32         # :nodoc:
  SCANCODE    = :uint16         # :nodoc:
  KEY         = :int32          # :nodoc:
  MOD         = :uint16         # :nodoc:

end


this_dir = File.expand_path( File.dirname(__FILE__) )

# NOTE: keyboard and video are deliberately loaded early,
# because event and mouse depend on them, respectively.

%w{
  version
  scancode
  keysym
  keyboard
  video

  atomic
  audio
  compat
  cpuinfo
  error
  events
  haptic
  joystick
  loadso
  mouse
  mutex
  pixels
  platform
  power
  rect
  rwops
  sdl
  surface
  syswm
  thread
  timer
}.each do |f|
  require File.join( this_dir, "sdl-1.3", f )
end

# %w{
#   mixer
# }.each do |f|
#   require File.join( this_dir, "sdl-1.3", f )
# end

# %w{
#   opengles
#   opengl
# }.each do |f|
#   require File.join( this_dir, "sdl-1.3", f )
# end
