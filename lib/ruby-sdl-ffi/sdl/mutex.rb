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


module SDL

  MUTEX_TIMEDOUT = 1

  sdl_func  :CreateMutex,      [                             ], :pointer
  sdl_func  :mutexP,           [ :pointer                    ], :int
  sdl_func  :mutexV,           [ :pointer                    ], :int
  sdl_func  :DestroyMutex,     [ :pointer                    ], :void

  sdl_func  :CreateSemaphore,  [ :uint32                     ], :pointer
  sdl_func  :DestroySemaphore, [ :pointer                    ], :void

  sdl_func  :SemWait,          [ :pointer                    ], :int
  sdl_func  :SemTryWait,       [ :pointer                    ], :int
  sdl_func  :SemWaitTimeout,   [ :pointer, :uint32           ], :int
  sdl_func  :SemPost,          [ :pointer                    ], :int
  sdl_func  :SemValue,         [ :pointer                    ], :uint32

  sdl_func  :CreateCond,       [                             ], :pointer
  sdl_func  :DestroyCond,      [ :pointer                    ], :void
  sdl_func  :CondSignal,       [ :pointer                    ], :int
  sdl_func  :CondBroadcast,    [ :pointer                    ], :int
  sdl_func  :CondWait,         [ :pointer, :pointer          ], :int

  sdl_func  :CondWaitTimeout,  [ :pointer, :pointer, :uint32 ], :int

end
