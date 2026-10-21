
unit WebPDec;

{$R-}{$Q-}

interface

function WebPGetInfo(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): Boolean;
function WebPDecodeRGBA(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
function WebPDecodeARGB(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
function WebPDecodeBGRA(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
function WebPDecodeRGB(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
function WebPDecodeBGR(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
procedure WebPFree(ptr: Pointer);

implementation

{$POINTERMATH ON}

type
{$IF NOT DECLARED(PInt16)}
  PInt16 = ^Int16;
{$IFEND}
{$IF NOT DECLARED(PUInt32)}
  PUInt32 = ^UInt32;
{$IFEND}
  TCSMode = (csmRGBA, csmARGB, csmBGRA, csmRGB, csmBGR);

const
  BPS = 32;
  YUV_SIZE = BPS * 17 + BPS * 9;
  Y_OFF = BPS * 1 + 8;
  U_OFF = Y_OFF + BPS * 16 + BPS * 1;
  V_OFF = U_OFF + 16;

  NUM_MB_SEGMENTS = 4;
  NUM_TYPES = 4;
  NUM_BANDS = 8;
  NUM_CTX = 3;
  NUM_PROBAS = 11;
  MB_FEATURE_TREE_PROBS = 3;
  NUM_REF_LF_DELTAS = 4;
  NUM_MODE_LF_DELTAS = 4;
  MAX_NUM_PARTITIONS = 8;

  B_DC_PRED = 0;
  B_TM_PRED = 1;
  B_VE_PRED = 2;
  B_HE_PRED = 3;
  B_RD_PRED = 4;
  B_VR_PRED = 5;
  B_LD_PRED = 6;
  B_VL_PRED = 7;
  B_HD_PRED = 8;
  B_HU_PRED = 9;
  NUM_BMODES = 10;

  DC_PRED = 0;
  TM_PRED = 1;
  V_PRED = 2;
  H_PRED = 3;
  B_PRED = 4;

  FIXED_TABLE_SIZE = 630 * 3 + 410;

const
  CoeffsProba0: array [0 .. 3, 0 .. 7, 0 .. 2, 0 .. 10]
    of Byte = ((((128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128),
    (128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128), (128, 128, 128,
    128, 128, 128, 128, 128, 128, 128, 128)), ((253, 136, 254, 255, 228, 219,
    128, 128, 128, 128, 128), (189, 129, 242, 255, 227, 213, 255, 219, 128, 128,
    128), (106, 126, 227, 252, 214, 209, 255, 255, 128, 128, 128)),
    ((1, 98, 248, 255, 236, 226, 255, 255, 128, 128, 128), (181, 133, 238, 254,
    221, 234, 255, 154, 128, 128, 128), (78, 134, 202, 247, 198, 180, 255, 219,
    128, 128, 128)), ((1, 185, 249, 255, 243, 255, 128, 128, 128, 128, 128),
    (184, 150, 247, 255, 236, 224, 128, 128, 128, 128, 128), (77, 110, 216, 255,
    236, 230, 128, 128, 128, 128, 128)), ((1, 101, 251, 255, 241, 255, 128, 128,
    128, 128, 128), (170, 139, 241, 252, 236, 209, 255, 255, 128, 128, 128),
    (37, 116, 196, 243, 228, 255, 255, 255, 128, 128, 128)),
    ((1, 204, 254, 255, 245, 255, 128, 128, 128, 128, 128), (207, 160, 250, 255,
    238, 128, 128, 128, 128, 128, 128), (102, 103, 231, 255, 211, 171, 128, 128,
    128, 128, 128)), ((1, 152, 252, 255, 240, 255, 128, 128, 128, 128, 128),
    (177, 135, 243, 255, 234, 225, 128, 128, 128, 128, 128), (80, 129, 211, 255,
    194, 224, 128, 128, 128, 128, 128)), ((1, 1, 255, 128, 128, 128, 128, 128,
    128, 128, 128), (246, 1, 255, 128, 128, 128, 128, 128, 128, 128, 128),
    (255, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128))),
    (((198, 35, 237, 223, 193, 187, 162, 160, 145, 155, 62), (131, 45, 198, 221,
    172, 176, 220, 157, 252, 221, 1), (68, 47, 146, 208, 149, 167, 221, 162,
    255, 223, 128)), ((1, 149, 241, 255, 221, 224, 255, 255, 128, 128, 128),
    (184, 141, 234, 253, 222, 220, 255, 199, 128, 128, 128), (81, 99, 181, 242,
    176, 190, 249, 202, 255, 255, 128)), ((1, 129, 232, 253, 214, 197, 242, 196,
    255, 255, 128), (99, 121, 210, 250, 201, 198, 255, 202, 128, 128, 128),
    (23, 91, 163, 242, 170, 187, 247, 210, 255, 255, 128)),
    ((1, 200, 246, 255, 234, 255, 128, 128, 128, 128, 128), (109, 178, 241, 255,
    231, 245, 255, 255, 128, 128, 128), (44, 130, 201, 253, 205, 192, 255, 255,
    128, 128, 128)), ((1, 132, 239, 251, 219, 209, 255, 165, 128, 128, 128),
    (94, 136, 225, 251, 218, 190, 255, 255, 128, 128, 128), (22, 100, 174, 245,
    186, 161, 255, 199, 128, 128, 128)), ((1, 182, 249, 255, 232, 235, 128, 128,
    128, 128, 128), (124, 143, 241, 255, 227, 234, 128, 128, 128, 128, 128),
    (35, 77, 181, 251, 193, 211, 255, 205, 128, 128, 128)),
    ((1, 157, 247, 255, 236, 231, 255, 255, 128, 128, 128), (121, 141, 235, 255,
    225, 227, 255, 255, 128, 128, 128), (45, 99, 188, 251, 195, 217, 255, 224,
    128, 128, 128)), ((1, 1, 251, 255, 213, 255, 128, 128, 128, 128, 128),
    (203, 1, 248, 255, 255, 128, 128, 128, 128, 128, 128), (137, 1, 177, 255,
    224, 255, 128, 128, 128, 128, 128))),
    (((253, 9, 248, 251, 207, 208, 255, 192, 128, 128, 128), (175, 13, 224, 243,
    193, 185, 249, 198, 255, 255, 128), (73, 17, 171, 221, 161, 179, 236, 167,
    255, 234, 128)), ((1, 95, 247, 253, 212, 183, 255, 255, 128, 128, 128),
    (239, 90, 244, 250, 211, 209, 255, 255, 128, 128, 128), (155, 77, 195, 248,
    188, 195, 255, 255, 128, 128, 128)), ((1, 24, 239, 251, 218, 219, 255, 205,
    128, 128, 128), (201, 51, 219, 255, 196, 186, 128, 128, 128, 128, 128),
    (69, 46, 190, 239, 201, 218, 255, 228, 128, 128, 128)),
    ((1, 191, 251, 255, 255, 128, 128, 128, 128, 128, 128), (223, 165, 249, 255,
    213, 255, 128, 128, 128, 128, 128), (141, 124, 248, 255, 255, 128, 128, 128,
    128, 128, 128)), ((1, 16, 248, 255, 255, 128, 128, 128, 128, 128, 128),
    (190, 36, 230, 255, 236, 255, 128, 128, 128, 128, 128), (149, 1, 255, 128,
    128, 128, 128, 128, 128, 128, 128)), ((1, 226, 255, 128, 128, 128, 128, 128,
    128, 128, 128), (247, 192, 255, 128, 128, 128, 128, 128, 128, 128, 128),
    (240, 128, 255, 128, 128, 128, 128, 128, 128, 128, 128)),
    ((1, 134, 252, 255, 255, 128, 128, 128, 128, 128, 128), (213, 62, 250, 255,
    255, 128, 128, 128, 128, 128, 128), (55, 93, 255, 128, 128, 128, 128, 128,
    128, 128, 128)), ((128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128),
    (128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128), (128, 128, 128,
    128, 128, 128, 128, 128, 128, 128, 128))),
    (((202, 24, 213, 235, 186, 191, 220, 160, 240, 175, 255),
    (126, 38, 182, 232, 169, 184, 228, 174, 255, 187, 128), (61, 46, 138, 219,
    151, 178, 240, 170, 255, 216, 128)), ((1, 112, 230, 250, 199, 191, 247, 159,
    255, 255, 128), (166, 109, 228, 252, 211, 215, 255, 174, 128, 128, 128),
    (39, 77, 162, 232, 172, 180, 245, 178, 255, 255, 128)),
    ((1, 52, 220, 246, 198, 199, 249, 220, 255, 255, 128), (124, 74, 191, 243,
    183, 193, 250, 221, 255, 255, 128), (24, 71, 130, 219, 154, 170, 243, 182,
    255, 255, 128)), ((1, 182, 225, 249, 219, 240, 255, 224, 128, 128, 128),
    (149, 150, 226, 252, 216, 205, 255, 171, 128, 128, 128), (28, 108, 170, 242,
    183, 194, 254, 223, 255, 255, 128)), ((1, 81, 230, 252, 204, 203, 255, 192,
    128, 128, 128), (123, 102, 209, 247, 188, 196, 255, 233, 128, 128, 128),
    (20, 95, 153, 243, 164, 173, 255, 203, 128, 128, 128)),
    ((1, 222, 248, 255, 216, 213, 128, 128, 128, 128, 128), (168, 175, 246, 252,
    235, 205, 255, 255, 128, 128, 128), (47, 116, 215, 255, 211, 212, 255, 255,
    128, 128, 128)), ((1, 121, 236, 253, 212, 214, 255, 255, 128, 128, 128),
    (141, 84, 213, 252, 201, 202, 255, 219, 128, 128, 128), (42, 80, 160, 240,
    162, 185, 255, 205, 128, 128, 128)), ((1, 1, 255, 128, 128, 128, 128, 128,
    128, 128, 128), (244, 1, 255, 128, 128, 128, 128, 128, 128, 128, 128),
    (238, 1, 255, 128, 128, 128, 128, 128, 128, 128, 128))));

  CoeffsUpdateProba: array [0 .. 3, 0 .. 7, 0 .. 2, 0 .. 10]
    of Byte = ((((255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255)), ((176, 246, 255, 255, 255, 255,
    255, 255, 255, 255, 255), (223, 241, 252, 255, 255, 255, 255, 255, 255, 255,
    255), (249, 253, 253, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 244, 252, 255, 255, 255, 255, 255, 255, 255, 255), (234, 254, 254,
    255, 255, 255, 255, 255, 255, 255, 255), (253, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 246, 254, 255, 255, 255, 255, 255, 255, 255,
    255), (239, 253, 254, 255, 255, 255, 255, 255, 255, 255, 255),
    (254, 255, 254, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 248, 254, 255, 255, 255, 255, 255, 255, 255, 255), (251, 255, 254,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 253, 254, 255, 255, 255, 255, 255, 255, 255,
    255), (251, 254, 254, 255, 255, 255, 255, 255, 255, 255, 255),
    (254, 255, 254, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 254, 253, 255, 254, 255, 255, 255, 255, 255, 255), (250, 255, 254,
    255, 254, 255, 255, 255, 255, 255, 255), (254, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255))),
    (((217, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255), (225, 252, 241,
    253, 255, 255, 254, 255, 255, 255, 255), (234, 250, 241, 250, 253, 255, 253,
    254, 255, 255, 255)), ((255, 254, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (223, 254, 254, 255, 255, 255, 255, 255, 255, 255, 255),
    (238, 253, 254, 254, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 248, 254, 255, 255, 255, 255, 255, 255, 255, 255), (249, 254, 255,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 253, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (247, 254, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 253, 254, 255, 255, 255, 255, 255, 255, 255, 255), (252, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 254, 254, 255, 255, 255, 255, 255, 255, 255,
    255), (253, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 254, 253, 255, 255, 255, 255, 255, 255, 255, 255), (250, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255), (254, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255))),
    (((186, 251, 250, 255, 255, 255, 255, 255, 255, 255, 255), (234, 251, 244,
    254, 255, 255, 255, 255, 255, 255, 255), (251, 251, 243, 253, 254, 255, 254,
    255, 255, 255, 255)), ((255, 253, 254, 255, 255, 255, 255, 255, 255, 255,
    255), (236, 253, 254, 255, 255, 255, 255, 255, 255, 255, 255),
    (251, 253, 253, 254, 254, 255, 255, 255, 255, 255, 255)),
    ((255, 254, 254, 255, 255, 255, 255, 255, 255, 255, 255), (254, 254, 254,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 254, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (254, 254, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (254, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255), (254, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255))),
    (((248, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255), (250, 254, 252,
    254, 255, 255, 255, 255, 255, 255, 255), (248, 254, 249, 253, 255, 255, 255,
    255, 255, 255, 255)), ((255, 253, 253, 255, 255, 255, 255, 255, 255, 255,
    255), (246, 253, 253, 255, 255, 255, 255, 255, 255, 255, 255),
    (252, 254, 251, 254, 254, 255, 255, 255, 255, 255, 255)),
    ((255, 254, 252, 255, 255, 255, 255, 255, 255, 255, 255), (248, 254, 253,
    255, 255, 255, 255, 255, 255, 255, 255), (253, 255, 254, 254, 255, 255, 255,
    255, 255, 255, 255)), ((255, 251, 254, 255, 255, 255, 255, 255, 255, 255,
    255), (245, 251, 254, 255, 255, 255, 255, 255, 255, 255, 255),
    (253, 253, 254, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 251, 253, 255, 255, 255, 255, 255, 255, 255, 255), (252, 253, 254,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 254, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 252, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (249, 255, 254, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 254, 255, 255, 255, 255, 255, 255, 255, 255)),
    ((255, 255, 253, 255, 255, 255, 255, 255, 255, 255, 255), (250, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255), (255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255)), ((255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255), (254, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255),
    (255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255))));

  kBands: array [0 .. 16] of Byte = (0, 1, 2, 3, 6, 4, 5, 6, 6, 6, 6, 6, 6,
    6, 6, 7, 0);

  kBModesProba: array [0 .. NUM_BMODES - 1, 0 .. NUM_BMODES - 1,
    0 .. NUM_BMODES - 2] of Byte = (((231, 120, 48, 89, 115, 113, 120, 152,
    112), (152, 179, 64, 126, 170, 118, 46, 70, 95), (175, 69, 143, 80, 85, 82,
    72, 155, 103), (56, 58, 10, 171, 218, 189, 17, 13, 152),
    (114, 26, 17, 163, 44, 195, 21, 10, 173), (121, 24, 80, 195, 26, 62, 44, 64,
    85), (144, 71, 10, 38, 171, 213, 144, 34, 26), (170, 46, 55, 19, 136, 160,
    33, 206, 71), (63, 20, 8, 114, 114, 208, 12, 9, 226), (81, 40, 11, 96, 182,
    84, 29, 16, 36)), ((134, 183, 89, 137, 98, 101, 106, 165, 148),
    (72, 187, 100, 130, 157, 111, 32, 75, 80), (66, 102, 167, 99, 74, 62, 40,
    234, 128), (41, 53, 9, 178, 241, 141, 26, 8, 107), (74, 43, 26, 146, 73,
    166, 49, 23, 157), (65, 38, 105, 160, 51, 52, 31, 115, 128),
    (104, 79, 12, 27, 217, 255, 87, 17, 7), (87, 68, 71, 44, 114, 51, 15, 186,
    23), (47, 41, 14, 110, 182, 183, 21, 17, 194), (66, 45, 25, 102, 197, 189,
    23, 18, 22)), ((88, 88, 147, 150, 42, 46, 45, 196, 205),
    (43, 97, 183, 117, 85, 38, 35, 179, 61), (39, 53, 200, 87, 26, 21, 43, 232,
    171), (56, 34, 51, 104, 114, 102, 29, 93, 77), (39, 28, 85, 171, 58, 165,
    90, 98, 64), (34, 22, 116, 206, 23, 34, 43, 166, 73), (107, 54, 32, 26, 51,
    1, 81, 43, 31), (68, 25, 106, 22, 64, 171, 36, 225, 114),
    (34, 19, 21, 102, 132, 188, 16, 76, 124), (62, 18, 78, 95, 85, 57, 50, 48,
    51)), ((193, 101, 35, 159, 215, 111, 89, 46, 111), (60, 148, 31, 172, 219,
    228, 21, 18, 111), (112, 113, 77, 85, 179, 255, 38, 120, 114),
    (40, 42, 1, 196, 245, 209, 10, 25, 109), (88, 43, 29, 140, 166, 213, 37, 43,
    154), (61, 63, 30, 155, 67, 45, 68, 1, 209), (100, 80, 8, 43, 154, 1, 51,
    26, 71), (142, 78, 78, 16, 255, 128, 34, 197, 171), (41, 40, 5, 102, 211,
    183, 4, 1, 221), (51, 50, 17, 168, 209, 192, 23, 25, 82)),
    ((138, 31, 36, 171, 27, 166, 38, 44, 229), (67, 87, 58, 169, 82, 115, 26,
    59, 179), (63, 59, 90, 180, 59, 166, 93, 73, 154), (40, 40, 21, 116, 143,
    209, 34, 39, 175), (47, 15, 16, 183, 34, 223, 49, 45, 183),
    (46, 17, 33, 183, 6, 98, 15, 32, 183), (57, 46, 22, 24, 128, 1, 54, 17, 37),
    (65, 32, 73, 115, 28, 128, 23, 128, 205), (40, 3, 9, 115, 51, 192, 18, 6,
    223), (87, 37, 9, 115, 59, 77, 64, 21, 47)),
    ((104, 55, 44, 218, 9, 54, 53, 130, 226), (64, 90, 70, 205, 40, 41, 23, 26,
    57), (54, 57, 112, 184, 5, 41, 38, 166, 213), (30, 34, 26, 133, 152, 116,
    10, 32, 134), (39, 19, 53, 221, 26, 114, 32, 73, 255), (31, 9, 65, 234, 2,
    15, 1, 118, 73), (75, 32, 12, 51, 192, 255, 160, 43, 51),
    (88, 31, 35, 67, 102, 85, 55, 186, 85), (56, 21, 23, 111, 59, 205, 45, 37,
    192), (55, 38, 70, 124, 73, 102, 1, 34, 98)),
    ((125, 98, 42, 88, 104, 85, 117, 175, 82), (95, 84, 53, 89, 128, 100, 113,
    101, 45), (75, 79, 123, 47, 51, 128, 81, 171, 1), (57, 17, 5, 71, 102, 57,
    53, 41, 49), (38, 33, 13, 121, 57, 73, 26, 1, 85), (41, 10, 67, 138, 77,
    110, 90, 47, 114), (115, 21, 2, 10, 102, 255, 166, 23, 6),
    (101, 29, 16, 10, 85, 128, 101, 196, 26), (57, 18, 10, 102, 102, 213, 34,
    20, 43), (117, 20, 15, 36, 163, 128, 68, 1, 26)),
    ((102, 61, 71, 37, 34, 53, 31, 243, 192), (69, 60, 71, 38, 73, 119, 28, 222,
    37), (68, 45, 128, 34, 1, 47, 11, 245, 171), (62, 17, 19, 70, 146, 85, 55,
    62, 70), (37, 43, 37, 154, 100, 163, 85, 160, 1), (63, 9, 92, 136, 28, 64,
    32, 201, 85), (75, 15, 9, 9, 64, 255, 184, 119, 16), (86, 6, 28, 5, 64, 255,
    25, 248, 1), (56, 8, 17, 132, 137, 255, 55, 116, 128), (58, 15, 20, 82, 135,
    57, 26, 121, 40)), ((164, 50, 31, 137, 154, 133, 25, 35, 218),
    (51, 103, 44, 131, 131, 123, 31, 6, 158), (86, 40, 64, 135, 148, 224, 45,
    183, 128), (22, 26, 17, 131, 240, 154, 14, 1, 209), (45, 16, 21, 91, 64,
    222, 7, 1, 197), (56, 21, 39, 155, 60, 138, 23, 102, 213),
    (83, 12, 13, 54, 192, 255, 68, 47, 28), (85, 26, 85, 85, 128, 128, 32, 146,
    171), (18, 11, 7, 63, 144, 171, 4, 4, 246), (35, 27, 10, 146, 174, 171, 12,
    26, 128)), ((190, 80, 35, 99, 180, 80, 126, 54, 45), (85, 126, 47, 87, 176,
    51, 41, 20, 32), (101, 75, 128, 139, 118, 146, 116, 128, 85),
    (56, 41, 15, 176, 236, 85, 37, 9, 62), (71, 30, 17, 119, 118, 255, 17, 18,
    138), (101, 38, 60, 138, 55, 70, 43, 26, 142), (146, 36, 19, 30, 171, 255,
    97, 27, 20), (138, 45, 61, 62, 219, 1, 81, 188, 64), (32, 41, 20, 117, 151,
    142, 20, 21, 163), (112, 19, 12, 61, 195, 128, 48, 4, 24)));

  kDcTable: array [0 .. 127] of Byte = (4, 5, 6, 7, 8, 9, 10, 10, 11, 12, 13,
    14, 15, 16, 17, 17, 18, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 25, 25, 26,
    27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 37, 38, 39, 40, 41, 42, 43, 44,
    45, 46, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
    63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 76, 77, 78, 79, 80,
    81, 82, 83, 84, 85, 86, 87, 88, 89, 91, 93, 95, 96, 98, 100, 101, 102, 104,
    106, 108, 110, 112, 114, 116, 118, 122, 124, 126, 128, 130, 132, 134, 136,
    138, 140, 143, 145, 148, 151, 154, 157);

  kAcTable: array [0 .. 127] of Word = (4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,
    34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52,
    53, 54, 55, 56, 57, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84,
    86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116,
    119, 122, 125, 128, 131, 134, 137, 140, 143, 146, 149, 152, 155, 158, 161,
    164, 167, 170, 173, 177, 181, 185, 189, 193, 197, 201, 205, 209, 213, 217,
    221, 225, 229, 234, 239, 245, 249, 254, 259, 264, 269, 274, 279, 284);

  kZigzag: array [0 .. 15] of Byte = (0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7,
    11, 14, 15);

  kScan: array [0 .. 15] of Integer = (0, 4, 8, 12, 128, 132, 136, 140, 256,
    260, 264, 268, 384, 388, 392, 396);

  kCat3: array [0 .. 3] of Byte = (173, 148, 140, 0);
  kCat4: array [0 .. 4] of Byte = (176, 155, 140, 135, 0);
  kCat5: array [0 .. 5] of Byte = (180, 157, 141, 134, 130, 0);
  kCat6: array [0 .. 11] of Byte = (254, 254, 243, 230, 196, 177, 153, 140, 133,
    130, 129, 0);

  kCodeToPlane: array [0 .. 119] of Integer = ($18, $07, $17, $19, $28, $06,
    $27, $29, $16, $1A, $26, $2A, $38, $05, $37, $39, $15, $1B, $36, $3A, $25,
    $2B, $48, $04, $47, $49, $14, $1C, $35, $3B, $46, $4A, $24, $2C, $58, $45,
    $4B, $34, $3C, $03, $57, $59, $13, $1D, $56, $5A, $23, $2D, $44, $4C, $55,
    $5B, $33, $3D, $68, $02, $67, $69, $12, $1E, $66, $6A, $22, $2E, $54, $5C,
    $43, $4D, $65, $6B, $32, $3E, $78, $01, $77, $79, $53, $5D, $11, $1F, $64,
    $6C, $42, $4E, $76, $7A, $21, $2F, $75, $7B, $31, $3F, $63, $6D, $52, $5E,
    $00, $74, $7C, $41, $4F, $10, $20, $62, $6E, $30, $73, $7D, $51, $5F, $40,
    $72, $7E, $61, $6F, $50, $71, $7F, $60, $70);

  kCodeLengthCodeOrder: array [0 .. 18] of Byte = (17, 18, 0, 1, 2, 3, 4, 5, 16,
    6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

  kAlphabetSize: array [0 .. 4] of Integer = (280, 256, 256, 256, 40);

type
  TVP8BandProbas = record
    Probas: array [0 .. NUM_CTX - 1, 0 .. NUM_PROBAS - 1] of Byte;
  end;

  TBandPtrsRow = array [0 .. 16] of ^TVP8BandProbas;

  TVP8Proba = record
    Bands: array [0 .. NUM_TYPES - 1, 0 .. NUM_BANDS - 1] of TVP8BandProbas;
    BandsPtr: array [0 .. NUM_TYPES - 1] of TBandPtrsRow;
  end;

  TVP8QuantMatrix = record
    Y1Mat: array [0 .. 1] of Integer;
    Y2Mat: array [0 .. 1] of Integer;
    UVMat: array [0 .. 1] of Integer;
    UVQuant: Integer;
  end;

  TVP8SegmentHeader = record
    UseSegment: Boolean;
    UpdateMap: Boolean;
    AbsoluteDelta: Boolean;
    Quantizer: array [0 .. NUM_MB_SEGMENTS - 1] of Integer;
    FilterStrength: array [0 .. NUM_MB_SEGMENTS - 1] of Integer;
    SegProbs: array [0 .. MB_FEATURE_TREE_PROBS - 1] of Byte;
  end;

  TVP8MB = record
    NZ: Byte;
    NZDC: Byte;
  end;

  PVP8MB = ^TVP8MB;

  TVP8MBData = record
    Coeffs: array [0 .. 383] of Int16;
    IsI4x4: Boolean;
    IModes: array [0 .. 15] of Byte;
    UVMode: Byte;
    NonZeroY: Cardinal;
    NonZeroUV: Cardinal;
    Skip: Boolean;
    Segment: Byte;
  end;

  PVP8MBData = ^TVP8MBData;

  THuffmanCode = record
    Bits: Byte;
    Value: Word;
  end;

  PHuffmanCode = ^THuffmanCode;

  THuffmanCode32 = record
    Bits: Byte;
    Value: Cardinal;
  end;

function SarI(v, n: Integer): Integer; inline;
begin
  if v >= 0 then
    Result := v shr n
  else
    Result := not(not v shr n);
end;

function Clip8b(v: Integer): Byte; inline;
begin
  if v < 0 then
    Result := 0
  else if v > 255 then
    Result := 255
  else
    Result := Byte(v);
end;

function ClipMax(v, M: Integer): Integer; inline;
begin
  if v < 0 then
    Result := 0
  else if v > M then
    Result := M
  else
    Result := v;
end;

function MultHi(v, c: Integer): Integer; inline;
begin
  Result := (v * c) shr 8;
end;

function VP8Clip8(v: Integer): Byte; inline;
begin
  if (v and (not $3FFF)) = 0 then
    Result := Byte(v shr 6)
  else if v < 0 then
    Result := 0
  else
    Result := 255;
end;

function YuvToR(y, v: Integer): Byte; inline;
begin
  Result := VP8Clip8(MultHi(y, 19077) + MultHi(v, 26149) - 14234);
end;

function YuvToG(y, u, v: Integer): Byte; inline;
begin
  Result := VP8Clip8(MultHi(y, 19077) - MultHi(u, 6419) - MultHi(v,
    13320) + 8708);
end;

function YuvToB(y, u: Integer): Byte; inline;
begin
  Result := VP8Clip8(MultHi(y, 19077) + MultHi(u, 33050) - 17685);
end;

type
  TVP8LBitReader = record
    Val: UInt64;
    Available: Integer;
    Buf: PByte;
    BufEnd: PByte;
    Eos: Boolean;
  end;

procedure VP8LFillBitWindow(var BR: TVP8LBitReader); inline;
begin
  while (BR.Available <= 56) and (BR.Buf < BR.BufEnd) do
  begin
    BR.Val := BR.Val or (UInt64(BR.Buf^) shl BR.Available);
    Inc(BR.Buf);
    Inc(BR.Available, 8);
  end;
  if (BR.Buf >= BR.BufEnd) and (BR.Available < 0) then
    BR.Eos := True;
end;

procedure VP8LInitBitReader(var BR: TVP8LBitReader; Data: PByte;
  Size: NativeUInt);
begin
  BR.Val := 0;
  BR.Available := 0;
  BR.Buf := Data;
  BR.BufEnd := Data + Size;
  BR.Eos := (Size = 0);
  VP8LFillBitWindow(BR);
end;

function VP8LReadBits(var BR: TVP8LBitReader; n: Integer): Cardinal; inline;
begin
  if n = 0 then
  begin
    Result := 0;
    Exit;
  end;
  Result := Cardinal(BR.Val) and Cardinal((UInt64(1) shl n) - 1);
  BR.Val := BR.Val shr n;
  Dec(BR.Available, n);
  if BR.Available <= 32 then
    VP8LFillBitWindow(BR);
end;

function VP8LPeekBits(const BR: TVP8LBitReader; n: Integer): Cardinal; inline;
begin
  Result := Cardinal(BR.Val) and Cardinal((UInt64(1) shl n) - 1);
end;

type
  TVP8Rd = record
    Val: UInt64;
    Range: UInt32;
    Bits: Integer;
    Buf: PByte;
    BufEnd: PByte;
    Eof: Boolean;
  end;

procedure VP8RdLoadByte(var R: TVP8Rd); inline;
begin
  if R.Buf < R.BufEnd then
  begin
    R.Val := (R.Val shl 8) or R.Buf^;
    Inc(R.Buf);
  end
  else
  begin
    R.Eof := True;
    R.Val := R.Val shl 8;
  end;
  Inc(R.Bits, 8);
end;

procedure VP8RdInit(var R: TVP8Rd; Data: PByte; Size: NativeUInt);
begin
  R.Val := 0;
  R.Range := 254;
  R.Bits := -8;
  R.Buf := Data;
  R.BufEnd := Data + Size;
  R.Eof := (Size = 0);
  VP8RdLoadByte(R);
end;

function VP8RdGetBit(var R: TVP8Rd; Prob: Integer): Integer; inline;
var
  split: UInt32;
begin
  if R.Bits < 0 then
    VP8RdLoadByte(R);
  split := (R.Range * UInt32(Prob)) shr 8;
  if (R.Val shr R.Bits) > split then
  begin
    Dec(R.Range, split + 1);
    Dec(R.Val, UInt64(split + 1) shl R.Bits);
    Result := 1;
  end
  else
  begin
    R.Range := split;
    Result := 0;
  end;

  while R.Range < 127 do
  begin
    R.Range := R.Range * 2 + 1;
    Dec(R.Bits);
    if R.Bits < 0 then
      VP8RdLoadByte(R);
  end;
end;

function VP8RdGet(var R: TVP8Rd): Integer; inline;
begin
  Result := VP8RdGetBit(R, 128);
end;

function VP8RdGetSigned(var R: TVP8Rd; v: Integer): Integer; inline;
var
  pos: Integer;
  split, Value: UInt32;
  mask: Integer;
begin
  if R.Bits < 0 then
    VP8RdLoadByte(R);
  pos := R.Bits;
  split := R.Range shr 1;
  Value := UInt32(R.Val shr pos);

  mask := SarI(Integer(split) - Integer(Value), 31);
  R.Bits := pos - 1;
  Inc(R.Range, UInt32(mask));
  R.Range := R.Range or 1;
  Dec(R.Val, UInt64((split + 1) and UInt32(mask)) shl pos);

  Result := (v xor mask) - mask;
end;

function VP8RdGetValue(var R: TVP8Rd; n: Integer): Cardinal; inline;
var
  i: Integer;
begin
  Result := 0;
  for i := n - 1 downto 0 do
    if VP8RdGetBit(R, 128) <> 0 then
      Result := Result or (Cardinal(1) shl i);
end;

function VP8RdGetSignedValue(var R: TVP8Rd; n: Integer): Integer; inline;
var
  v: Cardinal;
begin
  v := VP8RdGetValue(R, n);
  if VP8RdGetBit(R, 128) <> 0 then
    Result := -Integer(v)
  else
    Result := Integer(v);
end;

const
  HUFF_LUT_BITS = 8;

type
  THuffTable = array [0 .. FIXED_TABLE_SIZE - 1] of THuffmanCode;
  PHuffTable = ^THuffTable;

function VP8LBuildHuffmanTable(const Lengths: array of Integer;
  NumSymbols: Integer; Table: PHuffmanCode; TableBits: Integer): Boolean;
var
  count: array [0 .. 16] of Integer;
  nextcode: array [0 .. 16] of Cardinal;
  code: Cardinal;
  i, len: Integer;
  entry: THuffmanCode;
  mirror: Cardinal;
  j, step: Integer;
  tableSize: Integer;
begin
  Result := False;
  tableSize := 1 shl TableBits;
  FillChar(count, SizeOf(count), 0);
  for i := 0 to NumSymbols - 1 do
  begin
    len := Lengths[i];
    if (len < 0) or (len > 15) then
      Exit;
    Inc(count[len]);
  end;

  code := 0;
  nextcode[0] := 0;
  for len := 1 to 15 do
  begin
    code := (code + Cardinal(count[len - 1])) shl 1;
    nextcode[len] := code;
  end;

  for i := 0 to tableSize - 1 do
  begin
    Table[i].Bits := 0;
    Table[i].Value := $FFFF;
  end;
  for i := 0 to NumSymbols - 1 do
  begin
    len := Lengths[i];
    if len = 0 then
      Continue;
    if len > TableBits then
      Continue;

    code := nextcode[len];
    Inc(nextcode[len]);
    mirror := 0;
    for j := 0 to len - 1 do
      if (code shr j) and 1 <> 0 then
        mirror := mirror or (Cardinal(1) shl (len - 1 - j));

    step := 1 shl len;
    j := Integer(mirror);
    while j < tableSize do
    begin
      entry.Bits := Byte(len);
      entry.Value := Word(i);
      Table[j] := entry;
      Inc(j, step);
    end;
  end;
  Result := True;
end;

function HuffReadSymbol(var BR: TVP8LBitReader; const Table: PHuffmanCode;
  TableBits: Integer): Integer; inline;
var
  key: Cardinal;
  e: THuffmanCode;
begin
  key := VP8LPeekBits(BR, TableBits);
  e := Table[key];
  if e.Bits = 0 then
  begin
    Result := -1;
    Exit;
  end;

  BR.Val := BR.Val shr e.Bits;
  Dec(BR.Available, e.Bits);
  if BR.Available <= 32 then
    VP8LFillBitWindow(BR);
  Result := Integer(e.Value);
end;

type
  TVP8FInfo = record
    FLimit: Integer;
    FILevel: Integer;
    HevThresh: Integer;
    FInner: Boolean;
  end;

  PVP8FInfo = ^TVP8FInfo;

  TVP8Decoder = record
    BR: TVP8Rd;

    Parts: array [0 .. MAX_NUM_PARTITIONS - 1] of TVP8Rd;
    NumParts: Integer;

    PicWidth: Integer;
    PicHeight: Integer;
    MbW: Integer;
    MbH: Integer;

    KeyFrame: Boolean;
    Profile: Integer;
    PartLen0: Integer;

    SegHdr: TVP8SegmentHeader;

    DQM: array [0 .. NUM_MB_SEGMENTS - 1] of TVP8QuantMatrix;

    Proba: TVP8Proba;

    FilterSimple: Boolean;
    FilterLevel: Integer;
    FilterSharpness: Integer;
    UseLFDelta: Boolean;
    RefLFDelta: array [0 .. NUM_REF_LF_DELTAS - 1] of Integer;
    ModeLFDelta: array [0 .. NUM_MODE_LF_DELTAS - 1] of Integer;

    OutputMode: TCSMode;
    OutStride: Integer;
    OutBpp: Integer;

    YuvBuf: array [0 .. YUV_SIZE - 1] of Byte;

    YTopBuf: PByte;
    UTopBuf: PByte;
    VTopBuf: PByte;

    MBInfo: PVP8MB;

    MBData: TVP8MBData;

    UseSkipProba: Boolean;
    SkipP: Byte;

    IntraT: PByte;
    IntraL: array [0 .. 3] of Byte;

    OutBuf: PByte;

    FilterType: Integer;
    FStrength: array [0 .. NUM_MB_SEGMENTS - 1, 0 .. 1] of TVP8FInfo;

    FInfo: PVP8FInfo;

    FYPlane: PByte;
    FUPlane: PByte;
    FVPlane: PByte;
    FYStride: Integer;
    FUVStride: Integer;
  end;

procedure VP8ParseSegmentHeader(var BR: TVP8Rd; var Hdr: TVP8SegmentHeader);
var
  i: Integer;
begin
  Hdr.UseSegment := VP8RdGet(BR) <> 0;
  if not Hdr.UseSegment then
  begin
    Hdr.UpdateMap := False;
    Exit;
  end;
  Hdr.UpdateMap := VP8RdGet(BR) <> 0;

  if VP8RdGet(BR) <> 0 then
  begin
    Hdr.AbsoluteDelta := VP8RdGet(BR) <> 0;

    for i := 0 to NUM_MB_SEGMENTS - 1 do
      if VP8RdGet(BR) <> 0 then
        Hdr.Quantizer[i] := VP8RdGetSignedValue(BR, 7)
      else
        Hdr.Quantizer[i] := 0;
    for i := 0 to NUM_MB_SEGMENTS - 1 do
      if VP8RdGet(BR) <> 0 then
        Hdr.FilterStrength[i] := VP8RdGetSignedValue(BR, 6)
      else
        Hdr.FilterStrength[i] := 0;
  end;
  if Hdr.UpdateMap then
  begin
    for i := 0 to MB_FEATURE_TREE_PROBS - 1 do
      if VP8RdGet(BR) <> 0 then
        Hdr.SegProbs[i] := Byte(VP8RdGetValue(BR, 8))
      else
        Hdr.SegProbs[i] := 255;
  end;
end;

procedure VP8ParseFilterHeader(var BR: TVP8Rd; var D: TVP8Decoder);
var
  i: Integer;
begin
  D.FilterSimple := VP8RdGet(BR) <> 0;
  D.FilterLevel := Integer(VP8RdGetValue(BR, 6));
  D.FilterSharpness := Integer(VP8RdGetValue(BR, 3));
  D.UseLFDelta := VP8RdGet(BR) <> 0;
  if D.UseLFDelta and (VP8RdGet(BR) <> 0) then
  begin
    for i := 0 to NUM_REF_LF_DELTAS - 1 do
      if VP8RdGet(BR) <> 0 then
        D.RefLFDelta[i] := VP8RdGetSignedValue(BR, 6);
    for i := 0 to NUM_MODE_LF_DELTAS - 1 do
      if VP8RdGet(BR) <> 0 then
        D.ModeLFDelta[i] := VP8RdGetSignedValue(BR, 6);
  end;
end;

function QClip(v, M: Integer): Integer; inline;
begin
  if v < 0 then
    Result := 0
  else if v > M then
    Result := M
  else
    Result := v;
end;

procedure VP8ParseQuant(var BR: TVP8Rd; var D: TVP8Decoder);
var
  base_q0: Integer;
  dqy1_dc, dqy2_dc, dqy2_ac, dquv_dc, dquv_ac: Integer;
  i, q: Integer;
  M: ^TVP8QuantMatrix;
begin
  // q := 0;
  base_q0 := Integer(VP8RdGetValue(BR, 7));
  if VP8RdGet(BR) <> 0 then
    dqy1_dc := VP8RdGetSignedValue(BR, 4)
  else
    dqy1_dc := 0;
  if VP8RdGet(BR) <> 0 then
    dqy2_dc := VP8RdGetSignedValue(BR, 4)
  else
    dqy2_dc := 0;
  if VP8RdGet(BR) <> 0 then
    dqy2_ac := VP8RdGetSignedValue(BR, 4)
  else
    dqy2_ac := 0;
  if VP8RdGet(BR) <> 0 then
    dquv_dc := VP8RdGetSignedValue(BR, 4)
  else
    dquv_dc := 0;
  if VP8RdGet(BR) <> 0 then
    dquv_ac := VP8RdGetSignedValue(BR, 4)
  else
    dquv_ac := 0;
  for i := 0 to NUM_MB_SEGMENTS - 1 do
  begin
    if D.SegHdr.UseSegment then
    begin
      q := D.SegHdr.Quantizer[i];
      if not D.SegHdr.AbsoluteDelta then
        Inc(q, base_q0);
    end
    else
    begin
      if i > 0 then
      begin
        D.DQM[i] := D.DQM[0];
        Continue;
      end;
      q := base_q0;
    end;
    M := @D.DQM[i];
    M^.Y1Mat[0] := kDcTable[QClip(q + dqy1_dc, 127)];
    M^.Y1Mat[1] := kAcTable[QClip(q, 127)];
    M^.Y2Mat[0] := kDcTable[QClip(q + dqy2_dc, 127)] * 2;
    M^.Y2Mat[1] := (Integer(kAcTable[QClip(q + dqy2_ac, 127)]) * 101581) shr 16;
    if M^.Y2Mat[1] < 8 then
      M^.Y2Mat[1] := 8;
    M^.UVMat[0] := kDcTable[QClip(q + dquv_dc, 117)]; // max 117!
    M^.UVMat[1] := kAcTable[QClip(q + dquv_ac, 127)];
    M^.UVQuant := q + dquv_ac;
  end;
end;

procedure VP8ParseProba(var BR: TVP8Rd; var D: TVP8Decoder);
var
  t, b, ctx, p: Integer;
begin
  for t := 0 to NUM_TYPES - 1 do
    for b := 0 to NUM_BANDS - 1 do
      for ctx := 0 to NUM_CTX - 1 do
        for p := 0 to NUM_PROBAS - 1 do
          D.Proba.Bands[t, b].Probas[ctx, p] := CoeffsProba0[t, b, ctx, p];
  for t := 0 to NUM_TYPES - 1 do
    for b := 0 to NUM_BANDS - 1 do
      for ctx := 0 to NUM_CTX - 1 do
        for p := 0 to NUM_PROBAS - 1 do
          if VP8RdGetBit(BR, CoeffsUpdateProba[t, b, ctx, p]) <> 0 then
            D.Proba.Bands[t, b].Probas[ctx, p] := Byte(VP8RdGetValue(BR, 8));
  for t := 0 to NUM_TYPES - 1 do
    for b := 0 to 16 do
      D.Proba.BandsPtr[t][b] := @D.Proba.Bands[t, kBands[b]];
  D.UseSkipProba := VP8RdGet(BR) <> 0;
  if D.UseSkipProba then
    D.SkipP := Byte(VP8RdGetValue(BR, 8));
end;

function ParseIntra16Mode(var BR: TVP8Rd): Integer; inline;
begin
  if VP8RdGetBit(BR, 156) <> 0 then
  begin
    if VP8RdGetBit(BR, 128) <> 0 then
      Result := TM_PRED
    else
      Result := H_PRED;
  end
  else
  begin
    if VP8RdGetBit(BR, 163) <> 0 then
      Result := V_PRED
    else
      Result := DC_PRED;
  end;
end;

function ParseUVMode(var BR: TVP8Rd): Integer; inline;
begin
  if VP8RdGetBit(BR, 142) = 0 then
    Result := DC_PRED
  else if VP8RdGetBit(BR, 114) = 0 then
    Result := V_PRED
  else if VP8RdGetBit(BR, 183) <> 0 then
    Result := TM_PRED
  else
    Result := H_PRED;
end;

function ParseIntra4x4Mode(var BR: TVP8Rd; const Prob: array of Byte): Integer;
begin
  if VP8RdGetBit(BR, Prob[0]) = 0 then
  begin
    Result := B_DC_PRED;
    Exit;
  end;
  if VP8RdGetBit(BR, Prob[1]) = 0 then
  begin
    Result := B_TM_PRED;
    Exit;
  end;
  if VP8RdGetBit(BR, Prob[2]) = 0 then
  begin
    Result := B_VE_PRED;
    Exit;
  end;
  if VP8RdGetBit(BR, Prob[3]) = 0 then
  begin
    if VP8RdGetBit(BR, Prob[4]) = 0 then
    begin
      Result := B_HE_PRED;
      Exit;
    end;
    if VP8RdGetBit(BR, Prob[5]) = 0 then
    begin
      Result := B_RD_PRED;
      Exit;
    end;
    Result := B_VR_PRED;
  end
  else
  begin
    if VP8RdGetBit(BR, Prob[6]) = 0 then
    begin
      Result := B_LD_PRED;
      Exit;
    end;
    if VP8RdGetBit(BR, Prob[7]) = 0 then
    begin
      Result := B_VL_PRED;
      Exit;
    end;
    if VP8RdGetBit(BR, Prob[8]) = 0 then
    begin
      Result := B_HD_PRED;
      Exit;
    end;
    Result := B_HU_PRED;
  end;
end;

procedure VP8ParseIntraModes(var D: TVP8Decoder);
var
  topY: PByte;
  seg_proba: array [0 .. MB_FEATURE_TREE_PROBS - 1] of Byte;
  leftMode: array [0 .. 15] of Byte;
begin
  topY := AllocMem(D.MbW * 4 * SizeOf(Byte));
  FillChar(topY^, D.MbW * 4, B_DC_PRED);
  FillChar(leftMode, SizeOf(leftMode), B_DC_PRED);

  seg_proba[0] := 145;
  seg_proba[1] := 145;
  seg_proba[2] := 145;

  FreeMem(topY);
end;

function VP8GetCoeffsFast(var BR: TVP8Rd; const BandsPtr: TBandPtrsRow;
  StartCtx, First: Integer; Dq0, Dq1: Integer; Coeffs: PInt16): Integer;
var
  n, v: Integer;
  p: PByte;
  tab: PByte;
  bit1, bit0, cat: Integer;
begin
  n := First;
  p := @(BandsPtr[n]^.Probas[StartCtx, 0]);

  while n < 16 do
  begin
    if VP8RdGetBit(BR, p[0]) = 0 then
    begin
      Result := n;
      Exit;
    end;

    while VP8RdGetBit(BR, p[1]) = 0 do
    begin
      Inc(n);
      if n = 16 then
      begin
        Result := 16;
        Exit;
      end;
      p := @(BandsPtr[n]^.Probas[0, 0]);
    end;

    if VP8RdGetBit(BR, p[2]) = 0 then
    begin
      v := 1;
      p := @(BandsPtr[n + 1]^.Probas[1, 0]);
    end
    else
    begin
      if VP8RdGetBit(BR, p[3]) = 0 then
      begin
        if VP8RdGetBit(BR, p[4]) = 0 then
          v := 2
        else
          v := 3 + VP8RdGetBit(BR, p[5]);
      end
      else if VP8RdGetBit(BR, p[6]) = 0 then
      begin
        if VP8RdGetBit(BR, p[7]) = 0 then
          v := 5 + VP8RdGetBit(BR, 159)
        else
        begin
          v := 7 + 2 * VP8RdGetBit(BR, 165);
          v := v + VP8RdGetBit(BR, 145);
        end;
      end
      else
      begin
        bit1 := VP8RdGetBit(BR, p[8]);
        bit0 := VP8RdGetBit(BR, p[9 + bit1]);
        cat := 2 * bit1 + bit0;
        case cat of
          0:
            tab := @kCat3[0];
          1:
            tab := @kCat4[0];
          2:
            tab := @kCat5[0];
          3:
            tab := @kCat6[0];
        else
          tab := @kCat3[0];
        end;
        v := 0;
        while tab^ <> 0 do
        begin
          v := v * 2 + VP8RdGetBit(BR, tab^);
          Inc(tab);
        end;
        v := v + 3 + (8 shl cat);
      end;
      p := @(BandsPtr[n + 1]^.Probas[2, 0]);
    end;
    v := VP8RdGetSigned(BR, v);
    if n = 0 then
      Coeffs[kZigzag[0]] := Int16(v * Dq0)
    else
      Coeffs[kZigzag[n]] := Int16(v * Dq1);
    Inc(n);
    if n = 16 then
      Break;
  end;
  Result := n;
end;

procedure VP8TransformWHT(DC: PInt16; Out16: PInt16); forward;

function VP8ParseResiduals(var D: TVP8Decoder; MbX: Integer; var Part: TVP8Rd;
  PartIdx: Integer): Boolean;
var
  mb: ^TVP8MBData;
  leftMB: PVP8MB;
  topMB: PVP8MB;
  DQM: ^TVP8QuantMatrix;
  dcBuf: array [0 .. 15] of Int16;
  dst: PInt16;
  First: Integer;
  acBands: ^TBandPtrsRow;
  tnz, lnz: Byte;
  l, nz_val: Integer;
  x, y, ch: Integer;
  ctx: Integer;
  nzCoeffs: Cardinal;
  NonZeroY: Cardinal;
  NonZeroUV: Cardinal;
  outTNZ, outLNZ: Byte;
begin
  mb := @D.MBData;
  leftMB := D.MBInfo;
  topMB := PVP8MB(NativeUInt(D.MBInfo) + NativeUInt((MbX + 1) * SizeOf(TVP8MB)));
  DQM := @D.DQM[mb^.Segment];

  FillChar(mb^.Coeffs[0], SizeOf(mb^.Coeffs), 0);
  NonZeroY := 0;
  NonZeroUV := 0;

  if not mb^.IsI4x4 then
  begin
    FillChar(dcBuf, SizeOf(dcBuf), 0);
    ctx := Integer(topMB^.NZDC) + Integer(leftMB^.NZDC);
    nz_val := VP8GetCoeffsFast(Part, D.Proba.BandsPtr[1], ctx, 0, DQM^.Y2Mat[0],
      DQM^.Y2Mat[1], @dcBuf[0]);
    topMB^.NZDC := Byte(nz_val > 0);
    leftMB^.NZDC := Byte(nz_val > 0);
    if nz_val > 1 then
    begin
      VP8TransformWHT(@dcBuf[0], @dcBuf[0]);

      for y := 0 to 15 do
        mb^.Coeffs[y * 16] := dcBuf[y];
    end
    else if nz_val = 1 then
    begin
      nz_val := SarI(Integer(dcBuf[0]) + 3, 3);
      for y := 0 to 15 do
        mb^.Coeffs[y * 16] := Int16(nz_val);
    end;
    First := 1;
    acBands := @D.Proba.BandsPtr[0];
  end
  else
  begin
    First := 0;
    acBands := @D.Proba.BandsPtr[3];
  end;

  tnz := topMB^.NZ and $0F;
  lnz := leftMB^.NZ and $0F;
  dst := @mb^.Coeffs[0];
  for y := 0 to 3 do
  begin
    l := lnz and 1;
    nzCoeffs := 0;
    for x := 0 to 3 do
    begin
      ctx := l + (tnz and 1);
      nz_val := VP8GetCoeffsFast(Part, acBands^, ctx, First, DQM^.Y1Mat[0],
        DQM^.Y1Mat[1], dst);
      l := Byte(nz_val > First);
      tnz := Byte((tnz shr 1) or (l shl 7));
      nzCoeffs := nzCoeffs shl 2;
      if nz_val > 3 then
        nzCoeffs := nzCoeffs or 3
      else if nz_val > 1 then
        nzCoeffs := nzCoeffs or 2
      else if dst[0] <> 0 then
        nzCoeffs := nzCoeffs or 1;
      Inc(dst, 16);
    end;
    tnz := tnz shr 4;
    lnz := Byte((lnz shr 1) or (l shl 7));
    NonZeroY := (NonZeroY shl 8) or nzCoeffs;
  end;
  outTNZ := tnz;
  outLNZ := lnz shr 4;
  mb^.NonZeroY := NonZeroY;

  for ch := 0 to 1 do
  begin
    nzCoeffs := 0;
    tnz := topMB^.NZ shr (4 + ch * 2);
    lnz := leftMB^.NZ shr (4 + ch * 2);
    for y := 0 to 1 do
    begin
      l := lnz and 1;
      for x := 0 to 1 do
      begin
        ctx := l + (tnz and 1);
        nz_val := VP8GetCoeffsFast(Part, D.Proba.BandsPtr[2], ctx, 0,
          DQM^.UVMat[0], DQM^.UVMat[1], dst);
        l := Byte(nz_val > 0);
        tnz := Byte((tnz shr 1) or (l shl 3));
        nzCoeffs := nzCoeffs shl 2;
        if nz_val > 3 then
          nzCoeffs := nzCoeffs or 3
        else if nz_val > 1 then
          nzCoeffs := nzCoeffs or 2
        else if dst[0] <> 0 then
          nzCoeffs := nzCoeffs or 1;
        Inc(dst, 16);
      end;
      tnz := tnz shr 2;
      lnz := Byte((lnz shr 1) or (l shl 5));
    end;
    NonZeroUV := NonZeroUV or (nzCoeffs shl (4 * ch * 2));
    outTNZ := outTNZ or Byte((tnz shl 4) shl (ch * 2));
    outLNZ := outLNZ or Byte((lnz and $F0) shl (ch * 2));
  end;
  mb^.NonZeroUV := NonZeroUV;

  topMB^.NZ := outTNZ;
  leftMB^.NZ := outLNZ;

  Result := (NonZeroY or NonZeroUV) = 0;
end;

procedure VP8TransformOne(c: PInt16; Pred: PByte; dst: PByte; BPS: Integer);
var
  tmp: array [0 .. 3, 0 .. 3] of Integer;
  i: Integer;
  a, b, c2, d2: Integer;
  a0, a1, a2, a3: Integer;
begin
  for i := 0 to 3 do
  begin
    a := c[0 + i] + c[8 + i];
    b := c[0 + i] - c[8 + i];

    c2 := SarI(c[4 + i] * 35468, 16) -
      (SarI(c[12 + i] * 20091, 16) + c[12 + i]);
    d2 := (SarI(c[4 + i] * 20091, 16) + c[4 + i]) + SarI(c[12 + i] * 35468, 16);
    tmp[i, 0] := a + d2;
    tmp[i, 1] := b + c2;
    tmp[i, 2] := b - c2;
    tmp[i, 3] := a - d2;
  end;

  for i := 0 to 3 do
  begin
    a := tmp[0, i] + tmp[2, i];
    b := tmp[0, i] - tmp[2, i];
    c2 := SarI(tmp[1, i] * 35468, 16) -
      (SarI(tmp[3, i] * 20091, 16) + tmp[3, i]);
    d2 := (SarI(tmp[1, i] * 20091, 16) + tmp[1, i]) +
      SarI(tmp[3, i] * 35468, 16);

    a0 := SarI(a + d2 + 4, 3);
    a1 := SarI(b + c2 + 4, 3);
    a2 := SarI(b - c2 + 4, 3);
    a3 := SarI(a - d2 + 4, 3);

    (dst + i * BPS + 0)^ := Clip8b(Integer((Pred + i * BPS + 0)^) + a0);
    (dst + i * BPS + 1)^ := Clip8b(Integer((Pred + i * BPS + 1)^) + a1);
    (dst + i * BPS + 2)^ := Clip8b(Integer((Pred + i * BPS + 2)^) + a2);
    (dst + i * BPS + 3)^ := Clip8b(Integer((Pred + i * BPS + 3)^) + a3);
  end;
end;

procedure VP8TransformWHT(DC: PInt16; Out16: PInt16);
var
  tmp: array [0 .. 15] of Integer;
  i, a0, a1, a2, a3: Integer;
begin
  for i := 0 to 3 do
  begin
    a0 := DC[0 + i] + DC[12 + i];
    a1 := DC[4 + i] + DC[8 + i];
    a2 := DC[4 + i] - DC[8 + i];
    a3 := DC[0 + i] - DC[12 + i];
    tmp[0 + i] := a0 + a1;
    tmp[8 + i] := a0 - a1;
    tmp[4 + i] := a3 + a2;
    tmp[12 + i] := a3 - a2;
  end;
  for i := 0 to 3 do
  begin
    a0 := tmp[0 + i * 4] + tmp[3 + i * 4];
    a1 := tmp[1 + i * 4] + tmp[2 + i * 4];
    a2 := tmp[1 + i * 4] - tmp[2 + i * 4];
    a3 := tmp[0 + i * 4] - tmp[3 + i * 4];
    Out16[0 + i * 4] := Int16(SarI(a0 + a1 + 3, 3));
    Out16[1 + i * 4] := Int16(SarI(a3 + a2 + 3, 3));
    Out16[2 + i * 4] := Int16(SarI(a0 - a1 + 3, 3));
    Out16[3 + i * 4] := Int16(SarI(a3 - a2 + 3, 3));
  end;
end;

procedure Fill(dst: PByte; Val: Byte; W, H, Stride: Integer);
var
  R: Integer;
begin
  for R := 0 to H - 1 do
    FillChar((dst + R * Stride)^, W, Val);
end;

procedure I16x16_DC(dst: PByte; Top, Left: PByte; Stride: Integer);
var
  sum, i: Integer;
begin
  sum := 0;
  for i := 0 to 15 do
  begin
    Inc(sum, (Left + i)^);
    Inc(sum, (Top + i)^);
  end;
  Fill(dst, Byte((sum + 16) shr 5), 16, 16, Stride);
end;

procedure I16x16_DC_Left(dst: PByte; Left: PByte; Stride: Integer);
var
  sum, i: Integer;
begin
  sum := 0;
  for i := 0 to 15 do
    Inc(sum, (Left + i)^);
  Fill(dst, Byte((sum + 8) shr 4), 16, 16, Stride);
end;

procedure I16x16_DC_Top(dst: PByte; Top: PByte; Stride: Integer);
var
  sum, i: Integer;
begin
  sum := 0;
  for i := 0 to 15 do
    Inc(sum, (Top + i)^);
  Fill(dst, Byte((sum + 8) shr 4), 16, 16, Stride);
end;

procedure I16x16_V(dst: PByte; Top: PByte; Stride: Integer);
var
  R: Integer;
begin
  for R := 0 to 15 do
    Move(Top^, (dst + R * Stride)^, 16);
end;

procedure I16x16_H(dst: PByte; Left: PByte; Stride: Integer);
var
  R: Integer;
begin
  for R := 0 to 15 do
    FillChar((dst + R * Stride)^, 16, (Left + R)^);
end;

procedure I16x16_TM(dst: PByte; Top, Left: PByte; TopLeft: Byte;
  Stride: Integer);
var
  R, c, v: Integer;
begin
  for R := 0 to 15 do
    for c := 0 to 15 do
    begin
      v := Integer((Left + R)^) + Integer((Top + c)^) - Integer(TopLeft);
      (dst + R * Stride + c)^ := Clip8b(v);
    end;
end;

procedure VP8PredLuma16(Mode: Integer; dst: PByte; TopCtx, LeftCtx: PByte;
  HasTop, HasLeft: Boolean; Stride: Integer);
var
  TopLeft: Byte;
  tmpLeft: array [0 .. 15] of Byte;
  tmpTop: array [0 .. 15] of Byte;
begin
  if not HasTop then
    FillChar(tmpTop, 16, 127)
  else
    Move(TopCtx^, tmpTop, 16);
  if not HasLeft then
    FillChar(tmpLeft, 16, 129)
  else
    Move(LeftCtx^, tmpLeft, 16);
 
  TopLeft := (dst - Stride - 1)^;
  case Mode of
    DC_PRED:
      if HasTop and HasLeft then
        I16x16_DC(dst, @tmpTop[0], @tmpLeft[0], Stride)
      else if HasLeft then
        I16x16_DC_Left(dst, @tmpLeft[0], Stride)
      else if HasTop then
        I16x16_DC_Top(dst, @tmpTop[0], Stride)
      else
        Fill(dst, 128, 16, 16, Stride);
    V_PRED:
      I16x16_V(dst, @tmpTop[0], Stride);
    H_PRED:
      I16x16_H(dst, @tmpLeft[0], Stride);
    TM_PRED:
      I16x16_TM(dst, @tmpTop[0], @tmpLeft[0], TopLeft, Stride);
  end;
end;

procedure I8x8_DC(dst: PByte; Top, Left: PByte; HasTop, HasLeft: Boolean;
  Stride: Integer);
var
  sum, i: Integer;
begin
  sum := 0;
  if HasTop then
    for i := 0 to 7 do
      Inc(sum, (Top + i)^);
  if HasLeft then
    for i := 0 to 7 do
      Inc(sum, (Left + i)^);
  if HasTop and HasLeft then
    Fill(dst, Byte((sum + 8) shr 4), 8, 8, Stride)
  else if HasTop then
    Fill(dst, Byte((sum + 4) shr 3), 8, 8, Stride)
  else if HasLeft then
    Fill(dst, Byte((sum + 4) shr 3), 8, 8, Stride)
  else
    Fill(dst, 128, 8, 8, Stride);
end;

procedure I8x8_V(dst: PByte; Top: PByte; Stride: Integer);
var
  R: Integer;
begin
  for R := 0 to 7 do
    Move(Top^, (dst + R * Stride)^, 8);
end;

procedure I8x8_H(dst: PByte; Left: PByte; Stride: Integer);
var
  R: Integer;
begin
  for R := 0 to 7 do
    FillChar((dst + R * Stride)^, 8, (Left + R)^);
end;

procedure I8x8_TM(dst: PByte; Top, Left: PByte; TL: Byte; Stride: Integer);
var
  R, c, v: Integer;
begin
  for R := 0 to 7 do
    for c := 0 to 7 do
    begin
      v := Integer((Left + R)^) + Integer((Top + c)^) - Integer(TL);
      (dst + R * Stride + c)^ := Clip8b(v);
    end;
end;

procedure VP8PredChroma8(Mode: Integer; dst: PByte; TopCtx, LeftCtx: PByte;
  HasTop, HasLeft: Boolean; Stride: Integer);
var
  tmpLeft: array [0 .. 7] of Byte;
  tmpTop: array [0 .. 7] of Byte;
  TL: Byte;
begin
  if not HasTop then
    FillChar(tmpTop, 8, 127)
  else
    Move(TopCtx^, tmpTop, 8);
  if not HasLeft then
    FillChar(tmpLeft, 8, 129)
  else
    Move(LeftCtx^, tmpLeft, 8);
  TL := (dst - Stride - 1)^;
  case Mode of
    DC_PRED:
      I8x8_DC(dst, @tmpTop[0], @tmpLeft[0], HasTop, HasLeft, Stride);
    V_PRED:
      I8x8_V(dst, @tmpTop[0], Stride);
    H_PRED:
      I8x8_H(dst, @tmpLeft[0], Stride);
    TM_PRED:
      I8x8_TM(dst, @tmpTop[0], @tmpLeft[0], TL, Stride);
  end;
end;

function Avg4(a, b, c, D: Integer): Byte; inline;
begin
  Result := Byte((a + b + c + D + 2) shr 2);
end;

function Avg3(a, b, c: Integer): Byte; inline;
begin
  Result := Byte((a + 2 * b + c + 2) shr 2);
end;

function Avg2(a, b: Integer): Byte; inline;
begin
  Result := Byte((a + b + 1) shr 1);
end;

procedure I4x4_DC(dst: PByte; Top: PByte; Left: PByte; Stride: Integer);
var
  s: Integer;
begin
  s := (Top + 0)^ + (Top + 1)^ + (Top + 2)^ + (Top + 3)^ + (Left + 0)^ +
    (Left + 1)^ + (Left + 2)^ + (Left + 3)^ + 4;
  Fill(dst, Byte(s shr 3), 4, 4, Stride);
end;

procedure I4x4_TM(dst: PByte; Top, Left: PByte; TL: Byte; Stride: Integer);
var
  R, c: Integer;
begin
  for R := 0 to 3 do
    for c := 0 to 3 do
      (dst + R * Stride + c)^ := Clip8b((Left + R)^ + (Top + c)^ - TL);
end;

procedure I4x4_VE(dst: PByte; Top: PByte; Stride: Integer);
var
  R: Integer;
  vals: array [0 .. 3] of Byte;
begin
  vals[0] := Avg3((Top - 1)^, (Top + 0)^, (Top + 1)^);
  vals[1] := Avg3((Top + 0)^, (Top + 1)^, (Top + 2)^);
  vals[2] := Avg3((Top + 1)^, (Top + 2)^, (Top + 3)^);
  vals[3] := Avg3((Top + 2)^, (Top + 3)^, (Top + 4)^);
  for R := 0 to 3 do
    Move(vals[0], (dst + R * Stride)^, 4);
end;

procedure I4x4_HE(dst: PByte; Left: PByte; TL: Byte; Stride: Integer);
var
  c: array [0 .. 3] of Byte;
begin
  c[0] := Avg3(TL, (Left + 0)^, (Left + 1)^);
  c[1] := Avg3((Left + 0)^, (Left + 1)^, (Left + 2)^);
  c[2] := Avg3((Left + 1)^, (Left + 2)^, (Left + 3)^);
  c[3] := Avg3((Left + 2)^, (Left + 3)^, (Left + 3)^);
  FillChar((dst + 0 * Stride)^, 4, c[0]);
  FillChar((dst + 1 * Stride)^, 4, c[1]);
  FillChar((dst + 2 * Stride)^, 4, c[2]);
  FillChar((dst + 3 * Stride)^, 4, c[3]);
end;

procedure I4x4_RD(dst: PByte; Top, Left: PByte; TL: Byte; Stride: Integer);
var
  x, i, j, K, l, a, b, c, D: Integer;
begin
  x := TL;
  i := (Left + 0)^;
  j := (Left + 1)^;
  K := (Left + 2)^;
  l := (Left + 3)^;
  a := (Top + 0)^;
  b := (Top + 1)^;
  c := (Top + 2)^;
  D := (Top + 3)^;
  (dst + 3 * Stride + 0)^ := Avg3(j, K, l);
  (dst + 3 * Stride + 1)^ := Avg3(i, j, K);
  (dst + 2 * Stride + 0)^ := Avg3(i, j, K);
  (dst + 3 * Stride + 2)^ := Avg3(x, i, j);
  (dst + 2 * Stride + 1)^ := Avg3(x, i, j);
  (dst + 1 * Stride + 0)^ := Avg3(x, i, j);
  (dst + 3 * Stride + 3)^ := Avg3(a, x, i);
  (dst + 2 * Stride + 2)^ := Avg3(a, x, i);
  (dst + 1 * Stride + 1)^ := Avg3(a, x, i);
  (dst + 0 * Stride + 0)^ := Avg3(a, x, i);
  (dst + 2 * Stride + 3)^ := Avg3(b, a, x);
  (dst + 1 * Stride + 2)^ := Avg3(b, a, x);
  (dst + 0 * Stride + 1)^ := Avg3(b, a, x);
  (dst + 1 * Stride + 3)^ := Avg3(c, b, a);
  (dst + 0 * Stride + 2)^ := Avg3(c, b, a);
  (dst + 0 * Stride + 3)^ := Avg3(D, c, b);
end;

procedure I4x4_LD(dst: PByte; Top: PByte; Stride: Integer);
var
  t: array [0 .. 7] of Integer;
begin
  t[0] := (Top + 0)^;
  t[1] := (Top + 1)^;
  t[2] := (Top + 2)^;
  t[3] := (Top + 3)^;
  t[4] := (Top + 4)^;
  t[5] := (Top + 5)^;
  t[6] := (Top + 6)^;
  t[7] := (Top + 7)^;
  (dst + 0 * Stride + 0)^ := Avg3(t[0], t[1], t[2]);
  (dst + 0 * Stride + 1)^ := Avg3(t[1], t[2], t[3]);
  (dst + 0 * Stride + 2)^ := Avg3(t[2], t[3], t[4]);
  (dst + 0 * Stride + 3)^ := Avg3(t[3], t[4], t[5]);
  (dst + 1 * Stride + 0)^ := Avg3(t[1], t[2], t[3]);
  (dst + 1 * Stride + 1)^ := Avg3(t[2], t[3], t[4]);
  (dst + 1 * Stride + 2)^ := Avg3(t[3], t[4], t[5]);
  (dst + 1 * Stride + 3)^ := Avg3(t[4], t[5], t[6]);
  (dst + 2 * Stride + 0)^ := Avg3(t[2], t[3], t[4]);
  (dst + 2 * Stride + 1)^ := Avg3(t[3], t[4], t[5]);
  (dst + 2 * Stride + 2)^ := Avg3(t[4], t[5], t[6]);
  (dst + 2 * Stride + 3)^ := Avg3(t[5], t[6], t[7]);
  (dst + 3 * Stride + 0)^ := Avg3(t[3], t[4], t[5]);
  (dst + 3 * Stride + 1)^ := Avg3(t[4], t[5], t[6]);
  (dst + 3 * Stride + 2)^ := Avg3(t[5], t[6], t[7]);
  (dst + 3 * Stride + 3)^ := Avg3(t[6], t[7], t[7]);
end;

procedure I4x4_VR(dst: PByte; Top, Left: PByte; TL: Byte; Stride: Integer);
var
  x, i, j, K, a, b, c, D: Integer;
begin
  x := TL;
  i := (Left + 0)^;
  j := (Left + 1)^;
  K := (Left + 2)^;
  a := (Top + 0)^;
  b := (Top + 1)^;
  c := (Top + 2)^;
  D := (Top + 3)^;
  (dst + 0 * Stride + 0)^ := Avg2(x, a);
  (dst + 2 * Stride + 1)^ := Avg2(x, a);
  (dst + 0 * Stride + 1)^ := Avg2(a, b);
  (dst + 2 * Stride + 2)^ := Avg2(a, b);
  (dst + 0 * Stride + 2)^ := Avg2(b, c);
  (dst + 2 * Stride + 3)^ := Avg2(b, c);
  (dst + 0 * Stride + 3)^ := Avg2(c, D);
  (dst + 1 * Stride + 0)^ := Avg3(i, x, a);
  (dst + 3 * Stride + 1)^ := Avg3(i, x, a);
  (dst + 1 * Stride + 1)^ := Avg3(x, a, b);
  (dst + 3 * Stride + 2)^ := Avg3(x, a, b);
  (dst + 1 * Stride + 2)^ := Avg3(a, b, c);
  (dst + 3 * Stride + 3)^ := Avg3(a, b, c);
  (dst + 1 * Stride + 3)^ := Avg3(b, c, D);
  (dst + 2 * Stride + 0)^ := Avg3(j, i, x);
  (dst + 3 * Stride + 0)^ := Avg3(K, j, i);
end;

procedure I4x4_VL(dst: PByte; Top: PByte; Stride: Integer);
var
  t: array [0 .. 7] of Integer;
begin
  t[0] := (Top + 0)^;
  t[1] := (Top + 1)^;
  t[2] := (Top + 2)^;
  t[3] := (Top + 3)^;
  t[4] := (Top + 4)^;
  t[5] := (Top + 5)^;
  t[6] := (Top + 6)^;
  t[7] := (Top + 7)^;
  (dst + 0 * Stride + 0)^ := Avg2(t[0], t[1]);
  (dst + 0 * Stride + 1)^ := Avg2(t[1], t[2]);
  (dst + 0 * Stride + 2)^ := Avg2(t[2], t[3]);
  (dst + 0 * Stride + 3)^ := Avg2(t[3], t[4]);
  (dst + 1 * Stride + 0)^ := Avg3(t[0], t[1], t[2]);
  (dst + 1 * Stride + 1)^ := Avg3(t[1], t[2], t[3]);
  (dst + 1 * Stride + 2)^ := Avg3(t[2], t[3], t[4]);
  (dst + 1 * Stride + 3)^ := Avg3(t[3], t[4], t[5]);
  (dst + 2 * Stride + 0)^ := Avg2(t[1], t[2]);
  (dst + 2 * Stride + 1)^ := Avg2(t[2], t[3]);
  (dst + 2 * Stride + 2)^ := Avg2(t[3], t[4]);
  (dst + 2 * Stride + 3)^ := Avg3(t[4], t[5], t[6]);
  (dst + 3 * Stride + 0)^ := Avg3(t[1], t[2], t[3]);
  (dst + 3 * Stride + 1)^ := Avg3(t[2], t[3], t[4]);
  (dst + 3 * Stride + 2)^ := Avg3(t[3], t[4], t[5]);
  (dst + 3 * Stride + 3)^ := Avg3(t[5], t[6], t[7]);
end;

procedure I4x4_HD(dst: PByte; Top, Left: PByte; TL: Byte; Stride: Integer);
var
  x, i, j, K, l, a, b, c: Integer;
begin
  x := TL;
  i := (Left + 0)^;
  j := (Left + 1)^;
  K := (Left + 2)^;
  l := (Left + 3)^;
  a := (Top + 0)^;
  b := (Top + 1)^;
  c := (Top + 2)^;
  (dst + 0 * Stride + 0)^ := Avg2(i, x);
  (dst + 1 * Stride + 2)^ := Avg2(i, x);
  (dst + 1 * Stride + 0)^ := Avg2(j, i);
  (dst + 2 * Stride + 2)^ := Avg2(j, i);
  (dst + 2 * Stride + 0)^ := Avg2(K, j);
  (dst + 3 * Stride + 2)^ := Avg2(K, j);
  (dst + 3 * Stride + 0)^ := Avg2(l, K);
  (dst + 0 * Stride + 3)^ := Avg3(a, b, c);
  (dst + 0 * Stride + 2)^ := Avg3(x, a, b);
  (dst + 0 * Stride + 1)^ := Avg3(i, x, a);
  (dst + 1 * Stride + 3)^ := Avg3(i, x, a);
  (dst + 1 * Stride + 1)^ := Avg3(j, i, x);
  (dst + 2 * Stride + 3)^ := Avg3(j, i, x);
  (dst + 2 * Stride + 1)^ := Avg3(K, j, i);
  (dst + 3 * Stride + 3)^ := Avg3(K, j, i);
  (dst + 3 * Stride + 1)^ := Avg3(l, K, j);
end;

procedure I4x4_HU(dst: PByte; Left: PByte; Stride: Integer);
var
  l: array [0 .. 3] of Integer;
begin
  l[0] := (Left + 0)^;
  l[1] := (Left + 1)^;
  l[2] := (Left + 2)^;
  l[3] := (Left + 3)^;
  (dst + 0 * Stride + 0)^ := Avg2(l[0], l[1]);
  (dst + 0 * Stride + 1)^ := Avg3(l[0], l[1], l[2]);
  (dst + 0 * Stride + 2)^ := Avg2(l[1], l[2]);
  (dst + 0 * Stride + 3)^ := Avg3(l[1], l[2], l[3]);
  (dst + 1 * Stride + 0)^ := Avg2(l[1], l[2]);
  (dst + 1 * Stride + 1)^ := Avg3(l[1], l[2], l[3]);
  (dst + 1 * Stride + 2)^ := Avg2(l[2], l[3]);
  (dst + 1 * Stride + 3)^ := Avg3(l[2], l[3], l[3]);
  (dst + 2 * Stride + 0)^ := Avg2(l[2], l[3]);
  (dst + 2 * Stride + 1)^ := Avg3(l[2], l[3], l[3]);
  (dst + 2 * Stride + 2)^ := l[3];
  (dst + 2 * Stride + 3)^ := l[3];
  (dst + 3 * Stride + 0)^ := l[3];
  (dst + 3 * Stride + 1)^ := l[3];
  (dst + 3 * Stride + 2)^ := l[3];
  (dst + 3 * Stride + 3)^ := l[3];
end;

procedure VP8PredLuma4(Mode: Integer; dst: PByte; Top, Left: PByte; TL: Byte;
  Stride: Integer);
begin
  case Mode of
    B_DC_PRED:
      I4x4_DC(dst, Top, Left, Stride);
    B_TM_PRED:
      I4x4_TM(dst, Top, Left, TL, Stride);
    B_VE_PRED:
      I4x4_VE(dst, Top, Stride);
    B_HE_PRED:
      I4x4_HE(dst, Left, TL, Stride);
    B_RD_PRED:
      I4x4_RD(dst, Top, Left, TL, Stride);
    B_VR_PRED:
      I4x4_VR(dst, Top, Left, TL, Stride);
    B_LD_PRED:
      I4x4_LD(dst, Top, Stride);
    B_VL_PRED:
      I4x4_VL(dst, Top, Stride);
    B_HD_PRED:
      I4x4_HD(dst, Top, Left, TL, Stride);
    B_HU_PRED:
      I4x4_HU(dst, Left, Stride);
  end;
end;

procedure Copy4(dst, Src: PByte); inline;
begin
  PCardinal(dst)^ := PCardinal(Src)^;
end;

procedure VP8ReconstructMB(var D: TVP8Decoder; MbX: Integer;
  HasTop, HasLeft: Boolean);
var
  mb: ^TVP8MBData;
  y, x, n: Integer;
  yBase, uBase, vBase: PByte;
  topY, topU, topV: PByte;
  leftY: array [0 .. 15] of Byte;
  leftU, leftV: array [0 .. 7] of Byte;
  yDst, uDst, vDst: PByte;
  leftCol: array [0 .. 15] of Byte;
begin
  mb := @D.MBData;
  yBase := @D.YuvBuf[Y_OFF];
  uBase := @D.YuvBuf[U_OFF];
  vBase := @D.YuvBuf[V_OFF];

  topY := D.YTopBuf + MbX * 16;
  topU := D.UTopBuf + MbX * 8;
  topV := D.VTopBuf + MbX * 8;

  if HasLeft then
  begin
    for y := 0 to 15 do
      leftY[y] := (yBase + y * BPS - 1)^;
    for y := 0 to 7 do
      leftU[y] := (uBase + y * BPS - 1)^;
    for y := 0 to 7 do
      leftV[y] := (vBase + y * BPS - 1)^;
  end
  else
  begin
    FillChar(leftY, 16, 129);
    FillChar(leftU, 8, 129);
    FillChar(leftV, 8, 129);
  end;

  if not mb^.IsI4x4 then
  begin
    VP8PredLuma16(mb^.IModes[0], yBase, topY, @leftY[0], HasTop, HasLeft, BPS);
    for y := 0 to 3 do
      for x := 0 to 3 do
      begin
        n := y * 4 + x;
        yDst := yBase + kScan[n];
        VP8TransformOne(@mb^.Coeffs[n * 16], yDst, yDst, BPS);
      end;
  end
  else
  begin
    for n := 0 to 15 do
    begin
      yDst := yBase + kScan[n];

      leftCol[0] := (yDst - 1 + 0 * BPS)^;
      leftCol[1] := (yDst - 1 + 1 * BPS)^;
      leftCol[2] := (yDst - 1 + 2 * BPS)^;
      leftCol[3] := (yDst - 1 + 3 * BPS)^;
      VP8PredLuma4(mb^.IModes[n], yDst, yDst - BPS,  @leftCol[0],
        (yDst - BPS - 1)^, BPS);
      VP8TransformOne(@mb^.Coeffs[n * 16], yDst, yDst, BPS);
    end;
  end;

  VP8PredChroma8(mb^.UVMode, uBase, topU, @leftU[0], HasTop, HasLeft, BPS);
  VP8PredChroma8(mb^.UVMode, vBase, topV, @leftV[0], HasTop, HasLeft, BPS);

  for n := 0 to 3 do
  begin
    x := n and 1;
    y := n shr 1;
    uDst := uBase + (x * 4) + (y * 4 * BPS);
    vDst := vBase + (x * 4) + (y * 4 * BPS);
    VP8TransformOne(@mb^.Coeffs[(16 + n) * 16], uDst, uDst, BPS);
    VP8TransformOne(@mb^.Coeffs[(20 + n) * 16], vDst, vDst, BPS);
  end;

  Move((yBase + 15 * BPS)^, topY^, 16);
  Move((uBase + 7 * BPS)^, topU^, 8);
  Move((vBase + 7 * BPS)^, topV^, 8);
end;

procedure EmitRGBRow(y, u, v: PByte; Width: Integer; dst: PByte; Mode: TCSMode;
  Bpp: Integer);
var
  x: Integer;
  yv, uv, vv: Integer;
  R, g, b: Byte;
  p: PByte;
begin
  for x := 0 to Width - 1 do
  begin
    yv := y[x];
    uv := u[x shr 1];
    vv := v[x shr 1];
    R := YuvToR(yv, vv);
    g := YuvToG(yv, uv, vv);
    b := YuvToB(yv, uv);
    p := dst + x * Bpp;
    case Mode of
      csmRGBA:
        begin
          p[0] := R;
          p[1] := g;
          p[2] := b;
          p[3] := 255;
        end;
      csmARGB:
        begin
          p[0] := 255;
          p[1] := R;
          p[2] := g;
          p[3] := b;
        end;
      csmBGRA:
        begin
          p[0] := b;
          p[1] := g;
          p[2] := R;
          p[3] := 255;
        end;
      csmRGB:
        begin
          p[0] := R;
          p[1] := g;
          p[2] := b;
        end;
      csmBGR:
        begin
          p[0] := b;
          p[1] := g;
          p[2] := R;
        end;
    end;
  end;
end;

function FSclip1(v: Integer): Integer; inline;
begin
  if v < -128 then
    Result := -128
  else if v > 127 then
    Result := 127
  else
    Result := v;
end;

function FSclip2(v: Integer): Integer; inline;
begin
  if v < -16 then
    Result := -16
  else if v > 15 then
    Result := 15
  else
    Result := v;
end;

function FClip1(v: Integer): Integer; inline;
begin
  if v < 0 then
    Result := 0
  else if v > 255 then
    Result := 255
  else
    Result := v;
end;

procedure FDoFilter2(p: PByte; step: Integer); inline;
var
  p1, p0, q0, q1, a, a1, a2: Integer;
begin
  p1 := (p + (-2 * step))^;
  p0 := (p + (-step))^;
  q0 := p^;
  q1 := (p + step)^;
  a := 3 * (q0 - p0) + FSclip1(p1 - q1);
  a1 := FSclip2(SarI(a + 4, 3));
  a2 := FSclip2(SarI(a + 3, 3));
  (p + (-step))^ := Byte(FClip1(p0 + a2));
  p^ := Byte(FClip1(q0 - a1));
end;

procedure FDoFilter4(p: PByte; step: Integer); inline;
var
  p1, p0, q0, q1, a, a1, a2, a3: Integer;
begin
  p1 := (p + (-2 * step))^;
  p0 := (p + (-step))^;
  q0 := p^;
  q1 := (p + step)^;
  a := 3 * (q0 - p0);
  a1 := FSclip2(SarI(a + 4, 3));
  a2 := FSclip2(SarI(a + 3, 3));
  a3 := SarI(a1 + 1, 1);
  (p + (-2 * step))^ := Byte(FClip1(p1 + a3));
  (p + (-step))^ := Byte(FClip1(p0 + a2));
  p^ := Byte(FClip1(q0 - a1));
  (p + step)^ := Byte(FClip1(q1 - a3));
end;

procedure FDoFilter6(p: PByte; step: Integer); inline;
var
  p2, p1, p0, q0, q1, q2, a, a1, a2, a3: Integer;
begin
  p2 := (p + (-3 * step))^;
  p1 := (p + (-2 * step))^;
  p0 := (p + (-step))^;
  q0 := p^;
  q1 := (p + step)^;
  q2 := (p + 2 * step)^;
  a := FSclip1(3 * (q0 - p0) + FSclip1(p1 - q1));
  a1 := SarI(27 * a + 63, 7);
  a2 := SarI(18 * a + 63, 7);
  a3 := SarI(9 * a + 63, 7);
  (p + (-3 * step))^ := Byte(FClip1(p2 + a3));
  (p + (-2 * step))^ := Byte(FClip1(p1 + a2));
  (p + (-step))^ := Byte(FClip1(p0 + a1));
  p^ := Byte(FClip1(q0 - a1));
  (p + step)^ := Byte(FClip1(q1 - a2));
  (p + 2 * step)^ := Byte(FClip1(q2 - a3));
end;

function FHev(p: PByte; step, thresh: Integer): Boolean; inline;
var
  p1, p0, q0, q1: Integer;
begin
  p1 := (p + (-2 * step))^;
  p0 := (p + (-step))^;
  q0 := p^;
  q1 := (p + step)^;
  Result := (Abs(p1 - p0) > thresh) or (Abs(q1 - q0) > thresh);
end;

function FNeedsFilter(p: PByte; step, t: Integer): Boolean; inline;
var
  p1, p0, q0, q1: Integer;
begin
  p1 := (p + (-2 * step))^;
  p0 := (p + (-step))^;
  q0 := p^;
  q1 := (p + step)^;
  Result := (4 * Abs(p0 - q0) + Abs(p1 - q1)) <= t;
end;

function FNeedsFilter2(p: PByte; step, t, it: Integer): Boolean; inline;
var
  p3, p2, p1, p0, q0, q1, q2, q3: Integer;
begin
  p3 := (p + (-4 * step))^;
  p2 := (p + (-3 * step))^;
  p1 := (p + (-2 * step))^;
  p0 := (p + (-step))^;
  q0 := p^;
  q1 := (p + step)^;
  q2 := (p + 2 * step)^;
  q3 := (p + 3 * step)^;
  if (4 * Abs(p0 - q0) + Abs(p1 - q1)) > t then
  begin
    Result := False;
    Exit;
  end;
  Result := (Abs(p3 - p2) <= it) and (Abs(p2 - p1) <= it) and
    (Abs(p1 - p0) <= it) and (Abs(q3 - q2) <= it) and (Abs(q2 - q1) <= it) and
    (Abs(q1 - q0) <= it);
end;

procedure FSimpleVFilter16(p: PByte; Stride, thresh: Integer);
var
  i, t2: Integer;
begin
  t2 := 2 * thresh + 1;
  for i := 0 to 15 do
    if FNeedsFilter(p + i, Stride, t2) then
      FDoFilter2(p + i, Stride);
end;

procedure FSimpleHFilter16(p: PByte; Stride, thresh: Integer);
var
  i, t2: Integer;
begin
  t2 := 2 * thresh + 1;
  for i := 0 to 15 do
    if FNeedsFilter(p + i * Stride, 1, t2) then
      FDoFilter2(p + i * Stride, 1);
end;

procedure FSimpleVFilter16i(p: PByte; Stride, thresh: Integer);
var
  K: Integer;
begin
  for K := 3 downto 1 do
  begin
    p := p + 4 * Stride;
    FSimpleVFilter16(p, Stride, thresh);
  end;
end;

procedure FSimpleHFilter16i(p: PByte; Stride, thresh: Integer);
var
  K: Integer;
begin
  for K := 3 downto 1 do
  begin
    p := p + 4;
    FSimpleHFilter16(p, Stride, thresh);
  end;
end;

procedure FFilterLoop26(p: PByte; hstride, vstride, Size, thresh, ithresh,
  hevt: Integer);
var
  t2: Integer;
begin
  t2 := 2 * thresh + 1;
  while Size > 0 do
  begin
    if FNeedsFilter2(p, hstride, t2, ithresh) then
    begin
      if FHev(p, hstride, hevt) then
        FDoFilter2(p, hstride)
      else
        FDoFilter6(p, hstride);
    end;
    p := p + vstride;
    Dec(Size);
  end;
end;

procedure FFilterLoop24(p: PByte; hstride, vstride, Size, thresh, ithresh,
  hevt: Integer);
var
  t2: Integer;
begin
  t2 := 2 * thresh + 1;
  while Size > 0 do
  begin
    if FNeedsFilter2(p, hstride, t2, ithresh) then
    begin
      if FHev(p, hstride, hevt) then
        FDoFilter2(p, hstride)
      else
        FDoFilter4(p, hstride);
    end;
    p := p + vstride;
    Dec(Size);
  end;
end;

procedure FVFilter16(p: PByte; Stride, thresh, ithresh, hevt: Integer);
begin
  FFilterLoop26(p, Stride, 1, 16, thresh, ithresh, hevt);
end;

procedure FHFilter16(p: PByte; Stride, thresh, ithresh, hevt: Integer);
begin
  FFilterLoop26(p, 1, Stride, 16, thresh, ithresh, hevt);
end;

procedure FVFilter16i(p: PByte; Stride, thresh, ithresh, hevt: Integer);
var
  K: Integer;
begin
  for K := 3 downto 1 do
  begin
    p := p + 4 * Stride;
    FFilterLoop24(p, Stride, 1, 16, thresh, ithresh, hevt);
  end;
end;

procedure FHFilter16i(p: PByte; Stride, thresh, ithresh, hevt: Integer);
var
  K: Integer;
begin
  for K := 3 downto 1 do
  begin
    p := p + 4;
    FFilterLoop24(p, 1, Stride, 16, thresh, ithresh, hevt);
  end;
end;

procedure FVFilter8(u, v: PByte; Stride, thresh, ithresh, hevt: Integer);
begin
  FFilterLoop26(u, Stride, 1, 8, thresh, ithresh, hevt);
  FFilterLoop26(v, Stride, 1, 8, thresh, ithresh, hevt);
end;

procedure FHFilter8(u, v: PByte; Stride, thresh, ithresh, hevt: Integer);
begin
  FFilterLoop26(u, 1, Stride, 8, thresh, ithresh, hevt);
  FFilterLoop26(v, 1, Stride, 8, thresh, ithresh, hevt);
end;

procedure FVFilter8i(u, v: PByte; Stride, thresh, ithresh, hevt: Integer);
begin
  FFilterLoop24(u + 4 * Stride, Stride, 1, 8, thresh, ithresh, hevt);
  FFilterLoop24(v + 4 * Stride, Stride, 1, 8, thresh, ithresh, hevt);
end;

procedure FHFilter8i(u, v: PByte; Stride, thresh, ithresh, hevt: Integer);
begin
  FFilterLoop24(u + 4, 1, Stride, 8, thresh, ithresh, hevt);
  FFilterLoop24(v + 4, 1, Stride, 8, thresh, ithresh, hevt);
end;

procedure VP8PrecomputeFilterStrengths(var D: TVP8Decoder);
var
  s, i4x4, baseLevel, level, ilevel: Integer;
begin
  if D.FilterType = 0 then
    Exit;
  for s := 0 to NUM_MB_SEGMENTS - 1 do
  begin
    if D.SegHdr.UseSegment then
    begin
      baseLevel := D.SegHdr.FilterStrength[s];
      if not D.SegHdr.AbsoluteDelta then
        Inc(baseLevel, D.FilterLevel);
    end
    else
      baseLevel := D.FilterLevel;
    for i4x4 := 0 to 1 do
    begin
      level := baseLevel;
      if D.UseLFDelta then
      begin
        Inc(level, D.RefLFDelta[0]);
        if i4x4 <> 0 then
          Inc(level, D.ModeLFDelta[0]);
      end;
      if level < 0 then
        level := 0
      else if level > 63 then
        level := 63;
      if level > 0 then
      begin
        ilevel := level;
        if D.FilterSharpness > 0 then
        begin
          if D.FilterSharpness > 4 then
            ilevel := ilevel shr 2
          else
            ilevel := ilevel shr 1;
          if ilevel > 9 - D.FilterSharpness then
            ilevel := 9 - D.FilterSharpness;
        end;
        if ilevel < 1 then
          ilevel := 1;
        D.FStrength[s][i4x4].FILevel := ilevel;
        D.FStrength[s][i4x4].FLimit := 2 * level + ilevel;
        if level >= 40 then
          D.FStrength[s][i4x4].HevThresh := 2
        else if level >= 15 then
          D.FStrength[s][i4x4].HevThresh := 1
        else
          D.FStrength[s][i4x4].HevThresh := 0;
      end
      else
        D.FStrength[s][i4x4].FLimit := 0;
      D.FStrength[s][i4x4].FInner := (i4x4 <> 0);
    end;
  end;
end;

procedure VP8DoFilter(var D: TVP8Decoder; MbX, mby: Integer);
var
  FInfo: PVP8FInfo;
  yBps, uvBps, ilevel, limit, hevt: Integer;
  yDst, uDst, vDst: PByte;
begin
  FInfo := D.FInfo + (mby * D.MbW + MbX);
  limit := FInfo^.FLimit;
  if limit = 0 then
    Exit;
  ilevel := FInfo^.FILevel;
  yBps := D.FYStride;
  uvBps := D.FUVStride;
  yDst := D.FYPlane + mby * 16 * yBps + MbX * 16;
  if D.FilterType = 1 then
  begin
    if MbX > 0 then
      FSimpleHFilter16(yDst, yBps, limit + 4);
    if FInfo^.FInner then
      FSimpleHFilter16i(yDst, yBps, limit);
    if mby > 0 then
      FSimpleVFilter16(yDst, yBps, limit + 4);
    if FInfo^.FInner then
      FSimpleVFilter16i(yDst, yBps, limit);
  end
  else
  begin
    hevt := FInfo^.HevThresh;
    uDst := D.FUPlane + mby * 8 * uvBps + MbX * 8;
    vDst := D.FVPlane + mby * 8 * uvBps + MbX * 8;
    if MbX > 0 then
    begin
      FHFilter16(yDst, yBps, limit + 4, ilevel, hevt);
      FHFilter8(uDst, vDst, uvBps, limit + 4, ilevel, hevt);
    end;
    if FInfo^.FInner then
    begin
      FHFilter16i(yDst, yBps, limit, ilevel, hevt);
      FHFilter8i(uDst, vDst, uvBps, limit, ilevel, hevt);
    end;
    if mby > 0 then
    begin
      FVFilter16(yDst, yBps, limit + 4, ilevel, hevt);
      FVFilter8(uDst, vDst, uvBps, limit + 4, ilevel, hevt);
    end;
    if FInfo^.FInner then
    begin
      FVFilter16i(yDst, yBps, limit, ilevel, hevt);
      FVFilter8i(uDst, vDst, uvBps, limit, ilevel, hevt);
    end;
  end;
end;

procedure VP8FilterFrame(var D: TVP8Decoder);
var
  MbX, mby: Integer;
begin
  if D.FilterType = 0 then
    Exit;
  for mby := 0 to D.MbH - 1 do
    for MbX := 0 to D.MbW - 1 do
      VP8DoFilter(D, MbX, mby);
end;

procedure StorePixel(yv, uv, vv: Integer; p: PByte; Mode: TCSMode); inline;
var
  R, g, b: Byte;
begin
  R := YuvToR(yv, vv);
  g := YuvToG(yv, uv, vv);
  b := YuvToB(yv, uv);
  case Mode of
    csmRGBA:
      begin
        p[0] := R;
        p[1] := g;
        p[2] := b;
        p[3] := 255;
      end;
    csmARGB:
      begin
        p[0] := 255;
        p[1] := R;
        p[2] := g;
        p[3] := b;
      end;
    csmBGRA:
      begin
        p[0] := b;
        p[1] := g;
        p[2] := R;
        p[3] := 255;
      end;
    csmRGB:
      begin
        p[0] := R;
        p[1] := g;
        p[2] := b;
      end;
    csmBGR:
      begin
        p[0] := b;
        p[1] := g;
        p[2] := R;
      end;
  end;
end;

procedure UpsamplePair(topY, botY, topU, topV, curU, curV, topDst,
  botDst: PByte; len, Bpp: Integer; Mode: TCSMode);
var
  x, lastPair: Integer;
  tlU, tlV, lU, lV, tU, tV, cU, cV: Integer;
  avgU, avgV, d12U, d12V, d03U, d03V: Integer;
begin
  lastPair := (len - 1) shr 1;
  tlU := topU[0];
  tlV := topV[0];
  lU := curU[0];
  lV := curV[0];

  StorePixel(topY[0], (3 * tlU + lU + 2) shr 2, (3 * tlV + lV + 2) shr 2,
    topDst, Mode);
  if botY <> nil then
    StorePixel(botY[0], (3 * lU + tlU + 2) shr 2, (3 * lV + tlV + 2) shr 2,
      botDst, Mode);
  for x := 1 to lastPair do
  begin
    tU := topU[x];
    tV := topV[x];
    cU := curU[x];
    cV := curV[x];
    avgU := tlU + tU + lU + cU + 8;
    avgV := tlV + tV + lV + cV + 8;
    d12U := (avgU + 2 * (tU + lU)) shr 3;
    d12V := (avgV + 2 * (tV + lV)) shr 3;
    d03U := (avgU + 2 * (tlU + cU)) shr 3;
    d03V := (avgV + 2 * (tlV + cV)) shr 3;
    StorePixel(topY[2 * x - 1], (d12U + tlU) shr 1, (d12V + tlV) shr 1,
      topDst + (2 * x - 1) * Bpp, Mode);
    StorePixel(topY[2 * x], (d03U + tU) shr 1, (d03V + tV) shr 1,
      topDst + (2 * x) * Bpp, Mode);
    if botY <> nil then
    begin
      StorePixel(botY[2 * x - 1], (d03U + lU) shr 1, (d03V + lV) shr 1,
        botDst + (2 * x - 1) * Bpp, Mode);
      StorePixel(botY[2 * x], (d12U + cU) shr 1, (d12V + cV) shr 1,
        botDst + (2 * x) * Bpp, Mode);
    end;
    tlU := tU;
    tlV := tV;
    lU := cU;
    lV := cV;
  end;
  if (len and 1) = 0 then
  begin
    StorePixel(topY[len - 1], (3 * tlU + lU + 2) shr 2,
      (3 * tlV + lV + 2) shr 2, topDst + (len - 1) * Bpp, Mode);
    if botY <> nil then
      StorePixel(botY[len - 1], (3 * lU + tlU + 2) shr 2,
        (3 * lV + tlV + 2) shr 2, botDst + (len - 1) * Bpp, Mode);
  end;
end;

procedure VP8EmitFrame(var D: TVP8Decoder);
var
  y, cU, W, H, Bpp, ys, uvs, os: Integer;
  fy, fu, fv, ob: PByte;
begin
  W := D.PicWidth;
  H := D.PicHeight;
  Bpp := D.OutBpp;
  ys := D.FYStride;
  uvs := D.FUVStride;
  os := D.OutStride;
  fy := D.FYPlane;
  fu := D.FUPlane;
  fv := D.FVPlane;
  ob := D.OutBuf;
  if H <= 0 then
    Exit;

  UpsamplePair(fy, nil, fu, fv, fu, fv, ob, nil, W, Bpp, D.OutputMode);
  cU := 0;
  y := 0;
  while y + 2 < H do
  begin
    UpsamplePair(fy + (y + 1) * ys, fy + (y + 2) * ys, fu + cU * uvs,
      fv + cU * uvs, fu + (cU + 1) * uvs, fv + (cU + 1) * uvs,
      ob + NativeUInt(y + 1) * NativeUInt(os), ob + NativeUInt(y + 2) *
      NativeUInt(os), W, Bpp, D.OutputMode);
    Inc(cU);
    Inc(y, 2);
  end;
  if (H and 1) = 0 then
    UpsamplePair(fy + (H - 1) * ys, nil, fu + cU * uvs, fv + cU * uvs,
      fu + cU * uvs, fv + cU * uvs, ob + NativeUInt(H - 1) * NativeUInt(os),
      nil, W, Bpp, D.OutputMode);
end;

function VP8DecodeFrame(var D: TVP8Decoder): Boolean;
var
  mby, MbX: Integer;
  HasTop, HasLeft: Boolean;
  PartIdx: Integer;
  mb: ^TVP8MBData;
  BR: ^TVP8Rd;
  info: PVP8MB;
  y, ix, iy: Integer;
  TopCtx: PByte;
  ymode: Integer;
  leftMode: Integer;
  yBase, uBase, vBase: PByte;
  j: Integer;
  FInfo: PVP8FInfo;
begin
  Result := False;

  yBase := @D.YuvBuf[Y_OFF];
  uBase := @D.YuvBuf[U_OFF];
  vBase := @D.YuvBuf[V_OFF];

  for mby := 0 to D.MbH - 1 do
  begin
    HasTop := (mby > 0);

    for j := 0 to 15 do
      (yBase + j * BPS - 1)^ := 129;
    for j := 0 to 7 do
    begin
      (uBase + j * BPS - 1)^ := 129;
      (vBase + j * BPS - 1)^ := 129;
    end;

    if mby = 0 then
    begin
      FillChar((yBase - BPS - 1)^, 16 + 4 + 1, 127);
      FillChar((uBase - BPS - 1)^, 8 + 1, 127);
      FillChar((vBase - BPS - 1)^, 8 + 1, 127);
    end
    else
    begin
      (yBase - BPS - 1)^ := 129;
      (uBase - BPS - 1)^ := 129;
      (vBase - BPS - 1)^ := 129;
    end;

    D.MBInfo^.NZ := 0;
    D.MBInfo^.NZDC := 0;
    FillChar(D.IntraL, SizeOf(D.IntraL), B_DC_PRED);

    PartIdx := mby mod D.NumParts;

    for MbX := 0 to D.MbW - 1 do
    begin
      HasLeft := (MbX > 0);

      if MbX > 0 then
      begin
        for j := -1 to 15 do
          (yBase + j * BPS - 1)^ := (yBase + j * BPS + 15)^;
        for j := -1 to 7 do
        begin
          (uBase + j * BPS - 1)^ := (uBase + j * BPS + 7)^;
          (vBase + j * BPS - 1)^ := (vBase + j * BPS + 7)^;
        end;
      end;

      if HasTop then
      begin
        Move((D.YTopBuf + MbX * 16)^, (yBase - BPS)^, 16);
        Move((D.UTopBuf + MbX * 8)^, (uBase - BPS)^, 8);
        Move((D.VTopBuf + MbX * 8)^, (vBase - BPS)^, 8);

        if MbX < D.MbW - 1 then
          Move((D.YTopBuf + (MbX + 1) * 16)^, (yBase - BPS + 16)^, 4)
        else
          FillChar((yBase - BPS + 16)^, 4, (D.YTopBuf + MbX * 16 + 15)^);
      end;
      PCardinal(yBase + 3 * BPS + 16)^ := PCardinal(yBase - BPS + 16)^;
      PCardinal(yBase + 7 * BPS + 16)^ := PCardinal(yBase - BPS + 16)^;
      PCardinal(yBase + 11 * BPS + 16)^ := PCardinal(yBase - BPS + 16)^;

      mb := @D.MBData;
      info := PVP8MB(NativeUInt(D.MBInfo) + NativeUInt((MbX + 1) *
        SizeOf(TVP8MB)));
      TopCtx := D.IntraT + MbX * 4;

      BR := @D.BR;

      if D.SegHdr.UseSegment and D.SegHdr.UpdateMap then
      begin
        if VP8RdGetBit(BR^, D.SegHdr.SegProbs[0]) = 0 then
          mb^.Segment := VP8RdGetBit(BR^, D.SegHdr.SegProbs[1])
        else
          mb^.Segment := 2 + VP8RdGetBit(BR^, D.SegHdr.SegProbs[2]);
      end
      else
        mb^.Segment := 0;

       if D.UseSkipProba then
        mb^.Skip := VP8RdGetBit(BR^, D.SkipP) <> 0
      else
        mb^.Skip := False;

       mb^.IsI4x4 := VP8RdGetBit(BR^, 145) = 0;
      if not mb^.IsI4x4 then
      begin
        ymode := ParseIntra16Mode(BR^);
        for ix := 0 to 15 do
          mb^.IModes[ix] := ymode;
        for ix := 0 to 3 do
          TopCtx[ix] := ymode;
        for iy := 0 to 3 do
          D.IntraL[iy] := ymode;
      end
      else
      begin
        for iy := 0 to 3 do
        begin
          leftMode := D.IntraL[iy];
          for ix := 0 to 3 do
          begin
            y := ParseIntra4x4Mode(BR^, kBModesProba[TopCtx[ix], leftMode]);
            mb^.IModes[iy * 4 + ix] := y;
            TopCtx[ix] := y;
            leftMode := y;
          end;
          D.IntraL[iy] := leftMode;
        end;
      end;
      mb^.UVMode := ParseUVMode(BR^);
      if not mb^.Skip then
      begin
        VP8ParseResiduals(D, MbX, D.Parts[PartIdx], PartIdx);
      end
      else
      begin
        FillChar(mb^.Coeffs[0], SizeOf(mb^.Coeffs), 0);
        mb^.NonZeroY := 0;
        mb^.NonZeroUV := 0;

        D.MBInfo^.NZ := 0;
        info^.NZ := 0;
        if not mb^.IsI4x4 then
        begin
          D.MBInfo^.NZDC := 0;
          info^.NZDC := 0;
        end;
      end;

      if D.FilterType > 0 then
      begin
        FInfo := D.FInfo + (mby * D.MbW + MbX);
        FInfo^ := D.FStrength[mb^.Segment and 3][Ord(mb^.IsI4x4)];

        if (mb^.NonZeroY <> 0) or (mb^.NonZeroUV <> 0) then
          FInfo^.FInner := True;
      end;
      VP8ReconstructMB(D, MbX, HasTop, HasLeft);

      for y := 0 to 15 do
        Move(D.YuvBuf[Y_OFF + y * BPS],
          (D.FYPlane + (mby * 16 + y) * D.FYStride + MbX * 16)^, 16);
      for y := 0 to 7 do
      begin
        Move(D.YuvBuf[U_OFF + y * BPS],
          (D.FUPlane + (mby * 8 + y) * D.FUVStride + MbX * 8)^, 8);
        Move(D.YuvBuf[V_OFF + y * BPS],
          (D.FVPlane + (mby * 8 + y) * D.FUVStride + MbX * 8)^, 8);
      end;
    end;
  end;
  Result := True;
end;

function VP8ParseHeaders(var D: TVP8Decoder; Data: PByte;
  Size: NativeUInt): Boolean;
var
  tmp: Cardinal;
  partLen: Cardinal;
  W, H: Integer;
  partData: PByte;
  szPtr: PByte;
  partSize: NativeUInt;
  i: Integer;
begin
  Result := False;
  if Size < 10 then
    Exit;

  tmp := PByte(Data)[0] or (Cardinal(PByte(Data)[1]) shl 8) or
    (Cardinal(PByte(Data)[2]) shl 16);
  D.KeyFrame := (tmp and 1) = 0;
  D.Profile := (tmp shr 1) and 7;

  partLen := (tmp shr 5) and $7FFFF;

  if not D.KeyFrame then
    Exit;

  if (Data[3] <> $9D) or (Data[4] <> $01) or (Data[5] <> $2A) then
    Exit;

  W := (Data[6] or (Cardinal(Data[7]) shl 8)) and $3FFF;
  H := (Data[8] or (Cardinal(Data[9]) shl 8)) and $3FFF;
  D.PicWidth := W;
  D.PicHeight := H;
  D.MbW := (W + 15) shr 4;
  D.MbH := (H + 15) shr 4;

  D.PartLen0 := partLen;

  VP8RdInit(D.BR, Data + 10, partLen);

  if VP8RdGet(D.BR) <> 0 then
    Exit;
  VP8RdGet(D.BR);

  VP8ParseSegmentHeader(D.BR, D.SegHdr);
  VP8ParseFilterHeader(D.BR, D);

  D.NumParts := 1 shl Integer(VP8RdGetValue(D.BR, 2));
  VP8ParseQuant(D.BR, D);
  VP8RdGet(D.BR);
  VP8ParseProba(D.BR, D);

  partData := Data + 10 + partLen;
  szPtr := partData;
  partData := partData + NativeUInt(D.NumParts - 1) * 3;
  for i := 0 to D.NumParts - 2 do
  begin
    partSize := szPtr[0] or (Cardinal(szPtr[1]) shl 8) or
      (Cardinal(szPtr[2]) shl 16);
    Inc(szPtr, 3);
    VP8RdInit(D.Parts[i], partData, partSize);
    Inc(partData, partSize);
  end;

  if NativeUInt(partData) < NativeUInt(Data + Size) then
    partSize := NativeUInt(Data + Size) - NativeUInt(partData)
  else
    partSize := 0;
  VP8RdInit(D.Parts[D.NumParts - 1], partData, partSize);

  Result := True;
end;

const
  HV_MAX_CODELEN = 15;

type
  TVP8LHuffTable = record
    e: PHuffmanCode;
    Sz: Integer;
  end;

  TVP8LHuffGroup = record
    t: array [0 .. 4] of TVP8LHuffTable;
  end;

  PVP8LHuffGroup = ^TVP8LHuffGroup;

function VP8LGetNextKey(key: Cardinal; len: Integer): Cardinal;
var
  step: Cardinal;
begin
  step := Cardinal(1) shl (len - 1);
  while (key and step) <> 0 do
    step := step shr 1;
  if step <> 0 then
    Result := (key and (step - 1)) + step
  else
    Result := key;
end;

function VP8LNextTableBits(count: PInteger; len, RootBits: Integer): Integer;
var
  Left: Integer;
begin
  Left := 1 shl (len - RootBits);
  while len < HV_MAX_CODELEN do
  begin
    Dec(Left, count[len]);
    if Left <= 0 then
      Break;
    Inc(len);
    Left := Left shl 1;
  end;
  Result := len - RootBits;
end;

function VP8LHuffBuild(Table: PHuffmanCode; RootBits: Integer;
  Lengths: PInteger; NumSymbols: Integer): Integer;
var
  count: array [0 .. HV_MAX_CODELEN + 1] of Integer;
  Offset: array [0 .. HV_MAX_CODELEN + 1] of Integer;
  Sorted: array [0 .. 2327] of Word;
  Sym, len, j: Integer;
  step, TotalSize, TableBits, tableSize, SecBase: Integer;
  NumNodes, NumOpen, Sym2, totalNZ: Integer;
  Low, mask, key: Cardinal;
  code: THuffmanCode;
begin
  Result := 0;
  FillChar(count, SizeOf(count), 0);
  for Sym := 0 to NumSymbols - 1 do
  begin
    len := Lengths[Sym];
    if (len < 0) or (len > HV_MAX_CODELEN) then
    begin
      Exit;
    end;
    Inc(count[len]);
  end;
  if count[0] = NumSymbols then
  begin
    Exit;
  end;
  for len := 1 to HV_MAX_CODELEN do
    if count[len] > (1 shl len) then
    begin
      Exit;
    end;

  Offset[1] := 0;
  for len := 1 to HV_MAX_CODELEN - 1 do
    Offset[len + 1] := Offset[len] + count[len];
  for Sym := 0 to NumSymbols - 1 do
  begin
    len := Lengths[Sym];
    if len > 0 then
    begin
      Sorted[Offset[len]] := Word(Sym);
      Inc(Offset[len]);
    end;
  end;
  totalNZ := Offset[HV_MAX_CODELEN];

  if totalNZ = 1 then
  begin
    if Table <> nil then
    begin
      code.Bits := 0;
      code.Value := Sorted[0];
      for j := 0 to (1 shl RootBits) - 1 do
        Table[j] := code;
    end;
    Result := 1 shl RootBits;
    Exit;
  end;

  FillChar(count, SizeOf(count), 0);
  for Sym := 0 to NumSymbols - 1 do
  begin
    len := Lengths[Sym];
    if (len > 0) and (len <= HV_MAX_CODELEN) then
      Inc(count[len]);
  end;

  TotalSize := 1 shl RootBits;
  Low := $FFFFFFFF;
  mask := Cardinal(TotalSize - 1);
  key := 0;
  NumNodes := 1;
  NumOpen := 1;
  tableSize := 1 shl RootBits;

  SecBase := 0;
  Sym2 := 0;

  step := 2;
  for len := 1 to RootBits do
  begin
    NumOpen := NumOpen shl 1;
    Inc(NumNodes, NumOpen);
    Dec(NumOpen, count[len]);
    if NumOpen < 0 then
    begin
      Exit;
    end;
    while count[len] > 0 do
    begin
      if Table <> nil then
      begin
        code.Bits := Byte(len);
        code.Value := Sorted[Sym2];
        j := Integer(key);
        while j < (1 shl RootBits) do
        begin
          Table[j] := code;
          Inc(j, step);
        end;
      end;
      Inc(Sym2);
      key := VP8LGetNextKey(key, len);
      Dec(count[len]);
    end;
    step := step shl 1;
  end;

  step := 2;
  for len := RootBits + 1 to HV_MAX_CODELEN do
  begin
    NumOpen := NumOpen shl 1;
    Inc(NumNodes, NumOpen);
    Dec(NumOpen, count[len]);
    if NumOpen < 0 then
    begin
      Exit;
    end;
    while count[len] > 0 do
    begin
      if (key and mask) <> Low then
      begin
        SecBase := SecBase + tableSize;
        TableBits := VP8LNextTableBits(@count[0], len, RootBits);
        tableSize := 1 shl TableBits;
        Inc(TotalSize, tableSize);
        Low := key and mask;
        if Table <> nil then
        begin
          Table[Low].Bits := Byte(TableBits + RootBits);
          Table[Low].Value := Word(SecBase - Integer(Low));
        end;
      end;
      if Table <> nil then
      begin
        code.Bits := Byte(len - RootBits);
        code.Value := Sorted[Sym2];
        j := Integer(key shr RootBits);
        while j < tableSize do
        begin
          Table[SecBase + j] := code;
          Inc(j, step);
        end;
      end;
      Inc(Sym2);
      key := VP8LGetNextKey(key, len);
      Dec(count[len]);
    end;
    step := step shl 1;
  end;

  if NumNodes <> 2 * totalNZ - 1 then
  begin
    Exit;
  end;
  Result := TotalSize;
end;

const
  VP8L_MAX_TRANSFORMS = 4;
  VP8L_TT_PREDICTOR = 0;
  VP8L_TT_COLORXFORM = 1;
  VP8L_TT_SUBGREEN = 2;
  VP8L_TT_COLORINDEX = 3;

type
  TVP8LTransform = record
    TType: Integer;
    Bits: Integer;
    XSize: Integer;
    YSize: Integer;
    Data: PCardinal;
  end;

type
  TVP8LState = record
    BR: TVP8LBitReader;
    CacheBits: Integer;
    ColorCache: PCardinal;
    HuffBits: Integer;
    HuffW: Integer;
    HuffImage: PCardinal;
    NumGroups: Integer;
    Groups: PVP8LHuffGroup;
  end;

function VP8LReadCodeLengths(var BR: TVP8LBitReader; CLTable: PHuffmanCode;
  NumSymbols: Integer; Lengths: PInteger): Boolean;
var
  i, Sym, reps: Integer;
  prev: Integer;
  maxSymbol, lengthNbits: Integer;
  usePrev, length: Integer;
  extraBits: array [0 .. 2] of Integer;
  repOff: array [0 .. 2] of Integer;
begin
  Result := False;
  extraBits[0] := 2;
  extraBits[1] := 3;
  extraBits[2] := 7;
  repOff[0] := 3;
  repOff[1] := 3;
  repOff[2] := 11;

  if VP8LReadBits(BR, 1) <> 0 then
  begin
    lengthNbits := 2 + 2 * Integer(VP8LReadBits(BR, 3));
    maxSymbol := 2 + Integer(VP8LReadBits(BR, lengthNbits));
    if maxSymbol > NumSymbols then
      Exit;
  end
  else
    maxSymbol := NumSymbols;

  i := 0;
  prev := 8;
  while i < NumSymbols do
  begin
    if maxSymbol = 0 then
      Break;
    Dec(maxSymbol);
    if BR.Available <= 32 then
      VP8LFillBitWindow(BR);
    Sym := HuffReadSymbol(BR, CLTable, HUFF_LUT_BITS);
    if Sym < 0 then
      Exit;
    if Sym < 16 then
    begin
      Lengths[i] := Sym;
      if Sym <> 0 then
        prev := Sym;
      Inc(i);
    end
    else
    begin
      usePrev := Ord(Sym = 16);
      reps := Integer(VP8LReadBits(BR, extraBits[Sym - 16])) + repOff[Sym - 16];
      if i + reps > NumSymbols then
        Exit;
      if usePrev <> 0 then
        length := prev
      else
        length := 0;
      while reps > 0 do
      begin
        Lengths[i] := length;
        Inc(i);
        Dec(reps);
      end;
    end;
  end;
  Result := True;
end;

function VP8LReadHuffTable(var BR: TVP8LBitReader; AlphabetSize: Integer;
  out HT: TVP8LHuffTable): Boolean;
var
  IsSimple: Integer;
  NumSyms: Integer;
  LenBit: Integer;
  Sym1: Integer;

  ClLengths: array [0 .. 18] of Integer;
  CLTable: array [0 .. 255] of THuffmanCode;
  CodeLengths: array [0 .. 2327] of Integer;

  NumCodes: Integer;
  j: Integer;
  Tsz: Integer;
  Sym: Integer;
begin
  Result := False;

  HT.e := nil;
  HT.Sz := 0;

  IsSimple := Integer(VP8LReadBits(BR, 1));

  FillChar(CodeLengths[0], AlphabetSize * SizeOf(Integer), 0);

  if IsSimple <> 0 then
  begin
    NumSyms := Integer(VP8LReadBits(BR, 1)) + 1;
    LenBit := Integer(VP8LReadBits(BR, 1));

    if LenBit = 0 then
      Sym1 := Integer(VP8LReadBits(BR, 1))
    else
      Sym1 := Integer(VP8LReadBits(BR, 8));

    if (Sym1 >= 0) and (Sym1 < AlphabetSize) then
      CodeLengths[Sym1] := 1;

    if NumSyms = 2 then
    begin
      Sym := Integer(VP8LReadBits(BR, 8));

      if (Sym >= 0) and (Sym < AlphabetSize) then
        CodeLengths[Sym] := 1;
    end;
  end
  else
  begin
    FillChar(ClLengths, SizeOf(ClLengths), 0);

    NumCodes := Integer(VP8LReadBits(BR, 4)) + 4;

    for j := 0 to NumCodes - 1 do
      ClLengths[kCodeLengthCodeOrder[j]] := Integer(VP8LReadBits(BR, 3));

    if not VP8LBuildHuffmanTable(ClLengths, 19, @CLTable[0], HUFF_LUT_BITS) then
      Exit;

    if not VP8LReadCodeLengths(BR, @CLTable[0], AlphabetSize, @CodeLengths[0])
    then
      Exit;
  end;

  Tsz := VP8LHuffBuild(nil, HUFF_LUT_BITS, @CodeLengths[0], AlphabetSize);

  if Tsz = 0 then
    Exit;

  HT.e := AllocMem(Tsz * SizeOf(THuffmanCode));

  HT.Sz := Tsz;

  if VP8LHuffBuild(HT.e, HUFF_LUT_BITS, @CodeLengths[0], AlphabetSize) = 0 then
  begin
    FreeMem(HT.e);
    HT.e := nil;
    HT.Sz := 0;
    Exit;
  end;

  Result := True;
end;

procedure VP8LFreeGroupTables(grp: PVP8LHuffGroup);
var
  j: Integer;
begin
  for j := 0 to 4 do
    if grp^.t[j].e <> nil then
    begin
      FreeMem(grp^.t[j].e);
      grp^.t[j].e := nil;
    end;
end;

function VP8LReadGroups(var BR: TVP8LBitReader; NumGroups: Integer;
  GreenAlphaSize: Integer; Groups: PVP8LHuffGroup): Boolean;
var
  g, j: Integer;
  alphabets: array [0 .. 4] of Integer;
begin
  Result := False;
  alphabets[0] := GreenAlphaSize;
  alphabets[1] := 256;
  alphabets[2] := 256;
  alphabets[3] := 256;
  alphabets[4] := 40;
  for g := 0 to NumGroups - 1 do
    for j := 0 to 4 do
      if not VP8LReadHuffTable(BR, alphabets[j], Groups[g].t[j]) then
      begin
        Exit;
      end;
  Result := True;
end;

function VP8LReadSym(var BR: TVP8LBitReader; const HT: TVP8LHuffTable): Integer;
var
  key: Cardinal;
  e: PHuffmanCode;
  nbits: Integer;
  xkey: Cardinal;
begin
  key := VP8LPeekBits(BR, HUFF_LUT_BITS);
  e := @HT.e[key];
  nbits := Integer(e^.Bits) - HUFF_LUT_BITS;
  if nbits > 0 then
  begin
    BR.Val := BR.Val shr HUFF_LUT_BITS;
    Dec(BR.Available, HUFF_LUT_BITS);
    if BR.Available <= 32 then
      VP8LFillBitWindow(BR);
    xkey := VP8LPeekBits(BR, nbits);
    Inc(e, Integer(e^.Value) + Integer(xkey));
  end;
  BR.Val := BR.Val shr e^.Bits;
  Dec(BR.Available, e^.Bits);
  if BR.Available <= 32 then
    VP8LFillBitWindow(BR);
  Result := Integer(e^.Value);
end;

function VP8LPlaneCodeToDist(XSize, PlaneCode: Integer): Integer; inline;
var
  DC, yoff, xoff, D: Integer;
begin
  if PlaneCode > 120 then
    Result := PlaneCode - 120
  else
  begin
    DC := Integer(kCodeToPlane[PlaneCode - 1]);
    yoff := DC shr 4;
    xoff := 8 - (DC and $F);
    D := yoff * XSize + xoff;
    if D < 1 then
      D := 1;
    Result := D;
  end;
end;

function VP8LCopyCode(Sym: Integer; var BR: TVP8LBitReader): Integer; inline;
var
  extra, Offset: Integer;
begin
  if Sym < 4 then
    Result := Sym + 1
  else
  begin
    extra := (Sym - 2) shr 1;
    Offset := (2 + (Sym and 1)) shl extra;
    Result := Offset + Integer(VP8LReadBits(BR, extra)) + 1;
  end;
end;

function VP8LAddPx(a, b: Cardinal): Cardinal; inline;
begin
  Result := ((a + b) and $FF) or ((((a shr 8) + (b shr 8)) and $FF) shl 8) or
    ((((a shr 16) + (b shr 16)) and $FF) shl 16) or
    ((((a shr 24) + (b shr 24)) and $FF) shl 24);
end;

function PAvg2(a, b: Cardinal): Cardinal; inline;
begin
  Result := (((a xor b) and $FEFEFEFE) shr 1) + (a and b);
end;

function PAvg3(a, b, c: Cardinal): Cardinal; inline;
begin
  Result := PAvg2(PAvg2(a, c), b);
end;

function PAvg4(a, b, c, D: Cardinal): Cardinal; inline;
begin
  Result := PAvg2(PAvg2(a, b), PAvg2(c, D));
end;

function Clip8(v: Integer): Integer; inline;
begin
  if v < 0 then
    Result := 0
  else if v > 255 then
    Result := 255
  else
    Result := v;
end;

function PSelect(a, b, c: Cardinal): Cardinal; inline;
var
  pa: Integer;
begin
  pa := (Abs(Integer((a shr 24) and $FF) - Integer((c shr 24) and $FF)) -
    Abs(Integer((b shr 24) and $FF) - Integer((c shr 24) and $FF))) +
    (Abs(Integer((a shr 16) and $FF) - Integer((c shr 16) and $FF)) -
    Abs(Integer((b shr 16) and $FF) - Integer((c shr 16) and $FF))) +
    (Abs(Integer((a shr 8) and $FF) - Integer((c shr 8) and $FF)) -
    Abs(Integer((b shr 8) and $FF) - Integer((c shr 8) and $FF))) +
    (Abs(Integer(a and $FF) - Integer(c and $FF)) -
    Abs(Integer(b and $FF) - Integer(c and $FF)));

  if pa >= 0 then
    Result := a
  else
    Result := b;
end;

function PClampFull(c0, c1, c2: Cardinal): Cardinal; inline;
begin
  Result := (Cardinal(Clip8(Integer(c0 shr 24) + Integer(c1 shr 24) -
    Integer(c2 shr 24))) shl 24) or
    (Cardinal(Clip8(Integer((c0 shr 16) and $FF) + Integer((c1 shr 16) and $FF)
    - Integer((c2 shr 16) and $FF))) shl 16) or
    (Cardinal(Clip8(Integer((c0 shr 8) and $FF) + Integer((c1 shr 8) and $FF) -
    Integer((c2 shr 8) and $FF))) shl 8) or
    Cardinal(Clip8(Integer(c0 and $FF) + Integer(c1 and $FF) -
    Integer(c2 and $FF)));
end;

function PClampHalf(c0, c1, c2: Cardinal): Cardinal; inline;
var
  av: Cardinal;
  aa, ra, ga, ba, ac, rc, gc, bc: Integer;
begin
  av := PAvg2(c0, c1);
  aa := Integer(av shr 24) and $FF;
  ac := Integer(c2 shr 24) and $FF;
  ra := Integer((av shr 16) and $FF);
  rc := Integer((c2 shr 16) and $FF);
  ga := Integer((av shr 8) and $FF);
  gc := Integer((c2 shr 8) and $FF);
  ba := Integer(av and $FF);
  bc := Integer(c2 and $FF);
  Result := (Cardinal(Clip8(aa + (aa - ac) div 2)) shl 24) or
    (Cardinal(Clip8(ra + (ra - rc) div 2)) shl 16) or
    (Cardinal(Clip8(ga + (ga - gc) div 2)) shl 8) or
    Cardinal(Clip8(ba + (ba - bc) div 2));
end;

function VP8LPredict(Mode: Integer; Left, Top, TopLeft, topRight: Cardinal)
  : Cardinal; inline;
begin
  case Mode of
    0:
      Result := $FF000000;
    1:
      Result := Left;
    2:
      Result := Top;
    3:
      Result := topRight;
    4:
      Result := TopLeft;
    5:
      Result := PAvg3(Left, Top, topRight);
    6:
      Result := PAvg2(Left, TopLeft);
    7:
      Result := PAvg2(Left, Top);
    8:
      Result := PAvg2(TopLeft, Top);
    9:
      Result := PAvg2(Top, topRight);
    10:
      Result := PAvg4(Left, TopLeft, Top, topRight);
    11:
      Result := PSelect(Top, Left, TopLeft);
    12:
      Result := PClampFull(Left, Top, TopLeft);
    13:
      Result := PClampHalf(Left, Top, TopLeft);
  else
    Result := $FF000000;
  end;
end;

procedure VP8LInvSubGreen(Pixels: PCardinal; count: Integer);
var
  i: Integer;
  px, g: Cardinal;
begin
  for i := 0 to count - 1 do
  begin
    px := Pixels[i];
    g := (px shr 8) and $FF;
    Pixels[i] := (px and $FF00FF00) or (((px shr 16) and $FF) + g) and
      $FF shl 16 or ((px and $FF) + g) and $FF;
  end;
end;

function CTDelta(t, c: Integer): Integer; inline;
begin
  if t >= 128 then
    Dec(t, 256);
  if c >= 128 then
    Dec(c, 256);
  Result := SarI(t * c, 5);
end;

procedure VP8LInvColorXform(TData: PCardinal; TBits, W: Integer;
  Pixels: PCardinal; count: Integer);
var
  i, tw, tx, ty, tileIdx: Integer;
  px, td: Cardinal;
  g, R, b: Integer;
begin
  tw := 1 shl TBits;
  for i := 0 to count - 1 do
  begin
    tx := (i mod W) shr TBits;
    ty := (i div W) shr TBits;
    tileIdx := ty * ((W + tw - 1) shr TBits) + tx;
    td := TData[tileIdx];
    px := Pixels[i];
    g := Integer((px shr 8) and $FF);
    R := Integer((px shr 16) and $FF);
    b := Integer(px and $FF);
    R := (R + CTDelta(td and $FF, g)) and $FF;
    b := (b + CTDelta((td shr 8) and $FF, g) + CTDelta((td shr 16) and $FF,
      R)) and $FF;
    Pixels[i] := (px and $FF00FF00) or (Cardinal(R) shl 16) or Cardinal(b);
  end;
end;

procedure VP8LInvPredictor(TData: PCardinal; TBits, W, H: Integer;
  Pixels: PCardinal);
var
  x, y, tw, tileIdx: Integer;
  idx: Integer;
  Pred: Cardinal;
  Mode: Integer;
begin
  tw := 1 shl TBits;

  Pixels[0] := VP8LAddPx(Pixels[0], $FF000000);
  for x := 1 to W - 1 do
    Pixels[x] := VP8LAddPx(Pixels[x], Pixels[x - 1]);

  for y := 1 to H - 1 do
  begin
    idx := y * W;

    Pixels[idx] := VP8LAddPx(Pixels[idx], Pixels[idx - W]);
    for x := 1 to W - 1 do
    begin
      tileIdx := (y shr TBits) * ((W + tw - 1) shr TBits) + (x shr TBits);
      Mode := Integer((TData[tileIdx] shr 8) and $F);
      Pred := VP8LPredict(Mode, Pixels[idx + x - 1],
      Pixels[idx + x - W],
      Pixels[idx + x - W - 1],
      Pixels[idx + x - W + 1]);
      Pixels[idx + x] := VP8LAddPx(Pixels[idx + x], Pred);
    end;
  end;
end;

procedure VP8LInvColorIndex(Palette: PCardinal; PackBits: Integer;
  OrigW: Integer; Pixels: PCardinal; W, H: Integer);
var
  Bpp, ppb, bmask, i: Integer;
  x, y, srcIdx, outIdx, idx: Integer;
  packedByte: Cardinal;
  OutBuf: PCardinal;
begin
  if PackBits = 0 then
  begin
    for srcIdx := 0 to W * H - 1 do
    begin
      idx := Integer((Pixels[srcIdx] shr 8) and $FF);
      Pixels[srcIdx] := Palette[idx];
    end;
  end
  else
  begin
    Bpp := 8 shr PackBits;
    ppb := 1 shl PackBits;
    bmask := (1 shl Bpp) - 1;
    OutBuf := AllocMem(OrigW * H * SizeOf(Cardinal));
    outIdx := 0;
    srcIdx := 0;
    for y := 0 to H - 1 do
    begin
      x := 0;
      while x < OrigW do
      begin
        packedByte := (Pixels[srcIdx] shr 8) and $FF;
        Inc(srcIdx);
        for i := 0 to ppb - 1 do
        begin
          if x >= OrigW then
            Break;
          OutBuf[outIdx] := Palette[packedByte and bmask];
          packedByte := packedByte shr Bpp;
          Inc(x);
          Inc(outIdx);
        end;
      end;
    end;
    Move(OutBuf^, Pixels^, OrigW * H * SizeOf(Cardinal));
    FreeMem(OutBuf);
  end;
end;

procedure VP8LExpandPalette(Palette: PCardinal; n: Integer);
var
  i: Integer;
begin
  for i := 1 to n - 1 do
    Palette[i] := VP8LAddPx(Palette[i], Palette[i - 1]);
end;

function VP8LBuildColorMap(SubPix: PCardinal; NumColors, Bits: Integer)
  : PCardinal;
var
  finalN, i: Integer;
begin
  finalN := 1 shl (8 shr Bits);
  Result := AllocMem(finalN * SizeOf(Cardinal));
  if NumColors > 0 then
    Result[0] := SubPix[0];
  for i := 1 to NumColors - 1 do
    Result[i] := VP8LAddPx(SubPix[i], Result[i - 1]);
end;

function VP8LDecodeSubImage(var BR: TVP8LBitReader; SW, SH: Integer;
  out Pixels: PCardinal): Boolean; forward;

function VP8LDecodePixels(var s: TVP8LState; Pixels: PCardinal;
  W, H: Integer): Boolean;
var
  nPix, pidx, x, y, i: Integer;
  Sym, length, dcode, pdist: Integer;
  green, red, blue, alpha: Cardinal;
  px: Cardinal;
  cidx: Integer;
  grpIdx: Integer;
  grp: PVP8LHuffGroup;
begin
  Result := False;
  nPix := W * H;
  pidx := 0;
  x := 0;
  y := 0;
  while pidx < nPix do
  begin
    if s.HuffBits > 0 then
    begin
      grpIdx := Integer(s.HuffImage[(y shr s.HuffBits) * s.HuffW +
        (x shr s.HuffBits)]);
      grp := @s.Groups[grpIdx];
    end
    else
      grp := @s.Groups[0];

    Sym := VP8LReadSym(s.BR, grp^.t[0]);
    if Sym < 0 then
      Exit;

    if Sym < 256 then
    begin
      green := Cardinal(Sym);
      red := Cardinal(VP8LReadSym(s.BR, grp^.t[1]));
      blue := Cardinal(VP8LReadSym(s.BR, grp^.t[2]));
      alpha := Cardinal(VP8LReadSym(s.BR, grp^.t[3]));
      px := (alpha shl 24) or (red shl 16) or (green shl 8) or blue;
      Pixels[pidx] := px;
      if s.CacheBits > 0 then
      begin
        cidx := Integer(Cardinal(px * Cardinal($1E35A7BD))
          shr (32 - s.CacheBits));
        s.ColorCache[cidx] := px;
      end;
      Inc(pidx);
      Inc(x);
      if x >= W then
      begin
        x := 0;
        Inc(y);
      end;
    end
    else if Sym < 256 + 24 then
    begin
      length := VP8LCopyCode(Sym - 256, s.BR);
      dcode := VP8LReadSym(s.BR, grp^.t[4]);
      if dcode < 0 then
        Exit;
      pdist := VP8LPlaneCodeToDist(W, VP8LCopyCode(dcode, s.BR));
      if (pdist < 1) or (pdist > pidx) then
        Exit;

      for i := 0 to length - 1 do
      begin
        if pidx >= nPix then
          Break;
        px := Pixels[pidx - pdist];
        Pixels[pidx] := px;
        if s.CacheBits > 0 then
        begin
          cidx := Integer(Cardinal(px * Cardinal($1E35A7BD))
            shr (32 - s.CacheBits));
          s.ColorCache[cidx] := px;
        end;
        Inc(pidx);
        Inc(x);
        if x >= W then
        begin
          x := 0;
          Inc(y);
        end;
      end;
    end
    else if (s.CacheBits > 0) and (Sym < 256 + 24 + (1 shl s.CacheBits)) then
    begin
      cidx := Sym - 256 - 24;
      px := s.ColorCache[cidx];
      Pixels[pidx] := px;
      Inc(pidx);
      Inc(x);
      if x >= W then
      begin
        x := 0;
        Inc(y);
      end;
    end
    else
    begin
      Inc(pidx);
      Inc(x);
      if x >= W then
      begin
        x := 0;
        Inc(y);
      end;
    end;
  end;
  Result := True;
end;

function VP8LSetupState(var BR: TVP8LBitReader; W, H: Integer;
  AllowMeta: Boolean; var s: TVP8LState): Boolean;
var
  cacheBit, metaBit: Integer;
  numPix, i, g, gi: Integer;
  greenAlpha: Integer;
  grpsBuf: PVP8LHuffGroup;
  huffH: Integer;
begin
  Result := False;
  FillChar(s, SizeOf(s), 0);
  s.BR := BR;

  cacheBit := Integer(VP8LReadBits(s.BR, 1));
  if cacheBit <> 0 then
  begin
    s.CacheBits := Integer(VP8LReadBits(s.BR, 4));
    if (s.CacheBits < 1) or (s.CacheBits > 11) then
      Exit;
    s.ColorCache := AllocMem((1 shl s.CacheBits) * SizeOf(Cardinal));
  end;
  greenAlpha := 280;
  if s.CacheBits > 0 then
    Inc(greenAlpha, 1 shl s.CacheBits);

  if AllowMeta then
    metaBit := Integer(VP8LReadBits(s.BR, 1))
  else
    metaBit := 0;
  if metaBit <> 0 then
  begin
    s.HuffBits := Integer(VP8LReadBits(s.BR, 3)) + 2;
    s.HuffW := (W + (1 shl s.HuffBits) - 1) shr s.HuffBits;
    huffH := (H + (1 shl s.HuffBits) - 1) shr s.HuffBits;
    if not VP8LDecodeSubImage(s.BR, s.HuffW, huffH, s.HuffImage) then
    begin
      if s.ColorCache <> nil then
        FreeMem(s.ColorCache);
      Exit;
    end;
    numPix := s.HuffW * huffH;
    s.NumGroups := 0;
    for i := 0 to numPix - 1 do
    begin
      g := Integer((s.HuffImage[i] shr 8) and $FFFF);
      s.HuffImage[i] := Cardinal(g);
      if g >= s.NumGroups then
        s.NumGroups := g + 1;
    end;
    if s.NumGroups = 0 then
      s.NumGroups := 1;
  end
  else
  begin
    s.HuffBits := 0;
    s.NumGroups := 1;
  end;

  grpsBuf := AllocMem(s.NumGroups * SizeOf(TVP8LHuffGroup));
  s.Groups := grpsBuf;
  if not VP8LReadGroups(s.BR, s.NumGroups, greenAlpha, s.Groups) then
  begin
    for gi := 0 to s.NumGroups - 1 do
      VP8LFreeGroupTables(@s.Groups[gi]);
    FreeMem(grpsBuf);
    s.Groups := nil;
    if s.ColorCache <> nil then
    begin
      FreeMem(s.ColorCache);
      s.ColorCache := nil;
    end;
    if s.HuffImage <> nil then
    begin
      FreeMem(s.HuffImage);
      s.HuffImage := nil;
    end;
    Exit;
  end;

  BR := s.BR;
  Result := True;
end;

procedure VP8LFreeState(var s: TVP8LState);
var
  g: Integer;
begin
  if s.Groups <> nil then
  begin
    for g := 0 to s.NumGroups - 1 do
      VP8LFreeGroupTables(@s.Groups[g]);
    FreeMem(s.Groups);
    s.Groups := nil;
  end;
  if s.ColorCache <> nil then
  begin
    FreeMem(s.ColorCache);
    s.ColorCache := nil;
  end;
  if s.HuffImage <> nil then
  begin
    FreeMem(s.HuffImage);
    s.HuffImage := nil;
  end;
end;

function VP8LDecodeSubImage(var BR: TVP8LBitReader; SW, SH: Integer;
  out Pixels: PCardinal): Boolean;
var
  s: TVP8LState;
  nPx: Integer;
begin
  Result := False;
  Pixels := nil;
  FillChar(s, SizeOf(s), 0);
  if not VP8LSetupState(BR, SW, SH, False, s) then
  begin
    VP8LFreeState(s);
    Exit;
  end;
  nPx := SW * SH;
  Pixels := AllocMem(nPx * SizeOf(Cardinal));
  Result := VP8LDecodePixels(s, Pixels, SW, SH);
  if not Result then
  begin
    FreeMem(Pixels);
    Pixels := nil;
  end;
  BR := s.BR;
  VP8LFreeState(s);
end;

function VP8LDecodeBody(var BR: TVP8LBitReader; W, H: Integer;
  out Pixels: PCardinal): Boolean;
var
  encW: Integer;
  i, t: Integer;
  transforms: array [0 .. VP8L_MAX_TRANSFORMS - 1] of TVP8LTransform;
  numT: Integer;
  ttType: Integer;
  ttBits: Integer;
  NumColors: Integer;
  SubPix: PCardinal;
  s: TVP8LState;
  nPix: Integer;
  ok: Boolean;
begin
  Result := False;
  Pixels := nil;
  encW := W;
  numT := 0;
  FillChar(transforms, SizeOf(transforms), 0);

  while VP8LReadBits(BR, 1) <> 0 do
  begin
    if numT >= VP8L_MAX_TRANSFORMS then
    begin
      for i := 0 to numT - 1 do
        if transforms[i].Data <> nil then
          FreeMem(transforms[i].Data);
      Exit;
    end;
    ttType := Integer(VP8LReadBits(BR, 2));
    transforms[numT].TType := ttType;
    transforms[numT].XSize := encW;
    transforms[numT].YSize := H;
    case ttType of
      VP8L_TT_PREDICTOR, VP8L_TT_COLORXFORM:
        begin
          ttBits := Integer(VP8LReadBits(BR, 3)) + 2;
          transforms[numT].Bits := ttBits;
          if not VP8LDecodeSubImage(BR, (encW + (1 shl ttBits) - 1) shr ttBits,
            (H + (1 shl ttBits) - 1) shr ttBits, SubPix) then
          begin
            for i := 0 to numT - 1 do
              if transforms[i].Data <> nil then
                FreeMem(transforms[i].Data);
            Exit;
          end;
          transforms[numT].Data := SubPix;
        end;
      VP8L_TT_SUBGREEN:
        ;
      VP8L_TT_COLORINDEX:
        begin
          NumColors := Integer(VP8LReadBits(BR, 8)) + 1;
          if NumColors > 16 then
            ttBits := 0
          else if NumColors > 4 then
            ttBits := 1
          else if NumColors > 2 then
            ttBits := 2
          else
            ttBits := 3;
          transforms[numT].Bits := ttBits;
          if not VP8LDecodeSubImage(BR, NumColors, 1, SubPix) then
          begin
            for i := 0 to numT - 1 do
              if transforms[i].Data <> nil then
                FreeMem(transforms[i].Data);
            Exit;
          end;
          transforms[numT].Data := VP8LBuildColorMap(SubPix, NumColors, ttBits);
          FreeMem(SubPix);
          if ttBits > 0 then
            encW := (W + (1 shl ttBits) - 1) shr ttBits;
        end;
    end;
    Inc(numT);
  end;

  FillChar(s, SizeOf(s), 0);
  if not VP8LSetupState(BR, encW, H, True, s) then
  begin
    VP8LFreeState(s);
    for i := 0 to numT - 1 do
      if transforms[i].Data <> nil then
        FreeMem(transforms[i].Data);
    Exit;
  end;

  nPix := W * H;
  Pixels := AllocMem(nPix * SizeOf(Cardinal));
  ok := VP8LDecodePixels(s, Pixels, encW, H);
  VP8LFreeState(s);

  if not ok then
  begin
    FreeMem(Pixels);
    Pixels := nil;
    for i := 0 to numT - 1 do
      if transforms[i].Data <> nil then
        FreeMem(transforms[i].Data);
    Exit;
  end;

  for t := numT - 1 downto 0 do
  begin
    case transforms[t].TType of
      VP8L_TT_SUBGREEN:
        VP8LInvSubGreen(Pixels, encW * H);
      VP8L_TT_COLORXFORM:
        VP8LInvColorXform(transforms[t].Data, transforms[t].Bits, encW, Pixels,
          encW * H);
      VP8L_TT_PREDICTOR:
        VP8LInvPredictor(transforms[t].Data, transforms[t].Bits, encW,
          H, Pixels);
      VP8L_TT_COLORINDEX:
        begin
          VP8LInvColorIndex(transforms[t].Data, transforms[t].Bits, W,
            Pixels, encW, H);
          encW := W;
        end;
    end;
    if transforms[t].Data <> nil then
      FreeMem(transforms[t].Data);
  end;

  Result := True;
end;

function VP8LDecode(Data: PByte; Size: NativeUInt; out PixBuf: PByte;
  out Width, Height: Integer): Boolean;
var
  BR: TVP8LBitReader;
  W, H, i: Integer;
  Pixels: PCardinal;
  alphaUsed: Integer;
begin
  Result := False;
  PixBuf := nil;
  Width := 0;
  Height := 0;
  if Size < 5 then
    Exit;
  if Data[0] <> $2F then
    Exit;

  VP8LInitBitReader(BR, Data + 1, Size - 1);
  W := Integer(VP8LReadBits(BR, 14)) + 1;
  H := Integer(VP8LReadBits(BR, 14)) + 1;
  alphaUsed := Integer(VP8LReadBits(BR, 1));
  if VP8LReadBits(BR, 3) <> 0 then
    Exit;
  Width := W;
  Height := H;

  if not VP8LDecodeBody(BR, W, H, Pixels) then
    Exit;

  if alphaUsed = 0 then
    for i := 0 to W * H - 1 do
      Pixels[i] := $FF000000 or (Pixels[i] and $0000FF00) or
        ((Pixels[i] and $000000FF) shl 16) or ((Pixels[i] shr 16) and $000000FF)
  else
    for i := 0 to W * H - 1 do
      Pixels[i] := (Pixels[i] and $FF00FF00) or
        ((Pixels[i] and $000000FF) shl 16) or
        ((Pixels[i] shr 16) and $000000FF);

  PixBuf := PByte(Pixels);
  Result := True;
end;

procedure VP8UnfilterAlpha(Filter: Integer; Plane: PByte; W, H: Integer);
var
  y, i, g, Pred: Integer;
  cur, prev: PByte;
begin
  if Filter = 0 then
    Exit;
  prev := nil;
  for y := 0 to H - 1 do
  begin
    cur := Plane + y * W;
    case Filter of
      1:
        begin
          if prev = nil then
            Pred := 0
          else
            Pred := prev[0];
          cur[0] := Byte(Pred + cur[0]);
          for i := 1 to W - 1 do
            cur[i] := Byte(cur[i - 1] + cur[i]);
        end;
      2:
        begin
          if prev = nil then
          begin
            for i := 1 to W - 1 do
              cur[i] := Byte(cur[i - 1] + cur[i]);
          end
          else
            for i := 0 to W - 1 do
              cur[i] := Byte(prev[i] + cur[i]);
        end;
      3:
        begin
          if prev = nil then
          begin
            for i := 1 to W - 1 do
              cur[i] := Byte(cur[i - 1] + cur[i]);
          end
          else
          begin
            cur[0] := Byte(prev[0] + cur[0]);
            for i := 1 to W - 1 do
            begin
              g := Integer(cur[i - 1]) + Integer(prev[i]) -
                Integer(prev[i - 1]);
              if g < 0 then
                Pred := 0
              else if g > 255 then
                Pred := 255
              else
                Pred := g;
              cur[i] := Byte(cur[i] + Pred);
            end;
          end;
        end;
    end;
    prev := cur;
  end;
end;

function DecodeAlpha(AlphData: PByte; AlphSize: NativeUInt; W, H: Integer;
  AlphaOut: PByte): Boolean;
var
  method, Filter, i, n: Integer;
  bitData: PByte;
  bitSize: NativeUInt;
  Pixels: PCardinal;
  BR: TVP8LBitReader;
begin
  Result := False;
  if AlphSize < 1 then
    Exit;
  method := AlphData[0] and 3;
  Filter := (AlphData[0] shr 2) and 3;
  bitData := AlphData + 1;
  bitSize := AlphSize - 1;
  n := W * H;
  if method = 0 then
  begin
    if bitSize < NativeUInt(n) then
      Exit;
    Move(bitData^, AlphaOut^, n);
  end
  else if method = 1 then
  begin
    VP8LInitBitReader(BR, bitData, bitSize);
    if not VP8LDecodeBody(BR, W, H, Pixels) then
      Exit;
    for i := 0 to n - 1 do
      AlphaOut[i] := Byte((Pixels[i] shr 8) and $FF);
    FreeMem(Pixels);
  end
  else
    Exit;

  VP8UnfilterAlpha(Filter, AlphaOut, W, H);
  Result := True;
end;

function ReadLE32(p: PByte): Cardinal; inline;
begin
  Result := p[0] or (Cardinal(p[1]) shl 8) or (Cardinal(p[2]) shl 16) or
    (Cardinal(p[3]) shl 24);
end;

type
  TWebPChunk = record
    FourCC: Cardinal;
    Size: Cardinal;
    Data: PByte;
  end;

function FindChunk(const RIFF: PByte; RiffSize: NativeUInt;
  const Tag: AnsiString; out Chunk: TWebPChunk): Boolean;
var
  p: PByte;
  Left: NativeUInt;
  cc, Sz: Cardinal;
  tagCC: Cardinal;
begin
  Result := False;
  tagCC := Ord(Tag[1]) or (Cardinal(Ord(Tag[2])) shl 8) or
    (Cardinal(Ord(Tag[3])) shl 16) or (Cardinal(Ord(Tag[4])) shl 24);
  p := RIFF;
  Left := RiffSize;
  while Left >= 8 do
  begin
    cc := ReadLE32(p);
    Sz := ReadLE32(p + 4);
    if cc = tagCC then
    begin
      Chunk.FourCC := cc;
      Chunk.Size := Sz;
      Chunk.Data := p + 8;
      Result := True;
      Exit;
    end;

    Sz := (Sz + 1) and (not 1);
    Inc(p, 8 + Sz);
    if 8 + Sz > Left then
      Break;
    Dec(Left, 8 + Sz);
  end;
end;

function ParseRIFF(Data: PByte; Size: NativeUInt; out ChunkData: PByte;
  out ChunkSize: NativeUInt; out IsLossless: Boolean; out HasAlpha: Boolean;
  out AlphaData: PByte; out AlphaSize: NativeUInt): Integer;
var
  riffTag, webpTag: Cardinal;
  inner: PByte;
  innerSize: NativeUInt;
  Chunk: TWebPChunk;
  vp8x_flags: Cardinal;
  alphaChunk: TWebPChunk;
begin
  Result := 0;
  IsLossless := False;
  HasAlpha := False;
  ChunkData := nil;
  ChunkSize := 0;
  AlphaData := nil;
  AlphaSize := 0;

  if Size < 12 then
    Exit;

  riffTag := ReadLE32(Data);
  webpTag := ReadLE32(Data + 8);

  if riffTag <> $46464952 then
    Exit;

  if webpTag <> $50424557 then
    Exit;

  inner := Data + 12;
  innerSize := Size - 12;

  if FindChunk(inner, innerSize, 'VP8X', Chunk) then
  begin
    if Chunk.Size >= 10 then
    begin
      vp8x_flags := ReadLE32(Chunk.Data);
      HasAlpha := (vp8x_flags and 16) <> 0;
    end;

    if FindChunk(inner, innerSize, 'ALPH', alphaChunk) then
    begin
      AlphaData := alphaChunk.Data;
      AlphaSize := alphaChunk.Size;
    end;

    if FindChunk(inner, innerSize, 'VP8L', Chunk) then
    begin
      ChunkData := Chunk.Data;
      ChunkSize := Chunk.Size;
      IsLossless := True;
      Result := 2;
      Exit;
    end;

    if FindChunk(inner, innerSize, 'VP8 ', Chunk) then
    begin
      ChunkData := Chunk.Data;
      ChunkSize := Chunk.Size;
      IsLossless := False;
      Result := 1;
      Exit;
    end;

    Exit;
  end;

  if FindChunk(inner, innerSize, 'VP8L', Chunk) then
  begin
    ChunkData := Chunk.Data;
    ChunkSize := Chunk.Size;
    IsLossless := True;
    Result := 2;
    Exit;
  end;

  if FindChunk(inner, innerSize, 'VP8 ', Chunk) then
  begin
    ChunkData := Chunk.Data;
    ChunkSize := Chunk.Size;
    IsLossless := False;
    Result := 1;
    Exit;
  end;
end;

function VP8Decode(Data: PByte; DataSize: NativeUInt; Mode: TCSMode;
  out Width, Height: Integer): PByte;
var
  D: TVP8Decoder;
  outSize: NativeUInt;
  topBufSize: NativeUInt;
  topBuf: PByte;
  mbInfoSz: NativeUInt;
  i: Integer;
begin
  Result := nil;
  Width := 0;
  Height := 0;

  FillChar(D, SizeOf(D), 0);
  D.OutputMode := Mode;
  case Mode of
    csmRGB, csmBGR:
      D.OutBpp := 3;
  else
    D.OutBpp := 4;
  end;
  D.SegHdr.UseSegment := False;
  D.SegHdr.AbsoluteDelta := True;

  if not VP8ParseHeaders(D, Data, DataSize) then
    Exit;
  Width := D.PicWidth;
  Height := D.PicHeight;

  if D.FilterLevel = 0 then
    D.FilterType := 0
  else if D.FilterSimple then
    D.FilterType := 1
  else
    D.FilterType := 2;

  D.OutStride := D.PicWidth * D.OutBpp;
  outSize := NativeUInt(D.PicHeight) * NativeUInt(D.OutStride);
  D.OutBuf := AllocMem(outSize);

  D.FYStride := D.MbW * 16;
  D.FUVStride := D.MbW * 8;
  D.FYPlane := AllocMem(D.FYStride * D.MbH * 16);
  D.FUPlane := AllocMem(D.FUVStride * D.MbH * 8);
  D.FVPlane := AllocMem(D.FUVStride * D.MbH * 8);
  D.FInfo := PVP8FInfo(AllocMem(D.MbW * D.MbH * SizeOf(TVP8FInfo)));

  VP8PrecomputeFilterStrengths(D);

  topBufSize := D.MbW * 32;
  topBuf := AllocMem(topBufSize);
  FillChar(topBuf^, topBufSize, 127);
  D.YTopBuf := topBuf;
  D.UTopBuf := topBuf + D.MbW * 16;
  D.VTopBuf := topBuf + D.MbW * 24;

  mbInfoSz := (D.MbW + 1) * SizeOf(TVP8MB);
  D.MBInfo := PVP8MB(AllocMem(mbInfoSz));
  FillChar(D.MBInfo^, mbInfoSz, 0);

  D.IntraT := AllocMem(D.MbW * 4 + 4);
  FillChar(D.IntraT^, D.MbW * 4 + 4, B_DC_PRED);

  FillChar(D.YuvBuf, SizeOf(D.YuvBuf), 128);

  for i := 0 to 15 do
    D.YuvBuf[Y_OFF + i * BPS - 1] := 129;
  for i := 0 to 7 do
    D.YuvBuf[U_OFF + i * BPS - 1] := 129;
  for i := 0 to 7 do
    D.YuvBuf[V_OFF + i * BPS - 1] := 129;

  if VP8DecodeFrame(D) then
  begin
    VP8FilterFrame(D);
    VP8EmitFrame(D);
    Result := D.OutBuf;
  end
  else
  begin
    FreeMem(D.OutBuf);
    D.OutBuf := nil;
  end;

  FreeMem(topBuf);
  FreeMem(D.MBInfo);
  FreeMem(D.IntraT);
  if D.FYPlane <> nil then
    FreeMem(D.FYPlane);
  if D.FUPlane <> nil then
    FreeMem(D.FUPlane);
  if D.FVPlane <> nil then
    FreeMem(D.FVPlane);
  if D.FInfo <> nil then
    FreeMem(D.FInfo);
end;

function WebPGetInfo(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): Boolean;
var
  ChunkData: PByte;
  ChunkSize: NativeUInt;
  IsLossless, HasAlpha: Boolean;
  riffType: Integer;
  BR: TVP8LBitReader;
  tmp: Cardinal;
  AlphaData: PByte;
  AlphaSize: NativeUInt;
begin
  Result := False;
  Width := 0;
  Height := 0;
  if DataSize < 12 then
    Exit;

  riffType := ParseRIFF(Data, DataSize, ChunkData, ChunkSize, IsLossless,
    HasAlpha, AlphaData, AlphaSize);
  if riffType = 0 then
    Exit;

  if IsLossless then
  begin
    if ChunkSize < 5 then
      Exit;
    if ChunkData[0] <> $2F then
      Exit;
    VP8LInitBitReader(BR, ChunkData + 1, ChunkSize - 1);
    Width := Integer(VP8LReadBits(BR, 14)) + 1;
    Height := Integer(VP8LReadBits(BR, 14)) + 1;
    Result := True;
  end
  else
  begin
    if ChunkSize < 10 then
      Exit;
    tmp := ChunkData[0] or (Cardinal(ChunkData[1]) shl 8) or
      (Cardinal(ChunkData[2]) shl 16);
    if (tmp and 1) <> 0 then
      Exit;
    if (ChunkData[3] <> $9D) or (ChunkData[4] <> $01) or (ChunkData[5] <> $2A)
    then
      Exit;
    Width := (ChunkData[6] or (Cardinal(ChunkData[7]) shl 8)) and $3FFF;
    Height := (ChunkData[8] or (Cardinal(ChunkData[9]) shl 8)) and $3FFF;
    Result := True;
  end;
end;

function InternalDecode(Data: PByte; DataSize: NativeUInt; Mode: TCSMode;
  out Width, Height: Integer): PByte;
var
  ChunkData: PByte;
  ChunkSize: NativeUInt;
  IsLossless, HasAlpha: Boolean;
  riffType: Integer;
  lsBuf: PByte;
  lsW, lsH: Integer;
  OutBuf: PByte;
  i: Integer;
  AlphaData: PByte;
  AlphaSize: NativeUInt;
  alphaPlane: PByte;
  aOff: Integer;
begin
  Result := nil;
  Width := 0;
  Height := 0;

  riffType := ParseRIFF(Data, DataSize, ChunkData, ChunkSize, IsLossless,
    HasAlpha, AlphaData, AlphaSize);
  if riffType = 0 then
    Exit;

  if IsLossless then
  begin
    if not VP8LDecode(ChunkData, ChunkSize, lsBuf, lsW, lsH) then
      Exit;
    Width := lsW;
    Height := lsH;

    if Mode = csmRGBA then
    begin
      Result := lsBuf;
      Exit;
    end;

    case Mode of
      csmARGB:
        begin
          OutBuf := AllocMem(lsW * lsH * 4);
          for i := 0 to lsW * lsH - 1 do
          begin
            OutBuf[i * 4 + 0] := lsBuf[i * 4 + 3];
            OutBuf[i * 4 + 1] := lsBuf[i * 4 + 0];
            OutBuf[i * 4 + 2] := lsBuf[i * 4 + 1];
            OutBuf[i * 4 + 3] := lsBuf[i * 4 + 2];
          end;
          FreeMem(lsBuf);
          Result := OutBuf;
        end;
      csmBGRA:
        begin
          OutBuf := AllocMem(lsW * lsH * 4);
          for i := 0 to lsW * lsH - 1 do
          begin
            OutBuf[i * 4 + 0] := lsBuf[i * 4 + 2];
            OutBuf[i * 4 + 1] := lsBuf[i * 4 + 1];
            OutBuf[i * 4 + 2] := lsBuf[i * 4 + 0];
            OutBuf[i * 4 + 3] := lsBuf[i * 4 + 3];
          end;
          FreeMem(lsBuf);
          Result := OutBuf;
        end;
      csmRGB:
        begin
          OutBuf := AllocMem(lsW * lsH * 3);
          for i := 0 to lsW * lsH - 1 do
          begin
            OutBuf[i * 3 + 0] := lsBuf[i * 4 + 0];
            OutBuf[i * 3 + 1] := lsBuf[i * 4 + 1];
            OutBuf[i * 3 + 2] := lsBuf[i * 4 + 2];
          end;
          FreeMem(lsBuf);
          Result := OutBuf;
        end;
      csmBGR:
        begin
          OutBuf := AllocMem(lsW * lsH * 3);
          for i := 0 to lsW * lsH - 1 do
          begin
            OutBuf[i * 3 + 0] := lsBuf[i * 4 + 2];
            OutBuf[i * 3 + 1] := lsBuf[i * 4 + 1];
            OutBuf[i * 3 + 2] := lsBuf[i * 4 + 0];
          end;
          FreeMem(lsBuf);
          Result := OutBuf;
        end;
    end;
  end
  else
  begin
    Result := VP8Decode(ChunkData, ChunkSize, Mode, Width, Height);

    if (Result <> nil) and HasAlpha and (AlphaData <> nil) and
      (Mode in [csmRGBA, csmBGRA, csmARGB]) then
    begin
      alphaPlane := AllocMem(Width * Height);
      if DecodeAlpha(AlphaData, AlphaSize, Width, Height, alphaPlane) then
      begin
        if Mode = csmARGB then
          aOff := 0
        else
          aOff := 3;
        for i := 0 to Width * Height - 1 do
          Result[i * 4 + aOff] := alphaPlane[i];
      end;
      FreeMem(alphaPlane);
    end;
  end;
end;

function WebPDecodeRGBA(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
begin
  Result := InternalDecode(Data, DataSize, csmRGBA, Width, Height);
end;

function WebPDecodeARGB(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
begin
  Result := InternalDecode(Data, DataSize, csmARGB, Width, Height);
end;

function WebPDecodeBGRA(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
begin
  Result := InternalDecode(Data, DataSize, csmBGRA, Width, Height);
end;

function WebPDecodeRGB(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
begin
  Result := InternalDecode(Data, DataSize, csmRGB, Width, Height);
end;

function WebPDecodeBGR(Data: PByte; DataSize: NativeUInt;
  out Width, Height: Integer): PByte;
begin
  Result := InternalDecode(Data, DataSize, csmBGR, Width, Height);
end;

procedure WebPFree(ptr: Pointer);
begin
  FreeMemory(ptr);
end;

end.
