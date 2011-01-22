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

    class << self
      
      def make_menus( app_name )
        ptr = FFI.find_type(:pointer)
        
        nsapp = Cocoa.NSApp
        menubar = Cocoa::NSMenu.new.initWithTitle("AMainMenu")
        nsapp.msg( "setMainMenu:", ptr, menubar )
        
        remove_bold_menu( nsapp, menubar )
        make_app_menu( menubar, app_name )
        make_window_menu( nsapp, menubar )

        nil
      end
      
      
      def set_app_name( app_name )
        ptr = FFI.find_type(:pointer)
        
        if @appmenuitem
          @appmenuitem.title = app_name
          @hideitem.title = "Hide #{app_name}" if @hideitem
          @quititem.title = "Quit #{app_name}" if @quititem
        else
          make_menus( app_name )
        end
        
        nil
      end
      
      
      private
      
      # Hack to remove the bold "ruby" menu (aka the "Apple" menu).
      # It's a ghost menu, it haunts us but can't be modified.
      def remove_bold_menu( nsapp, menubar )
        item = Cocoa::NSMenuItem.new.initWithTitle("AppleMenu")
        menu = Cocoa::NSMenu.new.initWithTitle("AppleMenu")
        item.submenu = menu
        
        nsapp.msg("setAppleMenu:", FFI.find_type(:pointer), menu)
        menubar.addItem(item)
        menubar.removeItem(item)
        
        item.release
        menu.release
      end
      
      
      # Create the main menu with the app's name (Hide, Quit, etc.)
      def make_app_menu( menubar, app_name )
        item = Cocoa::NSMenuItem.new.initWithTitle( app_name )
        menu = Cocoa::NSMenu.new.initWithTitle( app_name )
        item.submenu = menu
        menubar.addItem(item)
        
        @hideitem = menu.addItemWithTitle("Hide #{app_name}", "hide:")
        menu.addItemWithTitle("Hide Others", "hideOtherApplications:")
        menu.addItemWithTitle("Show All", "unhideAllApplications:")

        # Can't get the Quit menu item to work right yet.
        # menu.addItem( Cocoa::NSMenuItem.separatorItem )
        # @quititem = menu.addItemWithTitle("Quit #{app_name}", "terminate:")
        
        @appmenuitem = item
        menu.release
      end
      
      
      # Create the "Window" menu (Minimize, etc.)
      def make_window_menu( nsapp, menubar )
        ptr = FFI.find_type(:pointer)
        
        item = Cocoa::NSMenuItem.new.initWithTitle("Window")
        menu = Cocoa::NSMenu.new.initWithTitle("Window")
        item.submenu = menu
        menubar.addItem(item)
        nsapp.msg("setWindowsMenu:", ptr, menu)
        
        menu.addItemWithTitle("Minimize", "performMiniaturize:")
        
        item.release
        menu.release
      end


      def inspect_menu( menu, indent="" )
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
        def self.nsclassname; name.split("::")[-1]; end

        # define msg, msg_ptr, msg_str, msg_int, msg_bool (and class methods)
        ["", "_ptr", "_str", "_int", "_bool"].each do |suffix|
          module_eval("
            def msg#{suffix}( message, *args )
              ObjC.msgSend#{suffix}( @pointer, message, *args )
            end

            def self.msg#{suffix}( message, *args )
              ObjC.msgSend#{suffix}( ObjC.NSClass(self.nsclassname),
                                                  message, *args )
            end")
        end

        def inspect; msg_str("description").to_s; end
        def nsclassname; ObjC.object_getClassName(@pointer); end
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

        def addItemWithTitle( title, action=nil, keyEquivalent="" )
          ptr = FFI.find_type(:pointer)
          action = ObjC.sel(action) if action.is_a? String
          item = msg_ptr( "addItemWithTitle:action:keyEquivalent:",
                      ptr, ObjC::NSString(title),
                      ptr, action,
                      ptr, ObjC::NSString(keyEquivalent))
          NSMenuItem.new(item)
        end

        def removeItem( item )
          msg("removeItem:", FFI.find_type(:pointer), item)
          self
        end

        def removeItemAtIndex( index )
          msg("removeItemAtIndex:", FFI.find_type(:long), index)
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
        def self.separatorItem
          new( msg_ptr("separatorItem") )
        end

        def initialize( *args )
          if args.empty?
            super( ObjC::NSClass("NSMenuItem").msg_ptr("alloc") )
          else
            super( args[0] )
          end
        end

        def initWithTitle( title, action=nil, keyEquivalent="" )
          ptr = FFI.find_type(:pointer)
          action = ObjC.sel(action) if action.is_a? String
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

      NSAlphaShiftKeyMask = 1 << 16
      NSShiftKeyMask      = 1 << 17
      NSControlKeyMask    = 1 << 18
      NSAlternateKeyMask  = 1 << 19
      NSCommandKeyMask    = 1 << 20
      NSNumericPadKeyMask = 1 << 21
      NSHelpKeyMask       = 1 << 22
      NSFunctionKeyMask   = 1 << 23
    end


    module HIServices
      extend NiceFFI::Library
      load_library '/System/Library/Frameworks/ApplicationServices.framework/Frameworks/HIServices.framework/HIServices'

      class ProcessSerialNumber < NiceFFI::Struct
        layout :highLongOfPSN, :ulong, :lowLongOfPSN, :ulong
      end

      KProcessTransformToForegroundApplication = 1

      func :GetCurrentProcess, [:pointer], :long
      func :TransformProcessType, [:pointer, :long], :long
      func :SetFrontProcess, [:pointer], :long

      # Does the magic to make the current process a front process.
      def self.make_current_front
        current = ProcessSerialNumber.new( [0, 0] )
        GetCurrentProcess( current )
        TransformProcessType(current,KProcessTransformToForegroundApplication)
        SetFrontProcess( current )
      end
    end

  end
end
