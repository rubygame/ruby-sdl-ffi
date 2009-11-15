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

  RELEASED        = 0
  PRESSED         = 1

  NOEVENT         = 0
  WINDOWEVENT     = 1
  KEYDOWN         = 2
  KEYUP           = 3
  TEXTEDITING     = 4
  TEXTINPUT       = 5
  MOUSEMOTION     = 6
  MOUSEBUTTONDOWN = 7
  MOUSEBUTTONUP   = 8
  MOUSEWHEEL      = 9
  JOYAXISMOTION   = 10
  JOYBALLMOTION   = 11
  JOYHATMOTION    = 12
  JOYBUTTONDOWN   = 13
  JOYBUTTONUP     = 14
  QUIT            = 15
  SYSWMEVENT      = 16
  PROXIMITYIN     = 17
  PROXIMITYOUT    = 18
  USEREVENT       = 24

  JOYAXISMOTIONMASK = 1 << JOYAXISMOTION
  JOYBALLMOTIONMASK = 1 << JOYBALLMOTION
  JOYBUTTONDOWNMASK = 1 << JOYBUTTONDOWN
  JOYBUTTONUPMASK   = 1 << JOYBUTTONUP
  JOYHATMOTIONMASK  = 1 << JOYHATMOTION

  JOYEVENTMASK = 
    JOYAXISMOTIONMASK |
    JOYBALLMOTIONMASK |
    JOYBUTTONDOWNMASK |
    JOYBUTTONUPMASK   |
    JOYHATMOTIONMASK

  KEYDOWNMASK  = 1 << KEYDOWN
  KEYUPMASK    = 1 << KEYUP
  KEYEVENTMASK = KEYDOWNMASK | KEYUPMASK

  MOUSEBUTTONDOWNMASK = 1 << MOUSEBUTTONDOWN
  MOUSEBUTTONUPMASK   = 1 << MOUSEBUTTONUP
  MOUSEMOTIONMASK     = 1 << MOUSEMOTION

  MOUSEEVENTMASK =
    MOUSEBUTTONDOWNMASK |
    MOUSEBUTTONUPMASK   |
    MOUSEMOTIONMASK

  MOUSEWHEELMASK   = 1 << MOUSEWHEEL
  PROXIMITYINMASK  = 1 << PROXIMITYIN
  PROXIMITYOUTMASK = 1 << PROXIMITYOUT
  QUITMASK         = 1 << QUIT
  SYSWMEVENTMASK   = 1 << SYSWMEVENT
  TEXTEDITINGMASK  = 1 << TEXTEDITING
  TEXTINPUTMASK    = 1 << TEXTINPUT
  WINDOWEVENTMASK  = 1 << WINDOWEVENT

  ALLEVENTS = 0xFFFFFFFF


  class WindowEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :event,    :uint8,
            :data1,    :int,
            :data2,    :int )
  end


  class KeyboardEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :which,    :uint8,
            :state,    :uint8,
            :keysym,   Keysym )
  end


  TEXTEDITINGEVENT_TEXT_SIZE = 32

  class TextEditingEvent < NiceFFI::Struct
    layout( :type,   :uint8,
            :text,   [:char, TEXTEDITINGEVENT_TEXT_SIZE],
            :start,  :int,
            :length, :int )
  end


  TEXTINPUTEVENT_TEXT_SIZE = 32

  class TextInputEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :which,    :uint8,
            :text,     [:char, TEXTINPUTEVENT_TEXT_SIZE] )
  end


  class MouseMotionEvent < NiceFFI::Struct
    layout( :type,         :uint8,
            :windowID,     WINDOWID,
            :which,        :uint8,
            :state,        :uint8,
            :x,            :int,
            :y,            :int,
            :z,            :int,
            :pressure,     :int,
            :pressure_max, :int,
            :pressure_min, :int,
            :rotation,     :int,
            :tilt,         :int,
            :cursor,       :int,
            :xrel,         :int,
            :yrel,         :int )
  end


  class MouseButtonEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :which,    :uint8,
            :button,   :uint8,
            :state,    :uint8,
            :x,        :int,
            :y,        :int )
  end


  class MouseWheelEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :which,    :uint8,
            :x,        :int,
            :y,        :int )
  end


  class JoyAxisEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :which, :uint8,
            :axis,  :uint8,
            :value, :int )
  end


  class JoyBallEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :which, :uint8,
            :ball,  :uint8,
            :xrel,  :int,
            :yrel,  :int )
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


  class QuitEvent < NiceFFI::Struct
    layout( :type, :uint8 )
  end


  class UserEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :code,     :int,
            :data1,    :pointer,
            :data2,    :pointer )
  end


  class SysWMEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :msg,   :pointer )
  end


  class ProximityEvent < NiceFFI::Struct
    layout( :type,     :uint8,
            :windowID, WINDOWID,
            :which,    :uint8,
            :cursor,   :int,
            :x,        :int,
            :y,        :int )
  end


  class ActiveEvent < NiceFFI::Struct
    layout( :type,  :uint8,
            :gain,  :uint8,
            :state, :uint8 )
  end


  class ResizeEvent < NiceFFI::Struct
    layout( :type, :uint8,
            :w,    :int,
            :h,    :int )
  end


  class Event < FFI::Union
    layout( :type,      :uint8,
            :window,    WindowEvent,
            :key,       KeyboardEvent,
            :edit,      TextEditingEvent,
            :text,      TextInputEvent,
            :motion,    MouseMotionEvent,
            :button,    MouseButtonEvent,
            :wheel,     MouseWheelEvent,
            :jaxis,     JoyAxisEvent,
            :jball,     JoyBallEvent,
            :jhat,      JoyHatEvent,
            :jbutton,   JoyButtonEvent,
            :quit,      QuitEvent,
            :user,      UserEvent,
            :syswm,     SysWMEvent,
            :proximity, ProximityEvent,
            :active,    ActiveEvent,
            :resize,    ResizeEvent )
  end


  sdl_func :PumpEvents, [], :void

  ADDEVENT = 0
  PEEKEVENT = 1
  GETEVENT = 2

  sdl_func :PeepEvents,       [ :pointer, :int, :int, :uint32 ], :int
  sdl_func :HasEvent,         [ :uint32                       ], BOOL
  sdl_func :PollEvent,        [ :pointer                      ], :int
  sdl_func :WaitEvent,        [ :pointer                      ], :int
  sdl_func :WaitEventTimeout, [ :pointer, :int                ], :int
  sdl_func :PushEvent,        [ :pointer                      ], :int

  callback( :EventFilter, [ :pointer, :pointer ], :int )

  sdl_func :SetEventFilter, [ :EventFilter, :pointer ], :void
  sdl_func :GetEventFilter, [ :pointer, :pointer     ], BOOL
  sdl_func :FilterEvents,   [ :EventFilter, :pointer ], :void

  QUERY = -1
  IGNORE = 0
  DISABLE = 0
  ENABLE = 1

  sdl_func :EventState, [ :uint8, :int ], :uint8

end
