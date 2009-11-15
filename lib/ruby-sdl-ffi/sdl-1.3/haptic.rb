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

  HAPTIC_CONSTANT     = 1 << 0
  HAPTIC_SINE         = 1 << 1
  HAPTIC_SQUARE       = 1 << 2
  HAPTIC_TRIANGLE     = 1 << 3
  HAPTIC_SAWTOOTHUP   = 1 << 4
  HAPTIC_SAWTOOTHDOWN = 1 << 5
  HAPTIC_RAMP         = 1 << 6
  HAPTIC_SPRING       = 1 << 7
  HAPTIC_DAMPER       = 1 << 8
  HAPTIC_INERTIA      = 1 << 9
  HAPTIC_FRICTION     = 1 << 10
  HAPTIC_CUSTOM       = 1 << 11
  HAPTIC_GAIN         = 1 << 12
  HAPTIC_AUTOCENTER   = 1 << 13
  HAPTIC_STATUS       = 1 << 14
  HAPTIC_PAUSE        = 1 << 15

  HAPTIC_POLAR        = 0
  HAPTIC_CARTESIAN    = 1
  HAPTIC_SPHERICAL    = 2

  HAPTIC_INFINITY     = 4294967295


  class HapticDirection < NiceFFI::Struct
    layout( :type, :uint8,
            :dir,  [:uint16, 3] )
  end


  class HapticConstant < NiceFFI::Struct
    layout( :type,          :uint16,
            :direction,     HapticDirection,
            :length,        :uint32,
            :delay,         :uint16,
            :button,        :uint16,
            :interval,      :uint16,
            :level,         :int16,
            :attack_length, :uint16,
            :attack_level,  :uint16,
            :fade_length,   :uint16,
            :fade_level,    :uint16 )
  end


  class HapticPeriodic < NiceFFI::Struct
    layout( :type,          :uint16,
            :direction,     HapticDirection,
            :length,        :uint32,
            :delay,         :uint16,
            :button,        :uint16,
            :interval,      :uint16,
            :period,        :uint16,
            :magnitude,     :int16,
            :offset,        :int16,
            :phase,         :uint16,
            :attack_length, :uint16,
            :attack_level,  :uint16,
            :fade_length,   :uint16,
            :fade_level,    :uint16 )
  end


  class HapticCondition < NiceFFI::Struct
    layout( :type,        :uint16,
            :direction,   HapticDirection,
            :length,      :uint32,
            :delay,       :uint16,
            :button,      :uint16,
            :interval,    :uint16,
            :right_sat,   [:uint16, 3],
            :left_sat,    [:uint16, 3],
            :right_coeff, [:int16,  3],
            :left_coeff,  [:int16,  3],
            :deadband,    [:uint16, 3],
            :center,      [:int16,  3] )
  end


  class HapticRamp < NiceFFI::Struct
    layout( :type,          :uint16,
            :direction,     HapticDirection,
            :length,        :uint32,
            :delay,         :uint16,
            :button,        :uint16,
            :interval,      :uint16,
            :start,         :int16,
            :end,           :int16,
            :attack_length, :uint16,
            :attack_level,  :uint16,
            :fade_length,   :uint16,
            :fade_level,    :uint16 )
  end


  class HapticCustom < NiceFFI::Struct
    layout( :type,          :uint16,
            :direction,     HapticDirection,
            :length,        :uint32,
            :delay,         :uint16,
            :button,        :uint16,
            :interval,      :uint16,
            :channels,      :uint8,
            :period,        :uint16,
            :samples,       :uint16,
            :data,          :pointer,
            :attack_length, :uint16,
            :attack_level,  :uint16,
            :fade_length,   :uint16,
            :fade_level,    :uint16 )
  end


  class HapticEffect < FFI::Union
    layout( :type,      :uint16,
            :constant,  HapticConstant,
            :periodic,  HapticPeriodic,
            :condition, HapticCondition,
            :ramp,      HapticRamp,
            :custom,    HapticCustom )
  end


  sdl_func :NumHaptics,   [          ], :int
  sdl_func :HapticName,   [ :int     ], :string
  sdl_func :HapticOpen,   [ :int     ], :pointer
  sdl_func :HapticOpened, [ :int     ], :int
  sdl_func :HapticIndex,  [ :pointer ], :int

  sdl_func :MouseIsHaptic,       [], :int
  sdl_func :HapticOpenFromMouse, [], :pointer

  sdl_func :JoystickIsHaptic,       [ :pointer ], :int
  sdl_func :HapticOpenFromJoystick, [ :pointer ], :pointer

  sdl_func :HapticClose, [ :pointer ], :void

  sdl_func :HapticNumEffects,        [ :pointer ], :int
  sdl_func :HapticNumEffectsPlaying, [ :pointer ], :int
  sdl_func :HapticQuery,   [ :pointer ], :uint
  sdl_func :HapticNumAxes, [ :pointer ], :int

  sdl_func :HapticEffectSupported, [ :pointer, :pointer       ], :int
  sdl_func :HapticNewEffect,       [ :pointer, :pointer       ], :int
  sdl_func :HapticUpdateEffect,    [ :pointer, :int, :pointer ], :int
  sdl_func :HapticRunEffect,       [ :pointer, :int, :uint32  ], :int
  sdl_func :HapticStopEffect,      [ :pointer, :int           ], :int
  sdl_func :HapticDestroyEffect,   [ :pointer, :int           ], :void
  sdl_func :HapticGetEffectStatus, [ :pointer, :int           ], :int
  sdl_func :HapticSetGain,         [ :pointer, :int           ], :int
  sdl_func :HapticSetAutocenter,   [ :pointer, :int           ], :int
  sdl_func :HapticPause,           [ :pointer                 ], :int
  sdl_func :HapticUnpause,         [ :pointer                 ], :int
  sdl_func :HapticStopAll,         [ :pointer                 ], :int

end
