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

  GL_VERSION_ES_CM_1_0 = 1
  GL_VERSION_ES_CL_1_0 = 1
  GL_VERSION_ES_CM_1_1 = 1
  GL_VERSION_ES_CL_1_1 = 1

  GL_DEPTH_BUFFER_BIT = 0x00000100
  GL_STENCIL_BUFFER_BIT = 0x00000400
  GL_COLOR_BUFFER_BIT = 0x00004000

  GL_FALSE = 0
  GL_TRUE = 1

  GL_POINTS         = 0x0000
  GL_LINES          = 0x0001
  GL_LINE_LOOP      = 0x0002
  GL_LINE_STRIP     = 0x0003
  GL_TRIANGLES      = 0x0004
  GL_TRIANGLE_STRIP = 0x0005
  GL_TRIANGLE_FAN   = 0x0006

  GL_NEVER    = 0x0200
  GL_LESS     = 0x0201
  GL_EQUAL    = 0x0202
  GL_LEQUAL   = 0x0203
  GL_GREATER  = 0x0204
  GL_NOTEQUAL = 0x0205
  GL_GEQUAL   = 0x0206
  GL_ALWAYS   = 0x0207

  GL_ZERO                = 0
  GL_ONE                 = 1
  GL_SRC_COLOR           = 0x0300
  GL_ONE_MINUS_SRC_COLOR = 0x0301
  GL_SRC_ALPHA           = 0x0302
  GL_ONE_MINUS_SRC_ALPHA = 0x0303
  GL_DST_ALPHA           = 0x0304
  GL_ONE_MINUS_DST_ALPHA = 0x0305
  GL_DST_COLOR           = 0x0306
  GL_ONE_MINUS_DST_COLOR = 0x0307
  GL_SRC_ALPHA_SATURATE  = 0x0308

  GL_CLIP_PLANE0 = 0x3000
  GL_CLIP_PLANE1 = 0x3001
  GL_CLIP_PLANE2 = 0x3002
  GL_CLIP_PLANE3 = 0x3003
  GL_CLIP_PLANE4 = 0x3004
  GL_CLIP_PLANE5 = 0x3005

  GL_FRONT          = 0x0404
  GL_BACK           = 0x0405
  GL_FRONT_AND_BACK = 0x0408

  GL_FOG                      = 0x0B60
  GL_LIGHTING                 = 0x0B50
  GL_TEXTURE_2D               = 0x0DE1
  GL_CULL_FACE                = 0x0B44
  GL_ALPHA_TEST               = 0x0BC0
  GL_BLEND                    = 0x0BE2
  GL_COLOR_LOGIC_OP           = 0x0BF2
  GL_DITHER                   = 0x0BD0
  GL_STENCIL_TEST             = 0x0B90
  GL_DEPTH_TEST               = 0x0B71
  GL_POINT_SMOOTH             = 0x0B10
  GL_LINE_SMOOTH              = 0x0B20
  GL_SCISSOR_TEST             = 0x0C11
  GL_COLOR_MATERIAL           = 0x0B57
  GL_NORMALIZE                = 0x0BA1
  GL_RESCALE_NORMAL           = 0x803A
  GL_POLYGON_OFFSET_FILL      = 0x8037
  GL_VERTEX_ARRAY             = 0x8074
  GL_NORMAL_ARRAY             = 0x8075
  GL_COLOR_ARRAY              = 0x8076
  GL_TEXTURE_COORD_ARRAY      = 0x8078
  GL_MULTISAMPLE              = 0x809D
  GL_SAMPLE_ALPHA_TO_COVERAGE = 0x809E
  GL_SAMPLE_ALPHA_TO_ONE      = 0x809F
  GL_SAMPLE_COVERAGE          = 0x80A0

  GL_NO_ERROR          = 0
  GL_INVALID_ENUM      = 0x0500
  GL_INVALID_VALUE     = 0x0501
  GL_INVALID_OPERATION = 0x0502
  GL_STACK_OVERFLOW    = 0x0503
  GL_STACK_UNDERFLOW   = 0x0504
  GL_OUT_OF_MEMORY     = 0x0505

  GL_EXP  = 0x0800
  GL_EXP2 = 0x0801

  GL_FOG_DENSITY = 0x0B62
  GL_FOG_START   = 0x0B63
  GL_FOG_END     = 0x0B64
  GL_FOG_MODE    = 0x0B65
  GL_FOG_COLOR   = 0x0B66

  GL_CW  = 0x0900
  GL_CCW = 0x0901

  GL_CURRENT_COLOR               = 0x0B00
  GL_CURRENT_NORMAL              = 0x0B02
  GL_CURRENT_TEXTURE_COORDS      = 0x0B03
  GL_POINT_SIZE                  = 0x0B11
  GL_POINT_SIZE_MIN              = 0x8126
  GL_POINT_SIZE_MAX              = 0x8127
  GL_POINT_FADE_THRESHOLD_SIZE   = 0x8128
  GL_POINT_DISTANCE_ATTENUATION  = 0x8129
  GL_SMOOTH_POINT_SIZE_RANGE     = 0x0B12
  GL_LINE_WIDTH                  = 0x0B21
  GL_SMOOTH_LINE_WIDTH_RANGE     = 0x0B22
  GL_ALIASED_POINT_SIZE_RANGE    = 0x846D
  GL_ALIASED_LINE_WIDTH_RANGE    = 0x846E
  GL_CULL_FACE_MODE              = 0x0B45
  GL_FRONT_FACE                  = 0x0B46
  GL_SHADE_MODEL                 = 0x0B54
  GL_DEPTH_RANGE                 = 0x0B70
  GL_DEPTH_WRITEMASK             = 0x0B72
  GL_DEPTH_CLEAR_VALUE           = 0x0B73
  GL_DEPTH_FUNC                  = 0x0B74
  GL_STENCIL_CLEAR_VALUE         = 0x0B91
  GL_STENCIL_FUNC                = 0x0B92
  GL_STENCIL_VALUE_MASK          = 0x0B93
  GL_STENCIL_FAIL                = 0x0B94
  GL_STENCIL_PASS_DEPTH_FAIL     = 0x0B95
  GL_STENCIL_PASS_DEPTH_PASS     = 0x0B96
  GL_STENCIL_REF                 = 0x0B97
  GL_STENCIL_WRITEMASK           = 0x0B98
  GL_MATRIX_MODE                 = 0x0BA0
  GL_VIEWPORT                    = 0x0BA2
  GL_MODELVIEW_STACK_DEPTH       = 0x0BA3
  GL_PROJECTION_STACK_DEPTH      = 0x0BA4
  GL_TEXTURE_STACK_DEPTH         = 0x0BA5
  GL_MODELVIEW_MATRIX            = 0x0BA6
  GL_PROJECTION_MATRIX           = 0x0BA7
  GL_TEXTURE_MATRIX              = 0x0BA8
  GL_ALPHA_TEST_FUNC             = 0x0BC1
  GL_ALPHA_TEST_REF              = 0x0BC2
  GL_BLEND_DST                   = 0x0BE0
  GL_BLEND_SRC                   = 0x0BE1
  GL_LOGIC_OP_MODE               = 0x0BF0
  GL_SCISSOR_BOX                 = 0x0C10
  GL_SCISSOR_TEST                = 0x0C11
  GL_COLOR_CLEAR_VALUE           = 0x0C22
  GL_COLOR_WRITEMASK             = 0x0C23
  GL_UNPACK_ALIGNMENT            = 0x0CF5
  GL_PACK_ALIGNMENT              = 0x0D05
  GL_MAX_LIGHTS                  = 0x0D31
  GL_MAX_CLIP_PLANES             = 0x0D32
  GL_MAX_TEXTURE_SIZE            = 0x0D33
  GL_MAX_MODELVIEW_STACK_DEPTH   = 0x0D36
  GL_MAX_PROJECTION_STACK_DEPTH  = 0x0D38
  GL_MAX_TEXTURE_STACK_DEPTH     = 0x0D39
  GL_MAX_VIEWPORT_DIMS           = 0x0D3A
  GL_MAX_TEXTURE_UNITS           = 0x84E2
  GL_SUBPIXEL_BITS               = 0x0D50
  GL_RED_BITS                    = 0x0D52
  GL_GREEN_BITS                  = 0x0D53
  GL_BLUE_BITS                   = 0x0D54
  GL_ALPHA_BITS                  = 0x0D55
  GL_DEPTH_BITS                  = 0x0D56
  GL_STENCIL_BITS                = 0x0D57
  GL_POLYGON_OFFSET_UNITS        = 0x2A00
  GL_POLYGON_OFFSET_FILL         = 0x8037
  GL_POLYGON_OFFSET_FACTOR       = 0x8038
  GL_TEXTURE_BINDING_2D          = 0x8069
  GL_VERTEX_ARRAY_SIZE           = 0x807A
  GL_VERTEX_ARRAY_TYPE           = 0x807B
  GL_VERTEX_ARRAY_STRIDE         = 0x807C
  GL_NORMAL_ARRAY_TYPE           = 0x807E
  GL_NORMAL_ARRAY_STRIDE         = 0x807F
  GL_COLOR_ARRAY_SIZE            = 0x8081
  GL_COLOR_ARRAY_TYPE            = 0x8082
  GL_COLOR_ARRAY_STRIDE          = 0x8083
  GL_TEXTURE_COORD_ARRAY_SIZE    = 0x8088
  GL_TEXTURE_COORD_ARRAY_TYPE    = 0x8089
  GL_TEXTURE_COORD_ARRAY_STRIDE  = 0x808A
  GL_VERTEX_ARRAY_POINTER        = 0x808E
  GL_NORMAL_ARRAY_POINTER        = 0x808F
  GL_COLOR_ARRAY_POINTER         = 0x8090
  GL_TEXTURE_COORD_ARRAY_POINTER = 0x8092
  GL_SAMPLE_BUFFERS              = 0x80A8
  GL_SAMPLES                     = 0x80A9
  GL_SAMPLE_COVERAGE_VALUE       = 0x80AA
  GL_SAMPLE_COVERAGE_INVERT      = 0x80AB

  GL_MAX_ELEMENTS_VERTICES = 0x80E8
  GL_MAX_ELEMENTS_INDICES  = 0x80E9

  GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2
  GL_COMPRESSED_TEXTURE_FORMATS     = 0x86A3

  GL_DONT_CARE = 0x1100
  GL_FASTEST   = 0x1101
  GL_NICEST    = 0x1102

  GL_PERSPECTIVE_CORRECTION_HINT = 0x0C50
  GL_POINT_SMOOTH_HINT           = 0x0C51
  GL_LINE_SMOOTH_HINT            = 0x0C52
  GL_FOG_HINT                    = 0x0C54
  GL_GENERATE_MIPMAP_HINT        = 0x8192

  GL_LIGHT_MODEL_AMBIENT  = 0x0B53
  GL_LIGHT_MODEL_TWO_SIDE = 0x0B52

  GL_AMBIENT               = 0x1200
  GL_DIFFUSE               = 0x1201
  GL_SPECULAR              = 0x1202
  GL_POSITION              = 0x1203
  GL_SPOT_DIRECTION        = 0x1204
  GL_SPOT_EXPONENT         = 0x1205
  GL_SPOT_CUTOFF           = 0x1206
  GL_CONSTANT_ATTENUATION  = 0x1207
  GL_LINEAR_ATTENUATION    = 0x1208
  GL_QUADRATIC_ATTENUATION = 0x1209

  GL_BYTE           = 0x1400
  GL_UNSIGNED_BYTE  = 0x1401
  GL_SHORT          = 0x1402
  GL_UNSIGNED_SHORT = 0x1403
  GL_FLOAT          = 0x1406
  GL_FIXED          = 0x140C

  GL_CLEAR         = 0x1500
  GL_AND           = 0x1501
  GL_AND_REVERSE   = 0x1502
  GL_COPY          = 0x1503
  GL_AND_INVERTED  = 0x1504
  GL_NOOP          = 0x1505
  GL_XOR           = 0x1506
  GL_OR            = 0x1507
  GL_NOR           = 0x1508
  GL_EQUIV         = 0x1509
  GL_INVERT        = 0x150A
  GL_OR_REVERSE    = 0x150B
  GL_COPY_INVERTED = 0x150C
  GL_OR_INVERTED   = 0x150D
  GL_NAND          = 0x150E
  GL_SET           = 0x150F

  GL_EMISSION            = 0x1600
  GL_SHININESS           = 0x1601
  GL_AMBIENT_AND_DIFFUSE = 0x1602

  GL_MODELVIEW  = 0x1700
  GL_PROJECTION = 0x1701
  GL_TEXTURE    = 0x1702

  GL_ALPHA           = 0x1906
  GL_RGB             = 0x1907
  GL_RGBA            = 0x1908
  GL_LUMINANCE       = 0x1909
  GL_LUMINANCE_ALPHA = 0x190A

  GL_UNPACK_ALIGNMENT = 0x0CF5
  GL_PACK_ALIGNMENT   = 0x0D05

  GL_UNSIGNED_SHORT_4_4_4_4 = 0x8033
  GL_UNSIGNED_SHORT_5_5_5_1 = 0x8034
  GL_UNSIGNED_SHORT_5_6_5   = 0x8363

  GL_FLAT       = 0x1D00
  GL_SMOOTH     = 0x1D01

  GL_KEEP       = 0x1E00
  GL_REPLACE    = 0x1E01
  GL_INCR       = 0x1E02
  GL_DECR       = 0x1E03

  GL_VENDOR     = 0x1F00
  GL_RENDERER   = 0x1F01
  GL_VERSION    = 0x1F02
  GL_EXTENSIONS = 0x1F03

  GL_MODULATE   = 0x2100
  GL_DECAL      = 0x2101
  GL_ADD        = 0x0104

  GL_TEXTURE_ENV_MODE  = 0x2200
  GL_TEXTURE_ENV_COLOR = 0x2201
  GL_TEXTURE_ENV       = 0x2300

  GL_NEAREST = 0x2600
  GL_LINEAR  = 0x2601

  GL_NEAREST_MIPMAP_NEAREST = 0x2700
  GL_LINEAR_MIPMAP_NEAREST  = 0x2701
  GL_NEAREST_MIPMAP_LINEAR  = 0x2702
  GL_LINEAR_MIPMAP_LINEAR   = 0x2703

  GL_TEXTURE_MAG_FILTER = 0x2800
  GL_TEXTURE_MIN_FILTER = 0x2801
  GL_TEXTURE_WRAP_S     = 0x2802
  GL_TEXTURE_WRAP_T     = 0x2803
  GL_GENERATE_MIPMAP    = 0x8191

  GL_TEXTURE0  = 0x84C0
  GL_TEXTURE1  = 0x84C1
  GL_TEXTURE2  = 0x84C2
  GL_TEXTURE3  = 0x84C3
  GL_TEXTURE4  = 0x84C4
  GL_TEXTURE5  = 0x84C5
  GL_TEXTURE6  = 0x84C6
  GL_TEXTURE7  = 0x84C7
  GL_TEXTURE8  = 0x84C8
  GL_TEXTURE9  = 0x84C9
  GL_TEXTURE10 = 0x84CA
  GL_TEXTURE11 = 0x84CB
  GL_TEXTURE12 = 0x84CC
  GL_TEXTURE13 = 0x84CD
  GL_TEXTURE14 = 0x84CE
  GL_TEXTURE15 = 0x84CF
  GL_TEXTURE16 = 0x84D0
  GL_TEXTURE17 = 0x84D1
  GL_TEXTURE18 = 0x84D2
  GL_TEXTURE19 = 0x84D3
  GL_TEXTURE20 = 0x84D4
  GL_TEXTURE21 = 0x84D5
  GL_TEXTURE22 = 0x84D6
  GL_TEXTURE23 = 0x84D7
  GL_TEXTURE24 = 0x84D8
  GL_TEXTURE25 = 0x84D9
  GL_TEXTURE26 = 0x84DA
  GL_TEXTURE27 = 0x84DB
  GL_TEXTURE28 = 0x84DC
  GL_TEXTURE29 = 0x84DD
  GL_TEXTURE30 = 0x84DE
  GL_TEXTURE31 = 0x84DF
  GL_ACTIVE_TEXTURE        = 0x84E0
  GL_CLIENT_ACTIVE_TEXTURE = 0x84E1

  GL_REPEAT        = 0x2901
  GL_CLAMP_TO_EDGE = 0x812F

  GL_LIGHT0 = 0x4000
  GL_LIGHT1 = 0x4001
  GL_LIGHT2 = 0x4002
  GL_LIGHT3 = 0x4003
  GL_LIGHT4 = 0x4004
  GL_LIGHT5 = 0x4005
  GL_LIGHT6 = 0x4006
  GL_LIGHT7 = 0x4007

  GL_ARRAY_BUFFER         = 0x8892
  GL_ELEMENT_ARRAY_BUFFER = 0x8893

  GL_ARRAY_BUFFER_BINDING               = 0x8894
  GL_ELEMENT_ARRAY_BUFFER_BINDING       = 0x8895
  GL_VERTEX_ARRAY_BUFFER_BINDING        = 0x8896
  GL_NORMAL_ARRAY_BUFFER_BINDING        = 0x8897
  GL_COLOR_ARRAY_BUFFER_BINDING         = 0x8898
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = 0x889A

  GL_STATIC_DRAW  = 0x88E4
  GL_DYNAMIC_DRAW = 0x88E8

  GL_BUFFER_SIZE  = 0x8764
  GL_BUFFER_USAGE = 0x8765

  GL_SUBTRACT       = 0x84E7
  GL_COMBINE        = 0x8570
  GL_COMBINE_RGB    = 0x8571
  GL_COMBINE_ALPHA  = 0x8572
  GL_RGB_SCALE      = 0x8573
  GL_ADD_SIGNED     = 0x8574
  GL_INTERPOLATE    = 0x8575
  GL_CONSTANT       = 0x8576
  GL_PRIMARY_COLOR  = 0x8577
  GL_PREVIOUS       = 0x8578
  GL_OPERAND0_RGB   = 0x8590
  GL_OPERAND1_RGB   = 0x8591
  GL_OPERAND2_RGB   = 0x8592
  GL_OPERAND0_ALPHA = 0x8598
  GL_OPERAND1_ALPHA = 0x8599
  GL_OPERAND2_ALPHA = 0x859A

  GL_ALPHA_SCALE = 0x0D1C

  GL_SRC0_RGB   = 0x8580
  GL_SRC1_RGB   = 0x8581
  GL_SRC2_RGB   = 0x8582
  GL_SRC0_ALPHA = 0x8588
  GL_SRC1_ALPHA = 0x8589
  GL_SRC2_ALPHA = 0x858A

  GL_DOT3_RGB  = 0x86AE
  GL_DOT3_RGBA = 0x86AF

  GL_IMPLEMENTATION_COLOR_READ_TYPE_OES   = 0x8B9A
  GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES = 0x8B9B

  GL_PALETTE4_RGB8_OES     = 0x8B90
  GL_PALETTE4_RGBA8_OES    = 0x8B91
  GL_PALETTE4_R5_G6_B5_OES = 0x8B92
  GL_PALETTE4_RGBA4_OES    = 0x8B93
  GL_PALETTE4_RGB5_A1_OES  = 0x8B94
  GL_PALETTE8_RGB8_OES     = 0x8B95
  GL_PALETTE8_RGBA8_OES    = 0x8B96
  GL_PALETTE8_R5_G6_B5_OES = 0x8B97
  GL_PALETTE8_RGBA4_OES    = 0x8B98
  GL_PALETTE8_RGB5_A1_OES  = 0x8B99

  GL_POINT_SIZE_ARRAY_OES                   = 0x8B9C
  GL_POINT_SIZE_ARRAY_TYPE_OES              = 0x898A
  GL_POINT_SIZE_ARRAY_STRIDE_OES            = 0x898B
  GL_POINT_SIZE_ARRAY_POINTER_OES           = 0x898C
  GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES    = 0x8B9F
  GL_POINT_SPRITE_OES                       = 0x8861
  GL_COORD_REPLACE_OES                      = 0x8862
  GL_TEXTURE_CROP_RECT_OES                  = 0x8B9D
  GL_ARRAY_BUFFER_OES                       = 0x8892
  GL_ELEMENT_ARRAY_BUFFER_OES               = 0x8893
  GL_ARRAY_BUFFER_BINDING_OES               = 0x8894
  GL_ELEMENT_ARRAY_BUFFER_BINDING_OES       = 0x8895
  GL_VERTEX_ARRAY_BUFFER_BINDING_OES        = 0x8896
  GL_NORMAL_ARRAY_BUFFER_BINDING_OES        = 0x8897
  GL_COLOR_ARRAY_BUFFER_BINDING_OES         = 0x8898
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_OES = 0x889A
  GL_STATIC_DRAW_OES                        = 0x88E4
  GL_DYNAMIC_DRAW_OES                       = 0x88E8
  GL_WRITE_ONLY_OES                         = 0x88B9
  GL_BUFFER_SIZE_OES                        = 0x8764
  GL_BUFFER_USAGE_OES                       = 0x8765
  GL_BUFFER_ACCESS_OES                      = 0x88BB

  attach_function :glAlphaFunc, [ :uint, :float ], :void
  attach_function :glClearColor, [ :float, :float, :float, :float ], :void
  attach_function :glClearDepthf, [ :float ], :void
  attach_function :glClipPlanef, [ :uint, :pointer ], :void
  attach_function :glColor4f, [ :float, :float, :float, :float ], :void
  attach_function :glDepthRangef, [ :float, :float ], :void
  attach_function :glFogf, [ :uint, :float ], :void
  attach_function :glFogfv, [ :uint, :pointer ], :void

  attach_function :glFrustumf, [ :float, :float, :float,
                                 :float, :float, :float ], :void

  attach_function :glGetClipPlanef, [ :uint, [:float, 4] ], :void
  attach_function :glGetFloatv, [ :uint, :pointer ], :void
  attach_function :glGetLightfv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetMaterialfv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetTexEnvfv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetTexParameterfv, [ :uint, :uint, :pointer ], :void
  attach_function :glLightModelf, [ :uint, :float ], :void
  attach_function :glLightModelfv, [ :uint, :pointer ], :void
  attach_function :glLightf, [ :uint, :uint, :float ], :void
  attach_function :glLightfv, [ :uint, :uint, :pointer ], :void
  attach_function :glLineWidth, [ :float ], :void
  attach_function :glLoadMatrixf, [ :pointer ], :void
  attach_function :glMaterialf, [ :uint, :uint, :float ], :void
  attach_function :glMaterialfv, [ :uint, :uint, :pointer ], :void
  attach_function :glMultMatrixf, [ :pointer ], :void

  attach_function :glMultiTexCoord4f, [ :uint, :float, :float,
                                        :float, :float ], :void

  attach_function :glNormal3f, [ :float, :float, :float ], :void

  attach_function :glOrthof, [ :float, :float, :float, 
                               :float, :float, :float ], :void

  attach_function :glPointParameterf, [ :uint, :float ], :void
  attach_function :glPointParameterfv, [ :uint, :pointer ], :void
  attach_function :glPointSize, [ :float ], :void
  attach_function :glPolygonOffset, [ :float, :float ], :void
  attach_function :glRotatef, [ :float, :float, :float, :float ], :void
  attach_function :glScalef, [ :float, :float, :float ], :void
  attach_function :glTexEnvf, [ :uint, :uint, :float ], :void
  attach_function :glTexEnvfv, [ :uint, :uint, :pointer ], :void
  attach_function :glTexParameterf, [ :uint, :uint, :float ], :void
  attach_function :glTexParameterfv, [ :uint, :uint, :pointer ], :void
  attach_function :glTranslatef, [ :float, :float, :float ], :void
  attach_function :glActiveTexture, [ :uint ], :void
  attach_function :glAlphaFuncx, [ :uint, :int ], :void
  attach_function :glBindBuffer, [ :uint, :uint ], :void
  attach_function :glBindTexture, [ :uint, :uint ], :void
  attach_function :glBlendFunc, [ :uint, :uint ], :void
  attach_function :glBufferData, [ :uint, :int, :pointer, :uint ], :void
  attach_function :glBufferSubData, [ :uint, :int, :int, :pointer ], :void
  attach_function :glClear, [ :uint ], :void
  attach_function :glClearColorx, [ :int, :int, :int, :int ], :void
  attach_function :glClearDepthx, [ :int ], :void
  attach_function :glClearStencil, [ :int ], :void
  attach_function :glClientActiveTexture, [ :uint ], :void
  attach_function :glClipPlanex, [ :uint, :pointer ], :void
  attach_function :glColor4ub, [ :uchar, :uchar, :uchar, :uchar ], :void
  attach_function :glColor4x, [ :int, :int, :int, :int ], :void
  attach_function :glColorMask, [ :uchar, :uchar, :uchar, :uchar ], :void
  attach_function :glColorPointer, [ :int, :uint, :int, :pointer ], :void

  attach_function :glCompressedTexImage2D, [ :uint, :int, :uint, :int, :int,
                                             :int, :int, :pointer ], :void

  attach_function :glCompressedTexSubImage2D,
                  [ :uint, :int, :int, :int, :int,
                    :int, :uint, :int, :pointer ], :void

  attach_function :glCopyTexImage2D, [ :uint, :int, :uint, :int,
                                       :int, :int, :int, :int ], :void

  attach_function :glCopyTexSubImage2D, [ :uint, :int, :int, :int,
                                          :int, :int, :int, :int ], :void

  attach_function :glCullFace, [ :uint ], :void
  attach_function :glDeleteBuffers, [ :int, :pointer ], :void
  attach_function :glDeleteTextures, [ :int, :pointer ], :void
  attach_function :glDepthFunc, [ :uint ], :void
  attach_function :glDepthMask, [ :uchar ], :void
  attach_function :glDepthRangex, [ :int, :int ], :void
  attach_function :glDisable, [ :uint ], :void
  attach_function :glDisableClientState, [ :uint ], :void
  attach_function :glDrawArrays, [ :uint, :int, :int ], :void
  attach_function :glDrawElements, [ :uint, :int, :uint, :pointer ], :void
  attach_function :glEnable, [ :uint ], :void
  attach_function :glEnableClientState, [ :uint ], :void
  attach_function :glFinish, [], :void
  attach_function :glFlush, [], :void
  attach_function :glFogx, [ :uint, :int ], :void
  attach_function :glFogxv, [ :uint, :pointer ], :void
  attach_function :glFrontFace, [ :uint ], :void
  attach_function :glFrustumx, [ :int, :int, :int, :int, :int, :int ], :void
  attach_function :glGetBooleanv, [ :uint, :pointer ], :void
  attach_function :glGetBufferParameteriv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetClipPlanex, [ :uint, [:int, 4] ], :void
  attach_function :glGenBuffers, [ :int, :pointer ], :void
  attach_function :glGenTextures, [ :int, :pointer ], :void
  attach_function :glGetError, [], :uint
  attach_function :glGetFixedv, [ :uint, :pointer ], :void
  attach_function :glGetIntegerv, [ :uint, :pointer ], :void
  attach_function :glGetLightxv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetMaterialxv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetPointerv, [ :uint, :pointer ], :void
  attach_function :glGetString, [ :uint ], :pointer
  attach_function :glGetTexEnviv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetTexEnvxv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetTexParameteriv, [ :uint, :uint, :pointer ], :void
  attach_function :glGetTexParameterxv, [ :uint, :uint, :pointer ], :void
  attach_function :glHint, [ :uint, :uint ], :void
  attach_function :glIsBuffer, [ :uint ], :uchar
  attach_function :glIsEnabled, [ :uint ], :uchar
  attach_function :glIsTexture, [ :uint ], :uchar
  attach_function :glLightModelx, [ :uint, :int ], :void
  attach_function :glLightModelxv, [ :uint, :pointer ], :void
  attach_function :glLightx, [ :uint, :uint, :int ], :void
  attach_function :glLightxv, [ :uint, :uint, :pointer ], :void
  attach_function :glLineWidthx, [ :int ], :void
  attach_function :glLoadIdentity, [], :void
  attach_function :glLoadMatrixx, [ :pointer ], :void
  attach_function :glLogicOp, [ :uint ], :void
  attach_function :glMaterialx, [ :uint, :uint, :int ], :void
  attach_function :glMaterialxv, [ :uint, :uint, :pointer ], :void
  attach_function :glMatrixMode, [ :uint ], :void
  attach_function :glMultMatrixx, [ :pointer ], :void
  attach_function :glMultiTexCoord4x, [ :uint, :int, :int, :int, :int ], :void
  attach_function :glNormal3x, [ :int, :int, :int ], :void
  attach_function :glNormalPointer, [ :uint, :int, :pointer ], :void
  attach_function :glOrthox, [ :int, :int, :int, :int, :int, :int ], :void
  attach_function :glPixelStorei, [ :uint, :int ], :void
  attach_function :glPointParameterx, [ :uint, :int ], :void
  attach_function :glPointParameterxv, [ :uint, :pointer ], :void
  attach_function :glPointSizex, [ :int ], :void
  attach_function :glPolygonOffsetx, [ :int, :int ], :void
  attach_function :glPopMatrix, [], :void
  attach_function :glPushMatrix, [], :void

  attach_function :glReadPixels, [ :int, :int, :int, :int,
                                   :uint, :uint, :pointer ], :void

  attach_function :glRotatex, [ :int, :int, :int, :int ], :void
  attach_function :glSampleCoverage, [ :float, :uchar ], :void
  attach_function :glSampleCoveragex, [ :int, :uchar ], :void
  attach_function :glScalex, [ :int, :int, :int ], :void
  attach_function :glScissor, [ :int, :int, :int, :int ], :void
  attach_function :glShadeModel, [ :uint ], :void
  attach_function :glStencilFunc, [ :uint, :int, :uint ], :void
  attach_function :glStencilMask, [ :uint ], :void
  attach_function :glStencilOp, [ :uint, :uint, :uint ], :void
  attach_function :glTexCoordPointer, [ :int, :uint, :int, :pointer ], :void
  attach_function :glTexEnvi, [ :uint, :uint, :int ], :void
  attach_function :glTexEnvx, [ :uint, :uint, :int ], :void
  attach_function :glTexEnviv, [ :uint, :uint, :pointer ], :void
  attach_function :glTexEnvxv, [ :uint, :uint, :pointer ], :void

  attach_function :glTexImage2D, [ :uint, :int, :int, :int, :int,
                                   :int, :uint, :uint, :pointer ], :void

  attach_function :glTexParameteri, [ :uint, :uint, :int ], :void
  attach_function :glTexParameterx, [ :uint, :uint, :int ], :void
  attach_function :glTexParameteriv, [ :uint, :uint, :pointer ], :void
  attach_function :glTexParameterxv, [ :uint, :uint, :pointer ], :void

  attach_function :glTexSubImage2D, [ :uint, :int, :int, :int, :int,
                                      :int, :uint, :uint, :pointer ], :void

  attach_function :glTranslatex, [ :int, :int, :int ], :void
  attach_function :glVertexPointer, [ :int, :uint, :int, :pointer ], :void
  attach_function :glViewport, [ :int, :int, :int, :int ], :void

  GL_OES_read_format = 1
  GL_OES_compressed_paletted_texture = 1
  GL_OES_point_size_array = 1

  attach_function :glPointSizePointerOES, [ :uint, :int, :pointer ], :void

  GL_OES_query_matrix = 1

  attach_function :glQueryMatrixxOES, [ [:int,16], [:int,16] ], :uint

  GL_OES_point_sprite = 1
  GL_OES_draw_texture = 1

  attach_function :glDrawTexsOES, [ :short, :short, :short,
                                    :short, :short ], :void
  attach_function :glDrawTexiOES, [ :int, :int, :int, :int, :int ], :void
  attach_function :glDrawTexxOES, [ :int, :int, :int, :int, :int ], :void
  attach_function :glDrawTexsvOES, [ :pointer ], :void
  attach_function :glDrawTexivOES, [ :pointer ], :void
  attach_function :glDrawTexxvOES, [ :pointer ], :void
  attach_function :glDrawTexfOES, [ :float, :float, :float,
                                    :float, :float ], :void
  attach_function :glDrawTexfvOES, [ :pointer ], :void

  GL_OES_single_precision = 1

  attach_function :glDepthRangefOES, [ :float, :float ], :void
  attach_function :glFrustumfOES, [ :float, :float, :float,
                                    :float, :float, :float ], :void
  attach_function :glOrthofOES, [ :float, :float, :float,
                                  :float, :float, :float ], :void
  attach_function :glClipPlanefOES, [ :uint, :pointer ], :void
  attach_function :glGetClipPlanefOES, [ :uint, [:float, 4] ], :void
  attach_function :glClearDepthfOES, [ :float ], :void

  GL_OES_vertex_buffer_object = 1

  attach_function :glBindBufferOES, [ :uint, :uint ], :void
  attach_function :glDeleteBuffersOES, [ :int, :pointer ], :void
  attach_function :glGenBuffersOES, [ :int, :pointer ], :void
  attach_function :glIsBufferOES, [ :uint ], :uchar
  attach_function :glBufferDataOES, [ :uint, :int, :pointer, :uint ], :void
  attach_function :glBufferSubDataOES, [ :uint, :int, :int, :pointer ], :void
  attach_function :glGetBufferParameterivOES, [ :uint, :uint, :pointer ], :void

end
