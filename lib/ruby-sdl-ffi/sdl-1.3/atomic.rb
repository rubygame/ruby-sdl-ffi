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

  sdl_func :AtomicLock,                 [ :pointer          ], :void
  sdl_func :AtomicUnlock,               [ :pointer          ], :void
  sdl_func :AtomicTestThenSet32,        [ :pointer          ], BOOL
  sdl_func :AtomicClear32,              [ :pointer          ], :void
  sdl_func :AtomicFetchThenIncrement32, [ :pointer          ], :uint32
  sdl_func :AtomicFetchThenDecrement32, [ :pointer          ], :uint32
  sdl_func :AtomicFetchThenAdd32,       [ :pointer, :uint32 ], :uint32
  sdl_func :AtomicFetchThenSubtract32,  [ :pointer, :uint32 ], :uint32
  sdl_func :AtomicIncrementThenFetch32, [ :pointer          ], :uint32
  sdl_func :AtomicDecrementThenFetch32, [ :pointer          ], :uint32
  sdl_func :AtomicAddThenFetch32,       [ :pointer, :uint32 ], :uint32
  sdl_func :AtomicSubtractThenFetch32,  [ :pointer, :uint32 ], :uint32

end
