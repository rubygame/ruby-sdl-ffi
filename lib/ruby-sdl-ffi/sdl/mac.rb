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
# Some bindings to Mac OS X system framework to allow Ruby-SDL-FFI
# to create a window on Mac without a special Ruby interpreter (rsdl).
# These are for internal use only. They are NOT part of the API.
#
# Eternal thanks to erisdiscord and jlnr for pointing the way!


# Only define this stuff if running on a Mac and not using rsdl and
# the RUBYSDLFFI_NOCOCOA environment variable is not true-ish.
if FFI::Platform.mac? and ($0 != "rsdl") and \
  not (/^(1|t|true|y|yes)$/i =~ ENV["RUBYSDLFFI_NOCOCOA"])

  module SDL::Mac

    def self.inspect_menu( menu, indent=0 )
      classname = ObjC.object_getClassName( menu )
      numitems = ObjC.msgSend_i( menu, "numberOfItems" )
      title = ObjC.msgSend_s( menu, "title" )
      puts (" "*indent + "- #{menu}  (#{classname} \"#{title}\", #{numitems} items)")

      numitems.times do |i|
        ob = ObjC.msgSend( menu, "itemAtIndex:", FFI.find_type(:long), i )
        classname = ObjC.object_getClassName(ob)
        if ObjC.msgSend_b(ob, "hasSubmenu")
          submenu = ObjC.msgSend(ob, "submenu")
          inspect_menu( submenu, indent+2 )
        else
          title = ObjC.msgSend_s( ob, "title" )
          puts (" "*(indent+2) + "- #{ob}  (#{classname} \"#{title}\")")
        end
      end
    end


    def self.make_menus( new_title )
      ptr = FFI.find_type(:pointer)

      nsapp = Cocoa.NSApp

      menubar = ObjC.msgSend( ObjC.getClass("NSMenu"), "alloc" )
      ObjC.msgSend( menubar, "initWithTitle:",
                    ptr, ObjC::NSString.new("AMainMenu") )
      ObjC.msgSend(nsapp, "setMainMenu:", ptr, menubar )


      appledummy = ObjC.msgSend( ObjC.getClass("NSMenuItem"), "alloc" )
      ObjC.msgSend( appledummy, "initWithTitle:action:keyEquivalent:",
                    ptr, ObjC::NSString.new("Apple"),
                    ptr, nil,
                    ptr, ObjC::NSString.new(""))
      applemenu = ObjC.msgSend( ObjC.getClass("NSMenu"), "alloc" )
      ObjC.msgSend( applemenu, "initWithTitle:",
                    ptr, ObjC::NSString.new("Apple") )
      ObjC.msgSend( appledummy, "setSubmenu:", ptr, applemenu )
      ObjC.msgSend( menubar, "addItem:", ptr, appledummy)
      ObjC.msgSend(nsapp, "setAppleMenu:", ptr, applemenu )

      appledummy2 = ObjC.msgSend( ObjC.getClass("NSMenuItem"), "alloc" )
      ObjC.msgSend( appledummy2, "initWithTitle:action:keyEquivalent:",
                    ptr, ObjC::NSString.new("Apple Item"),
                    ptr, nil,
                    ptr, ObjC::NSString.new(""))
      ObjC.msgSend( applemenu, "addItem:", ptr, appledummy2 )


      appdummy = ObjC.msgSend( ObjC.getClass("NSMenuItem"), "alloc" )
      ObjC.msgSend( appdummy, "initWithTitle:action:keyEquivalent:",
                    ptr, ObjC::NSString.new(new_title),
                    ptr, nil,
                    ptr, ObjC::NSString.new(""))
      appmenu = ObjC.msgSend( ObjC.getClass("NSMenu"), "alloc" )
      ObjC.msgSend( appmenu, "initWithTitle:",
                    ptr, ObjC::NSString.new(new_title) )
      ObjC.msgSend( appdummy, "setSubmenu:", ptr, appmenu )
      ObjC.msgSend( menubar, "insertItem:atIndex:", ptr, appdummy, FFI.find_type(:int), 0 )
      ObjC.msgSend( appdummy, "release" )

      appdummy2 = ObjC.msgSend( ObjC.getClass("NSMenuItem"), "alloc" )
      ObjC.msgSend( appdummy2, "initWithTitle:action:keyEquivalent:",
                    ptr, ObjC::NSString.new("App Item"),
                    ptr, nil,
                    ptr, ObjC::NSString.new(""))
      ObjC.msgSend( appmenu, "addItem:", ptr, appdummy2 )


      windowdummy = ObjC.msgSend( ObjC.getClass("NSMenuItem"), "alloc" )
      ObjC.msgSend( windowdummy, "initWithTitle:action:keyEquivalent:",
                    ptr, ObjC::NSString.new("Window"),
                    ptr, nil,
                    ptr, ObjC::NSString.new(""))
      windowmenu = ObjC.msgSend( ObjC.getClass("NSMenu"), "alloc" )
      ObjC.msgSend( windowmenu, "initWithTitle:",
                    ptr, ObjC::NSString.new("Window") )
      ObjC.msgSend( windowdummy, "setSubmenu:", ptr, windowmenu )
      ObjC.msgSend( menubar, "addItem:", ptr, windowdummy )
      ObjC.msgSend( windowdummy, "release" )

      windowdummy2 = ObjC.msgSend( ObjC.getClass("NSMenuItem"), "alloc" )
      ObjC.msgSend( windowdummy2, "initWithTitle:action:keyEquivalent:",
                    ptr, ObjC::NSString.new("Window Item"),
                    ptr, nil,
                    ptr, ObjC::NSString.new(""))
      ObjC.msgSend( windowmenu, "addItem:", ptr, windowdummy2 )
      

      ObjC.msgSend(nsapp, "setWindowsMenu:", ptr, windowmenu )


      inspect_menu( menubar )


      nil
    end


    # Sets the application menu title on Mac OS X, i.e. the bold word
    # in the application menu at the top of the screen.
    # 
    def self.set_app_title( new_title )
      ptr = FFI.find_type(:pointer)
      long = FFI.find_type(:long)

      nsapp = Cocoa.NSApp

      menubar = ObjC.msgSend( nsapp, "mainMenu" )
      inspect_menu( menubar )

      appdummy = ObjC.msgSend( menubar, "itemAtIndex:", long, 0 )
      appmenu = ObjC.msgSend( appdummy, "submenu" )
      ObjC.msgSend( appmenu, "setTitle:", ptr, ObjC::NSString.new(new_title) )
      inspect_menu( appmenu )
      ObjC.msgSend( menubar, "itemChanged:", ptr, appdummy )

      # windowdummy = ObjC.msgSend( menubar, "itemAtIndex:", long, 1 )
      # windowmenu = ObjC.msgSend( windowdummy, "submenu" )
      # ObjC.msgSend( windowmenu, "setTitle:", ptr, ObjC::NSString.new(new_title) )
      # inspect_menu( windowmenu )

      ObjC.msgSend( menubar, "update" )

      # ObjC.msgSend( menubar, "removeItemAtIndex:", long, 0 )
      # inspect_menu( menubar )
      
      nil
    end


    def self.load_nib( nibpath = :default )
      ptr = FFI.find_type(:pointer)
      long = FFI.find_type(:long)

      if nibpath == :default
        nibpath = File.join( File.dirname(__FILE__), "MacMenu.nib" )
        #nibpath = File.join( File.dirname(__FILE__), "SparseMacMenu.nib" )
        #nibpath = File.join( File.dirname(__FILE__), "EmptyMacMenu.nib" )
      end
      
      nsapp = Cocoa.NSApp
      toplevel = ObjC.msgSend( ObjC.getClass("NSMutableArray"), "array" )
      puts "toplevel = #{toplevel}"

      dict = ObjC.msgSend(ObjC.getClass("NSMutableDictionary"), "dictionary")
      ObjC.msgSend( dict, "setObject:forKey:",
                    ptr, nsapp, ptr, Cocoa::NSNibOwner )
      ObjC.msgSend( dict, "setObject:forKey:",
                    ptr, toplevel, ptr, Cocoa::NSNibTopLevelObjects )

      zone = ObjC.msgSend(nsapp, "zone")

      loaded = ObjC.msgSend_b( ObjC.getClass("NSBundle"),
                               "loadNibFile:externalNameTable:withZone:",
                               ptr, ObjC::NSString.new(nibpath),
                               ptr, dict,
                               ptr, zone )

      puts "loaded? = #{loaded}"
      puts "toplevel = #{ObjC.msgSend_s(toplevel, "description")}"

      count = ObjC.msgSend_i( toplevel, "count" )

      menubar = nil
      app = nil
      count.times do |i|
        ob = ObjC.msgSend( toplevel, "objectAtIndex:", long, i )
        case ObjC.object_getClassName(ob)
        when "NSMenu"; menubar = ob
        when "NSApplication"; app = ob
        end
      end

      puts "Loaded menubar:"
      inspect_menu( menubar )

      nil
    end


    module ObjC
      extend NiceFFI::Library
      load_library 'objc'

      typedef :pointer, :id
      typedef :pointer, :sel
      typedef :pointer, :ivar
      typedef :pointer, :nsclass
      callback :imp, [:id, :sel, :varargs], :id

      class NSString < NiceFFI::OpaqueStruct
        def initialize( str_or_ptr )
          if str_or_ptr.is_a? String
            super( ObjC.msgSend( ObjC.getClass("NSString"),
                                 "stringWithUTF8String:",
                                 FFI.find_type(:string), str_or_ptr ) )
          else
            super
          end
        end

        def to_s
          str = ObjC.msgSend( @pointer, "UTF8String" )
          (str.null?) ? "(NULL)" : str.read_string()
        end
      end

      func :__msgSend, :objc_msgSend, [:id, :sel, :varargs], :id
      func :__msgSend_i, :objc_msgSend, [:id, :sel, :varargs], :long

      def self.msgSend( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        __msgSend( id, selector, *args )
      end

      def self.msgSend_s( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        NSString.new( __msgSend( id, selector, *args ) )
      end

      def self.msgSend_i( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        __msgSend_i( id, selector, *args )
      end

      def self.msgSend_b( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        ( __msgSend_i( id, selector, *args ) == 0 ) ? false : true
      end

      func :getClass, :objc_getClass, [:string], :id

      func :class_replaceMethod, [:nsclass, :sel, :imp, :string], :imp

      func :object_getClassName, [:id], :string

      func :object_getInstanceVariable, [:id, :string, :pointer], :ivar
      func :object_setInstanceVariable, [:id, :string, :pointer], :ivar

      func :sel_registerName, [:string], :sel
      func :sel_getName, [:sel], NSString.typed_pointer

      def self.sel( name )
        sel_registerName( name.to_s )
      end

    end


    module Cocoa
      extend NiceFFI::Library
      load_library '/System/Library/Frameworks/Cocoa.framework/Cocoa'

      func :NSApplicationLoad, [], :bool

      func :NSPushAutoreleasePool, [], :void
      func :NSPopAutoreleasePool, [], :void

      NSApplicationLoad()
      NSPushAutoreleasePool()

      def self.NSApp
        @nsapp ||= ObjC.msgSend(ObjC.getClass("NSApplication"), "sharedApplication")
      end

      attach_variable "vNSNibOwner", "NSNibOwner", :pointer
      NSNibOwner =
        ObjC::NSString.new( ObjC::NSString.new(self.vNSNibOwner).to_s )

      attach_variable "vNSNibTopLevelObjects", "NSNibTopLevelObjects", :pointer
      NSNibTopLevelObjects =
        ObjC::NSString.new( ObjC::NSString.new(self.vNSNibTopLevelObjects).to_s )

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


    # def self.set_terminate_handler()
    #   imp = proc{ |id, sel, *args|
    #     p id
    #     p sel
    #     p *args
    #   }
    #
    #   old = ObjC.class_replaceMethod( ObjC.getClass("NSApplication"),
    #                                   "terminate:", imp, "v@:@" )
    # end

    # set_terminate_handler()

  end
end
