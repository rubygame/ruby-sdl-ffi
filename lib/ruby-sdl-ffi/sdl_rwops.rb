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


module SDL

  class RWopsHiddenStdio < FFI::Struct
     layout(
            :autoclose, :int,
            :fp, :pointer
    )
  end


  class RWopsHiddenMem < FFI::Struct
    layout(
           :base, :pointer,
           :here, :pointer,
           :stop, :pointer
    )
  end


  class RWopsHiddenUnknown < FFI::Struct
    layout(
           :data1, :pointer
    )
  end


  class RWopsHidden < FFI::Union
    layout(
           :stdio, SDL::RWopsHiddenStdio,
           :mem, SDL::RWopsHiddenMem,
           :unknown, SDL::RWopsHiddenUnknown
    )
  end


  class RWops < FFI::Struct
    layout(
           :seek, SDL::callback(:rwops_seek_cb, [ :pointer, :int, :int ], :int),
           :read, SDL::callback(:rwops_read_cb, [ :pointer, :pointer, :int, :int ], :int),
           :write, SDL::callback(:rwops_write_cb, [ :pointer, :pointer, :int, :int ], :int),
           :close, SDL::callback(:rwops_close_cb, [ :pointer ], :int),
           :type, :uint32,
           :hidden, SDL::RWopsHidden
    )
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

  attach_sdl_function :RWFromFile, [ :string, :string ], :pointer
  attach_sdl_function :RWFromFP, [ :pointer, :int ], :pointer
  attach_sdl_function :RWFromMem, [ :pointer, :int ], :pointer
  attach_sdl_function :RWFromConstMem, [ :pointer, :int ], :pointer
  attach_sdl_function :AllocRW, [  ], :pointer
  attach_sdl_function :FreeRW, [ :pointer ], :void

  RW_SEEK_SET = 0
  RW_SEEK_CUR = 1
  RW_SEEK_END = 2

  attach_sdl_function :ReadLE16, [ :pointer ], :uint16
  attach_sdl_function :ReadBE16, [ :pointer ], :uint16
  attach_sdl_function :ReadLE32, [ :pointer ], :uint32
  attach_sdl_function :ReadBE32, [ :pointer ], :uint32
  attach_sdl_function :ReadLE64, [ :pointer ], :uint64
  attach_sdl_function :ReadBE64, [ :pointer ], :uint64
  attach_sdl_function :WriteLE16, [ :pointer, :uint16 ], :int
  attach_sdl_function :WriteBE16, [ :pointer, :uint16 ], :int
  attach_sdl_function :WriteLE32, [ :pointer, :uint32 ], :int
  attach_sdl_function :WriteBE32, [ :pointer, :uint32 ], :int
  attach_sdl_function :WriteLE64, [ :pointer, :uint64 ], :int
  attach_sdl_function :WriteBE64, [ :pointer, :uint64 ], :int

end
