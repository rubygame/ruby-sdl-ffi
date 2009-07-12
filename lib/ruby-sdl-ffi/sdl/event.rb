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

  RELEASED        = 0
  PRESSED         = 1

  NOEVENT         = 0
  ACTIVEEVENT     = 1
  KEYDOWN         = 2
  KEYUP           = 3
  MOUSEMOTION     = 4
  MOUSEBUTTONDOWN = 5
  MOUSEBUTTONUP   = 6
  JOYAXISMOTION   = 7
  JOYBALLMOTION   = 8
  JOYHATMOTION    = 9
  JOYBUTTONDOWN   = 10
  JOYBUTTONUP     = 11
  QUIT            = 12
  SYSWMEVENT      = 13
  EVENT_RESERVEDA = 14
  EVENT_RESERVEDB = 15
  VIDEORESIZE     = 16
  VIDEOEXPOSE     = 17
  EVENT_RESERVED2 = 18
  EVENT_RESERVED3 = 19
  EVENT_RESERVED4 = 20
  EVENT_RESERVED5 = 21
  EVENT_RESERVED6 = 22
  EVENT_RESERVED7 = 23
  USEREVENT       = 24
  NUMEVENTS       = 32


  ACTIVEEVENTMASK     = (1 << (ACTIVEEVENT))
  JOYAXISMOTIONMASK   = (1 << (JOYAXISMOTION))
  JOYEVENTMASK        = (1 << (JOYAXISMOTION)) | \
                        (1 << (JOYBALLMOTION)) | \
                        (1 << (JOYHATMOTION))  | \
                        (1 << (JOYBUTTONDOWN)) | \
                        (1 << (JOYBUTTONUP))
  JOYBALLMOTIONMASK   = (1 << (JOYBALLMOTION))
  JOYBUTTONDOWNMASK   = (1 << (JOYBUTTONDOWN))
  JOYBUTTONUPMASK     = (1 << (JOYBUTTONUP))
  JOYHATMOTIONMASK    = (1 << (JOYHATMOTION))
  KEYDOWNMASK         = (1 << (KEYDOWN))
  KEYEVENTMASK        = (1 << (KEYDOWN))|(1 << (KEYUP))
  KEYUPMASK           = (1 << (KEYUP))
  MOUSEBUTTONDOWNMASK = (1 << (MOUSEBUTTONDOWN))
  MOUSEBUTTONUPMASK   = (1 << (MOUSEBUTTONUP))
  MOUSEMOTIONMASK     = (1 << (MOUSEMOTION))
  MOUSEEVENTMASK      = (1 << (MOUSEMOTION)) | \
                        (1 << (MOUSEBUTTONDOWN)) | \
                        (1 << (MOUSEBUTTONUP))
  QUITMASK            = (1 << (QUIT))
  SYSWMEVENTMASK      = (1 << (SYSWMEVENT))
  VIDEOEXPOSEMASK     = (1 << (VIDEOEXPOSE))
  VIDEORESIZEMASK     = (1 << (VIDEORESIZE))
  ALLEVENTS           = 0xFFFFFFFF



  class ActiveEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :gain,  :uint8,
            :state, :uint8 )
  end


  class KeyboardEvent < NiceFFI::Struct
    layout( :type,   :uint8,
            :which,  :uint8,
            :state,  :uint8,
            :keysym, SDL::Keysym )
  end


  class MouseMotionEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :which, :uint8,
            :state, :uint8,
            :x,     :uint16,
            :y,     :uint16,
            :xrel,  :int16,
            :yrel,  :int16 )
  end


  class MouseButtonEvent < NiceFFI::Struct
    layout( :type,   :uint8,
            :which,  :uint8,
            :button, :uint8,
            :state,  :uint8,
            :x,      :uint16,
            :y,      :uint16 )
  end


  class JoyAxisEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :which, :uint8,
            :axis,  :uint8,
            :value, :int16 )
  end


  class JoyBallEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :which, :uint8,
            :ball,  :uint8,
            :xrel,  :int16,
            :yrel,  :int16 )
  end


  class JoyHatEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :which, :uint8,
            :hat,   :uint8,
            :value, :uint8 )
  end


  class JoyButtonEvent < NiceFFI::Struct
    layout( :type,   :uint8,
            :which,  :uint8,
            :button, :uint8,
            :state,  :uint8 )
  end


  class ResizeEvent < NiceFFI::Struct
    layout( :type, :uint8,
            :w,    :int,
            :h,    :int )
  end


  class ExposeEvent < NiceFFI::Struct
    layout( :type, :uint8 )
  end


  class QuitEvent < NiceFFI::Struct
    layout( :type, :uint8 )
  end


  class UserEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :code,  :int,
            :data1, :pointer,
            :data2, :pointer )
  end


  class SysWMEvent < NiceFFI::Struct
    layout( :type, :uint8,
            :msg,  :pointer )
  end


  class Event < FFI::Union
    layout( :type,    :uint8,
            :active,  SDL::ActiveEvent,
            :key,     SDL::KeyboardEvent,
            :motion,  SDL::MouseMotionEvent,
            :button,  SDL::MouseButtonEvent,
            :jaxis,   SDL::JoyAxisEvent,
            :jball,   SDL::JoyBallEvent,
            :jhat,    SDL::JoyHatEvent,
            :jbutton, SDL::JoyButtonEvent,
            :resize,  SDL::ResizeEvent,
            :expose,  SDL::ExposeEvent,
            :quit,    SDL::QuitEvent,
            :user,    SDL::UserEvent,
            :syswm,   SDL::SysWMEvent )


    # Creates a generic Event containing a specific event.
    # You usually don't need to do this, because you can pass
    # specific events directly to SDL::SDL_PushEvent.
    # 
    def self.wrap( event )
      self.new( event.pointer )
    end


    # Extracts a specific event class from a generic Event.
    def unwrap
      case self[:type]
      when ACTIVEEVENT;                    self[:active]
      when KEYDOWN, KEYUP;                 self[:key]
      when MOUSEMOTION;                    self[:motion]
      when MOUSEBUTTONDOWN, MOUSEBUTTONUP; self[:button]
      when JOYAXISMOTION;                  self[:jaxis]
      when JOYBALLMOTION;                  self[:jball]
      when JOYHATMOTION;                   self[:jhat]
      when JOYBUTTONDOWN, JOYBUTTONUP;     self[:jbutton]
      when QUIT;                           self[:quit]
      when SYSWMEVENT;                     self[:syswm]
      when VIDEORESIZE;                    self[:resize]
      when VIDEOEXPOSE;                    self[:expose]
      when USEREVENT;                      self[:user]
      else; raise TypeError, "Invalid event #{self.inspect}"
      end
    end

    def inspect
      super.gsub(">", " :type=#{self[:type]}>")
    end

  end


  attach_function  :PumpEvents, "SDL_PumpEvents", [  ], :void


  ADDEVENT  = 0
  PEEKEVENT = 1
  GETEVENT  = 2

  attach_function  :__SDL_PeepEvents, "SDL_PeepEvents",
                   [ :pointer, :int, SDL::ENUM, :uint32 ], :int


  # Behavior varies depending on action.
  # 
  # PEEKEVENT or GETEVENT:
  #   events is the max number of events to retrieve.
  #   Returns an array of Events, or nil if there was an error.
  #   GETEVENT removes them from the queue, PEEKEVENT leaves them.
  # 
  # ADDEVENT:
  #   events is an array of Events (or specific event instances)
  #   to append to the queue.
  #   Returns the number of events added, or -1 if there was an error.
  # 
  def self.PeepEvents( events, action, mask )
    # PeepEvents is very versatile, so we break it up into
    # different actions...

    case action

    # Append the given events to the queue, return number added.
    when ADDEVENT
      numevents = events.size
      mp = FFI::Buffer.new( SDL::Event, numevents )

      # Dump the events into the Buffer as raw, hardcore bytes
      events.each_with_index do |ev, i|
        mp[i].put_bytes( 0, ev.pointer.get_bytes(0, ev.size) )
      end

      return __SDL_PeepEvents( mp, numevents, action, mask )
      
    # Peek or Get the first N events and return them in an array.
    # Peek does not remove them from the queue, but Get does.
    when PEEKEVENT, GETEVENT
      numevents = events.to_i
      mp = FFI::Buffer.new( SDL::Event, numevents )
      n = __SDL_PeepEvents( mp, numevents, action, mask )

      # Something went wrong
      return nil if( n == -1 )

      events = []
      n.times do |i|
        events << Event.new( mp[i] ).unwrap
      end

      return events
    end
  end


  attach_function  :__SDL_PollEvent, "SDL_PollEvent", [ :pointer ], :int

  def self.PollEvent()
    mp = FFI::MemoryPointer.new( SDL::Event, 1 )
    n = __SDL_PollEvent( mp )
    if n == 0
      nil
    else
      Event.new(mp).unwrap
    end
  end


  attach_function  :__SDL_WaitEvent, "SDL_WaitEvent", [ :pointer ], :int

  def self.WaitEvent()
    mp = FFI::MemoryPointer.new( SDL::Event, 1 )
    n = __SDL_WaitEvent( mp )
    if n == 0
      nil
    else
      _extract_event( Event.new(mp) )
    end
  end


  attach_function  :PushEvent, "SDL_PushEvent", [ :pointer ], :int



  callback(:eventfilter_cb, [ :pointer ], :int)

  attach_function  :__SDL_SetEventFilter, "SDL_SetEventFilter",
                   [ :eventfilter_cb ], :void

  def self.SetEventFilter( &block )
    if( block_given? )
      proc = Proc.new { |ev| 
        result = block.call( Event.new(ev).unwrap )
        case result
        when true;        1
        when false, nil;  0
        else;             result
        end
      }
      __SDL_SetEventFilter( proc )
    else
      __SDL_SetEventFilter( nil )
    end
  end


  #attach_function  :GetEventFilter, "SDL_GetEventFilter",
  #                 [ ], :eventfilter_cb


  QUERY   = -1
  IGNORE  = 0
  DISABLE = 0
  ENABLE  = 1

  attach_function  :EventState, "SDL_EventState", [ :uint8, :int ], :uint8

end
