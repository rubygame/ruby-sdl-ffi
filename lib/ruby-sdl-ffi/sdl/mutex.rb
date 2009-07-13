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

  func  :CreateMutex,      "SDL_CreateMutex",      [          ], :pointer
  func  :mutexP,           "SDL_mutexP",           [ :pointer ], :int
  func  :mutexV,           "SDL_mutexV",           [ :pointer ], :int
  func  :DestroyMutex,     "SDL_DestroyMutex",     [ :pointer ], :void

  func  :CreateSemaphore,  "SDL_CreateSemaphore",  [ :uint32  ], :pointer
  func  :DestroySemaphore, "SDL_DestroySemaphore", [ :pointer ], :void

  func  :SemWait,          "SDL_SemWait",          [ :pointer ], :int
  func  :SemTryWait,       "SDL_SemTryWait",       [ :pointer ], :int
  func  :SemWaitTimeout,   "SDL_SemWaitTimeout",   [ :pointer, :uint32 ], :int
  func  :SemPost,          "SDL_SemPost",          [ :pointer ], :int
  func  :SemValue,         "SDL_SemValue",         [ :pointer ], :uint32

  func  :CreateCond,       "SDL_CreateCond",       [          ], :pointer
  func  :DestroyCond,      "SDL_DestroyCond",      [ :pointer ], :void
  func  :CondSignal,       "SDL_CondSignal",       [ :pointer ], :int
  func  :CondBroadcast,    "SDL_CondBroadcast",    [ :pointer ], :int
  func  :CondWait,         "SDL_CondWait",         [ :pointer, :pointer ], :int

  func  :CondWaitTimeout,  "SDL_CondWaitTimeout",
        [ :pointer, :pointer, :uint32  ], :int

end
