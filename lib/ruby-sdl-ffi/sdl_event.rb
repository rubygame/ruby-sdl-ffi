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


require File.join( File.dirname(__FILE__), "nicestruct" )


module SDL

  RELEASED        = 0
  PRESSED         = 1
  KEYDOWN         = 2
  KEYUP           = 3
  MOUSEMOTION     = 4
  MOUSEBUTTONDOWN = 5
  MOUSEBUTTONUP   = 6
  JOYAXISMOTION   = 7
  JOYBALLMOTION   = 8
  JOYHATMOTION    = 9


  NOEVENT         = 0
  ACTIVEEVENT     = 1
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
  ALLEVENTS       = 0xFFFFFFFF


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




  class ActiveEvent < NiceStruct
    layout( :type,  :uint8,
            :gain,  :uint8,
            :state, :uint8 )
  end


  class KeyboardEvent < NiceStruct
    layout( :type,   :uint8,
            :which,  :uint8,
            :state,  :uint8,
            :keysym, SDL::Keysym )
  end


  class MouseMotionEvent < NiceStruct
    layout( :type,  :uint8,
            :which, :uint8,
            :state, :uint8,
            :x,     :uint16,
            :y,     :uint16,
            :xrel,  :int16,
            :yrel,  :int16 )
  end


  class MouseButtonEvent < NiceStruct
    layout( :type,   :uint8,
            :which,  :uint8,
            :button, :uint8,
            :state,  :uint8,
            :x,      :uint16,
            :y,      :uint16 )
  end


  class JoyAxisEvent < NiceStruct
    layout( :type,  :uint8,
            :which, :uint8,
            :axis,  :uint8,
            :value, :int16 )
  end


  class JoyBallEvent < NiceStruct
    layout( :type,  :uint8,
            :which, :uint8,
            :ball,  :uint8,
            :xrel,  :int16,
            :yrel,  :int16 )
  end


  class JoyHatEvent < NiceStruct
    layout( :type,  :uint8,
            :which, :uint8,
            :hat,   :uint8,
            :value, :uint8 )
  end


  class JoyButtonEvent < NiceStruct
    layout( :type,   :uint8,
            :which,  :uint8,
            :button, :uint8,
            :state,  :uint8 )
  end


  class ResizeEvent < NiceStruct
    layout( :type, :uint8,
            :w,    :int,
            :h,    :int )
  end


  class ExposeEvent < NiceStruct
    layout( :type, :uint8 )
  end


  class QuitEvent < NiceStruct
    layout( :type, :uint8 )
  end


  class UserEvent < NiceStruct
    layout( :type,  :uint8,
            :code,  :int,
            :data1, :pointer,
            :data2, :pointer )
  end


  class SysWMEvent < NiceStruct
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
  end


  attach_function  :SDL_PumpEvents, [  ], :void

  ADDEVENT  = 0
  PEEKEVENT = 1
  GETEVENT  = 2

  attach_function  :SDL_PeepEvents,
                   [ :pointer, :int, SDL::ENUM, :uint32 ], :int

  attach_function  :SDL_PollEvent, [ :pointer ], :int
  attach_function  :SDL_WaitEvent, [ :pointer ], :int
  attach_function  :SDL_PushEvent, [ :pointer ], :int


  callback(:eventfilter_cb, [ :pointer ], :int)

  attach_function  :SDL_SetEventFilter, [ :eventfilter_cb ], :void
  #attach_function  :SDL_GetEventFilter, [ ], :eventfilter_cb


  QUERY   = -1
  IGNORE  = 0
  DISABLE = 0
  ENABLE  = 1

  attach_function  :SDL_EventState, [ :uint8, :int ], :uint8

end
