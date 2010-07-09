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

    def self.inspect_menu( menu, indent="" )
      puts "%s-%s  (%s \"%s\", %d items)"%[indent, menu, menu.classname,
                                           menu.title, menu.length]
      menu.each do |ob|
        if ob.hasSubmenu?
          inspect_menu( ob.submenu, indent+"  " )
        else
          puts "%s  -%s  (%s \"%s\")"%[indent, ob, ob.classname, ob.title]
        end
      end
    end


    def self.make_menus( new_title )
      ptr = FFI.find_type(:pointer)

      nsapp = Cocoa.NSApp

      menubar = Cocoa::NSMenu.new.initWithTitle("AMainMenu")
      nsapp.msg( "setMainMenu:", ptr, menubar )


      # "Apple" menu - actually the "ruby" menu, supposedly.
      appledummy = ObjC::NSMenuItem.new.initWithTitle("Apple")
      applemenu = Cocoa::NSMenu.new.initWithTitle("Apple")
      appledummy.submenu = applemenu
      menubar.addItem(appledummy)
      nsapp.msg( "setAppleMenu:", ptr, applemenu )

      appledummy2 = ObjC::NSMenuItem.new.initWithTitle("Apple Item")
      applemenu.addItem( appledummy2 )


      # A new menu with the app's name
      appdummy = ObjC::NSMenuItem.new.initWithTitle(new_title)
      appmenu = Cocoa::NSMenu.new.initWithTitle( new_title )
      appdummy.submenu = appmenu
      menubar.msg( "insertItem:atIndex:", ptr, appdummy, FFI.find_type(:int), 0 )
      appdummy.release

      appdummy2 = ObjC::NSMenuItem.new.initWithTitle("App Item")
      appmenu.addItem( appdummy2 )


      # Window menu
      windowdummy = ObjC::NSMenuItem.new.initWithTitle("Window")
      windowmenu = Cocoa::NSMenu.new.initWithTitle("Window")
      windowdummy.submenu = windowmenu
      menubar.addItem( windowdummy )
      nsapp.msg( "setWindowsMenu:", ptr, windowmenu )
      windowdummy.release

      windowdummy2 = ObjC::NSMenuItem.new.initWithTitle("Window Item")
      windowmenu.addItem( windowdummy2 )

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

      menubar = nsapp.msg( "mainMenu" )
      inspect_menu( menubar )

      appdummy = menubar[0]
      appmenu = appdummy.submenu
      appmenu.title = new_title
      inspect_menu( appmenu )
      menubar.msg( "itemChanged:", ptr, appdummy )

      # windowdummy = menubar.[1]
      # windowmenu = windowdummy.submenu
      # windowmenu.title = new_title
      # inspect_menu( windowmenu )

      menubar.msg( "update" )

      # menubar.msg( "removeItemAtIndex:", long, 0 )
      # inspect_menu( menubar )
      
      nil
    end


    def self.load_nib( nibpath = :default )
      ptr = FFI.find_type(:pointer)

      if nibpath == :default
        dir = File.dirname(__FILE__)
        nibpath = File.join( dir, "MacMenu.nib" )
        #nibpath = File.join( dir, "SparseMacMenu.nib" )
        #nibpath = File.join( dir, "EmptyMacMenu.nib" )
      end
      
      nsapp = Cocoa.NSApp
      toplevel = ObjC::NSClass("NSMutableArray").msg("array")
      puts "toplevel = #{toplevel}"

      dict = ObjC::NSClass("NSMutableDictionary").msg("dictionary")
      dict.msg( "setObject:forKey:",
                ptr, nsapp, ptr, Cocoa::NSNibOwner )
      dict.msg( "setObject:forKey:",
                ptr, toplevel, ptr, Cocoa::NSNibTopLevelObjects )

      zone = nsapp.msg("zone")

      loaded = ObjC::NSClass("NSBundle").\
        msg_bool( "loadNibFile:externalNameTable:withZone:",
                  ptr, ObjC::NSString(nibpath),
                  ptr, dict, ptr, zone )

      puts "loaded? = #{loaded}"
      puts "toplevel = #{toplevel.inspect}"

      menubar = nil
      app = nil

      count = toplevel.msg_int("count")
      count.times do |i|
        ob = toplevel.msg("objectAtIndex:", FFI.find_type(:long), i)
        case ob.classname
        when "NSMenu"; menubar = Cocoa::NSMenu(ob.pointer)
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


      class NSObject < NiceFFI::OpaqueStruct
        # define msg, msg_ptr, msg_str, msg_int, msg_bool
        ["", "_ptr", "_str", "_int", "_bool"].each do |suffix|
          module_eval("
            def msg#{suffix}( message, *args )
              ObjC.msgSend#{suffix}( @pointer, message, *args )
            end")
        end

        def inspect; msg_str("description").to_s; end
        def classname; ObjC.object_getClassName(@pointer); end
        def release; msg("release"); end
      end

      def self.NSObject( *args )
        NSObject.new( *args )
      end


      class NSClass < NSObject
        def initialize( str_or_ptr )
          if str_or_ptr.is_a? String
            super( ObjC.getClass(str_or_ptr) )
          else
            super
          end
        end
      end

      def self.NSClass( *args )
        NSClass.new( *args )
      end


      class NSString < NSObject
        def initialize( str_or_ptr )
          if str_or_ptr.is_a? String
            super( ObjC::NSClass("NSString").\
                     msg_ptr("stringWithUTF8String:",
                             FFI.find_type(:string), str_or_ptr) )
          else
            super
          end
        end

        def to_s
          str = msg_ptr( "UTF8String" )
          (str.null?) ? "(NULL)" : str.read_string()
        end
      end

      def self.NSString( *args )
        NSString.new( *args )
      end


      func :__msgSend, :objc_msgSend, [:id, :sel, :varargs], :id
      func :__msgSend_int, :objc_msgSend, [:id, :sel, :varargs], :long

      def self.msgSend( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        NSObject.new( __msgSend( id, selector, *args ) )
      end
      def self.msgSend_ptr( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        __msgSend( id, selector, *args )
      end
      def self.msgSend_str( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        NSString.new( __msgSend( id, selector, *args ) )
      end
      def self.msgSend_int( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        __msgSend_int( id, selector, *args )
      end
      def self.msgSend_bool( id, selector, *args )
        selector = self.sel(selector) if selector.is_a? String
        ( __msgSend_int( id, selector, *args ) == 0 ) ? false : true
      end

      func :getClass, :objc_getClass, [:string], :id
      func :class_replaceMethod, [:nsclass, :sel, :imp, :string], :imp

      func :object_getClassName, [:id], :string
      func :object_getInstanceVariable, [:id, :string, :pointer], :ivar
      func :object_setInstanceVariable, [:id, :string, :pointer], :ivar

      func :sel_registerName, [:string], :sel
      func :sel_getName, [:sel], :string

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
        @nsapp ||= ObjC::NSClass("NSApplication").msg("sharedApplication")
      end

      class NSMenu < ObjC::NSObject
        include Enumerable

        def initialize( *args )
          if args.empty?
            super( ObjC::NSClass("NSMenu").msg_ptr("alloc") )
          else
            super( args[0] )
          end
        end

        def initWithTitle( title )
          msg( "initWithTitle:", FFI.find_type(:pointer), ObjC::NSString(title) )
          self
        end

        def title
          msg_str("title")
        end

        def title=( t )
          msg("setTitle:", FFI.find_type(:pointer), ObjC::NSString(t))
        end

        def addItem( item )
          msg("addItem:", FFI.find_type(:pointer), item)
          self
        end

        def length
          msg_int( "numberOfItems" )
        end

        def [](index)
          Cocoa::NSMenuItem( msg_ptr("itemAtIndex:", FFI.find_type(:long), index) )
        end

        def each
          length.times{ |i| yield self[i] }
        end
      end

      def self.NSMenu( *args )
        NSMenu.new( *args )
      end


      class NSMenuItem < ObjC::NSObject
        def initialize( *args )
          if args.empty?
            super( ObjC::NSClass("NSMenuItem").msg_ptr("alloc") )
          else
            super( args[0] )
          end
        end

        def initWithTitle( title, action=nil, keyEquivalent="" )
          ptr = FFI.find_type(:pointer)
          msg( "initWithTitle:action:keyEquivalent:",
               ptr, ObjC::NSString(title),
               ptr, action,
               ptr, ObjC::NSString(keyEquivalent))
          self
        end

        def title
          msg_str("title")
        end

        def title=( t )
          msg("setTitle:", FFI.find_type(:pointer), ObjC::NSString(t))
        end

        def hasSubmenu?
          msg_bool("hasSubmenu")
        end

        def submenu
          Cocoa::NSMenu( msg_ptr("submenu") ) if hasSubmenu?
        end

        def submenu=( menu )
          msg("setSubmenu:", FFI.find_type(:pointer), menu)
        end
      end

      def self.NSMenuItem( *args )
        NSMenuItem.new( *args )
      end


      attach_variable "vNSNibOwner", "NSNibOwner", :pointer
      NSNibOwner =
        ObjC::NSString( ObjC::NSString(self.vNSNibOwner).to_s )

      attach_variable "vNSNibTopLevelObjects", "NSNibTopLevelObjects", :pointer
      NSNibTopLevelObjects =
        ObjC::NSString( ObjC::NSString(self.vNSNibTopLevelObjects).to_s )

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
    #   old = ObjC.class_replaceMethod( ObjC::NSClass("NSApplication"),
    #                                   "terminate:", imp, "v@:@" )
    # end

    # set_terminate_handler()

  end
end
