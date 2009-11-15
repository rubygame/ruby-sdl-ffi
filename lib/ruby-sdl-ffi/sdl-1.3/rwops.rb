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

  RW_SEEK_SET = 0
  RW_SEEK_CUR = 1
  RW_SEEK_END = 2


  class RWopsHiddenMem < NiceFFI::Struct
    layout( :base, :pointer,
            :here, :pointer,
            :stop, :pointer )
  end


  class RWopsHiddenUnknown < NiceFFI::Struct
    layout( :data1, :pointer )
  end


  class RWopsHidden < FFI::Union
    layout( :unknown, RWopsHiddenUnknown,
            :mem,     RWopsHiddenMem )
  end

  class RWops < NiceFFI::Struct
    layout( :seek,   callback([:pointer, :long, :int], :long),
            :read,   callback([:pointer, :pointer, :uint, :uint], :size_t),
            :write,  callback([:pointer, :pointer, :uint, :uint], :size_t),
            :close,  callback([:pointer], :int),
            :type,   :uint32,
            :hidden, RWopsHidden )

    def seek=(cb)
      @seek = cb
      self[:seek] = @seek
    end

    def seek
      @seek
    end

    def read=(cb)
      @read = cb
      self[:read] = @read
    end

    def read
      @read
    end

    def write=(cb)
      @write = cb
      self[:write] = @write
    end

    def write
      @write
    end

    def close=(cb)
      @close = cb
      self[:close] = @close
    end

    def close
      @close
    end
  end


  sdl_func :RWFromFile,     [ :string, :string ], :pointer
  sdl_func :RWFromMem,      [ :pointer, :int   ], :pointer
  sdl_func :RWFromConstMem, [ :pointer, :int   ], :pointer

  sdl_func :AllocRW, [          ], :pointer
  sdl_func :FreeRW,  [ :pointer ], :void

  sdl_func :ReadLE16, [ :pointer ], :uint16
  sdl_func :ReadBE16, [ :pointer ], :uint16
  sdl_func :ReadLE32, [ :pointer ], :uint32
  sdl_func :ReadBE32, [ :pointer ], :uint32
  sdl_func :ReadLE64, [ :pointer ], :uint64
  sdl_func :ReadBE64, [ :pointer ], :uint64

  sdl_func :WriteLE16, [ :pointer, :uint16 ], :uint
  sdl_func :WriteBE16, [ :pointer, :uint16 ], :uint
  sdl_func :WriteLE32, [ :pointer, :uint32 ], :uint
  sdl_func :WriteBE32, [ :pointer, :uint32 ], :uint
  sdl_func :WriteLE64, [ :pointer, :uint64 ], :uint
  sdl_func :WriteBE64, [ :pointer, :uint64 ], :uint

end
