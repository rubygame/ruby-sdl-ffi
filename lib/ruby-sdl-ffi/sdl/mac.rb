#--
#
# This file is one part of:
#
# Ruby-SDL-FFI - Ruby-FFI bindings to SDL
#
# Copyright (c) 2010 John Croisant
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

#--
# A few bindings to Mac OS X's Cocoa framework to allow Ruby-SDL-FFI
# to create a window on Mac without a special Ruby interpreter (rsdl).
#
# Eternal thanks to erisdiscord and jlnr for pointing the way!

if FFI::Platform.mac?
  module SDL::Mac
    module Cocoa
      extend NiceFFI::Library
      load_library '/System/Library/Frameworks/Cocoa.framework/Cocoa'

      func :NSApplicationLoad, [], :char

      func :NSPushAutoreleasePool, [], :void
      func :NSPopAutoreleasePool, [], :void

      NSApplicationLoad()
      NSPushAutoreleasePool()
    end

    module HIServices
      extend NiceFFI::Library
      load_library '/System/Library/Frameworks/ApplicationServices.framework/Frameworks/HIServices.framework/HIServices'

      class ProcessSerialNumber < NiceFFI::Struct
        layout :highLongOfPSN, :ulong, :lowLongOfPSN, :ulong
      end

      # Some relevant constants (but not part of the same enum)
      KCurrentProcess = 2
      KProcessTransformToForegroundApplication = 1

      func :TransformProcessType, [:pointer, :long], :long
      func :SetFrontProcess, [:pointer], :long

      # Does the magic to make the current process a front process.
      def self.make_current_front
        current = ProcessSerialNumber.new( [0, KCurrentProcess] )
        TransformProcessType(current,KProcessTransformToForegroundApplication)
        SetFrontProcess( current )
      end
    end

  end
end
