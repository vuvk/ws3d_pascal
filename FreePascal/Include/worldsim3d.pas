(*
* started 08.09.2016
*
* Модуль для линкования библиотеки WS3DCore движка WS3D
*
* версия модуля 0.5 (2018-18-10)
*
* версия модуля 0.42 (2017-08-09)
* версия WorldSim3D 1.0.2
* (+ поддержка Win64)
*
* версия модуля 0.4 (2017-08-07)
* версия WorldSim3D 1.0.2
*
* версия модуля 0.2 (2016-10-07)
* версия WorldSim3D 1.0.1a

* Vuvk, Nikolas
*)

unit WorldSim3D;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  {$IFDEF FPC}
    {$IFDEF WINDOWS}
    {$ELSE}
      //glx provides functionality to set up an OpenGL window in an X Window system
      glx,
    {$ENDIF}
    GL
  {$ELSE}
    OpenGL
  {$ENDIF}
  ;

const
  //имя библиотеки ядра WS3D
  {$IFDEF WINDOWS}
    {$IFDEF WIN32}
      WS3DCoreLib = 'WS3DCoreLib.dll';
    {$ELSE}
      WS3DCoreLib = 'WS3DCoreLib64.dll';
    {$ENDIF}
  {$ELSE}
  WS3DCoreLib = 'WS3DCoreLib.so';
  {$ENDIF}

const
  {$IFDEF WINDOWS}
  nullStr = '';
  {$ELSE}
  nullStr = nil;
  {$ENDIF}

type
  {$IFDEF WINDOWS}
  WChar   = WideChar;
  WString = WideString;
  {$ELSE}
  WChar   = UCS4Char;
  WString = UCS4String;
  {$ENDIF}
  PWChar   = ^WChar;
  PPWChar   = ^PWChar;
  PWString = ^WString;

  {PChar=^char;}
  PPChar=^PChar;

type
    UInt64 = dword;
    UInt32 = dword;
    UInt16 = word;
    UInt8 = byte;
    Int64 = longint;
    Int32 = longint;
    Int16 = smallint;
    Int8 = char;
    Float64 = double;
    Float32 = single;
    PUInt32 =^UInt32;
    PFloat32=^Float32;
    PBoolean=^Boolean;
    wImage 		= PUInt32; 	PwImage          = ^wImage;
    wTexture 		= PUInt32;	PwTexture        = ^wTexture;
    wFont 		= PUInt32;	PwFont           = ^wFont;
    wGuiObject 		= PUInt32;	PwGuiObject      = ^wGuiobject;
    wMesh 		= PUInt32;	PwMesh           = ^wMesh;
    wMeshBuffer 	= PUInt32;	PwMeshBuffer     = ^wMeshBuffer;
    wNode 		= PUInt32;	PwNode           = ^wNode;
    wMaterial 		= PUInt32;	PwMaterial       = ^wMaterial;
    wSelector 		= PUInt32;	PwSelector       = ^wSelector;
    wEmitter 		= PUInt32;	PwEmitter        = ^wEmitter;
    wAffector 		= PUInt32;	PwAffector       = ^wAffector;
    wAnimator 		= PUInt32;	PwAnimator       = ^wAnimator;
    wXmlReader 		= PUInt32;	PwXmlReader      = ^wXmlReader;
    wXmlWriter 		= PUInt32;	PwXmlWriter      = ^wXmlWriter;
    wFile 		= PUInt32;	PwFile		 = ^wFile;
    wSoundEffect 	= PUInt32;	PwSoundEffect	 = ^wSoundEffect;
    wSoundFilter 	= PUInt32;	PwSoundFilter	 = ^wSoundFilter;
    wSound 		= PUInt32;	PwSound		 = ^wSound;
    wSoundBuffer 	= PUInt32;	PwSoundBuffer	 = ^wSoundBuffer;
    wVideo 		= PUInt32;	PwVideo		 = ^wVideo;
    wPostEffect 	= PUInt32;	PwPostEffect	 = ^wPostEffect;
    wPacket 		= PUInt32;	PwPacket	 = ^wPacket;

type 	wMouseEventType = (
	wMET_LMOUSE_PRESSED_DOWN := 0,
	wMET_RMOUSE_PRESSED_DOWN,
        wMET_MMOUSE_PRESSED_DOWN,
        wMET_LMOUSE_LEFT_UP,
        wMET_RMOUSE_LEFT_UP,
        wMET_MMOUSE_LEFT_UP,
        wMET_MOUSE_MOVED,
        wMET_MOUSE_WHEEL,
        wMET_LMOUSE_DOUBLE_CLICK,
        wMET_RMOUSE_DOUBLE_CLICK,
        wMET_MMOUSE_DOUBLE_CLICK,
        wMET_LMOUSE_TRIPLE_CLICK,
        wMET_RMOUSE_TRIPLE_CLICK,
        wMET_MMOUSE_TRIPLE_CLICK,
        wMET_COUNT
        );

type 	wMouseButtons = (
	wMB_LEFT := $01,
	wMB_RIGHT := $02,
	wMB_MIDDLE := $04,
        wMB_EXTRA1 := $08,
        wMB_EXTRA2 := $10,
        wMB_FORCE_32_BIT := $7fffffff
        );

type wVector2i = record
	x : Int32;
	y : Int32;
end;

type PwVector2i=^wVector2i;

const wVECTOR2i_ZERO:wVector2i=(x:0; y:0);
const wVECTOR2i_ONE:wVector2i=(x:1; y:1);

type wMouseEvent = record
	action : wMouseEventType;
	delta : Float32;
	position : wVector2i;
	isShift : Boolean;
	isControl : Boolean;
end;

type PwMouseEvent=^wMouseEvent;

type 	wKeyCode = (
	wKC_UNKNOWN                             := $0,
	wKC_LBUTTON 			        := $01,
        wKC_RBUTTON 			        := $02,
        wKC_CANCEL 				:= $03,
        wKC_MBUTTON 			        := $04,
        wKC_XBUTTON1 			        := $05,
        wKC_XBUTTON2 			        := $06,
        wKC_BACK 				:= $08,
        wKC_TAB 				:= $09,
        wKC_CLEAR 				:= $0C,
        wKC_RETURN 				:= $0D,
        wKC_SHIFT 				:= $10,
        wKC_CONTROL 			        := $11,
        wKC_MENU 				:= $12,
        wKC_PAUSE 				:= $13,
        wKC_CAPITAL 			        := $14,
        wKC_KANA 				:= $15,
        wKC_HANGUEL 			        := $15,
        wKC_HANGUL 				:= $15,
        wKC_JUNJA 				:= $17,
        wKC_FINAL 				:= $18,
        wKC_HANJA 				:= $19,
        wKC_KANJI 				:= $19,
        wKC_ESCAPE 				:= $1B,
        wKC_CONVERT 			        := $1C,
        wKC_NONCONVERT 			        := $1D,
        wKC_ACCEPT 				:= $1E,
        wKC_MODECHANGE 			        := $1F,
        wKC_SPACE 				:= $20,
        wKC_PRIOR 				:= $21,
        wKC_NEXT 				:= $22,
        wKC_END 				:= $23,
        wKC_HOME 				:= $24,
        wKC_LEFT 				:= $25,
        wKC_UP 					:= $26,
        wKC_RIGHT 				:= $27,
        wKC_DOWN 				:= $28,
        wKC_SELECT 				:= $29,
        wKC_PRINT 				:= $2A,
        wKC_EXECUT 				:= $2B,
        wKC_SNAPSHOT 			        := $2C,
        wKC_INSERT 				:= $2D,
        wKC_DELETE 				:= $2E,
        wKC_HELP 				:= $2F,
        wKC_KEY_0				:= $30,
        wKC_KEY_1 				:= $31,
        wKC_KEY_2 				:= $32,
        wKC_KEY_3 				:= $33,
        wKC_KEY_4 				:= $34,
        wKC_KEY_5 				:= $35,
        wKC_KEY_6 				:= $36,
        wKC_KEY_7 				:= $37,
        wKC_KEY_8 				:= $38,
        wKC_KEY_9 				:= $39,
        wKC_KEY_A 				:= $41,
        wKC_KEY_B 				:= $42,
        wKC_KEY_C 				:= $43,
        wKC_KEY_D 				:= $44,
        wKC_KEY_E 				:= $45,
        wKC_KEY_F 				:= $46,
        wKC_KEY_G 				:= $47,
        wKC_KEY_H 				:= $48,
        wKC_KEY_I 				:= $49,
        wKC_KEY_J 				:= $4A,
        wKC_KEY_K 				:= $4B,
        wKC_KEY_L 				:= $4C,
        wKC_KEY_M 				:= $4D,
        wKC_KEY_N 				:= $4E,
        wKC_KEY_O 				:= $4F,
        wKC_KEY_P 				:= $50,
        wKC_KEY_Q 				:= $51,
        wKC_KEY_R 				:= $52,
        wKC_KEY_S 				:= $53,
        wKC_KEY_T 				:= $54,
        wKC_KEY_U 				:= $55,
        wKC_KEY_V 				:= $56,
        wKC_KEY_W 				:= $57,
        wKC_KEY_X 				:= $58,
        wKC_KEY_Y 				:= $59,
        wKC_KEY_Z 				:= $5A,
        wKC_LWIN 				:= $5B,
        wKC_RWIN 				:= $5C,
        wKC_APPS 				:= $5D,
        wKC_SLEEP 				:= $5F,
        wKC_NUMPAD0 			        := $60,
        wKC_NUMPAD1 			        := $61,
        wKC_NUMPAD2 			        := $62,
        wKC_NUMPAD3 			        := $63,
        wKC_NUMPAD4 			        := $64,
        wKC_NUMPAD5 			        := $65,
        wKC_NUMPAD6 			        := $66,
        wKC_NUMPAD7 			        := $67,
        wKC_NUMPAD8 			        := $68,
        wKC_NUMPAD9 			        := $69,
        wKC_MULTIPLY 			        := $6A,
        wKC_ADD 				:= $6B,
        wKC_SEPARATOR 			        := $6C,
        wKC_SUBTRACT 			        := $6D,
        wKC_DECIMAL 			        := $6E,
        wKC_DIVIDE 				:= $6F,
        wKC_F1 					:= $70,
        wKC_F2 					:= $71,
        wKC_F3 					:= $72,
        wKC_F4 					:= $73,
        wKC_F5 					:= $74,
        wKC_F6 					:= $75,
        wKC_F7 					:= $76,
        wKC_F8 					:= $77,
        wKC_F9 					:= $78,
        wKC_F10 				:= $79,
        wKC_F11 				:= $7A,
        wKC_F12 				:= $7B,
        wKC_F13 				:= $7C,
        wKC_F14 				:= $7D,
        wKC_F15 				:= $7E,
        wKC_F16 				:= $7F,
        wKC_F17 				:= $80,
        wKC_F18 				:= $81,
        wKC_F19 				:= $82,
        wKC_F20 				:= $83,
        wKC_F21 				:= $84,
        wKC_F22 				:= $85,
        wKC_F23 				:= $86,
        wKC_F24 				:= $87,
        wKC_NUMLOCK 			        := $90,
        wKC_SCROLL 				:= $91,
        wKC_LSHIFT 				:= $A0,
        wKC_RSHIFT 				:= $A1,
        wKC_LCONTROL 			        := $A2,
        wKC_RCONTROL 			        := $A3,
        wKC_LMENU 				:= $A4,
        wKC_RMENU 				:= $A5,
        wKC_BROWSER_BACK		        := $A6,
        wKC_BROWSER_FORWARD 	                := $A7,
        wKC_BROWSER_REFRESH 	                := $A8,
        wKC_BROWSER_STOP 		        := $A9,
        wKC_BROWSER_SEARCH 		        := $AA,
        wKC_BROWSER_FAVORITES	                := $AB,
        wKC_BROWSER_HOME 		        := $AC,
        wKC_VOLUME_MUTE 		        := $AD,
        wKC_VOLUME_DOWN 		        := $AE,
        wKC_VOLUME_UP 			        := $AF,
        wKC_MEDIA_NEXT_TRACK 	                := $B0,
        wKC_MEDIA_PREV_TRACK 	                := $B1,
        wKC_MEDIA_STOP 			        := $B2,
        wKC_MEDIA_PLAY_PAUSE                    := $B3,
        wKC_OEM_1 				:= $BA,
        wKC_PLUS 				:= $BB,
        wKC_COMMA 				:= $BC,
        wKC_MINUS 				:= $BD,
        wKC_PERIOD 				:= $BE,
        wKC_OEM_2 				:= $BF,
        wKC_OEM_3 				:= $C0,
        wKC_OEM_4 				:= $DB,
        wKC_OEM_5 				:= $DC,
        wKC_OEM_6 				:= $DD,
        wKC_OEM_7 				:= $DE,
        wKC_OEM_8 				:= $DF,
        wKC_OEM_AX 				:= $E1,
        wKC_OEM_102 			        := $E2,
        wKC_ATTN 				:= $F6,
        wKC_CRSEL 				:= $F7,
        wKC_EXSEL 				:= $F8,
        wKC_EREOF 				:= $F9,
        wKC_PLAY 				:= $FA,
        wKC_ZOOM 				:= $FB,
        wKC_PA1 				:= $FD,
        wKC_OEM_CLEAR 			        := $FE,
        wKC_NONE 				:= $FF,
        wKC_KEY_CODES_COUNT 	                := $100
        );

type wKeyDirection = (
	wKD_UP := 0,
	wKD_DOWN
	);

type wKeyEvent = record
	key : wKeyCode;
	direction : wKeyDirection;
	isShift : Boolean;
	isControl : Boolean;
end;

type PwKeyEvent=^wKeyEvent;

type wKeyAction = (
	wKA_MOVE_FORWARD := 0,
	wKA_MOVE_BACKWARD,
    wKA_STRAFE_LEFT,
    wKA_STRAFE_RIGHT,
    wKA_JUMP_UP,
    wKA_COUNT,
    wKA_FORCE_32BIT := $7fffffff
    );

type wKeyMap = record
	Action : wKeyAction;
	KeyCode : wKeyCode;
end;

type PwKeyMap=^wKeyMap;

type wKeyMapArray=array[0..7] of wKeyMap;

const wKeyMapDefault:wKeyMapArray=(
      (Action: wKA_MOVE_FORWARD; KeyCode: wKC_KEY_W),
      (Action: wKA_MOVE_FORWARD; keyCode: wKC_UP),
      (Action: wKA_MOVE_BACKWARD; keyCode: wKC_KEY_S),
      (Action: wKA_MOVE_BACKWARD; keyCode: wKC_DOWN),
      (Action: wKA_STRAFE_LEFT; keyCode: wKC_KEY_A),
      (Action: wKA_STRAFE_LEFT; keyCode: wKC_LEFT),
      (Action: wKA_STRAFE_RIGHT; keyCode: wKC_KEY_D),
      (Action: wKA_STRAFE_RIGHT; keyCode: wKC_RIGHT)
      );     
type PwKeyMapArray=^wKeyMapArray;

const
  PwKeyMapDefault : PwKeyMapArray = @wKeyMapDefault;

type wJoystickPovHat = (
	wJPH_PRESENT,
	wJPH_ABSENT,
	wJPH_UNKNOWN
	);

type wJoystickInfo = record
	Axes : UInt32;
	Buttons : UInt32;
	joyId : UInt8;
	joyName : PChar;
	PovHat : wJoystickPovHat;
end;

type PwJoystickInfo=^wJoystickInfo;

const wNUMBER_OF_BUTTONS =32;
const wAXIS_X =0;
const wAXIS_Y =1;
const wAXIS_Z =2;
const wAXIS_R =3;
const wAXIS_U =4;
const wAXIS_V =5;
const wNUMBER_OF_AXES =6;

type wJoystickEvent = record
	joyId : UInt8;
	ButtonStates : array[0..(wNUMBER_OF_BUTTONS)-1] of Boolean;
	Axis : array[0..(wNUMBER_OF_AXES)-1] of UInt16;
	POV : UInt16;
end;

type PwJoystickEvent=^wJoystickEvent;

type wEventType = (
	wET_GUI_EVENT := 0,
        wET_MOUSE_INPUT_EVENT,
        wET_KEY_INPUT_EVENT,
        wET_JOYSTICK_INPUT_EVENT,
        wET_LOG_TEXT_EVENT,
        wET_USER_EVENT,
        wET_FORCE_32_BIT := $7fffffff
        );

type wGuiCallerType = (
     wGCT_ELEMENT_FOCUS_LOST,
     wGCT_ELEMENT_FOCUSED,
     wGCT_ELEMENT_HOVERED,
     wGCT_ELEMENT_LEFT,
     wGCT_ELEMENT_CLOSED,
     wGCT_BUTTON_CLICKED,
     wGCT_SCROLL_BAR_CHANGED,
     wGCT_CHECKBOX_CHANGED,
     wGCT_LISTBOX_CHANGED,
     wGCT_LISTBOX_SELECTED_AGAIN,
     wGCT_FILE_SELECTED,
     wGCT_DIRECTORY_SELECTED,
     wGCT_FILE_CHOOSE_DIALOG_CANCELLED,
     wGCT_MESSAGEBOX_YES,
     wGCT_MESSAGEBOX_NO,
     wGCT_MESSAGEBOX_OK,
     wGCT_MESSAGEBOX_CANCEL,
     wGCT_EDITBOX_ENTER,
     wGCT_EDITBOX_CHANGED,
     wGCT_EDITBOX_MARKING_CHANGED,
     wGCT_TAB_CHANGED,
     wGCT_MENU_ITEM_SELECTED,
     wGCT_COMBO_BOX_CHANGED,
     wGCT_SPINBOX_CHANGED,
     wGCT_TABLE_CHANGED,
     wGCT_TABLE_HEADER_CHANGED,
     wGCT_TABLE_SELECTED_AGAIN,
     wGCT_TREEVIEW_NODE_DESELECT,
     wGCT_TREEVIEW_NODE_SELECT,
     wGCT_TREEVIEW_NODE_EXPAND,
     wGCT_TREEVIEW_NODE_COLLAPSE,
     wGCT_RADIOBUTTONGROUP_CHANGED,
     wGCT_RADIOCHECKBOXGROUP_CHANGED,
     wGCT_COUNT
     );

type wGuiEvent = record
     id : Int32;
     name :PChar;
     event : wGuiCallerType;
     position : wVector2i;
end;

type PwGuiEvent=^wGuiEvent;

type wGuiMessageBoxFlags = (
     wGMBF_OK := $1,
     wGMBF_CANCEL := $2,
     wGMBF_YES := $4,
     wGMBF_NO := $8,
     wGMBF_FORCE_32BIT := $7fffffff
     );

type wFogType = (
     wFT_EXP,
     wFT_LINEAR,
     wFT_EXP2
     );

type PwFogType=^wFogType;

type wVector2f = record
     x : Float32;
     y : Float32;
end;

type PwVector2f=^wVector2f;

const wVECTOR2f_ZERO:wVector2f=(x: 0;y:0);
const wVECTOR2f_ONE:wVector2f=(x: 1;y:1);

type wVector2u = record
     x : UInt32;
     y : UInt32;
end;

type PwVector2u=^wVector2u;

const wVECTOR2u_ZERO:wVector2u=(x: 0;y: 0);
const wVECTOR2u_ONE:wVector2u=(x: 1;y: 1);
const wDEFAULT_SCREENSIZE:wVector2u=(x: 800;y: 600);

type wVector3f = record
     x : Float32;
     y : Float32;
     z : Float32;
end;

type PwVector3f=^wVector3f;

const wVECTOR3f_ZERO:wVector3f        = (x:  0.0;y:  0.0;z:  0.0);
const wVECTOR3f_ONE:wVector3f         = (x:  1.0;y:  1.0;z:  1.0);
const wVECTOR3f_UP:wVector3f          = (x:  0.0;y:  1.0;z:  0.0);
const wVECTOR3f_DOWN:wVector3f        = (x:  0.0;y: -1.0;z:  0.0);
const wVECTOR3f_FORWARD:wVector3f     = (x:  0.0;y:  0.0;z: -1.0);
const wVECTOR3f_BACKWARD:wVector3f    = (x:  0.0;y:  0.0;z:  1.0);
const wVECTOR3f_RIGHT:wVector3f       = (x:  1.0;y:  0.0;z:  0.0);
const wVECTOR3f_LEFT:wVector3f        = (x: -1.0;y:  0.0;z:  0.0);

type wVector3i = record
	x : Int32;
	y : Int32;
	z : Int32;
end;

type PwVector3i=^wVector3i;

const wVECTOR3i_ZERO:wVector3i        = (x:  0;y:  0;z:  0);
const wVECTOR3i_ONE:wVector3i         = (x:  1;y:  1;z:  1);
const wVECTOR3i_UP:wVector3i          = (x:  0;y:  1;z:  0);
const wVECTOR3i_DOWN:wVector3i        = (x:  0;y: -1;z:  0);
const wVECTOR3i_FORWARD:wVector3i     = (x:  0;y:  0;z: -1);
const wVECTOR3i_BACKWARD:wVector3i    = (x:  0;y:  0;z:  1);
const wVECTOR3i_RIGHT:wVector3i       = (x:  1;y:  0;z:  0);
const wVECTOR3i_LEFT:wVector3i        = (x: -1;y:  0;z:  0);

type wVector3u = record
	x : UInt32;
	y : UInt32;
	z : UInt32;
end;

type PwVectoru=^wVector3u;

const wVECTOR3u_ZERO:wVector3u        = (x:  0;y:  0;z:  0);
const wVECTOR3u_ONE:wVector3u         = (x:  1;y:  1;z:  1);

type wColor4s = record
	alpha : UInt16;
	red : UInt16;
	green : UInt16;
	blue : UInt16;
end;

type PwColor4s=^wColor4s;

const wCOLOR4s_ZERO:wColor4s 		=(alpha:0;	red:0;	green:0;	blue:0);

const wCOLOR4s_WHITE:wColor4s 		=(alpha:255;red:255;green:255;	blue:255);
const wCOLOR4s_DARKGREY:wColor4s 	=(alpha:255;red:64;	green:64;	blue:64);
const wCOLOR4s_GREY:wColor4s 		=(alpha:255;red:128;green:128;	blue:128);
const wCOLOR4s_SILVER:wColor4s 		=(alpha:255;red:192;green:192;	blue:192);

const wCOLOR4s_BLACK:wColor4s 		=(alpha:255;red:0;	green:0;	blue:0);

const wCOLOR4s_RED:wColor4s 		=(alpha:255;red:255;green:0;	blue:0);
const wCOLOR4s_DARKRED:wColor4s 	=(alpha:255;red:140;green:0;	blue:0);
const wCOLOR4s_MAROON:wColor4s 		=(alpha:255;red:128;green:0;	blue:0);

const wCOLOR4s_GREEN:wColor4s 		=(alpha:255;red:0;	green:255;	blue:0);
const wCOLOR4s_LIME:wColor4s 		=(alpha:255;red:250;green:128;	blue:114);
const wCOLOR4s_DARKGREEN:wColor4s 	=(alpha:255;red:0;	green:100;	blue:0);
const wCOLOR4s_OLIVE:wColor4s 		=(alpha:255;red:240;green:128;	blue:128);

const wCOLOR4s_BLUE:wColor4s 		=(alpha:255;red:0;	green:0;	blue:255);
const wCOLOR4s_DARKBLUE:wColor4s 	=(alpha:255;red:0;	green:0;	blue:139);
const wCOLOR4s_NAVY:wColor4s 		=(alpha:255;red:0;	green:0;	blue:128);
const wCOLOR4s_SKYBLUE:wColor4s 	=(alpha:255;red:135;green:206;	blue:235);

const wCOLOR4s_MAGENTA:wColor4s 	=(alpha:255;red:255;green:0;	blue:255);
const wCOLOR4s_PINK:wColor4s 		=(alpha:255;red:255;green:192;	blue:203);
const wCOLOR4s_DEEPPINK:wColor4s 	=(alpha:255;red:255;green:20;	blue:147);
const wCOLOR4s_INDIGO:wColor4s 		=(alpha:255;red:75 ;green:0;	blue:130);

const wCOLOR4s_YELLOW:wColor4s 		=(alpha:255;red:255	;green:255;	blue:0);
const wCOLOR4s_GOLD:wColor4s 		=(alpha:255;red:255	;green:215;	blue:0);
const wCOLOR4s_KHAKI:wColor4s 		=(alpha:255;red:245	;green:230;	blue:140);

const wCOLOR4s_ORANGE:wColor4s 		=(alpha:255;red:255	;green:68;	blue:0);
const wCOLOR4s_DARKORANGE:wColor4s 	=(alpha:255;red:255	;green:140;	blue:0);
const wCOLOR4s_ORANGERED:wColor4s 	=(alpha:255;red:255	;green:69;	blue:0);

type wColor4f = record
	alpha : Float32;
	red : Float32;
	green : Float32;
	blue : Float32;
end;

type PwColor4f=^wColor4f;

const wCOLOR4f_WHITE:wColor4f 	=(alpha:1.0;	red:1.0	;green:1.0;	blue:1.0);
const wCOLOR4f_BLACK:wColor4f 	=(alpha:1.0;	red:0.0	;green:0.0;	blue:0.0);

type wColor3s = record
	red : UInt16;
	green : UInt16;
	blue : UInt16;
end;

type PwColor3s=^wColor3s;

const wCOLOR3s_WHITE:wColor3s 	=(red:255;	green:255;	blue:255);
const wCOLOR3s_BLACK:wColor3s 	=(red:0;	green:0;	blue:0);

type wColor3f = record
   red : Float32;
   green : Float32;
   blue : Float32;
end;

type PwColor3f=^wColor3f;

const wCOLOR3f_WHITE:wColor3f 	=(red:1.0;	green:1.0;	blue:1.0);
const wCOLOR3f_BLACK:wColor3f 	=(red:0.0;	green:0.0;	blue:0.0);

type wVert = record
	vertPos : wVector3f;
	vertNormal : wVector3f;
	vertColor : wColor4s;
	texCoords : wVector2f;
end;

type PwVert=^wVert;

{/STRUCTURES FOR PARTICLE EMITTERS/// }
type wParticleEmitter = record
	direction : wVector3f;
	minParticlesPerSecond : UInt32;
	maxParticlesPerSecond : UInt32;
	minStartColor : wColor4s;
	maxStartColor : wColor4s;
	lifeTimeMin : UInt32;
	lifeTimeMax : UInt32;
	maxAnglesDegrees : Int32;
	minStartSize : wVector2f;
	maxStartSize : wVector2f;
end;

type PwParticleEmitter=^wParticleEmitter;

type wParticleCylinderEmitter = record
	center : wVector3f;
	length : Float32;
	normal : wVector3f;
	getOutlineOnly : Boolean;
	radius : Float32;
end;

type PwParticleCylinderEmitter=^wParticleCylinderEmitter;

type wParticleMeshEmitter = record
	mesh : wMesh;
	useNormalDirection : Boolean;
	normalDirectionModifier : Float32;
	everyMeshVertex : Boolean;
end;

type PwParticleMeshEmitter=^wParticleMeshEmitter;

type wParticleRingEmitter = record
	center : wVector3f;
	radius : Float32;
	ringThickness : Float32;
end;

type PwParticleRingEmitter=^wParticleRingEmitter;

type wParticleSphereEmitter = record
	center : wVector3f;
	radius : Float32;
end;

type PwParticleSphereEmitter=^wParticleSphereEmitter;

{/STRUCTURES FOR PARTICLE AFFECTORS/// }
type wParticleAttractionAffector = record
	point : wVector3f;
	attract : Boolean;
	affectX : Boolean;
	affectY : Boolean;
	affectZ : Boolean;
end;

type PwParticleAttractionAffector=^wParticleAttractionAffector;

type wParticleColorMorphAffector = record
	colorsList : PwColor4s;
	colorsCount : UInt32;
	timesList : PUInt32;
	timesCount : UInt32;
	smooth : Boolean;
end;

type PwParticleColorMorphAffector=^wParticleColorMorphAffector;

type wParticlePushAffector = record
	furthestDistance : Float32;
	nearestDistance : Float32;
	columnDistance : Float32;
	center : wVector3f;
	strength : wVector3f;
	distant : Boolean;
end;

type PwParticlePushAffector=^wParticlePushAffector;

type wParticleSplineAffector = record
	points : PwVector3f;
	pointsCount : UInt32;
	speed : Float32;
	tightness : Float32;
	attraction : Float32;
	deleteAtFinalPoint : Boolean;
end;

type PwParticleSplineAffector=^wParticleSplineAffector;

type wTriangle = record
	pointA : wVector3f;
	pointB : wVector3f;
	pointC : wVector3f;
end;

type PwTriangle=^wTriangle;

const wTRIANGLE3f_ZERO:wTriangle=(pointA: (x:0;y:0;z:0);
                                  pointB: (x:0;y:0;z:0);
                                  pointC: (x:0;y:0;z:0));

{/STRUCTURE FOR NODE ANIMATORS/// }
{/COLLISION RESPONSE ANIMATOR/// }

type wAnimatorCollisionResponse = record
	world : wSelector;
	targetNode : wNode;
	ellipsoidRadius : wVector3f;
	gravity : wVector3f;
	animateTarget : Boolean;
	ellipsoidTranslation : wVector3f;
	collisionPoint : wVector3f;
	collisionResultPosition : wVector3f;
	collisionTriangle : wTriangle;
	collisionNode : wNode;
	isFalling : Boolean;
	collisionOccured : Boolean;
end;

type PwAnimatorCollisionResponse=^wAnimatorCollisionResponse;

type tag_wConstant = record
	next : ^tag_wConstant;
	name : PChar;
	address : Int32;
	preset : Int32;
	data : PFloat32;
	count : Int32;
end;

type
	wConstant = tag_wConstant;

type PwConstant=^wConstant;

type wDriverTypes = (
	wDRT_NULL := 0,
	wDRT_SOFTWARE,
	wDRT_BURNINGS_VIDEO,
    wDRT_OPENGL,
    wDRT_DIRECT3D9,
    wDRT_CHOICE_CONSOLE := 6
    );


type wDeviceTypes = (
	wDT_BEST,
	wDT_WIN32,
	wDT_WINCE,
	wDT_X11,
    wDT_OSX,
    wDT_SDL,
    wDT_FRAMEBUFFER,
    wDT_CONSOLE
    );

{' Vertex shader program versions }
type wVertexShaderVersion = (
	wVSV_1_1 := 0,
	wVSV_2_0,
	wVSV_2_a,
	wVSV_3_0
    );

{' Pixel shader program versions }
type wPixelShaderVersion = (
	wPSV_1_1 := 0,
	wPSV_1_2,
	wPSV_1_3,
	wPSV_1_4,
    wPSV_2_0,
    wPSV_2_a,
    wPSV_2_b,
    wPSV_3_0
    );

{Geometry shaders program versions }
type wGeometryShaderVersion = (
	wGSV_4_0 := 0,
	wGSV_COUNT
	);

{For Geometry shaders }

type wPrimitiveType = (
	wPT_POINTS,
	wPT_LINE_STRIP,
	wPT_LINE_LOOP,
    wPT_LINES,
    wPT_TRIANGLE_STRIP,
    wPT_TRIANGLE_FAN,
    wPT_TRIANGLES,
    wPT_QUAD_STRIP,
    wPT_QUADS,
    wPT_POLYGON,
    wPT_POINT_SPRITES,
    wPT_COUNT
    );

type wShaderConstants = (
	wSC_NO_PRESET := 0,
	wSC_INVERSE_WORLD,
        wSC_WORLD_VIEW_PROJECTION,
        wSC_CAMERA_POSITION,
        wSC_TRANSPOSED_WORLD
    );

type wVideoFeatureQuery = (
	wVDF_RENDER_TO_TARGET := 0,
	wVDF_HARDWARE_TL,
        wVDF_MULTITEXTURE,
        wVDF_BILINEAR_FILTER,
	wVDF_MIP_MAP,
	wVDF_MIP_MAP_AUTO_UPDATE,
	wVDF_STENCIL_BUFFER,
	wVDF_VERTEX_SHADER_1_1,
        wVDF_VERTEX_SHADER_2_0,
        wVDF_VERTEX_SHADER_3_0,
        wVDF_PIXEL_SHADER_1_1,
        wVDF_PIXEL_SHADER_1_2,
        wVDF_PIXEL_SHADER_1_3,
        wVDF_PIXEL_SHADER_1_4,
        wVDF_PIXEL_SHADER_2_0,
        wVDF_PIXEL_SHADER_3_0,
        wVDF_ARB_VERTEX_PROGRAM_1,
        wVDF_ARB_FRAGMENT_PROGRAM_1,
        wVDF_ARB_GLSL,
        wVDF_HLSL,
        wVDF_TEXTURE_NSQUARE,
        wVDF_TEXTURE_NPOT,
        wVDF_FRAMEBUFFER_OBJECT,
        wVDF_VERTEX_BUFFER_OBJECT,
        wVDF_ALPHA_TO_COVERAGE,
        wVDF_COLOR_MASK,
        wVDF_MULTIPLE_RENDER_TARGETS,
        wVDF_MRT_BLEND,
        wVDF_MRT_COLOR_MASK,
        wVDF_MRT_BLEND_FUNC,
        wVDF_GEOMETRY_SHADER,
        wVDF_OCCLUSION_QUERY,
        wVDF_POLYGON_OFFSET,
        wVDF_BLEND_OPERATIONS,
	wVDF_BLEND_SEPARATE,
        wVDF_TEXTURE_MATRIX,
        wVDF_TEXTURE_COMPRESSED_DXT,
        wVDF_TEXTURE_COMPRESSED_PVRTC,
        wVDF_TEXTURE_COMPRESSED_PVRTC2,
        wVDF_TEXTURE_COMPRESSED_ETC1,
        wVDF_TEXTURE_COMPRESSED_ETC2,
        wVDF_TEXTURE_CUBEMAP,
        wVDF_COUNT
    );

type wLoggingLevel = (
	wLL_DEBUG := 0,
	wLL_INFORMATION := 1,
        wLL_WARNING := 2,
        wLL_ERROR := 3,
        wLL_NONE := 4
    );

type wMaterialFlags = (
	wMF_WIREFRAME := 0,
	wMF_POINTCLOUD,
        wMF_GOURAUD_SHADING,
        wMF_LIGHTING,
        wMF_ZBUFFER,
        wMF_ZWRITE_ENABLE,
        wMF_BACK_FACE_CULLING,
        wMF_FRONT_FACE_CULLING,
        wMF_BILINEAR_FILTER,
        wMF_TRILINEAR_FILTER,
        wMF_ANISOTROPIC_FILTER,
        wMF_FOG_ENABLE,
        wMF_NORMALIZE_NORMALS,
        wMF_TEXTURE_WRAP,
        wMF_ANTI_ALIASING,
        wMF_COLOR_MASK,
        wMF_COLOR_MATERIAL
    );

type wMaterialTypes = (
	wMT_SOLID := 0,
	wMT_SOLID_2_LAYER,
	wMT_LIGHTMAP,
        wMT_LIGHTMAP_ADD,
        wMT_LIGHTMAP_M2,
        wMT_LIGHTMAP_M4,
        wMT_LIGHTMAP_LIGHTING,
        wMT_LIGHTMAP_LIGHTING_M2,
        wMT_LIGHTMAP_LIGHTING_M4,
        wMT_DETAIL_MAP,
        wMT_SPHERE_MAP,
        wMT_REFLECTION_2_LAYER,
        wMT_TRANSPARENT_ADD_COLOR,
        wMT_TRANSPARENT_ALPHA_CHANNEL,
        wMT_TRANSPARENT_ALPHA_CHANNEL_REF,
        wMT_TRANSPARENT_VERTEX_ALPHA,
        wMT_TRANSPARENT_REFLECTION_2_LAYER,
        wMT_NORMAL_MAP_SOLID,
        wMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR,
        wMT_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA,
        wMT_PARALLAX_MAP_SOLID,
        wMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR,
        wMT_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA,
        wMT_ONETEXTURE_BLEND,wMT_FOUR_DETAIL_MAP,
        wMT_TRANSPARENT_ADD_ALPHA_CHANNEL_REF,
        wMT_TRANSPARENT_ADD_ALPHA_CHANNEL,
        wMT_FORCE_32BIT := $7fffffff
    );

type wColorMaterial = (
	wCM_NONE := 0,
	wCM_DIFFUSE,
	wCM_AMBIENT,
        wCM_EMISSIVE,
        wCM_SPECULAR,
        wCM_DIFFUSE_AND_AMBIENT
    );

type wBlendFactor = (
	wBF_ZERO := 0,
	wBF_ONE,
	wBF_DST_COLOR,
    wBF_ONE_MINUS_DST_COLOR,
    wBF_SRC_COLOR,
    wBF_ONE_MINUS_SRC_COLOR,
    wBF_SRC_ALPHA,
    wBF_ONE_MINUS_SRC_ALPHA,
    wBF_DST_ALPHA,
    wBF_ONE_MINUS_DST_ALPHA,
    wBF_SRC_ALPHA_SATURATE
    );

type wBlendOperation = (
	wBO_SCREEN := 0,
	wBO_ADD,
	wBO_SUBTRACT,
    wBO_MULTIPLY,
    wBO_DIVIDE
    );

type wTextureCreationFlag = (
	wTCF_ALWAYS_16_BIT := $00000001,
	wTCF_ALWAYS_32_BIT := $00000002,
    wTCF_OPTIMIZED_FOR_QUALITY := $00000004,
    wTCF_OPTIMIZED_FOR_SPEED := $00000008,
    wTCF_CREATE_MIP_MAPS := $00000010,
    wTCF_NO_ALPHA_CHANNEL := $00000020,
    wTCF_ALLOW_NON_POWER_2 := $00000040
    );

type wTextureClamp = (
	wTC_REPEAT,
	wTC_CLAMP,
	wTC_CLAMP_TO_EDGE,
    wTC_CLAMP_TO_BORDER,
    wTC_MIRROR,
    wTC_MIRROR_CLAMP,
    wTC_MIRROR_CLAMP_TO_EDGE,
    wTC_MIRROR_CLAMP_TO_BORDER
    );

type wColorPlane = (
	wCP_NONE := 0,
	wCP_ALPHA := 1,
	wCP_RED := 2,
    wCP_GREEN := 4,
    wCP_BLUE := 8,
    wCP_RGB := 14,
    wCP_ALL := 15
    );

type wAntiAliasingMode = (
	wAAM_OFF := 0,
	wAAM_SIMPLE := 1,
	wAAM_QUALITY := 3,
    wAAM_LINE_SMOOTH := 4,
    wAAM_POINT_SMOOTH := 8,
    wAAM_FULL_BASIC := 15,
    wAAM_ALPHA_TO_COVERAGE := 16
    );

type wCullingState = (
	wCS_OFF := 0,
	wCS_BOX := 1,
	wCS_FRUSTUM_BOX := 2,
    wCS_FRUSTUM_SPHERE := 4
    );


type wSceneNodeType = (
	wSNT_CUBE := 1,
	wSNT_SPHERE := 2,
	wSNT_TEXT := 3,
    wSNT_WATER_SURFACE := 4,
    wSNT_TERRAIN := 5,
    wSNT_SKY_BOX := 6,
    wSNT_SKY_DOME := 7,
    wSNT_SHADOW_VOLUME := 8,
    wSNT_OCTREE := 9,
    wSNT_MESH := 10,
    wSNT_LIGHT := 11,
    wSNT_EMPTY := 12,
    wSNT_DUMMY_TRANSFORMATION := 13,
    wSNT_CAMERA := 14,
    wSNT_BILLBOARD := 15,
    wSNT_ANIMATED_MESH := 16,
    wSNT_PARTICLE_SYSTEM := 17,
    wSNT_VOLUME_LIGHT := 18,
    wSNT_CAMERA_MAYA := 19,
    wSNT_CAMERA_FPS := 20,
    wSNT_Q3SHADER_SCENE_NODE := 21,
    wSNT_UNKNOWN := 22,
    wSNT_ANY := 23
    );

type wXmlNodeType = (
	wXNT_NONE,
	wXNT_ELEMENT,
	wXNT_ELEMENT_END,
    wXNT_TEXT,
    wXNT_COMMENT,
    wXNT_CDATA,
    wXNT_UNKNOWN
    );

type wTextFormat = (
	wTF_ASCII,
	wTF_UTF8,
	wTF_UTF16_BE,
	wTF_UTF16_LE,
    wTF_UTF32_BE,
    wTF_UTF32_LE
    );

type wFilterType = (
	wFT_NONE,
	wFT_4PCF,
	wFT_8PCF,
	wFT_12PCF,
    wFT_16PCF,
    wFT_COUNT
    );

type wShadowMode = (
	wSM_RECEIVE,
	wSM_CAST,
	wSM_BOTH,
	wSM_EXCLUDE,
    wSM_COUNT
    );

type wColorFormat = (
	wCF_A1R5G5B5 := 0,
	wCF_R5G6B5,
	wCF_R8G8B8,
    wCF_A8R8G8B8
    );

type PwColorFormat=^wColorFormat;

type wMd2AnimationType = (
	wMAT_STAND,
	wMAT_RUN,
	wMAT_ATTACK,
	wMAT_PAIN_A,
    wMAT_PAIN_B,
    wMAT_PAIN_C,
    wMAT_JUMP,
    wMAT_FLIP,
    wMAT_SALUTE,
    wMAT_FALLBACK,
    wMAT_WAVE,
    wMAT_POINT,
    wMAT_CROUCH_STAND,
    wMAT_CROUCH_WALK,
    wMAT_CROUCH_ATTACK,
    wMAT_CROUCH_PAIN,
    wMAT_CROUCH_DEATH,
    wMAT_DEATH_FALLBACK,
    wMAT_DEATH_FALLFORWARD,
    wMAT_DEATH_FALLBACKSLOW,
    wMAT_BOOM
    );

type wJointMode = (
	wJM_NONE := 0,
	wJM_READ,
	wJM_CONTROL
    );

type wBoneSkinningSpace = (
	wBSS_LOCAL,
	wBSS_GLOBAL,
	wBSS_COUNT
	);

type wMeshFileFormat = (
	wMFF_WS_MESH := 0,
	wMFF_COLLADA,
	wMFF_STL
	);

type wAnimatedMeshType = (
	wAMT_UNKNOWN,
	wAMT_MD2,
	wAMT_MD3,
	wAMT_OBJ,
    wAMT_BSP,
    wAMT_3DS,
    wAMT_MY3D,
    wAMT_LMTS,
    wAMT_CSM,
    wAMT_OCT,
    wAMT_MDL_HALFLIFE,
    wAMT_SKINNED
    );

type wPhysSolverModel = (
	wPSM_EXACT := 0,
	wPSM_ADAPTIVE := 1,
    wPSM_LINEAR := 2,
    wPSM_LINEAR2 := 4
    );

type wPhysFrictionModel = (
	wPFM_ZERO := 0,
	wPFM_ONE := 1
	);

type wPhysVehicleType = (
	wPVT_RAYCAST_WORLD := 0,
	wPVT_RAYCAST_CONVEX := 1
    );
type wPhysVehicleTireType = (
	wPVTT_STEER := 0,
	wPVTT_ACCEL := 1,
    wPVTT_ACCEL_STEER := 2,
    wPVTT_ONLYWEEL := 3
    );

{///GUI///}
type wGuiAlignment = (
	wGA_UPPERLEFT := 0,
	wGA_LOWERRIGHT,
    wGA_CENTER,
    wGA_SCALE
    );

type wGuiElementType = (
	wGET_BUTTON,
	wGET_CHECK_BOX,
	wGET_COMBO_BOX,
    wGET_CONTEXT_MENU,
    wGET_MENU,
    wGET_EDIT_BOX,
    wGET_FILE_OPEN_DIALOG,
    wGET_COLOR_SELECT_DIALOG,
    wGET_IN_OUT_FADER,
    wGET_IMAGE,
    wGET_LIST_BOX,
    wGET_MESH_VIEWER,
    wGET_MESSAGE_BOX,
    wGET_MODAL_SCREEN,
    wGET_SCROLL_BAR,
    wGET_SPIN_BOX,
    wGET_STATIC_TEXT,
    wGET_TAB,
    wGET_TAB_CONTROL,
    wGET_TABLE,
    wGET_TOOL_BAR,
    wGET_TREE_VIEW,
    wGET_WINDOW,
    wGET_ELEMENT,
    wGET_ROOT,
    wGET_COUNT,
    wGET_FORCE_32_BIT
    );

type wGuiColumnOrdering = (
	wGCO_NONE := 0,
	wGCO_CUSTOM := 1,
	wGCO_ASCENDING := 2,
    wGCO_DESCENDING := 3,
    wGCO_FLIP_ASCENDING_DESCENDING := 4,
    wGCO_COUNT := 5
    );

type wGuiListboxColor = (
	wGLC_TEXT := 0,
	wGLC_TEXT_HIGHLIGHT,
    wGLC_ICON,
    wGLC_ICON_HIGHLIGHT,
    wGLC_COUNT
    );

type wGuiDefaultColor = (
	wGDC_3D_DARK_SHADOW := 0,
	wGDC_3D_SHADOW,
    wGDC_3D_FACE,
    wGDC_3D_HIGH_LIGHT,
    wGDC_3D_LIGHT,
    wGDC_ACTIVE_BORDER,
    wGDC_ACTIVE_CAPTION,
    wGDC_APP_WORKSPACE,
    wGDC_BUTTON_TEXT,
    wGDC_GRAY_TEXT,
    wGDC_HIGH_LIGHT,
    wGDC_HIGH_LIGHT_TEXT,
    wGDC_INACTIVE_BORDER,
    wGDC_INACTIVE_CAPTION,
    wGDC_TOOLTIP,
    wGDC_TOOLTIP_BACKGROUND,
    wGDC_SCROLLBAR,
    wGDC_WINDOW,
    wGDC_WINDOW_SYMBOL,
    wGDC_ICON,
    wGDC_ICON_HIGH_LIGHT,
    wGDC_COUNT
    );

type wContextMenuClose = (
	wCMC_IGNORE := 0,
	wCMC_REMOVE,
	wCMC_HIDE
    );

type wGuiOrderingMode = (
	wGOM_NONE := 0,
	wGOM_ASCENDING,
	wGOM_DESCENDING,
    wGOM_COUNT
    );

type wGuiTableDrawFlags = (
	wGTDF_ROWS := 1,
	wGTDF_COLUMNS := 2,
    wGTDF_ACTIVE_ROW := 4,
    wGTDF_COUNT
    );

type wGuiSkinSpace = (
	wGSS_WINDOWS_CLASSIC := 0,
	wGSS_WINDOWS_METALLIC,
    wGSS_BURNING_SKIN,
    wGSS_UNKNOWN,
    wGSS_COUNT
    );

type wGuiDefaultSize = (
	wGDS_SCROLLBAR_SIZE := 0,
	wGDS_MENU_HEIGHT,
        wGDS_WINDOW_BUTTON_WIDTH,
        wGDS_CHECK_BOX_WIDTH,
        wGDS_MESSAGE_BOX_WIDTH,
        wGDS_MESSAGE_BOX_HEIGHT,
        wGDS_BUTTON_WIDTH,
        wGDS_BUTTON_HEIGHT,
        wGDS_TEXT_DISTANCE_X,
        wGDS_TEXT_DISTANCE_Y,
        wGDS_TITLEBARTEXT_DISTANCE_X,
        wGDS_TITLEBARTEXT_DISTANCE_Y,
        wGDS_MESSAGE_BOX_GAP_SPACE,
        wGDS_MESSAGE_BOX_MIN_TEXT_WIDTH,
        wGDS_MESSAGE_BOX_MAX_TEXT_WIDTH,
        wGDS_MESSAGE_BOX_MIN_TEXT_HEIGHT,
        wGDS_MESSAGE_BOX_MAX_TEXT_HEIGHT,
        wGDS_BUTTON_PRESSED_IMAGE_OFFSET_X,
        wGDS_BUTTON_PRESSED_IMAGE_OFFSET_Y,
        wGDS_BUTTON_PRESSED_TEXT_OFFSET_X,
        wGDS_BUTTON_PRESSED_TEXT_OFFSET_Y,
        wGDS_BUTTON_PRESSED_SPRITE_OFFSET_X,
        wGDS_BUTTON_PRESSED_SPRITE_OFFSET_Y,
        wGDS_COUNT
    );

type wGuiDefaultText = (
	wGDT_MSG_BOX_OK := 0,
	wGDT_MSG_BOX_CANCEL := 1,
        wGDT_MSG_BOX_YES := 2,
        wGDT_MSG_BOX_NO := 3,
        wGDT_WINDOW_CLOSE := 4,
        wGDT_WINDOW_MAXIMIZE := 5,
        wGDT_WINDOW_MINIMIZE := 6,
        wGDT_WINDOW_RESTORE := 7,
        wGDT_COUNT := 8
    );

type wGuiDefaultFont = (
	wGDF_DEFAULT := 0,
	wGDF_BUTTON,
	wGDF_WINDOW,
        wGDF_MENU,
        wGDF_TOOLTIP,
        wGDF_COUNT
    );

type wGuiButtonState = (
	wGBS_BUTTON_UP := 0,
	wGBS_BUTTON_DOWN := 1,
        wGBS_BUTTON_MOUSE_OVER := 2,
        wGBS_BUTTON_MOUSE_OFF := 3,
        wGBS_BUTTON_FOCUSED := 4,
        wGBS_BUTTON_NOT_FOCUSED := 5,
        wGBS_COUNT
    );

type wGuiDefaultIcon = (
	wGDI_WINDOW_MAXIMIZE := 0,
	wGDI_WINDOW_RESTORE,
        wGDI_WINDOW_CLOSE,
        wGDI_WINDOW_MINIMIZE,
        wGDI_WINDOW_RESIZE,
        wGDI_CURSOR_UP,
        wGDI_CURSOR_DOWN,
        wGDI_CURSOR_LEFT,
        wGDI_CURSOR_RIGHT,
        wGDI_MENU_MORE,
        wGDI_CHECK_BOX_CHECKED,
        wGDI_DROP_DOWN,
        wGDI_SMALL_CURSOR_UP,
        wGDI_SMALL_CURSOR_DOWN,
        wGDI_RADIO_BUTTON_CHECKED,
        wGDI_MORE_LEFT,
        wGDI_MORE_RIGHT,
        wGDI_MORE_UP,
        wGDI_MORE_DOWN,
        wGDI_EXPAND,
        wGDI_COLLAPSE,
        wGDI_FILE,
        wGDI_DIRECTORY,
        wGDI_COUNT
    );

type wLightType = (
	wLT_POINT := 0,
	wLT_SPOT,
	wLT_DIRECTIONAL
    );

type wDebugMode = (
      wDM_OFF := 0,
      wDM_BBOX := 1,
      wDM_NORMALS := 2,
      wDM_SKELETON := 4,
      wDM_MESH_WIRE_OVERLAY := 8,
      wDM_HALF_TRANSPARENCY := 16,
      wDM_BBOX_BUFFERS := 32,
      wDM_FULL := $ffffffff
    );

type wTerrainPatchSize = (
      wTPS_9 := 9,
      wTPS_17 := 17,
      wTPS_33 := 33,
      wTPS_65 := 65,
      wTPS_129 := 129
    );

type wTiledTerrainEdge = (
      wTTE_TOP := 0,
      wTTE_BOTTOM,
      wTTE_LEFT,
      wTTE_RIGHT
    );

const Float32_DEFAULTVALUE = 7285624.0;

type wPostEffectQuality = (
	wPEQ_CRUDE := 0,
	wPEQ_FAST := 1,
	wPEQ_DEFAULT := 2,
    wPEQ_GOOD := 3,
    wPEQ_BEST := 4
    );

type wPostEffectId = (
	wPEI_CUSTOM := 0,
	wPEI_DIRECT := 1,
    wPEI_PUNCH := 2,
    wPEI_PIXELATE := 3,
    wPEI_PIXELATEBANDS := 4,
    wPEI_DARKEN := 5,
    wPEI_LIGHTEN := 6,
    wPEI_RANGE := 7,
    wPEI_POSTERIZE := 8,
    wPEI_INVERT := 9,
    wPEI_TINT := 10,
    wPEI_CURVES := 11,
    wPEI_GREYSCALE := 12,
    wPEI_SEPIA := 13,
    wPEI_SATURATE := 14,
    wPEI_VIGNETTE := 15,
    wPEI_NOISE := 16,
    wPEI_COLORNOISE := 17,
    wPEI_PURENOISE := 18,
    wPEI_HBLUR := 19,
    wPEI_VBLUR := 20,
    wPEI_HSHARPEN := 21,
    wPEI_VSHARPEN := 22,
    wPEI_BIBLUR := 23,
    wPEI_HBLURDOFFAR := 24,
    wPEI_VBLURDOFFAR := 25,
    wPEI_HBLURDOFNEAR := 26,
    wPEI_VBLURDOFNEAR := 27,
    wPEI_LINEARBLUR := 28,
    wPEI_RADIALBLUR := 29,
    wPEI_RADIALBEAM := 30,
    wPEI_ROTATIONALBLUR := 31,
    wPEI_OVERLAY := 32,
    wPEI_OVERLAYNEG := 33,
    wPEI_MOTIONBLUR := 34,
    wPEI_HAZE := 35,
    wPEI_HAZEDEPTH := 36,
    wPEI_DEPTH := 37,
    wPEI_OCCLUSION := 38,
    wPEI_BLUR := 39,
    wPEI_SHARPEN := 40,
    wPEI_BLURDOFFAR := 41,
    wPEI_BLURDOFNEAR := 42,
    wPEI_BLURDOF := 43,
    wPEI_BLOOM := 44,
    wPEI_GLOOM := 45,
    wPEI_NIGHTVISION := 46,
    wPEI_MONITOR := 47,
    wPEI_WATERCOLOR := 48,
    wPEI_COUNT := 49
    );

type tag_wBillboard = record
	Position : wVector3f;
	Size : wVector2f;
	Roll : Float32;
	Axis : wVector3f;
	HasAxis : Int32;
	sColor : Int32;{///not for use///}
	alpha : UInt32;
	red : UInt32;
	green : UInt32;
	blue : UInt32;
	vertexIndex : UInt32;
	sprev : ^tag_wBillboard;
	snext : ^tag_wBillboard;
end;

type wBillboard = tag_wBillboard;

type PwBillboard=^wBillboard;

type wConsoleFontColor = (
	wCFC_BLACK,
	wCFC_BLUE,
	wCFC_GREEN,
	wCFC_CYAN,
	wCFC_RED,
	wCFC_MAGENTA,
	wCFC_BROWN,
	wCFC_GREY,
	wCFC_DARKGREY,
	wCFC_LIGHTBLUE,
	wCFC_LIGHTGREEN,
    wCFC_LIGHTCYAN,
    wCFC_LIGHTRED,
    wCFC_LIGHTMAGENTA,
    wCFC_YELLOW,
    wCFC_WHITE,
    wCFC_COUNT
    );

type wConsoleBackColor = (
	wCBC_BLACK,
	wCBC_BLUE,
	wCBC_GREEN,
	wCBC_CYAN,
    wCBC_RED,
    wCBC_MAGENTA,
    wCBC_YELLOW,
    wCBC_WHITE,
    wCBC_COUNT
    );

type wWeekDay = (
	wWD_SUNDAY,
	wWD_MONDAY,
	wWD_TUESDAY,
	wWD_WEDNESDAY,
    wWD_THURSDAY,
    wWD_FRIDAY,
    wWD_SATURDAY
    );

type wRealTimeDate = record
	Day : UInt32;
	Hour : UInt32;
	IsDST : Boolean;
	Minute : UInt32;
	Month : UInt32;
	Second : UInt32;
	Weekday : wWeekDay;
	Year : Int32;
	Yearday : UInt32;
end;

type wBillboardAxisParam = record
        isEnablePitch : Boolean;
        isEnableYaw : Boolean;
        isEnableRoll : Boolean;
        _reserve : Byte;
end;

type wFileArchiveType = (
	wFAT_ZIP,
	wFAT_GZIP,
	wFAT_FOLDER,
	wFAT_PAK,
    wFAT_NPK,
    wFAT_TAR,
    wFAT_WAD,
    wFAT_UNKNOWN
    );

type wEngineCreationParameters = record
	DeviceType : wDeviceTypes;
	DriverType : wDriverTypes;
	WindowSize : wVector2u;
	WindowPosition : wVector2i;
	Bits : UInt8;
	ZBufferBits : UInt8;
	Fullscreen : Boolean;
	Stencilbuffer : Boolean;
	Vsync : Boolean;
	AntiAlias : wAntiAliasingMode;
	HandleSRGB : Boolean;
	WithAlphaChannel : Boolean;
	Doublebuffer : Boolean;
	IgnoreInput : Boolean;
	Stereobuffer : Boolean;
	HighPrecisionFPU : Boolean;
	WindowId : Pointer;
	LoggingLevel : wLoggingLevel;
	DisplayAdapter : UInt32;
	DriverMultithreaded : Boolean;
	UsePerformanceTimer : Boolean;
	PrivateData : Pointer;
	OGLES2ShaderPath : PChar;
end;

type PwEngineCreationParameters=^wEngineCreationParameters;

type wLanguage = (
	wL_RU := 0,
	wL_EN := 1
	);

{/// OPEN AL  ENUMS ////// }
type wSoundEffectType = (
	wSET_NULL := 0,
	wSET_EAX_REVERB,
	wSET_REVERB,
    wSET_CHORUS,
    wSET_DISTORTION,
    wSET_ECHO,
    wSET_FLANGER,
    wSET_FREQUENCY_SHIFTER,
    wSET_VOCAL_MORPHER,
    wSET_PITCH_SHIFTER,
    wSET_RING_MODULATOR,
    wSET_AUTOWAH,
    wSET_COMPRESSOR,
    wSET_EQUALIZER,
    wSET_COUNT
    );

type wSoundFilterType = (
	wSFT_NULL := 0,
	wSFT_LOWPASS,
	wSFT_HIGHPASS,
    wSFT_BANDPASS,
    wSFT_COUNT
    );

type wAudioFormats = (
	wAF_8BIT_MONO,
	wAF_8BIT_STEREO,
	wAF_16BIT_MONO,
    wAF_16BIT_STEREO
    );

   {! Contains parameters for the EAX Reverb Effect.  This effect tries to simulate how sound behaves in different environments. }
    { __cplusplus }
    {! Reverb Modal Density controls the coloration of the late reverb. Lowering the value adds }
    {! more coloration to the late reverb. }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Diffusion property controls the echo density in the reverberation decay. It's set by }
    {! default to 1.0, which provides the highest density. Reducing diffusion gives the reverberation a }
    {! more "grainy" character that is especially noticeable with percussive sound sources. If you set a }
    {! diffusion value of 0.0, the later reverberation sounds like a succession of distinct echoes. }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Gain property is the master volume control for the reflected sound (both early }
    {! reflections and reverberation) that the reverb effect adds to all sound sources. It sets the }
    {! maximum amount of reflections and reverberation added to the final sound mix. The value of the }
    {! Reverb Gain property ranges from 1.0 (0db) (the maximum amount) to 0.0 (-100db) (no reflected }
    {! sound at all). }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Gain HF property further tweaks reflected sound by attenuating it at high frequencies. }
    {! It controls a low-pass filter that applies globally to the reflected sound of all sound sources }
    {! feeding the particular instance of the reverb effect. The value of the Reverb Gain HF property }
    {! ranges from 1.0 (0db) (no filter) to 0.0 (-100db) (virtually no reflected sound). HF Reference sets }
    {! the frequency at which the value of this property is measured. }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Gain LF property further tweaks reflected sound by attenuating it at low frequencies. }
    {! It controls a high-pass filter that applies globally to the reflected sound of all sound sources }
    {! feeding the particular instance of the reverb effect. The value of the Reverb Gain LF property }
    {! ranges from 1.0 (0db) (no filter) to 0.0 (-100db) (virtually no reflected sound). LF Reference sets }
    {! the frequency at which the value of this property is measured. }
    {! Range: 0.0 to 1.0 }
    {! The Decay Time property sets the reverberation decay time. It ranges from 0.1 (typically a small }
    {! room with very dead surfaces) to 20.0 (typically a large room with very live surfaces). }
    {! Range: 0.1 to 20.0 }
    {! The Decay HF Ratio property adjusts the spectral quality of the Decay Time parameter. It is the }
    {! ratio of high-frequency decay time relative to the time set by Decay Time. The Decay HF Ratio }
    {! value 1.0 is neutral: the decay time is equal for all frequencies. As Decay HF Ratio increases }
    {! above 1.0, the high-frequency decay time increases so it's longer than the decay time at mid }
    {! frequencies. You hear a more brilliant reverberation with a longer decay at high frequencies. As }
    {! the Decay HF Ratio value decreases below 1.0, the high-frequency decay time decreases so it's }
    {! shorter than the decay time of the mid frequencies. You hear a more natural reverberation. }
    {! Range: 0.1 to 20.0 }
    {! The Decay LF Ratio property adjusts the spectral quality of the Decay Time parameter. It is the }
    {! ratio of low-frequency decay time relative to the time set by Decay Time. The Decay LF Ratio }
    {! value 1.0 is neutral: the decay time is equal for all frequencies. As Decay LF Ratio increases }
    {! above 1.0, the low-frequency decay time increases so it's longer than the decay time at mid }
    {! frequencies. You hear a more booming reverberation with a longer decay at low frequencies. As }
    {! the Decay LF Ratio value decreases below 1.0, the low-frequency decay time decreases so it's }
    {! shorter than the decay time of the mid frequencies. You hear a more tinny reverberation. }
    {! Range: 0.1 to 20.0 }
    {! The Reflections Gain property controls the overall amount of initial reflections relative to the Gain }
    {! property. (The Gain property sets the overall amount of reflected sound: both initial reflections }
    {! and later reverberation.) The value of Reflections Gain ranges from a maximum of 3.16 (+10 dB) }
    {! to a minimum of 0.0 (-100 dB) (no initial reflections at all), and is corrected by the value of the }
    {! Gain property. The Reflections Gain property does not affect the subsequent reverberation decay. }
    {! Range: 0.0 to 3.16 }
    {! The Reflections Delay property is the amount of delay between the arrival time of the direct path }
    {! from the source to the first reflection from the source. It ranges from 0 to 300 milliseconds. You }
    {! can reduce or increase Reflections Delay to simulate closer or more distant reflective surfaces— }
    {! and therefore control the perceived size of the room. }
    {! Range: 0.0 to 0.3 }
    {! The Reflections Pan property is a 3D vector that controls the spatial distribution of the cluster of }
    {! early reflections. The direction of this vector controls the global direction of the reflections, while }
    {! its magnitude controls how focused the reflections are towards this direction. }
    {! It is important to note that the direction of the vector is interpreted in the coordinate system of the }
    {! user, without taking into account the orientation of the virtual listener. For instance, assuming a }
    {! four-point loudspeaker playback system, setting Reflections Pan to (0, 0, 0.7) means that the }
    {! reflections are panned to the front speaker pair, whereas as setting of (0, 0, -0.7) pans the }
    {! reflections towards the rear speakers. These vectors follow the a left-handed co-ordinate system, }
    {! unlike OpenAL uses a right-handed co-ordinate system. }
    {! If the magnitude of Reflections Pan is zero (the default setting), the early reflections come evenly }
    {! from all directions. As the magnitude increases, the reflections become more focused in the }
    {! direction pointed to by the vector. A magnitude of 1.0 would represent the extreme case, where }
    {! all reflections come from a single direction. }
    {cVector3 ReflectionsPan; }
    {! The Late Reverb Gain property controls the overall amount of later reverberation relative to the }
    {! Gain property. (The Gain property sets the overall amount of both initial reflections and later }
    {! reverberation.) The value of Late Reverb Gain ranges from a maximum of 10.0 (+20 dB) to a }
    {! minimum of 0.0 (-100 dB) (no late reverberation at all). }
    {! Range: 0.0 to 10.0 }
    {! The Late Reverb Delay property defines the begin time of the late reverberation relative to the }
    {! time of the initial reflection (the first of the early reflections). It ranges from 0 to 100 milliseconds. }
    {! Reducing or increasing Late Reverb Delay is useful for simulating a smaller or larger room. }
    {! Range: 0.0 to 0.1 }
    {! The Late Reverb Pan property is a 3D vector that controls the spatial distribution of the late }
    {! reverb. The direction of this vector controls the global direction of the reverb, while its magnitude }
    {! controls how focused the reverb are towards this direction. The details under Reflections Pan, }
    {! above, also apply to Late Reverb Pan. }
    {cVector3 LateReverbPan; }
    {! Echo Time controls the rate at which the cyclic echo repeats itself along the }
    {! reverberation decay. For example, the default setting for Echo Time is 250 ms. causing the echo }
    {! to occur 4 times per second. Therefore, if you were to clap your hands in this type of }
    {! environment, you will hear four repetitions of clap per second. }
    {! Range: 0.075 to 0.25 }
    {! Echo Depth introduces a cyclic echo in the reverberation decay, which will be noticeable with }
    {! transient or percussive sounds. A larger value of Echo Depth will make this effect more }
    {! prominent. }
    {! Together with Reverb Diffusion, Echo Depth will control how long the echo effect will persist along }
    {! the reverberation decay. In a more diffuse environment, echoes will wash out more quickly after }
    {! the direct sound. In an environment that is less diffuse, you will be able to hear a larger number }
    {! of repetitions of the echo, which will wash out later in the reverberation decay. If Diffusion is set }
    {! to 0.0 and Echo Depth is set to 1.0, the echo will persist distinctly until the end of the }
    {! reverberation decay. }
    {! Range: 0.0 to 1.0 }
    {! Using these two properties below, you can create a pitch modulation in the reverberant sound. This will }
    {! be most noticeable applied to sources that have tonal color or pitch. You can use this to make }
    {! some trippy effects! Modulation Time controls the speed of the vibrato (rate of periodic changes in pitch). }
    {! Range: 0.004 to 4.0 }
    {! Modulation Depth controls the amount of pitch change. Low values of Diffusion will contribute to }
    {! reinforcing the perceived effect by reducing the mixing of overlapping reflections in the }
    {! reverberation decay. }
    {! Range: 0.0 to 1.0 }
    {! The Air Absorption Gain HF property controls the distance-dependent attenuation at high }
    {! frequencies caused by the propagation medium. It applies to reflected sound only. You can use }
    {! Air Absorption Gain HF to simulate sound transmission through foggy air, dry air, smoky }
    {! atmosphere, and so on. The default value is 0.994 (-0.05 dB) per meter, which roughly }
    {! corresponds to typical condition of atmospheric humidity, temperature, and so on. Lowering the }
    {! value simulates a more absorbent medium (more humidity in the air, for example); raising the }
    {! value simulates a less absorbent medium (dry desert air, for example). }
    {! Range: 0.892 to 1.0 }
    {! The properties HF Reference and LF Reference determine respectively the frequencies at which }
    {! the high-frequency effects and the low-frequency effects created by EAX Reverb properties are }
    {! measured, for example Decay HF Ratio and Decay LF Ratio. }
    {! Note that it is necessary to maintain a factor of at least 10 between these two reference }
    {! frequencies so that low frequency and high frequency properties can be accurately controlled and }
    {! will produce independent effects. In other words, the LF Reference value should be less than }
    {! 1/10 of the HF Reference value. }
    {! Range: 1000.0 to 20000.0 }
    {! See HFReference. }
    {! Range: 20.0 to 1000.0 }
    {! The Room Rolloff Factor property is one of two methods available to attenuate the reflected }
    {! sound (containing both reflections and reverberation) according to source-listener distance. It's }
    {! defined the same way as OpenAL's Rolloff Factor, but operates on reverb sound instead of }
    {! direct-path sound. Setting the Room Rolloff Factor value to 1.0 specifies that the reflected sound }
    {! will decay by 6 dB every time the distance doubles. Any value other than 1.0 is equivalent to a }
    {! scaling factor applied to the quantity specified by ((Source listener distance) - (Reference }
    {! Distance)). Reference Distance is an OpenAL source parameter that specifies the inner border }
    {! for distance rolloff effects: if the source comes closer to the listener than the reference distance, }
    {! the direct-path sound isn't increased as the source comes closer to the listener, and neither is the }
    {! reflected sound. }
    {! The default value of Room Rolloff Factor is 0.0 because, by default, the Effects Extension reverb }
    {! effect naturally manages the reflected sound level automatically for each sound source to }
    {! simulate the natural rolloff of reflected sound vs. distance in typical rooms. }
    {! Range: 0.0 to 10.0 }
    {! When this flag is set, the high-frequency decay time automatically stays below a limit value that's }
    {! derived from the setting of the property Air Absorption Gain HF. This limit applies regardless of }
    {! the setting of the property Decay HF Ratio, and the limit doesn't affect the value of Decay HF }
    {! Ratio. This limit, when on, maintains a natural sounding reverberation decay by allowing you to }
    {! increase the value of Decay Time without the risk of getting an unnaturally long decay time at }
    {! high frequencies. If this flag is set to false, high-frequency decay time isn't automatically }
    {! limited. }

type tag_wEaxReverbParameters = record
	Density : Float32;
	Diffusion : Float32;
	Gain : Float32;
	GainHF : Float32;
	GainLF : Float32;
	DecayTime : Float32;
	DecayHFRatio : Float32;
	DecayLFRatio : Float32;
	ReflectionsGain : Float32;
	ReflectionsDelay : Float32;
	ReflectionsPanX : Float32;
	ReflectionsPanY : Float32;
	ReflectionsPanZ : Float32;
	LateReverbGain : Float32;
	LateReverbDelay : Float32;
	LateReverbPanX : Float32;
	LateReverbPanY : Float32;
	LateReverbPanZ : Float32;
	EchoTime : Float32;
	EchoDepth : Float32;
	ModulationTime : Float32;
	ModulationDepth : Float32;
	AirAbsorptionGainHF : Float32;
	HFReference : Float32;
	LFReference : Float32;
	RoomRolloffFactor : Float32;
	DecayHFLimit : Boolean;
end;

type wEaxReverbParameters = tag_wEaxReverbParameters;

    {! Similar to the above EAX Reverb Effect, but has less features, meaning it may be better supported on lower end hardware. }
    { __cplusplus }
    {! Reverb Modal Density controls the coloration of the late reverb. Lowering the value adds more }
    {! coloration to the late reverb. }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Diffusion property controls the echo density in the reverberation decay. It's set by }
    {! default to 1.0, which provides the highest density. Reducing diffusion gives the reverberation a }
    {! more "grainy" character that is especially noticeable with percussive sound sources. If you set a }
    {! diffusion value of 0.0, the later reverberation sounds like a succession of distinct echoes. }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Gain property is the master volume control for the reflected sound (both early }
    {! reflections and reverberation) that the reverb effect adds to all sound sources. It sets the }
    {! maximum amount of reflections and reverberation added to the final sound mix. The value of the }
    {! Reverb Gain property ranges from 1.0 (0db) (the maximum amount) to 0.0 (-100db) (no reflected }
    {! sound at all). }
    {! Range: 0.0 to 1.0 }
    {! The Reverb Gain HF property further tweaks reflected sound by attenuating it at high frequencies. }
    {! It controls a low-pass filter that applies globally to the reflected sound of all sound sources }
    {! feeding the particular instance of the reverb effect. The value of the Reverb Gain HF property }
    {! ranges from 1.0 (0db) (no filter) to 0.0 (-100db) (virtually no reflected sound). }
    {! Range: 0.0 to 1.0 }
    {! The Decay Time property sets the reverberation decay time. It ranges from 0.1 (typically a small }
    {! room with very dead surfaces) to 20.0 (typically a large room with very live surfaces). }
    {! Range: 0.1 to 20.0 }
    {! The Decay HF Ratio property sets the spectral quality of the Decay Time parameter. It is the }
    {! ratio of high-frequency decay time relative to the time set by Decay Time. The Decay HF Ratio }
    {! value 1.0 is neutral: the decay time is equal for all frequencies. As Decay HF Ratio increases }
    {! above 1.0, the high-frequency decay time increases so it's longer than the decay time at low }
    {! frequencies. You hear a more brilliant reverberation with a longer decay at high frequencies. As }
    {! the Decay HF Ratio value decreases below 1.0, the high-frequency decay time decreases so it's }
    {! shorter than the decay time of the low frequencies. You hear a more natural reverberation. }
    {! Range: 0.1 to 2.0 }
    {! The Reflections Gain property controls the overall amount of initial reflections relative to the Gain }
    {! property. (The Gain property sets the overall amount of reflected sound: both initial reflections }
    {! and later reverberation.) The value of Reflections Gain ranges from a maximum of 3.16 (+10 dB) }
    {! to a minimum of 0.0 (-100 dB) (no initial reflections at all), and is corrected by the value of the }
    {! Gain property. The Reflections Gain property does not affect the subsequent reverberation }
    {! decay. }
    {! Range: 0.0 to 3.16 }
    {! The Reflections Delay property is the amount of delay between the arrival time of the direct path }
    {! from the source to the first reflection from the source. It ranges from 0 to 300 milliseconds. You }
    {! can reduce or increase Reflections Delay to simulate closer or more distant reflective surfaces— }
    {! and therefore control the perceived size of the room. }
    {! Range: 0.0 to 0.3 }
    {! The Late Reverb Gain property controls the overall amount of later reverberation relative to the }
    {! Gain property. (The Gain property sets the overall amount of both initial reflections and later }
    {! reverberation.) The value of Late Reverb Gain ranges from a maximum of 10.0 (+20 dB) to a }
    {! minimum of 0.0 (-100 dB) (no late reverberation at all). }
    {! Range: 0.0 to 10.0 }
    {! The Late Reverb Delay property defines the begin time of the late reverberation relative to the }
    {! time of the initial reflection (the first of the early reflections). It ranges from 0 to 100 milliseconds. }
    {! Reducing or increasing Late Reverb Delay is useful for simulating a smaller or larger room. }
    {! Range: 0.0 to 0.1 }
    {! The Air Absorption Gain HF property controls the distance-dependent attenuation at high }
    {! frequencies caused by the propagation medium. It applies to reflected sound only. You can use }
    {! Air Absorption Gain HF to simulate sound transmission through foggy air, dry air, smoky }
    {! atmosphere, and so on. The default value is 0.994 (-0.05 dB) per meter, which roughly }
    {! corresponds to typical condition of atmospheric humidity, temperature, and so on. Lowering the }
    {! value simulates a more absorbent medium (more humidity in the air, for example); raising the }
    {! value simulates a less absorbent medium (dry desert air, for example). }
    {! Range: 0.892 to 1.0 }
    {! The Room Rolloff Factor property is one of two methods available to attenuate the reflected }
    {! sound (containing both reflections and reverberation) according to source-listener distance. It's }
    {! defined the same way as OpenAL's Rolloff Factor, but operates on reverb sound instead of }
    {! direct-path sound. Setting the Room Rolloff Factor value to 1.0 specifies that the reflected sound }
    {! will decay by 6 dB every time the distance doubles. Any value other than 1.0 is equivalent to a }
    {! scaling factor applied to the quantity specified by ((Source listener distance) - (Reference }
    {! Distance)). Reference Distance is an OpenAL source parameter that specifies the inner border }
    {! for distance rolloff effects: if the source comes closer to the listener than the reference distance, }
    {! the direct-path sound isn't increased as the source comes closer to the listener, and neither is the }
    {! reflected sound. }
    {! The default value of Room Rolloff Factor is 0.0 because, by default, the Effects Extension reverb }
    {! effect naturally manages the reflected sound level automatically for each sound source to }
    {! simulate the natural rolloff of reflected sound vs. distance in typical rooms. }
    {! Range: 0.0 to 10.0 }
    {! When this flag is set, the high-frequency decay time automatically stays below a limit value that's }
    {! derived from the setting of the property Air Absorption Gain HF. This limit applies regardless of }
    {! the setting of the property Decay HF Ratio, and the limit doesn't affect the value of Decay HF }
    {! Ratio. This limit, when on, maintains a natural sounding reverberation decay by allowing you to }
    {! increase the value of Decay Time without the risk of getting an unnaturally long decay time at }
    {! high frequencies. If this flag is set to false, high-frequency decay time isn't automatically }
    {! limited. }

type tag_wReverbParameters = record
	Density : Float32;
	Diffusion : Float32;
	Gain : Float32;
	GainHF : Float32;
	DecayTime : Float32;
	DecayHFRatio : Float32;
	ReflectionsGain : Float32;
	ReflectionsDelay : Float32;
	LateReverbGain : Float32;
	LateReverbDelay : Float32;
	AirAbsorptionGainHF : Float32;
	RoomRolloffFactor : Float32;
	DecayHFLimit : Boolean;
end;

type wReverbParameters = tag_wReverbParameters;

    {! The chorus effect essentially replays the input audio accompanied by another slightly delayed version of the signal, creating a "doubling" effect. }

    { __cplusplus }
    {! This property sets the waveform shape of the LFO that controls the delay time of the delayed signals. }
    {! This property controls the phase difference between the left and right LFO's. At zero degrees the }
    {! two LFOs are synchronized. Use this parameter to create the illusion of an expanded stereo field }
    {! of the output signal. }
    {! Range: -180 to 180 }
    {! This property sets the modulation rate of the LFO that controls the delay time of the delayed signals. }
    {! Range: 0.0 to 10.0 }
    {! This property controls the amount by which the delay time is modulated by the LFO. }
    {! Range: 0.0 to 1.0 }
    {! This property controls the amount of processed signal that is fed back to the input of the chorus }
    {! effect. Negative values will reverse the phase of the feedback signal. At full magnitude the }
    {! identical sample will repeat endlessly. At lower magnitudes the sample will repeat and fade out }
    {! over time. Use this parameter to create a "cascading" chorus effect. }
    {! Range: -1.0 to 1.0 }
    {! This property controls the average amount of time the sample is delayed before it is played back, }
    {! and with feedback, the amount of time between iterations of the sample. Larger values lower the }
    {! pitch. Smaller values make the chorus sound like a flanger, but with different frequency }
    {! characteristics. }
    {! Range: 0.0 to 0.016 }

type ChorusWaveform = (
	wCWF_SINUSOID,
	wCWF_TRIANGLE,
	wCWF_COUNT
    );

type tag_wChorusParameters = record
	Waveform : ChorusWaveform;
	Phase : Int32;
	Rate : Float32;
	Depth : Float32;
	Feedback : Float32;
	Delay : Float32;
end;

type wChorusParameters = tag_wChorusParameters;

    {! The distortion effect simulates turning up (overdriving) the gain stage on a guitar amplifier or adding a distortion pedal to an instrument's output. }
    { __cplusplus }
    {! This property controls the shape of the distortion. The higher the value for Edge, the "dirtier" and "fuzzier" the effect. }
    {! Range: 0.0 to 1.0 }
    {! This property allows you to attenuate the distorted sound. }
    {! Range: 0.01 to 1.0 }
    {! Input signal can have a low pass filter applied, to limit the amount of high frequency signal feeding into the distortion effect. }
    {! Range: 80.0 to 24000.0 }
    {! This property controls the frequency at which the post-distortion attenuation (Gain) is active. }
    {! Range: 80.0 to 24000.0 }
    {! This property controls the bandwidth of the post-distortion attenuation. }
    {! Range: 80.0 to 24000.0 }

type tag_wDistortionParameters = record
	Edge : Float32;
	Gain : Float32;
	LowpassCutoff : Float32;
	EqCenter : Float32;
	EqBandwidth : Float32;
end;

type wDistortionParameters = tag_wDistortionParameters;

    {! The echo effect generates discrete, delayed instances of the input signal. }
    { __cplusplus }
    {! This property controls the delay between the original sound and the first "tap", or echo instance. }
    {! Range: 0.0 to 0.207 }
    {! This property controls the delay between the first "tap" and the second "tap". }
    {! Range: 0.0 to 0.404 }
    {! This property controls the amount of high frequency damping applied to each echo. As the sound }
    {! is subsequently fed back for further echoes, damping results in an echo which progressively gets }
    {! softer in tone as well as intensity. }
    {! Range: 0.0 to 0.99 }
    {! This property controls the amount of feedback the output signal fed back into the input. Use this }
    {! parameter to create "cascading" echoes. At full magnitude, the identical sample will repeat }
    {! endlessly. Below full magnitude, the sample will repeat and fade. }
    {! Range: 0.0 to 1.0 }
    {! This property controls how hard panned the individual echoes are. With a value of 1.0, the first }
    {! "tap" will be panned hard left, and the second "tap" hard right. A value of -1.0 gives the opposite }
    {! result. Settings nearer to 0.0 result in less emphasized panning. }
    {! Range: -1.0 to 1.0 }

type tag_wEchoParameters = record
	Delay : Float32;
	LRDelay : Float32;
	Damping : Float32;
	Feedback : Float32;
	Spread : Float32;
end;

type wEchoParameters = tag_wEchoParameters;

    {! The flanger effect creates a "tearing" or "whooshing" sound (like a jet flying overhead). }

type FlangerWaveform = (
	wFWF_SINUSOID,
	wFWF_TRIANGLE,
	wFWF_COUNT
    );

    { __cplusplus }
    {! Selects the shape of the LFO waveform that controls the amount of the delay of the sampled signal. }
    {! This changes the phase difference between the left and right LFO's. At zero degrees the two LFOs are synchronized. }
    {! Range: -180 to 180 }
    {! The number of times per second the LFO controlling the amount of delay repeats. Higher values increase the pitch modulation. }
    {! Range: 0.0 to 10.0 }
    {! The ratio by which the delay time is modulated by the LFO. Use this parameter to increase the pitch modulation. }
    {! Range: 0.0 to 1.0 }
    {! This is the amount of the output signal level fed back into the effect's input. }
    {! A negative value will reverse the phase of the feedback signal. Use this parameter }
    {! to create an "intense metallic" effect. At full magnitude, the identical sample will }
    {! repeat endlessly. At less than full magnitude, the sample will repeat and fade out over time. }
    {! Range: -1.0 to 1.0 }
    {! The average amount of time the sample is delayed before it is played back; with feedback, the amount of time between iterations of the sample. }
    {! Range: 0.0 to 0.004 }

type tag_wFlangerParameters = record
	Waveform : FlangerWaveform;
	Phase : Int32;
	Rate : Float32;
	Depth : Float32;
	Feedback : Float32;
	Delay : Float32;
end;

type wFlangerParameters = tag_wFlangerParameters;

    {! The frequency shifter is a single-sideband modulator, which translates all the component frequencies of the input signal by an equal amount. }

type ShiftDirection = (
	wSD_DOWN,
	wSD_UP,
	wSD_OFF,
	wSD_COUNT
	);

    {! This is the carrier frequency. For carrier frequencies below the audible range, the singlesideband }
    {! modulator may produce phaser effects, spatial effects or a slight pitch-shift. As the }
    {! carrier frequency increases, the timbre of the sound is affected; a piano or guitar note becomes }
    {! like a bell's chime, and a human voice sounds extraterrestrial! }
    {! Range: 0.0 to 24000.0 }
    {! These select which internal signals are added together to produce the output. Different }
    {! combinations of values will produce slightly different tonal and spatial effects. }
    {! These select which internal signals are added together to produce the output. Different }
    {! combinations of values will produce slightly different tonal and spatial effects. }

type tag_wFrequencyShiftParameters = record
	Frequency : Float32;
	Left : ShiftDirection;
	Right : ShiftDirection;
end;

type wFrequencyShiftParameters = tag_wFrequencyShiftParameters;

    {! The vocal morpher consists of a pair of 4-band formant filters, used to impose vocal tract effects upon the input signal. }

type MorpherPhoneme = (
	wMP_A,
	wMP_E,
	wMP_I,
	wMP_O,
	wMP_U,
	wMP_AA,
	wMP_AE,
    wMP_AH,
    wMP_AO,
    wMP_EH,
    wMP_ER,
    wMP_IH,
    wMP_IY,
    wMP_UH,
    wMP_UW,
    wMP_B,
    wMP_D,
    wMP_F,
    wMP_G,
    wMP_J,
    wMP_K,
    wMP_L,
    wMP_M,
    wMP_N,
    wMP_P,
    wMP_R,
    wMP_S,
    wMP_T,
    wMP_V,
    wMP_Z,
    wMP_COUNT
    );

type MorpherWaveform = (
	wMWF_SINUSOID,
	wMWF_TRIANGLE,
	wMWF_SAW,
    wMWF_COUNT
    );

    {! If both parameters are set to the same phoneme, that determines the filtering effect that will be }
    {! heard. If these two parameters are set to different phonemes, the filtering effect will morph }
    {! between the two settings at a rate specified by Rate. }
    {! If both parameters are set to the same phoneme, that determines the filtering effect that will be }
    {! heard. If these two parameters are set to different phonemes, the filtering effect will morph }
    {! between the two settings at a rate specified by Rate. }
    {! This is used to adjust the pitch of phoneme filter A in 1-semitone increments. }
    {! Range: -24 to 24 }
    {! This is used to adjust the pitch of phoneme filter B in 1-semitone increments. }
    {! Range: -24 to 24 }
    {! This controls the shape of the low-frequency oscillator used to morph between the two phoneme filters. }
    {! This controls the frequency of the low-frequency oscillator used to morph between the two phoneme filters. }
    {! Range: 0.0 to 10.0 }

type tag_wVocalMorpherParameters = record
	PhonemeA : MorpherPhoneme;
	PhonemeB : MorpherPhoneme;
	PhonemeACoarseTune : Int32;
	PhonemeBCoarseTune : Int32;
	Waveform : MorpherWaveform;
	Rate : Float32;
end;

type wVocalMorpherParameters = tag_wVocalMorpherParameters;

    {! The pitch shifter applies time-invariant pitch shifting to the input signal, over a one octave range and controllable at a semi-tone and cent resolution. }
    { __cplusplus }
    {! This sets the number of semitones by which the pitch is shifted. There are 12 semitones per }
    {! octave. Negative values create a downwards shift in pitch, positive values pitch the sound }
    {! upwards. }
    {! Range: -12 to 12 }
    {! This sets the number of cents between Semitones a pitch is shifted. A Cent is 1/100th of a }
    {! Semitone. Negative values create a downwards shift in pitch, positive values pitch the sound }
    {! upwards. }
    {! Range: -50 to 50 }

type tag_wPitchShifterParameters = record
	CoarseTune : Int32;
	FineTune : Int32;
end;

type wPitchShifterParameters = tag_wPitchShifterParameters;

    {! The ring modulator multiplies an input signal by a carrier signal in the time domain, resulting in tremolo or inharmonic effects. }

type ModulatorWaveform = (
	wMDWF_SINUSOID,
	wMDWF_SAW,
	wMDWF_SQUARE,
    wMDWF_COUNT
    );

    {! This is the frequency of the carrier signal. If the carrier signal is slowly varying (less than 20 Hz), }
    {! the result is a tremolo (slow amplitude variation) effect. If the carrier signal is in the audio range, }
    {! audible upper and lower sidebands begin to appear, causing an inharmonic effect. The carrier }
    {! signal itself is not heard in the output. }
    {! Range: 0.0 to 8000.0 }
    {! This controls the cutoff frequency at which the input signal is high-pass filtered before being ring }
    {! modulated. If the cutoff frequency is 0, the entire signal will be ring modulated. If the cutoff }
    {! frequency is high, very little of the signal (only those parts above the cutoff) will be ring }
    {! modulated. }
    {! Range: 0.0 to 24000.0 }
    {! This controls which waveform is used as the carrier signal. Traditional ring modulator and }
    {! tremolo effects generally use a sinusoidal carrier. Sawtooth and square waveforms are may }
    {! cause unpleasant aliasing. }


type tag_wRingModulatorParameters = record
	Frequency : Float32;
	HighPassCutoff : Float32;
	Waveform : ModulatorWaveform;
end;

type wRingModulatorParameters = tag_wRingModulatorParameters;

    {! The Auto-wah effect emulates the sound of a wah-wah pedal used with an electric guitar, or a mute on a brass instrument. }
    { __cplusplus }
    {! This property controls the time the filtering effect takes to sweep from minimum to maximum center frequency when it is triggered by input signal. }
    {! Range: 0.0001 to 1.0 }
    {! This property controls the time the filtering effect takes to sweep from maximum back to base center frequency, when the input signal ends. }
    {! Range: 0.0001 to 1.0 }
    {! This property controls the resonant peak, sometimes known as emphasis or Q, of the auto-wah }
    {! band-pass filter. Resonance occurs when the effect boosts the frequency content of the sound }
    {! around the point at which the filter is working. A high value promotes a highly resonant, sharp }
    {! sounding effect. }
    {! Range: 2.0 to 1000.0 }
    {! This property controls the input signal level at which the band-pass filter will be fully opened. }
    {! Range: 0.00003 to 31621.0 }

type tag_wAutowahParameters = record
	AttackTime : Float32;
	ReleaseTime : Float32;
	Resonance : Float32;
	PeakGain : Float32;
end;

type wAutowahParameters = tag_wAutowahParameters;

    {! The Automatic Gain Control effect performs the same task as a studio compressor, evening out the audio dynamic range of an input sound. }
    {! The Compressor can only be switched on and off – it cannot be adjusted. }

type tag_wCompressorParameters = record
    Active : Boolean;
end;

type wCompressorParameters = tag_wCompressorParameters;

    {! The OpenAL Effects Extension EQ is very flexible, providing tonal control over four different adjustable frequency ranges. }
    {! This property controls amount of cut or boost on the low frequency range. }
    {! Range: 0.126 to 7.943 }
    {! This property controls the low frequency below which signal will be cut off. }
    {! Range: 50.0 to 800.0 }
    {! This property allows you to cut / boost signal on the "mid1" range. }
    {! Range: 0.126 to 7.943 }
    {! This property sets the center frequency for the "mid1" range. }
    {! Range: 200.0 to 3000.0 }
    {! This property controls the width of the "mid1" range. }
    {! Range: 0.01 to 1.0 }
    {! This property allows you to cut / boost signal on the "mid2" range. }
    {! Range: 0.126 to 7.943 }
    {! This property sets the center frequency for the "mid2" range. }
    {! Range: 1000.0 to 8000.0 }
    {! This property controls the width of the "mid2" range. }
    {! Range: 0.01 to 1.0 }
    {! This property allows you to cut / boost the signal at high frequencies. }
    {! Range: 0.126 to 7.943 }
    {! This property controls the high frequency above which signal will be cut off. }
    {! Range: 4000.0 to 16000.0 }

type tag_wEqualizerParameters = record
	LowGain : Float32;
	LowCutoff : Float32;
	Mid1Gain : Float32;
	Mid1Center : Float32;
	Mid1Width : Float32;
	Mid2Gain : Float32;
	Mid2Center : Float32;
	Mid2Width : Float32;
	HighGain : Float32;
	HighCutoff : Float32;
end;

type wEqualizerParameters = tag_wEqualizerParameters;

type tag_wShader = record
	material_type : Int32;
	irrShaderCallBack : Pointer;
	next_shader : ^tag_wShader;
end;

type wShader = ^tag_wShader;

type PwShader=^wShader;

{////////////////////////////////////////////////////////////////////}
{////////////////////////////////////////////////////////////////////}
{////////////////////////////////////////////////////////////////////}
{/wConsole/// }
procedure wConsoleSetFontColor(c:wConsoleFontColor); cdecl; external WS3DCoreLib ;

procedure wConsoleSetBackColor(c:wConsoleBackColor); cdecl; external WS3DCoreLib ;

function wConsoleSaveDefaultColors:Int32; cdecl; external WS3DCoreLib ;

procedure wConsoleResetColors(defValues:Int32); cdecl; external WS3DCoreLib ;

{/wTexture// }
function wTextureLoad(cptrFile:PChar):wTexture; cdecl; external WS3DCoreLib ;

function wTextureCreateRenderTarget(size:wVector2i):wTexture; cdecl; external WS3DCoreLib ;

function wTextureCreate(name:PChar; size:wVector2i;
         format:wColorFormat):wTexture;  cdecl; external WS3DCoreLib ;

procedure wTextureDestroy(texture:wTexture); cdecl; external WS3DCoreLib ;

function wTextureLock(texture:wTexture):PUInt32; cdecl; external WS3DCoreLib ;

procedure wTextureUnlock(texture:wTexture); cdecl; external WS3DCoreLib ;

procedure wTextureSave(texture:wTexture; filePath:PChar); cdecl; external WS3DCoreLib ;

function wTextureConvertToImage(texture:wTexture):wImage; cdecl; external WS3DCoreLib ;

procedure wTextureGetInformation(texture:wTexture; size:PwVector2u;
          pitch:PUInt32; format:PwColorFormat); cdecl; external WS3DCoreLib ;

procedure wTextureMakeNormalMap(texture:wTexture; amplitude:Float32); cdecl; external WS3DCoreLib ;

function wTexturesSetBlendMode(texturedest:wTexture; texturesrc:wTexture;
          offset:wVector2i; operation:wBlendOperation):Int32; cdecl; external WS3DCoreLib ;

procedure wTextureSetColorKey(texture:wTexture; key:wColor4s); cdecl; external WS3DCoreLib ;

procedure wTextureSetGray(texture:PwTexture); cdecl; external WS3DCoreLib ;

procedure wTextureSetAlpha(texture:PwTexture; value:UInt32); cdecl; external WS3DCoreLib ;

procedure wTextureSetInverse(texture:PwTexture); cdecl; external WS3DCoreLib ;

procedure wTextureSetBrightness(texture:PwTexture; value:UInt32); cdecl; external WS3DCoreLib ;

function wTextureCopy(texture:wTexture; name:PChar):wTexture; cdecl; external WS3DCoreLib ;

procedure wTextureSetContrast(texture:PwTexture; value:Float32); cdecl; external WS3DCoreLib ;

function wTextureFlip(texture:PwTexture; mode:Int32=1):wTexture; cdecl; external WS3DCoreLib ;

procedure wTextureSetBlur(texture:PwTexture; radius:Float32); cdecl; external WS3DCoreLib ;

function wTextureGetFullName(texture:wTexture):PChar; cdecl; external WS3DCoreLib ;

function wTextureGetInternalName(texture:wTexture):PChar; cdecl; external WS3DCoreLib ;

procedure wTextureDraw(texture:wTexture;
          pos:wVector2i;
          useAlphaChannel:Boolean;
          color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wTextureDrawEx(texture:wTexture;
          pos:wVector2i; scale:wVector2f;
          useAlphaChannel:Boolean=true); cdecl; external WS3DCoreLib ;

procedure wTextureDrawMouseCursor(texture:wTexture); cdecl; external WS3DCoreLib ;

procedure wTextureDrawElement(texture:wTexture; pos:wVector2i; fromPos:wVector2i;
          toPos:wVector2i; useAlphaChannel:Boolean;color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wTextureDrawElementStretch(texture:wTexture;
          destFromPos:wVector2i; destToPos:wVector2i;
          sourceFromPos:wVector2i; sourceToPos:wVector2i;
          useAlphaChannel:Boolean=true); cdecl; external WS3DCoreLib ;

procedure wTextureDrawAdvanced(texture:wTexture; pos:wVector2i; rotPoint:wVector2i;
          rotation:Float32;scale:wVector2f; useAlphaChannel:Boolean; color:wColor4s;
          aliasMode:wAntiAliasingMode=wAAM_SIMPLE;
          bFilter:Boolean=true; tFilter:Boolean=true;
          aFilter:Boolean=true); cdecl; external WS3DCoreLib ;

procedure wTextureDrawElementAdvanced(texture:wTexture; pos:wVector2i; fromPos:wVector2i;
          toPos:wVector2i; rotPoint:wVector2i; rotAngleDeg:Float32;scale:wVector2f;
          useAlphaChannel:Boolean; color:wColor4s;
          aliasMode:wAntiAliasingMode=wAAM_SIMPLE;bilinearFilter:Boolean=true;
          trilinearFilter:Boolean=true; anisotropFilter:Boolean=true); cdecl; external WS3DCoreLib ;

{/w2d/// }
procedure w2dDrawRect(minPos:wVector2i; maxPos:wVector2i; color:wColor4s);  cdecl; external WS3DCoreLib ;

procedure w2dDrawRectWithGradient(minPos:wVector2i; maxPos:wVector2i;
          colorLeftUp:wColor4s; colorRightUp:wColor4s;
          colorLeftDown:wColor4s; colorRightDown:wColor4s);  cdecl; external WS3DCoreLib ;

procedure w2dDrawRectOutline(minPos:wVector2i; maxPos:wVector2i; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure w2dDrawLine(fromPos:wVector2i; toPos:wVector2i; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure w2dDrawPixel(pos:wVector2i; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure w2dDrawPolygon(pos:wVector2i; Radius:Float32;
          color:wColor4s; vertexCount:Int32=12); cdecl; external WS3DCoreLib ;

{/w3d/// }
procedure w3dDrawLine(_start:wVector3f; _end:wVector3f; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure w3dDrawBox(minPoint:wVector3f; maxPoint:wVector3f; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure w3dDrawTriangle(triangle:wTriangle; color:wColor4s); cdecl; external WS3DCoreLib ;

{/wFont/// }
function wFontLoad(fontPath:PChar):wFont; cdecl; external WS3DCoreLib ;

function wFontAddToFont(fontPath:PChar; destFont:wFont):wFont; cdecl; external WS3DCoreLib ;

function wFontGetDefault():wFont; cdecl; external WS3DCoreLib ;

procedure wFontDraw(font:wFont; wcptrText:WString;
          fromPos:wVector2i; toPos:wVector2i; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wFontDestroy(font:wFont); cdecl; external WS3DCoreLib ;

function wFontGetTextSize(font:wFont; text:WString):wVector2u; cdecl; external WS3DCoreLib ;

procedure wFontSetKerningSize(font:wFont; kerning:wVector2u); cdecl; external WS3DCoreLib ;

function wFontGetKerningSize(font:wFont):wVector2u; cdecl; external WS3DCoreLib ;

function wFontGetCharacterFromPos(font:wFont; text:WString; xPixel:Int32):Int32; cdecl; external WS3DCoreLib ;

procedure wFontSetInvisibleCharacters(font:wFont; s:WString); cdecl; external WS3DCoreLib ;

function wFontLoadFromTTF(fontPath:PChar; size:UInt32;
          antialias:Boolean=false; transparency:Boolean=false):wFont; cdecl; external WS3DCoreLib ;

procedure wFontDrawAsTTF(font:wFont; wcptrText:WString; fromPos:wVector2i;
          toPos:wVector2i; color:wColor4s;
          hcenter:Boolean=false; vcenter:Boolean=false); cdecl; external WS3DCoreLib ;

{/wImage////// }
function wImageLoad(cptrFile:PChar):wImage; cdecl; external WS3DCoreLib ;

function wImageSave(img:wImage; _file:PChar):Boolean; cdecl; external WS3DCoreLib ;

function wImageCreate(size:wVector2i; format:wColorFormat):wImage; cdecl; external WS3DCoreLib ;

procedure wImageDestroy(image:wImage); cdecl; external WS3DCoreLib ;

function wImageLock(image:wImage):PUInt32; cdecl; external WS3DCoreLib ;

procedure wImageUnlock(image:wImage); cdecl; external WS3DCoreLib ;

function wImageConvertToTexture(img:wImage; name:PChar):wTexture; cdecl; external WS3DCoreLib ;

function wImageGetPixelColor(img:wImage; pos:wVector2u):wColor4s; cdecl; external WS3DCoreLib ;

procedure wImageSetPixelColor(img:wImage; pos:wVector2u;
          color:wColor4s; blend:Boolean=false); cdecl; external WS3DCoreLib ;

procedure wImageGetInformation(image:wImage; size:PwVector2u;
          pitch:PUInt32; format:PwColorFormat); cdecl; external WS3DCoreLib ;

{/wTimer/// }
function wTimerGetDelta:Float32; cdecl; external WS3DCoreLib ;

function wTimerGetTime:UInt32; cdecl; external WS3DCoreLib ;

function wTimerGetRealTimeAndDate:wRealTimeDate; cdecl; external WS3DCoreLib ;

function wTimerGetRealTime:UInt32; cdecl; external WS3DCoreLib ;

procedure wTimerSetTime(newTime:UInt32); cdecl; external WS3DCoreLib ;

function wTimerIsStopped():Boolean; cdecl; external WS3DCoreLib ;

procedure wTimerSetSpeed(speed:Float32); cdecl; external WS3DCoreLib ;

procedure wTimerStart(); cdecl; external WS3DCoreLib ;

procedure wTimerStop(); cdecl; external WS3DCoreLib ;

procedure wTimerTick(); cdecl; external WS3DCoreLib ;

{/wLog/// }
procedure wLogSetLevel(level:wLoggingLevel); cdecl; external WS3DCoreLib ;

procedure wLogSetFile(path:PChar); cdecl; external WS3DCoreLib ;

procedure wLogClear(path:PChar); cdecl; external WS3DCoreLib ;

procedure wLogWrite(hint:WString; text:WString;
          path:PChar=nil; mode:UInt32=1); cdecl; external WS3DCoreLib ;

{/wSystem//// }
procedure wSystemSetClipboardText(text:PChar); cdecl; external WS3DCoreLib ;

function wSystemGetClipboardText():PChar; cdecl; external WS3DCoreLib ;

function wSystemGetProcessorSpeed():UInt32; cdecl; external WS3DCoreLib ;

function wSystemGetTotalMemory():UInt32; cdecl; external WS3DCoreLib ;

function wSystemGetAvailableMemory():UInt32; cdecl; external WS3DCoreLib ;

function wSystemGetMaxTextureSize():wVector2i; cdecl; external WS3DCoreLib ;

function wSystemIsTextureFormatSupported(format:wColorFormat):Boolean; cdecl; external WS3DCoreLib ;

procedure wSystemSetTextureCreationFlag(flag:wTextureCreationFlag;
          value:Boolean); cdecl; external WS3DCoreLib ;

function wSystemIsTextureCreationFlag(flag:wTextureCreationFlag):Boolean; cdecl; external WS3DCoreLib ;

function wSystemCreateScreenShot(minPos:wVector2u;
          maxPos:wVector2u):wTexture; cdecl; external WS3DCoreLib ;

function wSystemSaveScreenShot(_file:PChar):Boolean; cdecl; external WS3DCoreLib ;

function wSystemGetVersion():PChar; cdecl; external WS3DCoreLib ;

function wSystemIsDriverSupported(testDriver:wDriverTypes):Boolean; cdecl; external WS3DCoreLib ;

{/wDisplay/// }
function wDisplayGetVendor():PChar; cdecl; external WS3DCoreLib ;

function wDisplayModesGetCount():Int32; cdecl; external WS3DCoreLib ;

function wDisplayModeGetDepth(modeNumber:Int32):Int32; cdecl; external WS3DCoreLib ;

function wDisplayModeGetResolution(ModeNumber:Int32):wVector2u; cdecl; external WS3DCoreLib ;

function wDisplayGetCurrentResolution():wVector2u; cdecl; external WS3DCoreLib ;

function wDisplayGetCurrentDepth():Int32; cdecl; external WS3DCoreLib ;

procedure wDisplaySetGammaRamp(gamma:wColor3f;
          brightness:Float32; contrast:Float32); cdecl; external WS3DCoreLib ;

procedure wDisplayGetGammaRamp(gamma:PwColor3f;
          brightness:PFloat32; contrast:PFloat32); cdecl; external WS3DCoreLib ;

function wDisplaySetDepth(depth:UInt32):Boolean; cdecl; external WS3DCoreLib ;

{/wMath/// }
const wMathPI = 3.14159265359;
const wMathPI64=3.1415926535897932384626433832795028841971693993751;

{/Возвращает нормализованный вектор }
function wMathVector3fNormalize(source:wVector3f):wVector3f; cdecl; external WS3DCoreLib ;

{/Возвращает длину вектора }
function wMathVector3fGetLength(vector:wVector3f):Float32; cdecl; external WS3DCoreLib ;

{/Get the rotations that would make a (0,0,1) direction vector }
{/point in the same direction as this direction vector. }
function wMathVector3fGetHorizontalAngle(vector:wVector3f):wVector3f; cdecl; external WS3DCoreLib ;

{/Возвращает инвертированный вектор (все координаты меняют знак) }
function wMathVector3fInvert(vector:wVector3f):wVector3f; cdecl; external WS3DCoreLib ;

{/Суммирует два вектора }
function wMathVector3fAdd(vector1:wVector3f;
          vector2:wVector3f):wVector3f; cdecl; external WS3DCoreLib ;

{/Вычитает из вектора 1 вектор 2 }
function wMathVector3fSubstract(vector1:wVector3f;
          vector2:wVector3f):wVector3f; cdecl; external WS3DCoreLib ;

{/Векторное произведение векторов }
function wMathVector3fCrossProduct(vector1:wVector3f;
          vector2:wVector3f):wVector3f; cdecl; external WS3DCoreLib ;

{/Скалярное произведение векторов }
function wMathVector3fDotProduct(vector1:wVector3f;
          vector2:wVector3f):Float32; cdecl; external WS3DCoreLib ;

{/Определяет кратчайшее расстояние между векторами }
function wMathVector3fGetDistanceFrom(vector1:wVector3f;
          vector2:wVector3f):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает интерполированный вектор }
function wMathVector3fInterpolate(vector1:wVector3f; vector2:wVector3f;
          d:Float64):wVector3f; cdecl; external WS3DCoreLib ;

{/Возвращает случайное число из интервала (first, last) }
function wMathRandomRange(first:Float64; last:Float64):Float64; cdecl; external WS3DCoreLib ;

{/Из градусов- в радианы/// }
function wMathDegToRad(degrees:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Из радиан- в градусы }
function wMathRadToDeg(radians:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Математически правильное округление/// }
function wMathRound(value:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Округление в большую сторону/// }
function wMathCeil(value:Float32):Int32; cdecl; external WS3DCoreLib ;

{/Округление в меньшую сторону/// }
function wMathFloor(value:Float32):Int32; cdecl; external WS3DCoreLib ;

{/returns if a equals b, taking possible rounding errors into account }
function wMathFloatEquals(value1:Float32;
          value2:Float32; tolerance:Float32=0.000001):Boolean; cdecl; external WS3DCoreLib ;

{/returns if a equals b, taking an explicit rounding tolerance into account }
function wMathIntEquals(value1:Int32;
          value2:Int32; tolerance:Int32=0):Boolean; cdecl; external WS3DCoreLib ;

{/returns if a equals b, taking an explicit rounding tolerance into account }
function wMathUIntEquals(value1:UInt32;
          value2:UInt32; tolerance:UInt32=0):Boolean; cdecl; external WS3DCoreLib ;

{/returns if a equals zero, taking rounding errors into account }
function wMathFloatIsZero(value:Float32;
          tolerance:Float32=0.000001):Boolean; cdecl; external WS3DCoreLib ;

{/returns if a equals zero, taking rounding errors into account }
function wMathIntIsZero(value:Int32;
          tolerance:Int32=0):Boolean; cdecl; external WS3DCoreLib ;

{/returns if a equals zero, taking rounding errors into account }
function wMathUIntIsZero(value:UInt32;
          tolerance:UInt32=0):Boolean; cdecl; external WS3DCoreLib ;

{/Возвращает больший Float32 из двух/// }
function wMathFloatMax2(value1:Float32; value2:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает больший Float32 из трех/// }
function wMathFloatMax3(value1:Float32; value2:Float32;
          value3:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает больший Int32 из двух/// }
function wMathIntMax2(value1:Int32;
          value2:Int32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает больший Int32 из трех/// }
function wMathIntMax3(value1:Int32;
          value2:Int32; value3:Int32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает меньший Float32 из двух/// }
function wMathFloatMin2(value1:Float32;
          value2:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает меньший Float32 из трех/// }
function wMathFloatMin3(value1:Float32;
          value2:Float32; value3:Float32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает меньший Int32 из двух/// }
function wMathIntMin2(value1:Int32;
          value2:Int32):Float32; cdecl; external WS3DCoreLib ;

{/Возвращает меньший Int32 из трех/// }
function wMathIntMin3(value1:Int32;
          value2:Int32; value3:Int32):Float32; cdecl; external WS3DCoreLib ;

{/wUtil/// }
function wUtilVector3fToStr(vector:wVector3f;
          s:PChar=';'; addNullChar:Boolean=false):PChar; cdecl; external WS3DCoreLib ;

function wUtilVector2fToStr(vector:wVector2f;
          s:PChar=';'; addNullChar:Boolean=false):PChar; cdecl; external WS3DCoreLib ;

function wUtilColor4sToStr(color:wColor4s;
          s:PChar; addNullChar:Boolean):PChar; cdecl; external WS3DCoreLib ;

function wUtilColor4fToStr(color:wColor4f;
          s:PChar; addNullChar:Boolean):PChar; cdecl; external WS3DCoreLib ;

function wUtilColor4sToUInt(color:wColor4s):UInt32; cdecl; external WS3DCoreLib ;

function wUtilColor4fToUInt(color:wColor4f):UInt32; cdecl; external WS3DCoreLib ;

function wUtilUIntToColor4s(color:UInt32):wColor4s;  cdecl; external WS3DCoreLib ;

function wUtilUIntToColor4f(color:UInt32):wColor4f; cdecl; external WS3DCoreLib ;

{/Convert a simple string of base 10 digits into a signed 32 bit integer. }
function wUtilStrToInt(str:PChar):Int32; cdecl; external WS3DCoreLib ;

function wUtilIntToStr(value:Int32;
          addNullChar:Boolean=false):PChar; cdecl; external WS3DCoreLib ;

{/Converts a sequence of digits into a whole positive floating point value. }
{/Only digits 0 to 9 are parsed. }
{/Parsing stops at any other character, including sign characters or a decimal point. }
function wUtilStrToFloat(str:PChar):Float32; cdecl; external WS3DCoreLib ;

function wUtilFloatToStr(value:Float32;
          addNullChar:Boolean=false):PChar; cdecl; external WS3DCoreLib ;

{/Convert a simple string of base 10 digits into an unsigned 32 bit integer. }
(* Const before type ignored *)
function wUtilStrToUInt(str:PChar):UInt32; cdecl; external WS3DCoreLib ;

(* Const before type ignored *)
function wUtilUIntToStr(value:UInt32;
          addNullChar:Boolean=false):PChar; cdecl; external WS3DCoreLib ;

{/swaps the content of the passed parameters }
procedure wUtilSwapInt(value1:PInt32;
          value2:PInt32); cdecl; external WS3DCoreLib ;

{/swaps the content of the passed parameters }
procedure wUtilSwapUInt(value1:PUInt32;
          value2:PUInt32); cdecl; external WS3DCoreLib ;

{/swaps the content of the passed parameters }
procedure wUtilSwapFloat(value1:PFloat32;
          value2:PFloat32); cdecl; external WS3DCoreLib ;

{/Конвертирует расширенную строку в С-строку }
function wUtilWideStrToStr(str:PWChar):PChar; cdecl; external WS3DCoreLib ;

{/Конвертирует С-строку в расширенную строку }
function wUtilStrToWideStr(str:PChar):PWChar; cdecl; external WS3DCoreLib ;

{/Добавляет символ конца строки }
procedure wUtilStrAddNullChar(str:PPChar); cdecl; external WS3DCoreLib ;

{/Добавляет символ конца строки к расширенной строке }
procedure wUtilWideStrAddNullChar(str:PPWChar); cdecl; external WS3DCoreLib ;

{/wEngine/// }
procedure wEngineSetClipboardText(text:PWChar); cdecl; external WS3DCoreLib ;

function wEngineGetClipboardText():PWChar; cdecl; external WS3DCoreLib ;

function wEngineLoadCreationParameters(outParams:PwEngineCreationParameters;
          xmlFilePath:PChar):Boolean; cdecl; external WS3DCoreLib ;

function wEngineSaveCreationParameters(inParams:PwEngineCreationParameters;
          xmlFilePath:Pchar):Boolean; cdecl; external WS3DCoreLib ;

function wEngineStartWithGui(captionText:PWChar;
         fontPath:PChar=nil;logo:PChar=nil; lang:wLanguage=wL_EN;
         outParams:PwEngineCreationParameters=nil;
         inXmlConfig:PChar=nil):Boolean; cdecl; external WS3DCoreLib ;

function wEngineStart(iDevice:wDriverTypes;size:wVector2u;iBPP:UInt32;
         boFullscreen:Boolean;boShadows:Boolean;boCaptureEvents:Boolean;
         vsync:Boolean):Boolean; cdecl; external WS3DCoreLib ;

procedure wEngineCloseByEsc(); cdecl; external WS3DCoreLib ;

function wEngineStartAdvanced(params:wEngineCreationParameters):Boolean; cdecl; external WS3DCoreLib ;

procedure wEngineSetTransparentZWrite(value:Boolean); cdecl; external WS3DCoreLib ;

function wEngineRunning():Boolean; cdecl; external WS3DCoreLib ;

procedure wEngineSleep(Ms:UInt32; pauseTimer:Boolean); cdecl; external WS3DCoreLib ;

{/Cause the device to temporarily pause execution and let other processes run. }
procedure wEngineYield(); cdecl; external WS3DCoreLib ;

procedure wEngineSetViewPort(fromPos:wVector2i; toPos:wVector2i); cdecl; external WS3DCoreLib ;

function wEngineIsQueryFeature(feature:wVideoFeatureQuery):Boolean; cdecl; external WS3DCoreLib ;

procedure wEngineDisableFeature(feature:wVideoFeatureQuery;flag:Boolean); cdecl; external WS3DCoreLib ;

function wEngineStop(closeDevice:Boolean):Boolean; cdecl; external WS3DCoreLib ;

procedure wEngineSetFPS(limit:UInt32); cdecl; external WS3DCoreLib ;

function wEngineGetGlobalMaterial():wMaterial; cdecl; external WS3DCoreLib ;

{
Get the 2d override material for altering its values.
The 2d override materual allows to alter certain render states of the 2d methods.
Not all members of SMaterial are honored, especially not MaterialType and Textures.
Moreover, the zbuffer is always ignored, and lighting is always off.
All other flags can be changed, though some might have to effect in most cases.
Please note that you have to enable/disable this effect with enableInitMaterial2D().
This effect is costly, as it increases the number of state changes considerably.
Always reset the values when done.
 }
function wEngineGet2dMaterial():wMaterial; cdecl; external WS3DCoreLib ;

procedure wEngineSet2dMaterial(value:Boolean); cdecl; external WS3DCoreLib ;

function wEngineGetFPS():Int32; cdecl; external WS3DCoreLib ;

procedure wEngineShowLogo(value:Boolean); cdecl; external WS3DCoreLib ;

{/wScene///// }
function wSceneBegin(color:wColor4s):Boolean; cdecl; external WS3DCoreLib ;

function wSceneBeginAdvanced(backColor:wColor4s;
         clearBackBuffer:Boolean=true;
         clearZBuffer:Boolean=true):Boolean; cdecl; external WS3DCoreLib ;

procedure wSceneLoad(filename:Pchar); cdecl; external WS3DCoreLib ;

procedure wSceneSave(filename:Pchar); cdecl; external WS3DCoreLib ;

procedure wSceneDrawAll(); cdecl; external WS3DCoreLib ;

function wSceneEnd():Boolean; cdecl; external WS3DCoreLib ;

procedure wSceneDrawToTexture(renderTarget:wTexture); cdecl; external WS3DCoreLib ;

procedure wSceneSetRenderTarget(renderTarget:wTexture;
         backColor:wColor4s;clearBackBuffer:Boolean=true;
         clearZBuffer:Boolean=true); cdecl; external WS3DCoreLib ;

procedure wSceneSetAmbientLight(color:wColor4f); cdecl; external WS3DCoreLib ;

function wSceneGetAmbientLight():wColor4f; cdecl; external WS3DCoreLib ;

procedure wSceneSetShadowColor(color:wColor4s); cdecl; external WS3DCoreLib ;

function wSceneGetShadowColor():wColor4s; cdecl; external WS3DCoreLib ;

procedure wSceneSetFog(color:wColor4s; fogtype:wFogType;
         start:Float32; _end:Float32; density:Float32;
         pixelFog:Boolean=false; rangeFog:Boolean=false); cdecl; external WS3DCoreLib ;

procedure wSceneGetFog(color:PwColor4s; fogtype:PwFogType;
         start:PFloat32;_end:PFloat32; density:PFloat32;
         pixelFog:PBoolean; rangeFog:PBoolean); cdecl; external WS3DCoreLib ;

function wSceneGetActiveCamera():wNode; cdecl; external WS3DCoreLib ;

{/Поиск текстуры по АБСОЛЮТНОМУ пути }
{/Если требуется искать по относительному пути, }
{/используйте сначала wFileGetAbsolutePath }
function wSceneGetTextureByName(name:PChar):wTexture; cdecl; external WS3DCoreLib ;

{ When animating a mesh by "Morphing" or "Skeletal Animation" such as "*.md3", "*.x" and "*.b3d" using "Shaders" for rendering we can improve the final render if we "Cyclically Update" the "Tangents" and "Binormals".. }
{ We presume that our meshes are, among others, textured with a "NORMAL MAP" used by the "Shader" (cg, hlsl, or glsl etc) in calculating diffuse and specular. }
{ We also have one or more lights used by the shader. }
{ Update TANGENTS & BINORMALS at every frame for a skinned animation.. }
{ We dont want to do this for static meshes like levels etc.. }
{ We also dont want to do it for Rotating, Scaled and translated meshes..(we can however, as a bonus, scale, rotate and translate these) }
{ Only for animated skinned and morph based meshes.. }
{ This is loose code that works. If anyone can improve it for the engine itself that would be great.. }
{ You'll probably ID possible improvements immediately! }
{ At every N'th Frame we loop through all the vertices.. }
{ 1. In the loop we Access the VERTEX of POINT A of the "INDEXED TRIANGLE".. }
{ 2. We interrogate the "OTHER TWO" VERTICES (which thankfully do change at each frame) for their Positions, Normals, and UV Coords to }
{    Genertate a "BRAND NEW" (animated) TANGENT and BINORMAL. (We may want to calculate the the "Binormal" in the SHADER to save time) }
{ 3. We REWRITE the Tangent and Binormal for our SELECTED TRIANGLE POINT. }
{ 4. We DO THE SAME for POINTS B and C.. }
{ }
{  GENERATE "LIVING" TANGENTS & BINBORMALS }
{  REMEMBER! }
{  WE NEED "LOOP THROUGH ALL ITS BUFFERS" }
{  WE NEED "LOOP THROUGH ALL THOSE BUFFER VERTICES" }
{ Possible types of (animated) meshes. }
{ Enumerator: }
{ 1  EAMT_MD2            Quake 2 MD2 model file.. }
{ 2  EAMT_MD3            Quake 3 MD3 model file.. }
{ 10 EAMT_MDL_HALFLIFE   Halflife MDL model file.. }
{ Below is what an item type must be for it to qualify for Tangent Updates.. }
{ 11 EAMT_SKINNED        generic skinned mesh "*.x" "*.b3d" etc.. (see Morphed too!) }
{ }
{ We want to change tangents for skinned meshes only so we must determine which ones are "Skinned".. }
{ This may change if we add and remove meshes during runtime.. }
procedure wMeshUpdateTangentsAndBinormals(mesh:wMesh); cdecl; external WS3DCoreLib ;

procedure wSceneDestroyAllTextures(); cdecl; external WS3DCoreLib ;

procedure wSceneDestroyAllNodes(); cdecl; external WS3DCoreLib ;

{/Можно для поиска меша использовать относительный путь }
function wSceneGetMeshByName(name:PChar):wMesh; cdecl; external WS3DCoreLib ;

function wSceneGetMeshByIndex(index:UInt32):wMesh; cdecl; external WS3DCoreLib ;

function wSceneGetMeshesCount():UInt32; cdecl; external WS3DCoreLib ;

procedure wSceneDestroyAllMeshes(); cdecl; external WS3DCoreLib ;

function wSceneIsMeshLoaded(filePath:PChar):Boolean; cdecl; external WS3DCoreLib ;

procedure wSceneDestroyAllUnusedMeshes(); cdecl; external WS3DCoreLib ;

function wSceneGetPrimitivesDrawn():UInt32; cdecl; external WS3DCoreLib ;

function wSceneGetNodesCount():UInt32; cdecl; external WS3DCoreLib ;

function wSceneGetNodeById(id:Int32):wNode; cdecl; external WS3DCoreLib ;

function wSceneGetNodeByName(name:PChar):wNode; cdecl; external WS3DCoreLib ;

function wSceneGetRootNode():wNode; cdecl; external WS3DCoreLib ;

{/wWindow/// }
procedure wWindowSetCaption(wcptrText:WString); cdecl; external WS3DCoreLib ;

procedure wWindowGetSize(size:PwVector2u); cdecl; external WS3DCoreLib ;

function wWindowIsFullscreen():Boolean; cdecl; external WS3DCoreLib ;

function wWindowIsResizable():Boolean; cdecl; external WS3DCoreLib ;

function wWindowIsActive():Boolean; cdecl; external WS3DCoreLib ;

function wWindowIsFocused():Boolean; cdecl; external WS3DCoreLib ;

function wWindowIsMinimized():Boolean; cdecl; external WS3DCoreLib ;

procedure wWindowMaximize(); cdecl; external WS3DCoreLib ;

procedure wWindowMinimize(); cdecl; external WS3DCoreLib ;

procedure wWindowRestore(); cdecl; external WS3DCoreLib ;

procedure wWindowSetResizable(resizable:Boolean); cdecl; external WS3DCoreLib ;

procedure wWindowMove(pos:wVector2u); cdecl; external WS3DCoreLib ;

procedure wWindowPlaceToCenter(); cdecl; external WS3DCoreLib ;

procedure wWindowResize(newSize:wVector2u); cdecl; external WS3DCoreLib ;

procedure wWindowSetFullscreen(value:Boolean); cdecl; external WS3DCoreLib ;

function wWindowSetDepth(depth:UInt32):Boolean; cdecl; external WS3DCoreLib ;

{/wPostEffect/// }
function wPostEffectCreate(effectnum:wPostEffectId;quality:wPostEffectQuality;
         value1:Float32;value2:Float32;value3:Float32;value4:Float32;
         value5:Float32; value6:Float32; value7:Float32; value8:Float32):wPostEffect; cdecl; external WS3DCoreLib ;

procedure wPostEffectDestroy(ppEffect:wPostEffect); cdecl; external WS3DCoreLib ;

procedure wPostEffectSetParameters(ppEffect:wPostEffect; para1:Float32; para2:Float32; para3:Float32; para4:Float32;
            para5:Float32; para6:Float32; para7:Float32; para8:Float32); cdecl; external WS3DCoreLib ;

procedure wPostEffectsDestroyAll(); cdecl; external WS3DCoreLib ;

{/wXEffects/// }
procedure wXEffectsStart(vsm:Boolean;softShadows:Boolean; bitDepth32:Boolean;
            color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wXEffectsEnableDepthPass(enable:Boolean); cdecl; external WS3DCoreLib ;

procedure wXEffectsAddPostProcessingFromFile(name:PChar; effectType:Int32); cdecl; external WS3DCoreLib ;

procedure wXEffectsSetPostProcessingUserTexture(texture:wTexture); cdecl; external WS3DCoreLib ;

procedure wXEffectsAddShadowToNode(node:wNode; filterType:wFilterType;
            shadowType:wShadowMode); cdecl; external WS3DCoreLib ;

procedure wXEffectsRemoveShadowFromNode(node:wNode); cdecl; external WS3DCoreLib ;

procedure wXEffectsExcludeNodeFromLightingCalculations(node:wNode); cdecl; external WS3DCoreLib ;

procedure wXEffectsAddNodeToDepthPass(node:wNode); cdecl; external WS3DCoreLib ;

procedure wXEffectsSetAmbientColor(color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wXEffectsSetClearColor(color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wXEffectsAddShadowLight(shadowDimen:UInt32; position:wVector3f;
            target:wVector3f; color:wColor4f; lightNearDist:Float32;
            lightFarDist:Float32; angleDeg:Float32); cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowLightsCount():UInt32; cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowMapTexture(resolution:UInt32;
            secondary:Boolean):wTexture; cdecl; external WS3DCoreLib ;

function wXEffectsGetDepthMapTexture():wTexture; cdecl; external WS3DCoreLib ;

procedure wXEffectsSetScreenRenderTargetResolution(size:wVector2u); cdecl; external WS3DCoreLib ;

procedure wXEffectsSetShadowLightPosition(index:UInt32;
            position:wVector3f); cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowLightPosition(index:UInt32):wVector3f; cdecl; external WS3DCoreLib ;

procedure wXEffectsSetShadowLightTarget(index:UInt32; target:wVector3f); cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowLightTarget(index:UInt32):wVector3f; cdecl; external WS3DCoreLib ;

procedure wXEffectsSetShadowLightColor(index:UInt32; color:wColor4f); cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowLightColor(index:UInt32):wColor4f; cdecl; external WS3DCoreLib ;

procedure wXEffectsSetShadowLightMapResolution(index:UInt32;
            resolution:UInt32); cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowLightMapResolution(index:UInt32):UInt32; cdecl; external WS3DCoreLib ;

function wXEffectsGetShadowLightFarValue(index:UInt32):Float32; cdecl; external WS3DCoreLib ;

{/wAnimator/// }
function wAnimatorFollowCameraCreate(node:wNode;
            position:wVector3f):wAnimator; cdecl; external WS3DCoreLib ;

function wAnimatorCollisionResponseCreate(selector:wSelector; node:wNode;
            slidingValue:Float32 = 0.0005):wAnimator; cdecl; external WS3DCoreLib ;

procedure wAnimatorCollisionResponseSetParameters(anim:wAnimator;
            params:wAnimatorCollisionResponse); cdecl; external WS3DCoreLib ;

procedure wAnimatorCollisionResponseGetParameters(anim:wAnimator;
            params:PwAnimatorCollisionResponse); cdecl; external WS3DCoreLib ;

function wAnimatorDeletingCreate(node:wNode;
            delete_after:Int32):wAnimator; cdecl; external WS3DCoreLib ;

function wAnimatorFlyingCircleCreate(node:wNode; pos:wVector3f; radius:Float32;
            speed:Float32; direction:wVector3f;startPos:Float32;
            radiusEllipsoid:Float32):wAnimator; cdecl; external WS3DCoreLib ;

function wAnimatorFlyingStraightCreate(node:wNode; startPoint:wVector3f; endPoint:wVector3f;
            time:UInt32; loop:Boolean):wAnimator; cdecl; external WS3DCoreLib ;

function wAnimatorRotationCreate(node:wNode;
            pos:wVector3f):wAnimator; cdecl; external WS3DCoreLib ;

function wAnimatorSplineCreate(node:wNode; iPoints:Int32;
           points:PwVector3f; time:Int32; speed:Float32;
           tightness:Float32):wAnimator; cdecl; external WS3DCoreLib ;

function wAnimatorFadingCreate(node:wNode; delete_after:Int32;
           scale:Float32):wAnimator; cdecl; external WS3DCoreLib ;

procedure wAnimatorDestroy(node:wNode;
           anim:wAnimator); cdecl; external WS3DCoreLib ;

{/wTpsCamera/// }
function wTpsCameraCreate(name:Pchar):wNode; cdecl; external WS3DCoreLib ;

procedure wTpsCameraDestroy(ctrl:wNode); cdecl; external WS3DCoreLib ;

procedure wTpsCameraUpdate(ctrl:wNode); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetTarget(ctrl:wNode;
           node:wNode); cdecl; external WS3DCoreLib ;

procedure wTpsCameraRotateHorizontal(ctrl:wNode;
           rotVal:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraRotateVertical(ctrl:wNode;
           rotVal:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetHorizontalRotation(ctrl:wNode;
           rotVal:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetVerticalRotation(ctrl:wNode;
           rotVal:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraZoomIn(ctrl:wNode); cdecl; external WS3DCoreLib ;

procedure wTpsCameraZoomOut(ctrl:wNode); cdecl; external WS3DCoreLib ;

function wTpsCameraGetCamera(ctrl:wNode):wNode; cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetCurrentDistance(ctrl:wNode;
           dist:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetRelativeTarget(ctrl:wNode;
           target:wVector3f); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetDefaultDistanceDirection(ctrl:wNode;
           dir:wVector3f); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetMaximalDistance(ctrl:wNode;
           value:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetMinimalDistance(ctrl:wNode;
           value:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetZoomStepSize(ctrl:wNode;
           value:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetHorizontalSpeed(ctrl:wNode;
           value:Float32); cdecl; external WS3DCoreLib ;

procedure wTpsCameraSetVerticalSpeed(ctrl:wNode;
           value:Float32); cdecl; external WS3DCoreLib ;

{/wFpsCamera/// }
function wFpsCameraCreate(rotateSpeed:Float32=100.0;
           moveSpeed:Float32=0.1;
           keyMapArray:PwKeyMapArray=nil;
           keyMapSize:Int32=0;
           noVerticalMovement:Boolean=false;
           jumpSpeed:Float32=0):wNode; cdecl; external WS3DCoreLib ;

function wFpsCameraGetSpeed(camera:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wFpsCameraSetSpeed(camera:wNode;
           newSpeed:Float32); cdecl; external WS3DCoreLib ;

function wFpsCameraGetRotationSpeed(camera:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wFpsCameraSetRotationSpeed(camera:wNode;
           rotSpeed:Float32); cdecl; external WS3DCoreLib ;

procedure wFpsCameraSetKeyMap(camera:wNode;
           map:PwKeyMap; count:UInt32); cdecl; external WS3DCoreLib ;

procedure wFpsCameraSetVerticalMovement(camera:wNode;
           value:Boolean); cdecl; external WS3DCoreLib ;

procedure wFpsCameraSetInvertMouse(camera:wNode;
           value:Boolean); cdecl; external WS3DCoreLib ;

procedure wFpsCameraSetMaxVerticalAngle(camera:wNode;
           newValue:Float32); cdecl; external WS3DCoreLib ;

function wFpsCameraGetMaxVerticalAngle(camera:wNode):Float32; cdecl; external WS3DCoreLib ;

{/wCamera/// }
function wCameraCreate(pos:wVector3f;
           target:wVector3f):wNode; cdecl; external WS3DCoreLib ;

function wMayaCameraCreate(rotateSpeed:Float32; zoomSpeed:Float32;
           moveSpeed:Float32):wNode; cdecl; external WS3DCoreLib ;

procedure wCameraSetTarget(camera:wNode;
           target:wVector3f); cdecl; external WS3DCoreLib ;

function wCameraGetTarget(camera:wNode):wVector3f;  cdecl; external WS3DCoreLib ;

function wCameraGetUpDirection(camera:wNode):wVector3f;  cdecl; external WS3DCoreLib ;

procedure wCameraSetUpDirection(camera:wNode; upDir:wVector3f); cdecl; external WS3DCoreLib ;

procedure wCameraGetOrientation(camera:wNode; upDir:PwVector3f;
           forwardDir:PwVector3f;rightDir:PwVector3f); cdecl; external WS3DCoreLib ;

procedure wCameraSetClipDistance(camera:wNode;
           farDistance:Float32; nearDistance:Float32); cdecl; external WS3DCoreLib ;

procedure wCameraSetActive(camera:wNode); cdecl; external WS3DCoreLib ;

procedure wCameraSetFov(camera:wNode; fov:Float32); cdecl; external WS3DCoreLib ;

function wCameraGetFov(camera:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wCameraSetOrthogonal(camera:wNode;
           vec:wVector3f); cdecl; external WS3DCoreLib ;

procedure wCameraRevolve(camera:wNode; angleDeg:wVector3f;
           offset:wVector3f); cdecl; external WS3DCoreLib ;

procedure wCameraSetUpAtRightAngle(camera:wNode); cdecl; external WS3DCoreLib ;

procedure wCameraSetAspectRatio(camera:wNode;
           aspectRatio:Float32); cdecl; external WS3DCoreLib ;

procedure wCameraSetInputEnabled(camera:wNode; value:Boolean); cdecl; external WS3DCoreLib ;

function wCameraIsInputEnabled(camera:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wCameraSetCollisionWithScene(camera:wNode; radius:wVector3f;
           gravity:wVector3f; offset:wVector3f; slidingValue:Float32= 0.0005); cdecl; external WS3DCoreLib ;

{/wRtsCamera/// }
function wRtsCameraCreate(pos:wVector3f; offsetX:wVector2f; offsetZ:wVector2f;
           offsetDistance:wVector2f; offsetAngle:wVector2f;
           driftSpeed:Float32; scrollSpeed:Float32; mouseSpeed:Float32;
           orbit:Float32; mouseButtonActive:wMouseButtons):wNode; cdecl; external WS3DCoreLib ;

{/wCollision/// }
function wCollisionGroupCreate():wSelector; cdecl; external WS3DCoreLib ;

procedure wCollisionGroupAddCollision(group:wSelector;
           selector:wSelector); cdecl; external WS3DCoreLib ;

procedure wCollisionGroupRemoveAll(group:wSelector); cdecl; external WS3DCoreLib ;

procedure wCollisionGroupRemoveCollision(group:wSelector;
           selector:wSelector); cdecl; external WS3DCoreLib ;

function wCollisionCreateFromMesh(mesh:wMesh; node:wNode;
           iframe:Int32):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionCreateFromStaticMesh(staticMesh:wMesh;
           node:wNode):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionCreateFromBatchingMesh(mesh:wMesh;
           node:wNode):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionCreateFromMeshBuffer(meshbuffer:wMeshBuffer;
           node:wNode):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionCreateFromOctreeMesh(mesh:wMesh; node:wNode;
           iframe:Int32 = 0):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionCreateFromBox(node:wNode):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionCreateFromTerrain(node:wNode;
           level_of_detail:Int32):wSelector; cdecl; external WS3DCoreLib ;

function wCollisionGetNodeFromCamera(camera:wNode):wNode; cdecl; external WS3DCoreLib ;

function wCollisionGetNodeFromRay(vectorStart:PwVector3f;
           vectorEnd:PwVector3f):wNode; cdecl; external WS3DCoreLib ;

function wCollisionGetNodeChildFromRay(node:wNode; id:Int32; recurse:Boolean;
           vectorStart:PwVector3f; vectorEnd:PwVector3f):wNode; cdecl; external WS3DCoreLib ;

function wCollisionGetNodeAndPointFromRay(vectorStart:PwVector3f; vectorEnd:PwVector3f;
           colPoint:PwVector3f; normal:PwVector3f; id:Int32;
           rootNode:wNode):wNode; cdecl; external WS3DCoreLib ;

function wCollisionGetNodeFromScreen(screenPos:wVector2i; idBitMask:Int32=0;
           bNoDebugObjects:Boolean=false; root:wNode=nil):wNode; cdecl; external WS3DCoreLib ;

{ __cplusplus }
function wCollisionGetScreenCoordFrom3dPosition(pos:wVector3f):wVector2i; cdecl; external WS3DCoreLib ;

procedure wCollisionGetRayFromScreenCoord(camera:wNode; screenCoord:wVector2i;
           vectorStart:PwVector3f; vectorEnd:PwVector3f); cdecl; external WS3DCoreLib ;

function wCollisionGet3dPositionFromScreen(camera:wNode; screenPos:wVector2i;
           normal:wVector3f; distanceFromOrigin:Float32):wVector3f; cdecl; external WS3DCoreLib ;

function wCollisionGet2dPositionFromScreen(camera:wNode;
           screenPos:wVector2i):wVector2f; cdecl; external WS3DCoreLib ;

function wCollisionGetPointFromRay(ts:wSelector; vectorStart:PwVector3f; vectorEnd:PwVector3f;
           collisionPoint:PwVector3f; vectorNormal:PwVector3f;collisionTriangle:PwTriangle;
           collNode:PwNode):Boolean; cdecl; external WS3DCoreLib ;

function wCollisionGetNodeChildFromPoint(node:wNode; id:Int32;
           recurse:Boolean; vectorPoint:PwVector3f):wNode; cdecl; external WS3DCoreLib ;

procedure wCollisionGetResultPosition(selector:wSelector; ellipsoidPosition:PwVector3f;
           ellipsoidRadius:PwVector3f; velocity:PwVector3f; gravity:PwVector3f;
            slidingSpeed:Float32; outPosition:PwVector3f; outHitPosition:PwVector3f;
           outFalling:PInt32); cdecl; external WS3DCoreLib ;

{/wFile/// }
procedure wFileAddZipArchive(cptrFile:PChar; boIgnoreCase:Boolean;
           boIgnorePaths:Boolean); cdecl; external WS3DCoreLib ;

procedure wFileAddArchive(cptrFile:PChar; boIgnoreCase:Boolean; boIgnorePaths:Boolean;
          aType:wFileArchiveType; password:PChar); cdecl; external WS3DCoreLib ;

procedure wFileSetWorkingDirectory(cptrPath:PChar); cdecl; external WS3DCoreLib ;

function wFileGetWorkingDirectory():PChar; cdecl; external WS3DCoreLib ;

procedure wFileAddPakArchive(cptrFile:PChar; boIgnoreCase:Boolean;
          boIgnorePaths:Boolean); cdecl; external WS3DCoreLib ;

procedure wFileAddDirectory(cptrFile:PChar; boIgnoreCase:Boolean;
          boIgnorePaths:Boolean); cdecl; external WS3DCoreLib ;

function wFileIsExist(cptrFile:PChar):Boolean; cdecl; external WS3DCoreLib ;

function wFileGetAbsolutePath(cptrPath:PChar):PChar; cdecl; external WS3DCoreLib ;

function wFileGetRelativePath(cptrPath:PChar;
          directory:Pchar):PChar; cdecl; external WS3DCoreLib ;

{/Get the base part of a filename, i.e. the name without the directory part. }
{/If no directory is prefixed, the full name is returned. }
function wFileGetBaseName(cptrPath:PChar;
          keepExtension:Boolean):PChar; cdecl; external WS3DCoreLib ;

function wFileGetDirectory(cptrPath:PChar):PChar; cdecl; external WS3DCoreLib ;

{/for read/// }
function wFileOpenForRead(cptrFile:Pchar):wFile; cdecl; external WS3DCoreLib ;

function wFileRead(_file:wFile; buffer:Pointer;
          sizeToRead:UInt32):Int32; cdecl; external WS3DCoreLib ;

function wFileGetSize(_file:wFile):Int64; cdecl; external WS3DCoreLib ;

{/for write/// }
function wFileCreateForWrite(cptrFile:PChar;
          append:Boolean):wFile; cdecl; external WS3DCoreLib ;

function wFileWrite(_file:wFile; buffer:Pointer;
          sizeToWrite:UInt32):Int32; cdecl; external WS3DCoreLib ;

{/for read/write/// }
function wFileGetName(_file:wFile):PChar; cdecl; external WS3DCoreLib ;

function wFileGetPos(_file:wFile):Int64; cdecl; external WS3DCoreLib ;

function wFileSeek(_file:wFile; finalPos:Int64;
          relativeMovement:Boolean):Boolean; cdecl; external WS3DCoreLib ;

procedure wFileClose(_file:wFile); cdecl; external WS3DCoreLib ;

{/XMLReader/// }
function wXmlReaderCreate(cptrFile:PChar):wXmlReader; cdecl; external WS3DCoreLib ;

function wXMLReaderCreateUTF8(cptrFile:PChar):wXmlReader; cdecl; external WS3DCoreLib ;

{Returns attribute count of the current XML node }
function wXmlGetAttributesCount(xml:wXmlReader):UInt32; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute }
function wXmlGetAttributeNameByIdx(xml:wXmlReader;
          idx:Int32):PWChar; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute }
function wXmlGetAttributeValueByIdx(xml:wXmlReader;
          idx:Int32):PWChar; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute }
function wXmlGetAttributeValueByName(xml:wXmlReader;
          name:WString):PWChar; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute as float }
function wXmlGetAttributeValueFloatByIdx(xml:wXmlReader;
          idx:Int32):Float32; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute as float }
function wXmlGetAttributeValueFloatByName(xml:wXmlReader;
          name:WString):Float32; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute as integer }
function wXmlGetAttributeValueIntByIdx(xml:wXmlReader;
          idx:Int32):Int32; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute as integer }
function wXmlGetAttributeValueIntByName(xml:wXmlReader;
          name:WString):Int32; cdecl; external WS3DCoreLib ;

{Returns the value of an attribute in a safe way }
function wXmlGetAttributeValueSafeByName(xml:wXmlReader;
          name:WString):PWChar; cdecl; external WS3DCoreLib ;

{Returns the name of the current node }
function wXmlGetNodeName(xml:wXmlReader):PWChar; cdecl; external WS3DCoreLib ;

{Returns data of the current node }
function wXmlGetNodeData(xml:wXmlReader):PWChar; cdecl; external WS3DCoreLib ;

{Returns format of the source xml file }
function wXmlGetSourceFormat(xml:wXmlReader):wTextFormat; cdecl; external WS3DCoreLib ;

{Returns format of the strings returned by the parser }
function wXmlGetParserFormat(xml:wXmlReader):wTextFormat; cdecl; external WS3DCoreLib ;

{Returns the type of the current XML node }
function wXmlGetNodeType(xml:wXmlReader):wXmlNodeType; cdecl; external WS3DCoreLib ;

{Returns if an element is an empty element, like <foo /> }
function wXmlIsEmptyElement(xml:wXmlReader):Boolean; cdecl; external WS3DCoreLib ;

{Reads forward to the next xml node }
function wXmlRead(xml:wXmlReader):Boolean; cdecl; external WS3DCoreLib ;

procedure wXmlReaderDestroy(xml:wXmlReader); cdecl; external WS3DCoreLib ;

{/XmlWriter/// }
function wXmlWriterCreate(cptrFile:Pchar):wXmlWriter; cdecl; external WS3DCoreLib ;

{Writes the closing tag for an element. Like "</foo>" }
procedure wXmlWriteClosingTag(xml:wXmlWriter;
          name:WString); cdecl; external WS3DCoreLib ;

{Writes a comment into the xml file }
procedure wXmlWriteComment(xml:wXmlWriter;
          comment:WString); cdecl; external WS3DCoreLib ;

{Writes a line break }
procedure wXmlWriteLineBreak(xml:wXmlWriter); cdecl; external WS3DCoreLib ;

{Writes a text into the file }
procedure wXmlWriteText(xml:wXmlWriter; _file:WString); cdecl; external WS3DCoreLib ;

{Writes an xml 1.0 heade }
procedure wXmlWriteHeader(xml:wXmlWriter); cdecl; external WS3DCoreLib ;

procedure wXmlWriteElement(xml:wXmlWriter; name:WString; empty:Boolean;
          attr1Name:WString = nullStr; attr1Value:WString = nullStr;attr2Name:WString = nullStr; attr2Value:WString = nullStr;
          attr3Name:WString = nullStr; attr3Value:WString = nullStr; attr4Name:WString = nullStr;
          attr4Value:WString = nullStr; attr5Name:WString = nullStr; attr5Value:WString = nullStr); cdecl; external WS3DCoreLib ;

procedure wXmlWriterDestroy(xml:wXmlWriter); cdecl; external WS3DCoreLib ;

{/wInput/// }
{/keyboard/// }
{/Get character without waiting for Return to be pressed. }
function wInputWaitKey():Boolean; cdecl; external WS3DCoreLib ;

function wInputIsKeyEventAvailable():Boolean; cdecl; external WS3DCoreLib ;

function wInputReadKeyEvent():PwKeyEvent; cdecl; external WS3DCoreLib ;

function wInputIsKeyUp(num:wKeyCode):Boolean; cdecl; external WS3DCoreLib ;

function wInputIsKeyHit(num:wKeyCode):Boolean; cdecl; external WS3DCoreLib ;

function wInputIsKeyPressed(num:wKeyCode):Boolean; cdecl; external WS3DCoreLib ;

{/mouse/// }
function wInputIsMouseEventAvailable():Boolean; cdecl; external WS3DCoreLib ;

function wInputReadMouseEvent():PwMouseEvent; cdecl; external WS3DCoreLib ;

procedure wInputSetCursorVisible(boShow:Boolean); cdecl; external WS3DCoreLib ;

function wInputIsCursorVisible():Boolean; cdecl; external WS3DCoreLib ;

procedure wInputSetMousePosition(position:PwVector2i); cdecl; external WS3DCoreLib ;

procedure wInputGetMousePosition(position:PwVector2i); cdecl; external WS3DCoreLib ;

procedure wInputSetMouseLogicalPosition(position:PwVector2f); cdecl; external WS3DCoreLib ;

procedure wInputGetMouseLogicalPosition(position:PwVector2f); cdecl; external WS3DCoreLib ;

function wInputGetMouseWheel():Float32; cdecl; external WS3DCoreLib ;

procedure wInputGetMouseDelta(deltaPos:PwVector2i); cdecl; external WS3DCoreLib ;

function wInputIsMouseUp(num:wMouseButtons):Boolean; cdecl; external WS3DCoreLib ;

function wInputIsMouseHit(num:wMouseButtons):Boolean; cdecl; external WS3DCoreLib ;

function wInputIsMousePressed(num:wMouseButtons):Boolean; cdecl; external WS3DCoreLib ;

function wInputGetMouseX():Int32; cdecl; external WS3DCoreLib ;

function wInputGetMouseY():Int32; cdecl; external WS3DCoreLib ;

function wInputGetMouseDeltaX():Int32; cdecl; external WS3DCoreLib ;

function wInputGetMouseDeltaY():Int32; cdecl; external WS3DCoreLib ;

{/joystick/// }
function wInputActivateJoystick:Boolean; cdecl; external WS3DCoreLib ;

function wInputGetJoysitcksCount():UInt32; cdecl; external WS3DCoreLib ;

procedure wInputGetJoystickInfo(joyIndex:UInt32;
          joyInfo:PwJoystickInfo); cdecl; external WS3DCoreLib ;

function wInputIsJoystickEventAvailable():Boolean; cdecl; external WS3DCoreLib ;

function wInputReadJoystickEvent():PwJoystickEvent; cdecl; external WS3DCoreLib ;

{/wLight/// }
function wLightCreate(position:wVector3f;color:wColor4f;
          radius:Float32):wNode; cdecl; external WS3DCoreLib ;

procedure wLightSetAmbientColor(light:wNode;
          color:wColor4f); cdecl; external WS3DCoreLib ;

function wLightGetAmbientColor(light:wNode):wColor4f; cdecl; external WS3DCoreLib ;

procedure wLightSetSpecularColor(light:wNode; color:wColor4f); cdecl; external WS3DCoreLib ;

function wLightGetSpecularColor(light:wNode):wColor4f; cdecl; external WS3DCoreLib ;

procedure wLightSetAttenuation(light:wNode; attenuation:wVector3f); cdecl; external WS3DCoreLib ;

{.x-constant, .y- linear, .z- quadratic }
function wLightGetAttenuation(light:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wLightSetCastShadows(light:wNode;
          castShadows:Boolean); cdecl; external WS3DCoreLib ;

function wLightIsCastShadows(light:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wLightSetDiffuseColor(light:wNode;
          color:wColor4f); cdecl; external WS3DCoreLib ;

function wLightGetDiffuseColor(light:wNode):wColor4f; cdecl; external WS3DCoreLib ;

procedure wLightSetFallOff(light:wNode;
          FallOff:Float32); cdecl; external WS3DCoreLib ;

function wLightGetFallOff(light:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wLightSetInnerCone(light:wNode;
          InnerCone:Float32); cdecl; external WS3DCoreLib ;

function wLightGetInnerCone(light:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wLightSetOuterCone(light:wNode; OuterCone:Float32); cdecl; external WS3DCoreLib ;

function wLightGetOuterCone(light:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wLightSetRadius(light:wNode; Radius:Float32); cdecl; external WS3DCoreLib ;

function wLightGetRadius(light:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wLightSetType(light:wNode; _Type:wLightType); cdecl; external WS3DCoreLib ;

function wLightGetType(light:wNode):wLightType; cdecl; external WS3DCoreLib ;

{Read-ONLY! Direction of the light. }
{If Type is WLT_POINT, it is ignored. }
{Changed via light scene node's rotation. }
function wLightGetDirection(light:wNode):wVector3f; cdecl; external WS3DCoreLib ;

{/wBillboardGroup/// }
function wBillboardGroupCreate(position:wVector3f; rotation:wVector3f;
          scale:wVector3f):wNode; cdecl; external WS3DCoreLib ;

procedure wBillboardGroupSetShadows(node:wNode; direction:wVector3f;
          intensity:Float32; ambient:Float32); cdecl; external WS3DCoreLib ;

procedure wBillboardGroupResetShadows(node:wNode); cdecl; external WS3DCoreLib ;

function wBillboardGroupGetSize(node:wNode):UInt32; cdecl; external WS3DCoreLib ;

function wBillboardGroupGetMeshBuffer(node:wNode):wMeshBuffer;  cdecl; external WS3DCoreLib ;

function wBillboardGroupGetFirstElement(node:wNode):PwBillboard; cdecl; external WS3DCoreLib ;

procedure wBillboardGroupUpdateForce(node:wNode);  cdecl; external WS3DCoreLib ;

function wBillboardGroupAddElement(node:wNode; position:wVector3f;
          size:wVector2f; roll:Float32; color:wColor4s):PwBillboard; cdecl; external WS3DCoreLib ;

function wBillboardGroupAddElementByAxis(node:wNode; position:wVector3f;
          size:wVector2f; roll:Float32; color:wColor4s;
          axis:wVector3f):PwBillboard; cdecl; external WS3DCoreLib ;

procedure wBillboardGroupRemoveElement(node:wNode;
          billboard:PwBillboard); cdecl; external WS3DCoreLib ;

{/wBillboard/// }
function wBillboardCreate(position:wVector3f;
          size:wVector2f):wNode; cdecl; external WS3DCoreLib ;

procedure wBillboardSetEnabledAxis(billboard:wNode;
          param:wBillboardAxisParam); cdecl; external WS3DCoreLib ;

function wBillboardGetEnabledAxis(billboard:wNode):wBillboardAxisParam; cdecl; external WS3DCoreLib ;

procedure wBillboardSetColor(node:wNode;topColor:wColor4s;
          bottomColor:wColor4s); cdecl; external WS3DCoreLib ;

procedure wBillboardSetSize(node:wNode;
          size:wVector2f); cdecl; external WS3DCoreLib ;

function wBillboardCreateText(position:wVector3f; size:wVector2f; font:wFont;
          text:WString; topColor:wColor4s;bottomColor:wColor4s):wNode; cdecl; external WS3DCoreLib ;

{/wSkyBox/// }
function wSkyBoxCreate(texture_up:wTexture; texture_down:wTexture;
          texture_left:wTexture; texture_right:wTexture; texture_front:wTexture;
           texture_back:wTexture):wNode; cdecl; external WS3DCoreLib ;

{/wSkyDome/// }
function wSkyDomeCreate(texture_file:wTexture; horiRes:UInt32; vertRes:UInt32;texturePercentage:Float64;
          spherePercentage:Float64;domeRadius:Float64):wNode; cdecl; external WS3DCoreLib ;

procedure wSkyDomeSetColor(dome:wNode; horizonColor:wColor4s;
          zenithColor:wColor4s); cdecl; external WS3DCoreLib ;

procedure wSkyDomeSetColorBand(dome:wNode; horizonColor:wColor4s;
          position:Int32; fade:Float32; additive:Boolean); cdecl; external WS3DCoreLib ;

procedure wSkyDomeSetColorPoint(dome:wNode; horizonColor:wColor4s; position:wVector3f;
          radius:Float32; fade:Float32;additive:Boolean); cdecl; external WS3DCoreLib ;

{/wLodManager/// }
function wLodManagerCreate(fadeScale:UInt32; useAlpha:Boolean;
          callbackFuncPointer:PUInt32):wNode; cdecl; external WS3DCoreLib ;

procedure wLodManagerAddMesh(node:wNode; mesh:wMesh;
          distance:Float32); cdecl; external WS3DCoreLib ;

procedure wLodManagerSetMaterialMap(node:wNode; source:wMaterialTypes;
          target:wMaterialTypes); cdecl; external WS3DCoreLib ;

{/wZoneManager/// }
function wZoneManagerCreate(initialNearDistance:Float32;
          initialFarDistance:Float32):wNode; cdecl; external WS3DCoreLib ;

procedure wZoneManagerSetProperties(node:wNode; newNearDistance:Float32;
          newFarDistance:Float32; accumulateChildBoxes:Boolean); cdecl; external WS3DCoreLib ;

procedure wZoneManagerSetBoundingBox(node:wNode; position:wVector3f;
          size:wVector3f); cdecl; external WS3DCoreLib ;

procedure wZoneManagerAddTerrain(node:wNode; terrainSource:wNode;
          structureMap:Pchar; colorMap:Pchar;detailMap:Pchar;
            pos:wVector2i; sliceSize:Int32); cdecl; external WS3DCoreLib ;

{/wNode/// }
{/primitives/// }
function wNodeCreateEmpty():wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateCube(size:Float32; color:wColor4s):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateSphere(radius:Float32; polyCount:Int32;
          color:wColor4s):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateCylinder(tesselation:UInt32; radius:Float32; length:Float32;
          color:wColor4s):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateCone(tesselation:UInt32; radius:Float32; length:Float32;
          clorTop:wColor4s; clorBottom:wColor4s):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreatePlane(size:Float32; tileCount:UInt32;
          color:wColor4s):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateFromMesh(mesh:wMesh):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateFromStaticMesh(mesh:wMesh):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateFromMeshAsOctree(vptrMesh:wMesh; minimalPolysPerNode:Int32=512;
          alsoAddIfMeshPointerZero:Boolean=false):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateFromBatchingMesh(batchMesh:wMesh):wNode; cdecl; external WS3DCoreLib ;

function wNodeCreateFromBatchingMeshAsOctree(batchMesh:wMesh;minimalPolysPerNode:Int32;
          alsoAddIfMeshPointerZero:Boolean):wNode; cdecl; external WS3DCoreLib ;

procedure wNodeRemoveCollision(node:wNode;
          selector:wSelector); cdecl; external WS3DCoreLib ;

procedure wNodeAddCollision(node:wNode;
          selector:wSelector); cdecl; external WS3DCoreLib ;

{/wWater/// }
function wWaterSurfaceCreate(mesh:wMesh; waveHeight:Float32; waveSpeed:Float32;
          waveLength:Float32; position:wVector3f;rotation:wVector3f;
          scale:wVector3f):wNode; cdecl; external WS3DCoreLib ;

{/wRealWater/// }
function wRealWaterSurfaceCreate(bumpTexture:wTexture; size:wVector2f;
          renderSize:wVector2u):wNode; cdecl; external WS3DCoreLib ;

procedure wRealWaterSetWindForce(water:wNode;
          force:Float32); cdecl; external WS3DCoreLib ;

procedure wRealWaterSetWindDirection(water:wNode;
          direction:wVector2f); cdecl; external WS3DCoreLib ;

procedure wRealWaterSetWaveHeight(water:wNode;
          height:Float32); cdecl; external WS3DCoreLib ;

procedure wRealWaterSetColor(water:wNode;
          color:wColor4f); cdecl; external WS3DCoreLib ;

procedure wRealWaterSetColorBlendFactor(water:wNode;
          factor:Float32); cdecl; external WS3DCoreLib ;

{/wClouds/// }
function wCloudsCreate(texture:wTexture; lod:UInt32; depth:UInt32;
          density:UInt32):wNode; cdecl; external WS3DCoreLib ;

{/wRealClouds/// }
function wRealCloudsCreate(txture:wTexture; height:wVector3f; speed:wVector2f;
          textureScale:Float32):wNode; cdecl; external WS3DCoreLib ;

procedure wRealCloudsSetTextureTranslation(cloud:wNode;
          speed:wVector2f); cdecl; external WS3DCoreLib ;

function wRealCloudsGetTextureTranslation(cloud:wNode):wVector2f; cdecl; external WS3DCoreLib ;

procedure wRealCloudsSetTextureScale(cloud:wNode;
          scale:Float32); cdecl; external WS3DCoreLib ;

function wRealCloudsGetTextureScale(cloud:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wRealCloudsSetCloudHeight(cloud:wNode;
          height:wVector3f); cdecl; external WS3DCoreLib ;

function wRealCloudsGetCloudHeight(cloud:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wRealCloudsSetCloudRadius(cloud:wNode;
          radius:wVector2f); cdecl; external WS3DCoreLib ;

function wRealCloudsGetCloudRadius(cloud:wNode):wVector2f; cdecl; external WS3DCoreLib ;

procedure wRealCloudsSetColors(cloud:wNode; centerColor:wColor4s;
          innerColor:wColor4s; outerColor:wColor4s); cdecl; external WS3DCoreLib ;

procedure wRealCloudsGetColors(cloud:wNode; centerColor:PwColor4s;
          innerColor:PwColor4s; outerColor:PwColor4s); cdecl; external WS3DCoreLib ;

{/wLensFlare/// }
function wLensFlareCreate(texture:wTexture):wNode; cdecl; external WS3DCoreLib ;

procedure wLensFlareSetStrength(flare:wNode;
          strength:Float32); cdecl; external WS3DCoreLib ;

function wLensFlareGetStrength(flare:wNode):Float32; cdecl; external WS3DCoreLib ;

{/wGrass/// }
function wGrassCreate(terrain:wNode; position:wVector2i; patchSize:UInt32;
          fadeDistance:Float32; crossed:Boolean;grassScale:Float32;maxDensity:UInt32;
          dataPosition:wVector2u; heightMap:wImage;textureMap:wImage;
          grassMap:wImage; grassTexture:wTexture):wNode; cdecl; external WS3DCoreLib ;

procedure wGrassSetDensity(grass:wNode; density:UInt32;
          distance:Float32); cdecl; external WS3DCoreLib ;

procedure wGrassSetWind(grass:wNode; strength:Float32;
          res:Float32); cdecl; external WS3DCoreLib ;

function wGrassGetDrawingCount(grass:wNode):UInt32; cdecl; external WS3DCoreLib ;

{/wTreeGenerator///// }
function wTreeGeneratorCreate(xmlFilePath:Pchar):wNode; cdecl; external WS3DCoreLib ;

procedure wTreeGeneratorDestroy(generator:wNode); cdecl; external WS3DCoreLib ;

{/wTree/// }
function wTreeCreate(generator:wNode; seed:Int32;
          billboardTexture:wTexture):wNode; cdecl; external WS3DCoreLib ;

procedure wTreeSetDistances(tree:wNode; midRange:Float32;
          farRange:Float32); cdecl; external WS3DCoreLib ;

function wTreeGetLeafNode(tree:wNode):wNode; cdecl; external WS3DCoreLib ;

procedure wTreeSetLeafEnabled(tree:wNode;
          value:Boolean); cdecl; external WS3DCoreLib ;

function wTreeIsLeafEnabled(tree:wNode):Boolean; cdecl; external WS3DCoreLib ;

function wTreeGetMeshBuffer(tree:wNode;
          idx:UInt32):wMeshBuffer; cdecl; external WS3DCoreLib ;

{0-HIGH meshbuffer,  1- MID meshbuffer }
procedure wTreeSetBillboardVertexColor(tree:wNode;
          color:wColor4s); cdecl; external WS3DCoreLib ;

function wTreeGetBillboardVertexColor(tree:wNode):wColor4s; cdecl; external WS3DCoreLib ;

{/wWindGenerator }
function wWindGeneratorCreate:wNode; cdecl; external WS3DCoreLib ;

procedure wWindGeneratorDestroy(windGenerator:wNode); cdecl; external WS3DCoreLib ;

procedure wWindGeneratorSetStrength(windGenerator:wNode;
          strength:Float32); cdecl; external WS3DCoreLib ;

function wWindGeneratorGetStrength(windGenerator:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wWindGeneratorSetRegularity(windGenerator:wNode;
          regularity:Float32); cdecl; external WS3DCoreLib ;

function wWindGeneratorGetRegularity(windGenerator:wNode):Float32; cdecl; external WS3DCoreLib ;

function wWindGeneratorGetWind(windGenerator:wNode;position:wVector3f;
          timeMs:UInt32):wVector2f; cdecl; external WS3DCoreLib ;

{/wBolt/// }
function wBoltCreate():wNode; cdecl; external WS3DCoreLib ;

procedure wBoltSetProperties(bolt:wNode; start:wVector3f; _end:wVector3f;
          updateTime:UInt32; height:UInt32;thickness:Float32;parts:UInt32;
          bolts:UInt32; steddyend:Boolean; color:wColor4s); cdecl; external WS3DCoreLib ;

{/wBeam/// }
function wBeamCreate():wNode; cdecl; external WS3DCoreLib ;

procedure wBeamSetSize(beam:wNode; size:Float32); cdecl; external WS3DCoreLib ;

procedure wBeamSetPosition(beam:wNode; start:wVector3f; _end:wVector3f); cdecl; external WS3DCoreLib ;

{/wParticleSystem/// }
function wParticleSystemCreate(defaultemitter:Boolean; position:wVector3f;
          rotation:wVector3f; scale:wVector3f):wNode; cdecl; external WS3DCoreLib ;

function wParticleSystemGetEmitter(ps:wNode):wEmitter; cdecl; external WS3DCoreLib ;

procedure wParticleSystemSetEmitter(ps:wNode; em:wEmitter); cdecl; external WS3DCoreLib ;

procedure wParticleSystemRemoveAllAffectors(ps:wNode); cdecl; external WS3DCoreLib ;

procedure wParticleSystemSetGlobal(ps:wNode; value:Boolean); cdecl; external WS3DCoreLib ;

procedure wParticleSystemSetParticleSize(ps:wNode; size:wVector2f); cdecl; external WS3DCoreLib ;

procedure wParticleSystemClear(ps:wNode); cdecl; external WS3DCoreLib ;

{/wParticleBoxEmitter/// }
function wParticleBoxEmitterCreate(ps:wNode):wEmitter; cdecl; external WS3DCoreLib ;

procedure wParticleBoxEmitterSetBox(em:wEmitter;
          boxMin:wVector3f; boxMax:wVector3f); cdecl; external WS3DCoreLib ;

procedure wParticleBoxEmitterGetBox(em:wEmitter; boxMin:PwVector3f;
          boxMax:PwVector3f); cdecl; external WS3DCoreLib ;

{/wParticleCylinderEmitter/// }
function wParticleCylinderEmitterCreate(ps:wNode; center:wVector3f;
          radius:Float32; normal:wVector3f;
          lenght:Float32):wEmitter; cdecl; external WS3DCoreLib ;

procedure wParticleCylinderEmitterSetParameters(em:wEmitter;
          params:wParticleCylinderEmitter); cdecl; external WS3DCoreLib ;

procedure wParticleCylinderEmitterGetParameters(em:wEmitter;
          params:PwParticleCylinderEmitter); cdecl; external WS3DCoreLib ;

{/wParticleMeshEmitter/// }
function wParticleMeshEmitterCreate(ps:wNode;
          node:wNode):wEmitter; cdecl; external WS3DCoreLib ;

procedure wParticleMeshEmitterSetParameters(em:wEmitter;
          params:wParticleMeshEmitter); cdecl; external WS3DCoreLib ;

procedure wParticleMeshEmitterGetParameters(em:wEmitter;
          params:PwParticleMeshEmitter); cdecl; external WS3DCoreLib ;

{/wParticlePointEmitter/// }
function wParticlePointEmitterCreate(ps:wNode):wEmitter; cdecl; external WS3DCoreLib ;

{/wParticleRingEmitter/// }
function wParticleRingEmitterCreate(ps:wNode; center:wVector3f;radius:Float32;
          ringThickness:Float32):wEmitter; cdecl; external WS3DCoreLib ;

procedure wParticleRingEmitterSetParameters(em:wEmitter;
          params:wParticleRingEmitter); cdecl; external WS3DCoreLib ;

procedure wParticleRingEmitterGetParameters(em:wEmitter;
          params:PwParticleRingEmitter); cdecl; external WS3DCoreLib ;

{/wParticleSphereEmitter/// }
function wParticleSphereEmitterCreate(ps:wNode; center:wVector3f;
          radius:Float32):wEmitter; cdecl; external WS3DCoreLib ;

procedure wParticleSphereEmitterSetParameters(em:wEmitter;
          params:wParticleSphereEmitter); cdecl; external WS3DCoreLib ;

procedure wParticleSphereEmitterGetParameters(em:wEmitter;
          params:PwParticleSphereEmitter); cdecl; external WS3DCoreLib ;

{/wParticleEmitter- FOR ALL/// }
procedure wParticleEmitterSetParameters(em:wEmitter;
          params:wParticleEmitter); cdecl; external WS3DCoreLib ;

procedure wParticleEmitterGetParameters(em:wEmitter;
          params:PwParticleEmitter); cdecl; external WS3DCoreLib ;

{/wParticleAffector -FOR ALL/// }
procedure wParticleAffectorSetEnable(foa:wAffector;
          enable:Boolean); cdecl; external WS3DCoreLib ;

function wParticleAffectorIsEnable(foa:wAffector):Boolean; cdecl; external WS3DCoreLib ;

{/wParticleFadeOutAffector/// }
function wParticleFadeOutAffectorCreate(ps:wNode):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleFadeOutAffectorSetTime(paf:wAffector;
          fadeOutTime:UInt32); cdecl; external WS3DCoreLib ;

function wParticleFadeOutAffectorGetTime(paf:wAffector):UInt32; cdecl; external WS3DCoreLib ;

procedure wParticleFadeOutAffectorSetColor(paf:wAffector;
          targetColor:wColor4s); cdecl; external WS3DCoreLib ;

function wParticleFadeOutAffectorGetColor(paf:wAffector):wColor4s; cdecl; external WS3DCoreLib ;

{/wParticleGravityAffector/// }
function wParticleGravityAffectorCreate(ps:wNode):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleGravityAffectorSetGravity(paf:wAffector;
          gravity:wVector3f); cdecl; external WS3DCoreLib ;

function wParticleGravityAffectorGetGravity(paf:wAffector):wVector3f; cdecl; external WS3DCoreLib ;

procedure wParticleGravityAffectorSetTimeLost(paf:wAffector;
          timeForceLost:UInt32); cdecl; external WS3DCoreLib ;

function wParticleGravityAffectorGetTimeLost(paf:wAffector):UInt32; cdecl; external WS3DCoreLib ;

{/wParticleAttractionAffector/// }
function wParticleAttractionAffectorCreate(ps:wNode; point:wVector3f;
          speed:Float32):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleAttractionAffectorSetParameters(paf:wAffector;
          params:wParticleAttractionAffector); cdecl; external WS3DCoreLib ;

procedure wParticleAttractionAffectorGetParameters(paf:wAffector;
          params:PwParticleAttractionAffector); cdecl; external WS3DCoreLib ;

{/wParticleRotationAffector/// }
function wParticleRotationAffectorCreate(ps:wNode):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleRotationAffectorSetSpeed(paf:wAffector;
          speed:wVector3f); cdecl; external WS3DCoreLib ;

function wParticleRotationAffectorGetSpeed(paf:wAffector):wVector3f; cdecl; external WS3DCoreLib ;

procedure wParticleRotationAffectorSetPivot(paf:wAffector;
          pivotPoint:wVector3f); cdecl; external WS3DCoreLib ;

function wParticleRotationAffectorGetPivot(paf:wAffector):wVector3f; cdecl; external WS3DCoreLib ;

{/wParticleStopAffector/// }
function wParticleStopAffectorCreate(ps:wNode; em:wEmitter;
          time:UInt32):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleStopAffectorSetTime(paf:wAffector;
          time:UInt32); cdecl; external WS3DCoreLib ;

function wParticleStopAffectorGetTime(paf:wAffector):UInt32; cdecl; external WS3DCoreLib ;

{/wParticleColorMorphAffector/// }
function wParticleColorMorphAffectorCreate(ps:wNode):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleColorAffectorSetParameters(paf:wAffector;
          params:wParticleColorMorphAffector); cdecl; external WS3DCoreLib ;

procedure wParticleColorAffectorGetParameters(paf:wAffector;
          params:PwParticleColorMorphAffector); cdecl; external WS3DCoreLib ;

{/wParticlePushAffector/// }
function wParticlePushAffectorCreate(ps:wNode):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticlePushAffectorSetParameters(paf:wAffector;
          params:wParticlePushAffector); cdecl; external WS3DCoreLib ;

procedure wParticlePushAffectorGetParameters(paf:wAffector;
          params:PwParticlePushAffector); cdecl; external WS3DCoreLib ;

{/wParticleSplineAffector/// }
function wParticleSplineAffectorCreate(ps:wNode):wAffector; cdecl; external WS3DCoreLib ;

procedure wParticleSplineAffectorSetParameters(paf:wAffector;
          params:wParticleSplineAffector); cdecl; external WS3DCoreLib ;

procedure wParticleSplineAffectorGetParameters(paf:wAffector;
          params:PwParticleSplineAffector); cdecl; external WS3DCoreLib ;

{/wParticleScaleAffector/// }
function wParticleScaleAffectorCreate(ps:wNode;
          scaleTo:wVector2f):wAffector; cdecl; external WS3DCoreLib ;

{/wNode/// }
procedure wNodeSetDecalsEnabled(node:wNode); cdecl; external WS3DCoreLib ;

procedure wNodeSetParent(node:wNode;
          parent:wNode); cdecl; external WS3DCoreLib ;

function wNodeGetParent(node:wNode):wNode; cdecl; external WS3DCoreLib ;

procedure wNodeSetReadOnlyMaterials(node:wNode;
          readonly:Boolean); cdecl; external WS3DCoreLib ;

function wNodeIsReadOnlyMaterials(node:wNode):Boolean; cdecl; external WS3DCoreLib ;

function wNodeGetFirstChild(node:wNode;
          iterator:PUInt32):wNode; cdecl; external WS3DCoreLib ;

function wNodeGetChildsCount(node:wNode;
          iterator:PUInt32):UInt32; cdecl; external WS3DCoreLib ;

function wNodeGetNextChild(node:wNode;
          iterator:PUInt32):wNode; cdecl; external WS3DCoreLib ;

function wNodeIsLastChild(node:wNode;
          iterator:PUInt32):Boolean;  cdecl; external WS3DCoreLib ;

procedure wNodeSetId(node:wNode; id:Int32); cdecl; external WS3DCoreLib ;

function wNodeGetId(node:wNode):Int32; cdecl; external WS3DCoreLib ;

procedure wNodeSetName(node:wNode; name:PChar); cdecl; external WS3DCoreLib ;

function wNodeGetName(node:wNode):PChar; cdecl; external WS3DCoreLib ;

procedure wNodeSetUserData(node:wNode; newData:Pointer); cdecl; external WS3DCoreLib ;

function wNodeGetUserData(node:wNode):Pointer; cdecl; external WS3DCoreLib ;

procedure wNodeSetDebugMode(node:wNode;
          visible:wDebugMode); cdecl; external WS3DCoreLib ;

procedure wNodeSetDebugDataVisible(node:wNode;
          value:Boolean); cdecl; external WS3DCoreLib ;

function wNodeGetMaterialsCount(node:wNode):UInt32; cdecl; external WS3DCoreLib ;

function wNodeGetMaterial(node:wNode;
          matIndex:UInt32):wMaterial; cdecl; external WS3DCoreLib ;

procedure wNodeSetPosition(node:wNode;
          position:wVector3f); cdecl; external WS3DCoreLib ;

function wNodeGetPosition(node:wNode):wVector3f; cdecl; external WS3DCoreLib ;

function wNodeGetAbsolutePosition(node:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wNodeSetRotation(node:wNode;
          rotation:wVector3f); cdecl; external WS3DCoreLib ;

procedure wNodeSetAbsoluteRotation(node:wNode;
          rotation:wVector3f); cdecl; external WS3DCoreLib ;

function wNodeGetRotation(node:wNode):wVector3f; cdecl; external WS3DCoreLib ;

function wNodeGetAbsoluteRotation(node:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wNodeTurn(Entity:wNode;
          turn:wVector3f); cdecl; external WS3DCoreLib ;

procedure wNodeMove(Entity:wNode;
          direction:wVector3f); cdecl; external WS3DCoreLib ;

procedure wNodeRotateToNode(Entity1:wNode;
          Entity2:wNode); cdecl; external WS3DCoreLib ;

function wNodesGetBetweenDistance(nodeA:wNode;
          nodeB:wNode):Float32; cdecl; external WS3DCoreLib ;

function wNodesAreIntersecting(nodeA:wNode;
          nodeB:wNode):Boolean; cdecl; external WS3DCoreLib ;

function wNodeIsPointInside(node:wNode;
          pos:wVector3f):Boolean; cdecl; external WS3DCoreLib ;

procedure wNodeDrawBoundingBox(node:wNode;
          color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wNodeGetBoundingBox(Node:wNode; min:PwVector3f;
          max:PwVector3f); cdecl; external WS3DCoreLib ;

procedure wNodeGetTransformedBoundingBox(Node:wNode; min:PwVector3f;
          max:PwVector3f); cdecl; external WS3DCoreLib ;

procedure wNodeSetScale(node:wNode; scale:wVector3f); cdecl; external WS3DCoreLib ;

function wNodeGetScale(node:wNode):wVector3f; cdecl; external WS3DCoreLib ;

function wNodeDuplicate(entity:wNode):wNode; cdecl; external WS3DCoreLib ;

function wNodeGetJointByName(node:wNode;
          node_name:Pchar):wNode; cdecl; external WS3DCoreLib ;

function wNodeGetJointById(node:wNode;
          Id:UInt32):wNode; cdecl; external WS3DCoreLib ;

function wNodeGetJointsCount(node:wNode):Int32; cdecl; external WS3DCoreLib ;

procedure wNodeSetJointSkinningSpace(bone:wNode;
          space:wBoneSkinningSpace); cdecl; external WS3DCoreLib ;

function wNodeGetJointSkinningSpace(bone:wNode):wBoneSkinningSpace; cdecl; external WS3DCoreLib ;

procedure wNodeSetRenderFromIdentity(node:wNode;
          value:Boolean); cdecl; external WS3DCoreLib ;

procedure wNodeAddShadowVolume(node:wNode; mesh:wMesh;zfailMethod:Boolean;
          infinity:Float32; oldStyle:Boolean); cdecl; external WS3DCoreLib ;

function wNodeAddShadowVolumeFromMeshBuffer(nodeParent:wNode; meshbuffer:wMeshBuffer;
          zfailMethod:Boolean; infinity:Float32; oldStyle:Boolean):wNode; cdecl; external WS3DCoreLib ;

procedure wNodeUpdateShadow(shadow:wNode); cdecl; external WS3DCoreLib ;

procedure wNodeSetVisibility(node:wNode; visible:Boolean); cdecl; external WS3DCoreLib ;

function wNodeIsVisible(node:wNode):Boolean; cdecl; external WS3DCoreLib ;

function wNodeIsInView(node:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wNodeDestroy(node:wNode); cdecl; external WS3DCoreLib ;

procedure wNodeSetMesh(node:wNode; mesh:wMesh); cdecl; external WS3DCoreLib ;

function wNodeGetMesh(node:wNode):wMesh; cdecl; external WS3DCoreLib ;

procedure wNodeSetRotationPositionChange(node:wNode;angles:wVector3f;
          offset:wVector3f; forwardStore:PwVector3f; upStore:PwVector3f;
          numOffsets:UInt32; offsetStore:PwVector3f); cdecl; external WS3DCoreLib ;

procedure wNodeSetCullingState(node:wNode;
          state:wCullingState); cdecl; external WS3DCoreLib ;

function wNodeGetType(node:wNode):wSceneNodeType; cdecl; external WS3DCoreLib ;

procedure wNodeSetAnimationRange(node:wNode;
          range:wVector2i); cdecl; external WS3DCoreLib ;

procedure wNodePlayMD2Animation(node:wNode;
          iAnimation:wMd2AnimationType); cdecl; external WS3DCoreLib ;

procedure wNodeSetAnimationSpeed(node:wNode;
          fSpeed:Float32); cdecl; external WS3DCoreLib ;

procedure wNodeSetAnimationFrame(node:wNode;
          fFrame:Float32); cdecl; external WS3DCoreLib ;

function wNodeGetAnimationFrame(node:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wNodeSetTransitionTime(node:wNode;
          fTime:Float32); cdecl; external WS3DCoreLib ;

procedure wNodeAnimateJoints(node:wNode); cdecl; external WS3DCoreLib ;

procedure wNodeSetJointMode(node:wNode;
          mode:wJointMode); cdecl; external WS3DCoreLib ;

procedure wNodeSetAnimationLoopMode(node:wNode;
          value:Boolean); cdecl; external WS3DCoreLib ;

procedure wNodeDestroyAllAnimators(node:wNode); cdecl; external WS3DCoreLib ;

function wNodeGetAnimatorsCount(node:wNode):UInt32; cdecl; external WS3DCoreLib ;

function wNodeGetFirstAnimator(node:wNode):wAnimator; cdecl; external WS3DCoreLib ;

function wNodeGetLastAnimator(node:wNode):wAnimator; cdecl; external WS3DCoreLib ;

function wNodeGetAnimatorByIndex(node:wNode;
          index:UInt32):wAnimator; cdecl; external WS3DCoreLib ;

procedure wNodeOnAnimate(node:wNode; timeMs:UInt32); cdecl; external WS3DCoreLib ;

procedure wNodeDraw(node:wNode); cdecl; external WS3DCoreLib ;

procedure wNodeUpdateAbsolutePosition(node:wNode); cdecl; external WS3DCoreLib ;

{/wMaterial/// }
procedure wMaterialSetTexture(material:wMaterial;
          texIdx:UInt32; texture:wTexture); cdecl; external WS3DCoreLib ;

function wMaterialGetTexture(material:wMaterial;
          texIdx:UInt32):wTexture; cdecl; external WS3DCoreLib ;

procedure wMaterialScaleTexture(material:wMaterial;
          texIdx:UInt32; scale:wVector2f); cdecl; external WS3DCoreLib ;

procedure wMaterialScaleTextureFromCenter(material:wMaterial;
          texIdx:UInt32; scale:wVector2f); cdecl; external WS3DCoreLib ;

procedure wMaterialTranslateTexture(material:wMaterial;
          texIdx:UInt32; translate:wVector2f); cdecl; external WS3DCoreLib ;

procedure wMaterialTranslateTextureTransposed(material:wMaterial;
          texIdx:UInt32; translate:wVector2f); cdecl; external WS3DCoreLib ;

procedure wMaterialRotateTexture(material:wMaterial;
          texIdx:UInt32; angle:Float32); cdecl; external WS3DCoreLib ;

procedure wMaterialSetTextureWrapUMode(material:wMaterial;
          texIdx:UInt32; value:wTextureClamp); cdecl; external WS3DCoreLib ;

function wMaterialGetTextureWrapUMode(material:wMaterial;
          texIdx:UInt32):wTextureClamp; cdecl; external WS3DCoreLib ;

procedure wMaterialSetTextureWrapVMode(material:wMaterial;
          texIdx:UInt32; value:wTextureClamp); cdecl; external WS3DCoreLib ;

function wMaterialGetTextureWrapVMode(material:wMaterial;
          texIdx:UInt32):wTextureClamp; cdecl; external WS3DCoreLib ;

procedure wMaterialSetTextureLodBias(material:wMaterial;
          texIdx:UInt32; lodBias:UInt32); cdecl; external WS3DCoreLib ;

function wMaterialGetTextureLodBias(material:wMaterial;
          texIdx:UInt32):UInt32; cdecl; external WS3DCoreLib ;

procedure wMaterialSetFlag(material:wMaterial;
          Flag:wMaterialFlags; boValue:Boolean); cdecl; external WS3DCoreLib ;

function wMaterialGetFlag(material:wMaterial;
          matFlag:wMaterialFlags):Boolean; cdecl; external WS3DCoreLib ;

procedure wMaterialSetType(material:wMaterial;
          _type:wMaterialTypes); cdecl; external WS3DCoreLib ;

procedure wMaterialSetShininess(material:wMaterial;
          shininess:Float32); cdecl; external WS3DCoreLib ;

function wMaterialGetShininess(material:wMaterial):Float32; cdecl; external WS3DCoreLib ;

procedure wMaterialSetVertexColoringMode(material:wMaterial;
          colorMaterial:wColorMaterial); cdecl; external WS3DCoreLib ;

function wMaterialGetVertexColoringMode(material:wMaterial):wColorMaterial; cdecl; external WS3DCoreLib ;

procedure wMaterialSetSpecularColor(material:wMaterial;
          color:wColor4s); cdecl; external WS3DCoreLib ;

function wMaterialGetSpecularColor(material:wMaterial):wColor4s; cdecl; external WS3DCoreLib ;

procedure wMaterialSetDiffuseColor(material:wMaterial;
          color:wColor4s); cdecl; external WS3DCoreLib ;

function wMaterialGetDiffuseColor(material:wMaterial):wColor4s; cdecl; external WS3DCoreLib ;

procedure wMaterialSetAmbientColor(material:wMaterial;
          color:wColor4s); cdecl; external WS3DCoreLib ;

function wMaterialGetAmbientColor(material:wMaterial):wColor4s; cdecl; external WS3DCoreLib ;

procedure wMaterialSetEmissiveColor(material:wMaterial;
          color:wColor4s); cdecl; external WS3DCoreLib ;

function wMaterialGetEmissiveColor(material:wMaterial):wColor4s; cdecl; external WS3DCoreLib ;

procedure wMaterialSetTypeParameter(material:wMaterial;
          param1:Float32); cdecl; external WS3DCoreLib ;

function wMaterialGetTypeParameter(material:wMaterial):Float32; cdecl; external WS3DCoreLib ;

procedure wMaterialSetTypeParameter2(material:wMaterial;
          param2:Float32); cdecl; external WS3DCoreLib ;

function wMaterialGetTypeParameter2(material:wMaterial):Float32; cdecl; external WS3DCoreLib ;

procedure wMaterialSetBlendingMode(material:wMaterial;blendSrc:wBlendFactor;
          blendDest:wBlendFactor); cdecl; external WS3DCoreLib ;

{wMaterialGetBlendingMode = wMaterialGetTypeParameter }
procedure wMaterialSetLineThickness(material:wMaterial;
          lineThickness:Float32); cdecl; external WS3DCoreLib ;

function wMaterialGetLineThickness(material:wMaterial):Float32; cdecl; external WS3DCoreLib ;

procedure wMaterialSetColorMask(material:wMaterial;
          value:wColorPlane); cdecl; external WS3DCoreLib ;

function wMaterialGetColorMask(material:wMaterial):wColorPlane; cdecl; external WS3DCoreLib ;

procedure wMaterialSetAntiAliasingMode(material:wMaterial; mode:wAntiAliasingMode); cdecl; external WS3DCoreLib ;

function wMaterialGetAntiAliasingMode(material:wMaterial):wAntiAliasingMode; cdecl; external WS3DCoreLib ;

{/wShader/// }
function wShaderCreateNamedVertexConstant(shader:wShader; name:Pchar; preset:wShaderConstants;
          floats:PFloat32; count:Int32):Boolean; cdecl; external WS3DCoreLib ;

function wShaderCreateNamedPixelConstant(shader:wShader; name:PChar;
          preset:wShaderConstants; floats:PFloat32; count:Int32):Boolean; cdecl; external WS3DCoreLib ;

function wShaderCreateAddressedVertexConstant(shader:wShader; address:Int32;
          preset:wShaderConstants; floats:PFloat32; count:Int32):Boolean; cdecl; external WS3DCoreLib ;

function wShaderCreateAddressedPixelConstant(shader:wShader; address:Int32;
          preset:wShaderConstants; floats:PFloat32; count:Int32):Boolean; cdecl; external WS3DCoreLib ;

function wShaderAddHighLevelMaterial(vertexShaderProgram:PChar; vertexShaderEntryPointName:PChar;
         wVersion:wVertexShaderVersion; pixelShaderProgram:PChar; pixelShaderEntryPointName:PChar;
         pVersion:wPixelShaderVersion; materialType:wMaterialTypes; userData:Int32):wShader; cdecl; external WS3DCoreLib ;

function wShaderAddHighLevelMaterialFromFiles(vertexShaderProgramFileName:PChar; vertexShaderEntryPointName:PChar;
         wVersion:wVertexShaderVersion; pixelShaderProgramFileName:PChar; pixelShaderEntryPointName:PChar;
         pVersion:wPixelShaderVersion; materialType:wMaterialTypes; userData:Int32):wShader; cdecl; external WS3DCoreLib ;

function wShaderAddMaterial(vertexShaderProgram:PChar; pixelShaderProgram:PChar;
         materialType:wMaterialTypes; userData:Int32):wShader; cdecl; external WS3DCoreLib ;

function wShaderAddMaterialFromFiles(vertexShaderProgramFileName:PChar; pixelShaderProgramFileName:PChar;
         materialType:wMaterialTypes; userData:Int32):wShader; cdecl; external WS3DCoreLib ;

{/with geometry shader }
function wShaderAddHighLevelMaterialEx(vertexShaderProgram:PChar; vertexShaderEntryPointName:PChar;
         wVersion:wVertexShaderVersion; pixelShaderProgram:PChar; pixelShaderEntryPointName:PChar;
         pVersion:wPixelShaderVersion; geometryShaderProgram:PChar; geometryShaderEntryPointName:PChar;
         gVersion:wGeometryShaderVersion; inType:wPrimitiveType;outType:wPrimitiveType;
         verticesOut:UInt32; materialType:wMaterialTypes; userData:Int32):wShader; cdecl; external WS3DCoreLib ;

{/with geometry shader }
function wShaderAddHighLevelMaterialFromFilesEx(vertexShaderProgramFileName:PChar; vertexShaderEntryPointName:PChar;
         wVersion:wVertexShaderVersion; pixelShaderProgramFileName:PChar; pixelShaderEntryPointName:PChar;
         pVersion:wPixelShaderVersion; geometryShaderProgram:Pchar; geometryShaderEntryPointName:PChar;
         gVersion:wGeometryShaderVersion; inType:wPrimitiveType;outType:wPrimitiveType; verticesOut:UInt32;
         materialType:wMaterialTypes; userData:Int32):wShader; cdecl; external WS3DCoreLib ;

{/wMesh/// }
function wMeshLoad(cptrFile:Pchar;
         ToTangents:Boolean=false):wMesh; cdecl; external WS3DCoreLib ;

function wMeshCreate(cptrMeshName:PChar):wMesh; cdecl; external WS3DCoreLib ;

procedure wMeshAddMeshBuffer(mesh:wMesh; meshbuffer:wMeshBuffer); cdecl; external WS3DCoreLib ;

function wMeshCreateSphere(name:PChar; radius:Float32; polyCount:Int32):wMesh; cdecl; external WS3DCoreLib ;

function wMeshCreateCube():wMesh; cdecl; external WS3DCoreLib ;

function wMeshSave(mesh:wMesh; _type:wMeshFileFormat;
         filename:PChar):Int32; cdecl; external WS3DCoreLib ;

procedure wMeshDestroy(mesh:wMesh); cdecl; external WS3DCoreLib ;

function wMeshSetName(mesh:wMesh; name:PChar):Boolean; cdecl; external WS3DCoreLib ;

function wMeshGetName(mesh:wMesh):PChar; cdecl; external WS3DCoreLib ;

function wMeshGetType(mesh:wMesh):wAnimatedMeshType; cdecl; external WS3DCoreLib ;

procedure wMeshFlipSurface(mesh:wMesh); cdecl; external WS3DCoreLib ;

procedure wMeshMakePlanarTextureMapping(mesh:wMesh;
         resolution:Float32); cdecl; external WS3DCoreLib ;

procedure wMeshMakePlanarTextureMappingAdvanced(mesh:wMesh; resolutionH:Float32;
         resolutionV:Float32; axis:UInt8; offset:wVector3f); cdecl; external WS3DCoreLib ;

function wMeshCreateStaticWithTangents(aMesh:wMesh):wMesh; cdecl; external WS3DCoreLib ;

procedure wMeshRecalculateNormals(mesh:wMesh;
         smooth:Boolean=false;angleWeighted:Boolean=false); cdecl; external WS3DCoreLib ;

procedure wMeshRecalculateTangents(mesh:wMesh; recalculateNormals:Boolean=false;
         smooth:Boolean=false; angleWeighted:Boolean=false); cdecl; external WS3DCoreLib ;

function wMeshCreateHillPlane(meshname:PChar; tilesSize:wVector2f; tilesCount:wVector2i;
         material:wMaterial; hillHeight:Float32;countHills:wVector2f;
         texRepeatCount:wVector2f):wMesh; cdecl; external WS3DCoreLib ;

function wMeshCreateArrow(nameName:PChar; cylinderColor:wColor4s; coneColor:wColor4s;
         tesselationCylinder:UInt32=4; tesselationCone:UInt32=8;height:Float32=1.0;heightCylinder:Float32=0.05;
         widthCylinder:Float32=0.05; widthCone:Float32=0.3):wMesh; cdecl; external WS3DCoreLib ;

function wMeshCreateBatching():wMesh; cdecl; external WS3DCoreLib ;

procedure wMeshAddToBatching(meshBatch:wMesh; mesh:wMesh; position:wVector3f;
         rotation:wVector3f; scale:wVector3f); cdecl; external WS3DCoreLib ;

procedure wMeshUpdateBatching(meshBatch:wMesh); cdecl; external WS3DCoreLib ;

procedure wMeshFinalizeBatching(meshBatch:wMesh); cdecl; external WS3DCoreLib ;

procedure wMeshClearBatching(meshBatch:wMesh); cdecl; external WS3DCoreLib ;

procedure wMeshDestroyBatching(meshBatch:wMesh); cdecl; external WS3DCoreLib ;

procedure wMeshEnableHardwareAcceleration(mesh:wMesh; iFrame:UInt32=0); cdecl; external WS3DCoreLib ;

function wMeshGetFramesCount(mesh:wMesh):UInt32; cdecl; external WS3DCoreLib ;

function wMeshGetIndicesCount(mesh:wMesh; iFrame:UInt32=0;
         iMeshBuffer:UInt32=0):UInt32; cdecl; external WS3DCoreLib ;

function wMeshGetIndices(mesh:wMesh; iFrame:UInt32=0;
         iMeshBuffer:UInt32=0):PUInt16; cdecl; external WS3DCoreLib ;

procedure wMeshSetIndices(mesh:wMesh; iFrame:UInt32;
         indicies:PUInt16; iMeshBuffer:UInt32=0); cdecl; external WS3DCoreLib ;

function wMeshGetVerticesCount(mesh:wMesh; iFrame:UInt32=0;
         iMeshBuffer:UInt32=0):UInt32; cdecl; external WS3DCoreLib ;

procedure wMeshGetVertices(mesh:wMesh; iFrame:UInt32;
         verts:PwVert; iMeshBuffer:UInt32=0); cdecl; external WS3DCoreLib ;

function wMeshGetVerticesMemory(mesh:wMesh; iFrame:UInt32=0;
         iMeshBuffer:UInt32=0):PUInt32; cdecl; external WS3DCoreLib ;

procedure wMeshSetVertices(mesh:wMesh; iFrame:UInt32; verts:PwVert;
         iMeshBuffer:UInt32=0); cdecl; external WS3DCoreLib ;

procedure wMeshSetScale(mesh:wMesh; scale:Float32; iFrame:UInt32=0;
         iMeshBuffer:UInt32=0; sourceMesh:wMesh=nil); cdecl; external WS3DCoreLib ;

procedure wMeshSetRotation(mesh:wMesh; rot:wVector3f); cdecl; external WS3DCoreLib ;

procedure wMeshSetVerticesColors(mesh:wMesh; iFrame:UInt32; verticesColor:PwColor4s;groupCount:UInt32=0;
         startPos:PUInt32=nil;endPos:PUInt32=nil; iMeshBuffer:UInt32=0); cdecl; external WS3DCoreLib ;

procedure wMeshSetVerticesAlpha(mesh:wMesh; iFrame:UInt32;
         value:UInt8); cdecl; external WS3DCoreLib ;

procedure wMeshSetVerticesCoords(mesh:wMesh; iFrame:UInt32; vertexCoord:PwVector3f; groupCount:UInt32=0;
         startPos:PUInt32=nil;endPos:PUInt32=nil; iMeshBuffer:UInt32=0); cdecl; external WS3DCoreLib ;

procedure wMeshSetVerticesSingleColor(mesh:wMesh; iFrame:UInt32;
            verticesColor:wColor4s;groupCount:UInt32=0; startPos:PUInt32=nil;
            endPos:PUInt32=nil; iMeshBuffer:UInt32=0); cdecl; external WS3DCoreLib ;

procedure wMeshGetBoundingBox(mesh:wMesh; min:PwVector3f; max:PwVector3f); cdecl; external WS3DCoreLib ;

function wMeshDuplicate(src:wMesh):wMesh; cdecl; external WS3DCoreLib ;

procedure wMeshFit(src:wMesh; pivot:wVector3f; delta:PwVector3f); cdecl; external WS3DCoreLib ;

function wMeshIsEmpty(mesh:wMesh):Boolean; cdecl; external WS3DCoreLib ;

function wMeshGetBuffersCount(mesh:wMesh; iFrame:UInt32=0):UInt32; cdecl; external WS3DCoreLib ;

function wMeshGetBuffer(mesh:wMesh; iFrame:UInt32=0;
            index:UInt32=0):wMeshBuffer; cdecl; external WS3DCoreLib ;

{/wMeshBuffer/// }
function wMeshBufferCreate(iVertexCount:UInt32; vVertices:PwVert;iIndicesCount:UInt32;
            usIndices:PUInt16):wMeshBuffer; cdecl; external WS3DCoreLib ;

procedure wMeshBufferDestroy(buf:wMeshBuffer); cdecl; external WS3DCoreLib ;

procedure wMeshBufferAddToBatching(meshBatch:wMesh; buffer:wMeshBuffer; position:wVector3f;
            rotation:wVector3f; scale:wVector3f); cdecl; external WS3DCoreLib ;

function wMeshBufferGetMaterial(buf:wMeshBuffer):wMaterial; cdecl; external WS3DCoreLib ;

{/wBsp/// }
{/Get BSP Entity List/// }
function wBspGetEntityList(mesh:wMesh):PUInt32; cdecl; external WS3DCoreLib ;

{/Get BSP Entity List size/// }
function wBspGetEntityListSize(entityList:PUInt32):Int32; cdecl; external WS3DCoreLib ;

{/Get First (vec.x) and Last (vec.y) BSP Entity Index/// }
function wBspGetEntityIndexByName(entityList:PUInt32;
            EntityName:PChar):wVector2i; cdecl; external WS3DCoreLib ;

{/Name BSP Entity From Index }
function wBspGetEntityNameByIndex(entityList:PUInt32;
            number:UInt32):PChar; cdecl; external WS3DCoreLib ;

{/Mesh from BSP Brush/// }
function wBspGetEntityMeshFromBrush(bspMesh:wMesh; entityList:PUInt32;
            index:Int32):wMesh; cdecl; external WS3DCoreLib ;

{/BSP VarGroup/// }
function wBspGetVarGroupByIndex(entityList:PUInt32;
            index:Int32):PUInt32; cdecl; external WS3DCoreLib ;

function wBspGetVarGroupSize(entityList:PUInt32;
            index:Int32):UInt32; cdecl; external WS3DCoreLib ;

function wBspGetVarGroupValueAsVec(group:PUInt32; strName:PChar;
            parsePos:UInt32):wVector3f; cdecl; external WS3DCoreLib ;

function wBspGetVarGroupValueAsFloat(group:PUInt32; strName:PChar;
            parsePos:UInt32):Float32; cdecl; external WS3DCoreLib ;

function wBspGetVarGroupValueAsString(group:PUInt32;
            strName:PChar):PChar; cdecl; external WS3DCoreLib ;

function wBspCreateFromMesh(mesh:wMesh; isTangent:Boolean=true;
            isOctree:Boolean=true;fileEntity:Pchar=nullstr;isLoadShaders:Boolean=true;
            PolysPerNode:UInt32=512):wNode; cdecl; external WS3DCoreLib ;

{/Occlusion Query }
procedure wOcclusionQueryAddNode(node:wNode); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryAddMesh(node:wNode;
            mesh:wMesh); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryUpdate(node:wNode;
            block:Boolean); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryRun(node:wNode;
            visible:Boolean); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryUpdateAll(block:Boolean); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryRunAll(visible:Boolean); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryRemoveNode(node:wNode); cdecl; external WS3DCoreLib ;

procedure wOcclusionQueryRemoveAll(); cdecl; external WS3DCoreLib ;

function wOcclusionQueryGetResult(node:wNode):UInt32; cdecl; external WS3DCoreLib ;

{/wSphericalTerrain/// }
function wSphericalTerrainCreate(cptrFile0:PChar; cptrFile1:PChar; cptrFile2:PChar;
            cptrFile3:PChar;cptrFile4:PChar;cptrFile5:PChar; position:wVector3f; rotation:wVector3f;
            scale:wVector3f;color:wColor4s;smootFactor:Int32; spherical:Boolean;
            maxLOD:Int32; patchSize:wTerrainPatchSize):wNode; cdecl; external WS3DCoreLib ;

procedure wSphericalTerrainSetTextures(terrain:wNode; textureTop:wTexture; textureFront:wTexture;
            textureBack:wTexture; textureLeft:wTexture;textureRight:wTexture;
            textureBottom:wTexture; materialIndex:UInt32); cdecl; external WS3DCoreLib ;

procedure wSphericalTerrainLoadVertexColor(terrain:wNode; imageTop:wImage; imageFront:wImage;
            imageBack:wImage; imageLeft:wImage;imageRight:wImage;
            imageBottom:wImage); cdecl; external WS3DCoreLib ;

function wSphericalTerrainGetSurfacePosition(terrain:wNode; face:Int32;
            logicalPos:wVector2f):wVector3f; cdecl; external WS3DCoreLib ;

function wSphericalTerrainGetSurfaceAngle(terrain:wNode; face:Int32;
            logicalPos:wVector2f):wVector3f; cdecl; external WS3DCoreLib ;

function wSphericalTerrainGetSurfaceLogicalPosition(terrain:wNode;
            position:wVector3f; face:Plongint):wVector2f; cdecl; external WS3DCoreLib ;

{/wTerrain/// }
function wTerrainCreate(cptrFile:PChar; position:wVector3f; rotation:wVector3f;
            scale:wVector3f;color:wColor4s;smoothing:Int32=0; maxLOD:Int32=5;
            patchSize:wTerrainPatchSize=wTPS_17):wNode; cdecl; external WS3DCoreLib ;

procedure wTerrainScaleDetailTexture(terrain:wNode;
            scale:wVector2f); cdecl; external WS3DCoreLib ;

function wTerrainGetHeight(terrain:wNode; positionXZ:wVector2f):Float32; cdecl; external WS3DCoreLib ;

{/wTiledTerrain/// }
function wTiledTerrainCreate(image:wImage; tileSize:Int32; dataSize:wVector2i;
            position:wVector3f; rotation:wVector3f; scale:wVector3f;
            color:wColor4s;smoothing:Int32=0; maxLOD:Int32=5;
            patchSize:wTerrainPatchSize=wTPS_17):wNode; cdecl; external WS3DCoreLib ;

procedure wTiledTerrainAddTile(terrain:wNode; neighbour:wNode;
            edge:wTiledTerrainEdge); cdecl; external WS3DCoreLib ;

procedure wTiledTerrainSetTileStructure(terrain:wNode; image:wImage;
            data:wVector2i); cdecl; external WS3DCoreLib ;

procedure wTiledTerrainSetTileColor(terrain:wNode; image:wImage;
            data:wVector2i); cdecl; external WS3DCoreLib ;

{/wSoundBuffer }
function wSoundBufferLoad(filePath:PChar):wSoundBuffer; cdecl; external WS3DCoreLib ;

function wSoundBufferLoadFromMemory(data:PChar; length:Int32;
            extension:PChar):wSoundBuffer; cdecl; external WS3DCoreLib ;

procedure wSoundBufferDestroy(buf:wSoundBuffer); cdecl; external WS3DCoreLib ;

{/wSound/// }
function wSoundLoad(filePath:Pchar;
            stream:Boolean=false):wSound; cdecl; external WS3DCoreLib ;

function wSoundLoadFromMemory(name:PChar; data:PChar; length:Int32;
            extension:PChar):wSound; cdecl; external WS3DCoreLib ;

function wSoundLoadFromRaw(name:PChar; data:PChar; length:Int32; frequency:UInt32;
            format:wAudioFormats):wSound; cdecl; external WS3DCoreLib ;

function wSoundCreateFromBuffer(buf:wSoundBuffer):wSound; cdecl; external WS3DCoreLib ;

function wSoundIsPlaying(sound:wSound):Boolean; cdecl; external WS3DCoreLib ;

function wSoundIsPaused(sound:wSound):Boolean; cdecl; external WS3DCoreLib ;

function wSoundIsStopped(sound:wSound):Boolean; cdecl; external WS3DCoreLib ;

procedure wSoundSetVelocity(sound:wSound;
            velocity:wVector3f); cdecl; external WS3DCoreLib ;

function wSoundGetVelocity(sound:wSound):wVector3f; cdecl; external WS3DCoreLib ;

procedure wSoundSetDirection(sound:wSound;
            direction:wVector3f); cdecl; external WS3DCoreLib ;

function wSoundGetDirection(sound:wSound):wVector3f; cdecl; external WS3DCoreLib ;

procedure wSoundSetVolume(sound:wSound; value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetVolume(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetMaxVolume(sound:wSound;
            value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetMaxVolume(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetMinVolume(sound:wSound;
            value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetMinVolume(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetPitch(sound:wSound;
            value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetPitch(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetRollOffFactor(sound:wSound;
            value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetRollOffFactor(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetStrength(sound:wSound;
            value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetStrength(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetMinDistance(sound:wSound;
            value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetMinDistance(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetMaxDistance(sound:wSound;
            Value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetMaxDistance(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetInnerConeAngle(sound:wSound;
            Value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetInnerConeAngle(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetOuterConeAngle(sound:wSound;
            Value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetOuterConeAngle(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetOuterConeVolume(sound:wSound;
            Value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetOuterConeVolume(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetDopplerStrength(sound:wSound;
            Value:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetDopplerStrength(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetDopplerVelocity(sound:wSound;
            velocity:wVector3f); cdecl; external WS3DCoreLib ;

function wSoundGetDopplerVelocity(sound:wSound):wVector3f; cdecl; external WS3DCoreLib ;

function wSoundCalculateGain(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetRelative(sound:wSound;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wSoundIsRelative(sound:wSound):Boolean; cdecl; external WS3DCoreLib ;

function wSoundPlay(sound:wSound;
            loop:Boolean):Boolean; cdecl; external WS3DCoreLib ;

procedure wSoundStop(sound:wSound); cdecl; external WS3DCoreLib ;

procedure wSoundPause(sound:wSound); cdecl; external WS3DCoreLib ;

procedure wSoundSetLoopMode(sound:wSound;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wSoundIsLooping(sound:wSound):Boolean; cdecl; external WS3DCoreLib ;

function wSoundIsValid(sound:wSound):Boolean; cdecl; external WS3DCoreLib ;

function wSoundSeek(sound:wSound; seconds:Float32;
            relative:Boolean):Boolean; cdecl; external WS3DCoreLib ;

procedure wSoundUpdate(sound:wSound); cdecl; external WS3DCoreLib ;

function wSoundGetTotalAudioTime(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

function wSoundGetTotalAudioSize(sound:wSound):Int32; cdecl; external WS3DCoreLib ;

function wSoundGetCompressedAudioSize(sound:wSound):Int32; cdecl; external WS3DCoreLib ;

function wSoundGetCurrentAudioTime(sound:wSound):Float32; cdecl; external WS3DCoreLib ;

function wSoundGetCurrentAudioPosition(sound:wSound):Int32; cdecl; external WS3DCoreLib ;

function wSoundGetCurrentCompressedAudioPosition(sound:wSound):Int32; cdecl; external WS3DCoreLib ;

function wSoundGetNumEffectSlotsAvailable(sound:wSound):UInt32; cdecl; external WS3DCoreLib ;

{/sound effects/// }
function wSoundAddEffect(sound:wSound; slot:UInt32;
            effect:wSoundEffect):Boolean; cdecl; external WS3DCoreLib ;

procedure wSoundRemoveEffect(sound:wSound; slot:UInt32); cdecl; external WS3DCoreLib ;

function wSoundCreateEffect():wSoundEffect; cdecl; external WS3DCoreLib ;

function wSoundIsEffectValid(effect:wSoundEffect):Boolean; cdecl; external WS3DCoreLib ;

function wSoundIsEffectSupported(_type:wSoundEffectType):Boolean; cdecl; external WS3DCoreLib ;

function wSoundGetMaxEffectsSupported():UInt32; cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectType(effect:wSoundEffect;
            _type:wSoundEffectType) cdecl; external WS3DCoreLib ;

function wSoundGetEffectType(effect:wSoundEffect):wSoundEffectType; cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectAutowahParameters(effect:wSoundEffect;
            param:wAutowahParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectChorusParameters(effect:wSoundEffect;
            param:wChorusParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectCompressorParameters(effect:wSoundEffect;
            param:wCompressorParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectDistortionParameters(effect:wSoundEffect;
            param:wDistortionParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectEaxReverbParameters(effect:wSoundEffect;
            param:wEaxReverbParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectEchoParameters(effect:wSoundEffect;
            param:wEchoParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectEqualizerParameters(effect:wSoundEffect;
            param:wEqualizerParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectFlangerParameters(effect:wSoundEffect;
            param:wFlangerParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectFrequencyShiftParameters(effect:wSoundEffect;
            param:wFrequencyShiftParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectPitchShifterParameters(effect:wSoundEffect;
            param:wPitchShifterParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectReverbParameters(effect:wSoundEffect;
            param:wReverbParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectRingModulatorParameters(effect:wSoundEffect;
            param:wRingModulatorParameters); cdecl; external WS3DCoreLib ;

procedure wSoundSetEffectVocalMorpherParameters(effect:wSoundEffect;
            param:wVocalMorpherParameters); cdecl; external WS3DCoreLib ;

{/Sound filters/// }
function wSoundCreateFilter:wSoundFilter; cdecl; external WS3DCoreLib ;

function wSoundIsFilterValid(filter:wSoundFilter):Boolean cdecl; external WS3DCoreLib ;

function wSoundAddFilter(sound:wSound;
            filter:wSoundFilter):Boolean; cdecl; external WS3DCoreLib ;

procedure wSoundRemoveFilter(sound:wSound); cdecl; external WS3DCoreLib ;

function wSoundIsFilterSupported(_type:wSoundFilterType):Boolean; cdecl; external WS3DCoreLib ;

procedure wSoundSetFilterType(filter:wSoundFilter;
            _type:wSoundFilterType); cdecl; external WS3DCoreLib ;

function wSoundGetFilterType(filter:wSoundFilter):wSoundFilterType; cdecl; external WS3DCoreLib ;

procedure wSoundSetFilterVolume(filter:wSoundFilter;
            volume:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetFilterVolume(filter:wSoundFilter):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetFilterHighFrequencyVolume(filter:wSoundFilter;
            volumeHF:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetFilterHighFrequencyVolume(filter:wSoundFilter):Float32; cdecl; external WS3DCoreLib ;

procedure wSoundSetFilterLowFrequencyVolume(filter:wSoundFilter;
            volumeLF:Float32); cdecl; external WS3DCoreLib ;

function wSoundGetFilterLowFrequencyVolume(filter:wSoundFilter):Float32; cdecl; external WS3DCoreLib ;

{/wVideo/// }
function wVideoLoad(fileName:Pchar):wVideo; cdecl; external WS3DCoreLib ;

procedure wVideoPlay(player:wVideo); cdecl; external WS3DCoreLib ;

function wVideoIsPlaying(player:wVideo):Boolean; cdecl; external WS3DCoreLib ;

procedure wVideoRewind(player:wVideo); cdecl; external WS3DCoreLib ;

procedure wVideoSetLoopMode(player:wVideo;
            looping:Boolean); cdecl; external WS3DCoreLib ;

function wVideoIsLooping(player:wVideo):Boolean; cdecl; external WS3DCoreLib ;

function wVideoCreateTargetImage(player:wVideo;
            position:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

function wVideoGetTargetTexture(player:wVideo):wTexture; cdecl; external WS3DCoreLib ;

function wVideoGetSoundNode(player:wVideo):wSound; cdecl; external WS3DCoreLib ;

procedure wVideoUpdate(player:wVideo;
            timeMs:UInt32); cdecl; external WS3DCoreLib ;

procedure wVideoPause(player:wVideo); cdecl; external WS3DCoreLib ;

function wVideoIsPaused(player:wVideo):Boolean; cdecl; external WS3DCoreLib ;

function wVideoIsAtEnd(player:wVideo):Boolean; cdecl; external WS3DCoreLib ;

function wVideoIsEmpty(player:wVideo):Boolean; cdecl; external WS3DCoreLib ;

function wVideoGetFramePosition(player:wVideo):Int64; cdecl; external WS3DCoreLib ;

function wVideoGetTimePosition(player:wVideo):UInt32; cdecl; external WS3DCoreLib ;

function wVideoGetFrameSize(player:wVideo):wVector2i; cdecl; external WS3DCoreLib ;

function wVideoGetQuality(player:wVideo):Int32; cdecl; external WS3DCoreLib ;

procedure wVideoDestroy(player:wVideo); cdecl; external WS3DCoreLib ;

{/wDecal/// }
function wDecalCreateFromRay(texture:wTexture; startRay:wVector3f; endRay:wVector3f;
            dimension:Float32; textureRotation:Float32;lifeTime:Float32;
            visibleDistance:Float32):wNode; cdecl; external WS3DCoreLib ;

function wDecalCreateFromPoint(texture:wTexture; position:wVector3f; normal:wVector3f;
            dimension:Float32; textureRotation:Float32;lifeTime:Float32;
            visibleDistance:Float32):wNode; cdecl; external WS3DCoreLib ;

function wDecalGetLifeTime(node:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wDecalSetLifeTime(node:wNode;
            lifeTime:Float32); cdecl; external WS3DCoreLib ;

function wDecalGetMaxVisibleDistance(node:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wDecalSetMaxVisibleDistance(node:wNode;
            distance:Float32); cdecl; external WS3DCoreLib ;

procedure wDecalSetFadeOutParams(node:wNode; isfadeOut:Boolean;
            time:Float32); cdecl; external WS3DCoreLib ;

function wDecalGetMaterial(decal:wNode):wMaterial; cdecl; external WS3DCoreLib ;

procedure wDecalsClear(); cdecl; external WS3DCoreLib ;

{/destroy all + disable new }
procedure wDecalsDestroyAll(); cdecl; external WS3DCoreLib ;

procedure wDecalsCombineAll(); cdecl; external WS3DCoreLib ;

function wDecalsGetCount():Int32; cdecl; external WS3DCoreLib ;

{/wNetPacket/// }
function wNetPacketCreate(id:UInt64; inOrder:Boolean=true; reliable:Boolean=true;
            priority:UInt64=100):wPacket; cdecl; external WS3DCoreLib ;

procedure wNetPacketWriteUInt(msg:wPacket;
            value:UInt32); cdecl; external WS3DCoreLib ;

procedure wNetPacketWriteInt(msg:wPacket;
            value:Int32); cdecl; external WS3DCoreLib ;

procedure wNetPacketWriteFloat(msg:wPacket;
            value:Float32); cdecl; external WS3DCoreLib ;

procedure wNetPacketWriteString(msg:wPacket;
            newString:PChar); cdecl; external WS3DCoreLib ;

function wNetPacketReadUint(numPacket:Int32):UInt32; cdecl; external WS3DCoreLib ;

function wNetPacketReadInt(numPacket:Int32):Int32; cdecl; external WS3DCoreLib ;

function wNetPacketReadFloat(numPacket:Int32):Float32; cdecl; external WS3DCoreLib ;

function wNetPacketReadString(numPacket:Int32):PChar; cdecl; external WS3DCoreLib ;

function wNetPacketReadMessage(numPacket:Int32):PChar; cdecl; external WS3DCoreLib ;

function wNetPacketGetId(numPacket:Int32):UInt64; cdecl; external WS3DCoreLib ;

function wNetPacketGetClientIp(numPacket:Int32):PChar; cdecl; external WS3DCoreLib ;

function wNetPacketGetClientPtr(numPacket:Int32):Pointer; cdecl; external WS3DCoreLib ;

function wNetPacketGetClientPort(numPacket:Int32):UInt16; cdecl; external WS3DCoreLib ;

{/wNetManager/// }
procedure wNetManagerSetVerbose(value:Boolean); cdecl; external WS3DCoreLib ;

procedure wNetManagerSetMessageId(newId:UInt64); cdecl; external WS3DCoreLib ;

function wNetManagerGetMessageId():UInt64; cdecl; external WS3DCoreLib ;

procedure wNetManagerDestroyAllPackets(); cdecl; external WS3DCoreLib ;

function wNetManagerGetPacketsCount():Int32; cdecl; external WS3DCoreLib ;

{/wNetServer/// }
function wNetServerCreate(port:UInt16; mode:Int32;
            maxClientsCount:Int32=-1):Boolean; cdecl; external WS3DCoreLib ;

procedure wNetServerUpdate(sleepMs:Int32=100; countIteration:Int32=100;
            maxMSecsToWait:Int32=-1); cdecl; external WS3DCoreLib ;

procedure wNetServerClear(); cdecl; external WS3DCoreLib ;

procedure wNetServerSendPacket(destPtr:Pointer;
            msg:wPacket); cdecl; external WS3DCoreLib ;

procedure wNetServerBroadcastMessage(text:PChar); cdecl; external WS3DCoreLib ;

procedure wNetServerAcceptNewConnections(value:Boolean); cdecl; external WS3DCoreLib ;

procedure wNetServerStop(msTime:Int32=100); cdecl; external WS3DCoreLib ;

function wNetServerGetClientsCount():Int32; cdecl; external WS3DCoreLib ;

procedure wNetServerKickClient(clientPtr:Pointer); cdecl; external WS3DCoreLib ;

procedure wNetServerUnKickClient(clientPtr:Pointer); cdecl; external WS3DCoreLib ;

procedure wNetServerClearBannedList(); cdecl; external WS3DCoreLib ;

{/wNetClient/// }
function wNetClientCreate(address:PChar; port:UInt16; mode:Int32;
            maxMSecsToWait:Int32=500):Boolean; cdecl; external WS3DCoreLib ;

procedure wNetClientUpdate(maxMessagesToProcess:Int32=100; countIteration:Int32=100;
            maxMSecsToWait:Int32=-1); cdecl; external WS3DCoreLib ;

procedure wNetClientDisconnect(maxMSecsToWait:Int32=500); cdecl; external WS3DCoreLib ;

procedure wNetClientStop(maxMSecsToWait:Int32=500); cdecl; external WS3DCoreLib ;

function wNetClientIsConnected():Boolean; cdecl; external WS3DCoreLib ;

procedure wNetClientSendMessage(text:PChar); cdecl; external WS3DCoreLib ;

procedure wNetClientSendPacket(msg:wPacket); cdecl; external WS3DCoreLib ;

{/wPhys/// }
function wPhysStart():Boolean; cdecl; external WS3DCoreLib ;

procedure wPhysUpdate(timeStep:Float32); cdecl; external WS3DCoreLib ;

procedure wPhysStop(); cdecl; external WS3DCoreLib ;

procedure wPhysSetGravity(gravity:wVector3f); cdecl; external WS3DCoreLib ;

procedure wPhysSetWorldSize(size:wVector3f); cdecl; external WS3DCoreLib ;

procedure wPhysSetSolverModel(model:wPhysSolverModel); cdecl; external WS3DCoreLib ;

procedure wPhysSetFrictionModel(model:wPhysFrictionModel); cdecl; external WS3DCoreLib ;

procedure wPhysDestroyAllBodies(); cdecl; external WS3DCoreLib ;

procedure wPhysDestroyAllJoints(); cdecl; external WS3DCoreLib ;

function wPhysGetBodiesCount():Int32; cdecl; external WS3DCoreLib ;

function wPhysGetJointsCount():Int32; cdecl; external WS3DCoreLib ;

function wPhysGetBodyPicked(position:wVector2i;
            mouseLeftKey:Boolean):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetBodyFromRay(start:wVector3f;
            _end:wVector3f):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetBodyFromScreenCoords(position:wVector2i):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetBodyByName(name:PChar):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetBodyById(Id:Int32):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetBodyByIndex(idx:Int32):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetJointByName(name:PChar):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetJointById(Id:Int32):wNode; cdecl; external WS3DCoreLib ;

function wPhysGetJointByIndex(idx:Int32):wNode; cdecl; external WS3DCoreLib ;

{/wPhysBody/// }
function wPhysBodyCreateNull:wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateCube(size:wVector3f;
            Mass:Float32):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateSphere(radius:wVector3f;
            Mass:Float32):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateCone(radius:Float32; height:Float32;
            mass:Float32; Offset:Boolean):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateCylinder(radius:Float32; height:Float32;
            mass:Float32; Offset:Boolean):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateCapsule(radius:Float32; height:Float32;
            mass:Float32; Offset:Boolean):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateHull(mesh:wNode;
            mass:Float32):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateTree(mesh:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateTreeBsp(mesh:wMesh;
            node:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateTerrain(mesh:wNode;
            LOD:Int32):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateHeightField(mesh:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateWaterSurface(size:wVector3f; FluidDensity:Float32;
            LinearViscosity:Float32; AngulaViscosity:Float32):wNode; cdecl; external WS3DCoreLib ;

function wPhysBodyCreateCompound(nodes:PwNode; CountNodes:Int32;
            mass:Float32):wNode; cdecl; external WS3DCoreLib ;

{/=> такой процедуры НЕ ТРЕБУЕТСЯ, так как }
{/так как здесь работает wNodeDestroy() }
{/wPhysBodyDestroy(body); }
procedure wPhysBodySetName(body:wNode; name:PChar); cdecl; external WS3DCoreLib ;

function wPhysBodyGetName(body:wNode):PChar; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetFreeze(body:wNode;
            freeze:Boolean); cdecl; external WS3DCoreLib ;

function wPhysBodyIsFreeze(body:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetMaterial(body:wNode;
            MatId:Int32); cdecl; external WS3DCoreLib ;

function wPhysBodyGetMaterial(body:wNode):Int32; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetGravity(body:wNode;
            gravity:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodyGetGravity(body:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetMass(body:wNode;
            NewMass:Float32); cdecl; external WS3DCoreLib ;

function wPhysBodyGetMass(body:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetCenterOfMass(body:wNode;
            center:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodyGetCenterOfMass(body:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetMomentOfInertia(body:wNode;
            value:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodyGetMomentOfInertia(body:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetAutoSleep(body:wNode;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wPhysBodyIsAutoSleep(body:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetLinearVelocity(body:wNode;
            velocity:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodyGetLinearVelocity(body:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetAngularVelocity(body:wNode;
            velocity:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodyGetAngularVelocity(body:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetLinearDamping(body:wNode;
            linearDamp:Float32); cdecl; external WS3DCoreLib ;

function wPhysBodyGetLinearDamping(body:wNode):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysBodySetAngularDamping(body:wNode;
            damping:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodyGetAngularDamping(body:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodyAddImpulse(body:wNode; velosity:wVector3f;
            position:wVector3f); cdecl; external WS3DCoreLib ;

procedure wPhysBodyAddForce(body:wNode;
            force:wVector3f); cdecl; external WS3DCoreLib ;

procedure wPhysBodyAddTorque(body:wNode;
            torque:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysBodiesIsCollide(body1:wNode;
            body2:wNode):Boolean; cdecl; external WS3DCoreLib ;

function wPhysBodiesGetCollisionPoint(body1:wNode;
            body2:wNode):wVector3f; cdecl; external WS3DCoreLib ;

function wPhysBodiesGetCollisionNormal(body1:wNode;
            body2:wNode):wVector3f; cdecl; external WS3DCoreLib ;

procedure wPhysBodyDraw(body:wNode); cdecl; external WS3DCoreLib ;

{/wPhysJoint/// }
function wPhysJointCreateBall(position:wVector3f; pinDir:wVector3f;
            body1:wNode; body2:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysJointCreateHinge(position:wVector3f; pinDir:wVector3f;
            body1:wNode; body2:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysJointCreateSlider(position:wVector3f; pinDir:wVector3f;
            body1:wNode; body2:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysJointCreateCorkScrew(position:wVector3f; pinDir:wVector3f;
            body1:wNode; body2:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysJointCreateUpVector(position:wVector3f;
            body:wNode):wNode; cdecl; external WS3DCoreLib ;

procedure wPhysJointSetName(joint:wNode; name:PChar); cdecl; external WS3DCoreLib ;

function wPhysJointGetName(joint:wNode):PChar; cdecl; external WS3DCoreLib ;

procedure wPhysJointSetCollisionState(joint:wNode;
            isCollision:Boolean); cdecl; external WS3DCoreLib ;

function wPhysJointIsCollision(Joint:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wPhysJointSetBallLimits(joint:wNode; MaxConeAngle:Float32;
            twistAngles:wVector2f); cdecl; external WS3DCoreLib ;

procedure wPhysJointSetHingeLimits(joint:wNode;
            anglesLimits:wVector2f); cdecl; external WS3DCoreLib ;

procedure wPhysJointSetSliderLimits(joint:wNode;
            anglesLimits:wVector2f); cdecl; external WS3DCoreLib ;

procedure wPhysJointSetCorkScrewLinearLimits(joint:wNode;
            distLimits:wVector2f); cdecl; external WS3DCoreLib ;

procedure wPhysJointSetCorkScrewAngularLimits(joint:wNode;
            distLimits:wVector2f); cdecl; external WS3DCoreLib ;

{/wPhysPlayerController/// }
function wPhysPlayerControllerCreate(position:wVector3f; body:wNode;
            maxStairStepFactor:Float32; cushion:Float32):wNode; cdecl; external WS3DCoreLib ;

procedure wPhysPlayerControllerSetVelocity(joint:wNode; forwardSpeed:Float32;
            sideSpeed:Float32; heading:Float32); cdecl; external WS3DCoreLib ;

{/wPhysVehicle }
function wPhysVehicleCreate(tiresCount:Int32; rayCastType:wPhysVehicleType;
            CarBody:wNode):wNode; cdecl; external WS3DCoreLib ;

function wPhysVehicleAddTire(Car:wNode; UserData:wNode; tireType:wPhysVehicleTireType;
            osition:wVector3f; Mass:Float32;Radius:Float32; Width:Float32;
            SLenght:Float32; SConst:Float32; SDamper:Float32):Int32; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetSpeed(Car:wNode):Float32; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTiresCount(Car:wNode):Int32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetBrake(Car:wNode; value:Boolean); cdecl; external WS3DCoreLib ;

function wPhysVehicleIsBrake(Car:wNode):Boolean; cdecl; external WS3DCoreLib ;

function wPhysVehicleIsAllTiresCollided(Car:wNode):Boolean; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetSteering(Car:wNode;
            angle:Float32); cdecl; external WS3DCoreLib ;

{/-1.......+1 }
function wPhysVehicleGetSteering(Car:wNode):Float32; cdecl; external WS3DCoreLib ;

{/ return value: -1......+1 }
procedure wPhysVehicleSetTireMaxSteerAngle(Car:wNode; tireIndex:Int32;
            angleDeg:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireMaxSteerAngle(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetBody(Car:wNode):wNode; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetMotorValue(Car:wNode;
            value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetMotorValue(Car:wNode):Float32; cdecl; external WS3DCoreLib ;

{/Vehicle Tires }
function wPhysVehicleGetTireLocalPosition(Car:wNode;
            tireIndex:Int32):wVector3f; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireUpDownPosition(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireAngularVelocity(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireSpeed(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireContactPoint(Car:wNode;
            tireIndex:Int32):wVector3f; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireContactNormal(Car:wNode;
            tireIndex:Int32):wVector3f; cdecl; external WS3DCoreLib ;

function wPhysVehicleIsTireBrake(Car:wNode;
            tireIndex:Int32):Boolean; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireType(Car:wNode;
            tireIndex:Int32):wPhysVehicleTireType; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireType(Car:wNode; tireIndex:Int32;
            tireType:wPhysVehicleTireType); cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireBrakeForce(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireBrakeForce(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireBrakeLateralFriction(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireBrakeLateralFriction(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireBrakeLongitudinalFriction(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireBrakeLongitudinalFriction(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireLateralFriction(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireLateralFriction(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireLongitudinalFriction(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireLongitudinalFriction(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireMass(Car:wNode;
            tireIndex:Int32; mass:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireMass(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireRadius(Car:wNode;
            tireIndex:Int32; radius:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireRadius(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireWidth(Car:wNode;
            tireIndex:Int32; width:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireWidth(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireSpringConst(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireSpringConst(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireSpringDamper(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireSpringDamper(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireSuspensionLenght(Car:wNode;
            tireIndex:Int32; value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireSuspensionLenght(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireUserData(Car:wNode;
            tireIndex:Int32; userData:wNode); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireUserData(Car:wNode;
            tireIndex:Int32):wNode; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireMotorForce(Car:wNode; tireIndex:Int32;
            value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireMotorForce(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireTurnForceHelper(Car:wNode; tireIndex:Int32;
            value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireTurnForceHelper(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireSpinTorqueFactor(Car:wNode; tireIndex:Int32;
            value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireSpinTorqueFactor(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireTorquePosition(Car:wNode; tireIndex:Int32;
            position:wVector3f); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireTorquePosition(Car:wNode;
            tireIndex:Int32):wVector3f; cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireLoad(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

procedure wPhysVehicleSetTireSpinForce(Car:wNode; tireIndex:Int32;
            value:Float32); cdecl; external WS3DCoreLib ;

function wPhysVehicleGetTireSpinForce(Car:wNode;
            tireIndex:Int32):Float32; cdecl; external WS3DCoreLib ;

{/wPhysMaterial/// }
function wPhysMaterialCreate():Int32; cdecl; external WS3DCoreLib ;

procedure wPhysMaterialSetElasticity(matId1:Int32; matId2:Int32;
            Elasticity:Float32); cdecl; external WS3DCoreLib ;

procedure wPhysMaterialSetFriction(matId1:Int32; matId2:Int32;
            StaticFriction:Float32; KineticFriction:Float32); cdecl; external WS3DCoreLib ;

procedure wPhysMaterialSetContactSound(matId1:Int32;matId2:Int32;
            soundNode:wSound); cdecl; external WS3DCoreLib ;

procedure wPhysMaterialSetSoftness(matId1:Int32; matId2:Int32;
            Softness:Float32); cdecl; external WS3DCoreLib ;

procedure wPhysMaterialSetCollidable(matId1:Int32; matId2:Int32;
            isCollidable:Boolean); cdecl; external WS3DCoreLib ;

{/wGui/// }
procedure wGuiDrawAll(); cdecl; external WS3DCoreLib ;

procedure wGuiDestroyAll(); cdecl; external WS3DCoreLib ;

function wGuiIsEventAvailable():Boolean; cdecl; external WS3DCoreLib ;

function wGuiReadEvent():PwGuiEvent; cdecl; external WS3DCoreLib ;

function wGuiLoad(fileName:PChar;
            start:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiSave(fileName:PChar;
            start:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiGetSkin():wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiSetSkin(skin:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiGetLastSelectedFile():PWChar; cdecl; external WS3DCoreLib ;

{/Returns the element which holds the focus. }
function wGuiGetObjectFocused:wGuiObject; cdecl; external WS3DCoreLib ;

{/Returns the element which was last under the mouse cursor. }
function wGuiGetObjectHovered():wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiGetRootNode():wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiGetObjectById(id:Int32;
            searchchildren:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiGetObjectByName(name:PChar;
            searchchildren:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiObject/// }
procedure wGuiObjectDestroy(element:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetParent(element:wGuiObject;
            parent:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiObjectGetParent(element:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetRelativePosition(element:wGuiObject;
            position:wVector2i); cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetRelativeSize(element:wGuiObject;
            size:wVector2i); cdecl; external WS3DCoreLib ;

function wGuiObjectGetRelativePosition(element:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

function wGuiObjectGetRelativeSize(element:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

function wGuiObjectGetAbsolutePosition(element:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

function wGuiObjectGetAbsoluteClippedPosition(element:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

function wGuiObjectGetAbsoluteClippedSize(element:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

{/Sets whether the element will ignore its parent's clipping rectangle. }
procedure wGuiObjectSetClippingMode(element:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiObjectIsClipped(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetMaxSize(element:wGuiObject;
            size:wVector2i); cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetMinSize(element:wGuiObject;
            size:wVector2i); cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetAlignment(element:wGuiObject; left:wGuiAlignment; right:wGuiAlignment;
            top:wGuiAlignment; bottom:wGuiAlignment); cdecl; external WS3DCoreLib ;

procedure wGuiObjectUpdateAbsolutePosition(element:wGuiObject); cdecl; external WS3DCoreLib ;

{/Возвращает гуи-объект -потомок element-а, который находится на пересечении }
{/с точкой экрана position }
{/Если нужен любой объект, то в качестве element-а нужно }
{/поставить root=wGuiGetRootNode() }
{/Примечание: Элемент root имеет размер ВСЕГО экрана }
function wGuiObjectGetFromScreenPos(element:wGuiObject;
            position:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

{/Персекается ли объект с точкой экрана position }
function wGuiObjectIsPointInside(element:wGuiObject;
            position:wVector2i):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiObjectDestroyChild(element:wGuiObject;
            child:wGuiObject); cdecl; external WS3DCoreLib ;

{/Можно вызывать вместо wGuiDrawAll() для конкретного элемента }
procedure wGuiObjectDraw(element:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiObjectMoveTo(element:wGuiObject;
            position:wVector2i); cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetVisible(element:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiObjectIsVisible(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/ Устанавливает, был ли этот элемент управления создан }
{/ как часть родительского элемента. }
{/ Например, если полоса прокрутки является частью списка. }
{/ Подразделы не сохраняются на диск при вызове wGuiSave() }
procedure wGuiObjectSetSubObject(element:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

{/ Вовзращает, был ли этот элемент управления создан }
{/ как часть родительского элемента. }
function wGuiObjectIsSubObject(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetTabStop(element:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

{/Returns true if this element can be focused by navigating with the tab key. }
function wGuiObjectIsTabStop(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Sets the priority of focus when using the tab key to navigate between a group of elements. }
procedure wGuiObjectSetTabOrder(element:wGuiObject;
            index:Int32); cdecl; external WS3DCoreLib ;

function wGuiObjectGetTabOrder(element:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

{/If set to true, the focus will visit this element when using the tab key to cycle through elements. }
procedure wGuiObjectSetTabGroup(element:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiObjectIsTabGroup(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetEnable(element:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiObjectIsEnabled(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetText(element:wGuiObject;
            text:WString); cdecl; external ;

function wGuiObjectGetText(element:wGuiObject):PWChar; cdecl; external WS3DCoreLib ;

{/Sets the new caption of this element. }
procedure wGuiObjectSetToolTipText(element:wGuiObject;
            text:WString); cdecl; external WS3DCoreLib ;

(* Const before type ignored *)
function wGuiObjectGetToolTipText(element:wGuiObject):WString; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetId(element:wGuiObject;
            id:Int32); cdecl; external WS3DCoreLib ;

function wGuiObjectGetId(element:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiObjectSetName(element:wGuiObject;
            name:PChar); cdecl; external WS3DCoreLib ;

function wGuiObjectIsHovered(el:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiObjectGetName(element:wGuiObject):PChar; cdecl; external WS3DCoreLib ;

{/Ищет  среди "детей" объекта искомого по его Id }
{/Если требуется найти ЛЮБОЙ ГУИ-объект сцены, }
{/нужно в качестве элемента указать root=wGuiGetRootNode() }
function wGuiObjectGetChildById(element:wGuiObject; id:Int32;
            searchchildren:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiObjectGetChildByName(element:wGuiObject; name:PChar;
            searchchildren:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiObjectIsChildOf(element:wGuiObject;
            child:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiObjectBringToFront(element:wGuiObject;
            subElement:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiObjectGetType(element:wGuiObject):wGuiElementType; cdecl; external WS3DCoreLib ;

function wGuiObjectGetTypeName(element:wGuiObject):PChar; cdecl; external WS3DCoreLib ;

function wGuiObjectHasType(element:wGuiObject;
            _type:wGuiElementType):Boolean; cdecl; external WS3DCoreLib ;

function wGuiObjectSetFocus(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiObjectRemoveFocus(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiObjectIsFocused(element:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiObjectReadFromXml(node:wGuiObject;
            reader:wXmlReader); cdecl; external WS3DCoreLib ;

procedure wGuiObjectWriteToXml(node:wGuiObject;
            writer:wXmlWriter); cdecl; external WS3DCoreLib ;

{/wGuiSkin/// }
function wGuiSkinCreate(_type:wGuiSkinSpace):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiSkinGetColor(skin:wGuiObject;
            elementType:wGuiDefaultColor):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiSkinSetColor(skin:wGuiObject; elementType:wGuiDefaultColor;
            color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiSkinSetSize(skin:wGuiObject; sizeType:wGuiDefaultSize;
            newSize:Int32); cdecl; external WS3DCoreLib ;

function wGuiSkinGetSize(skin:wGuiObject;
            sizeType:wGuiDefaultSize):Int32; cdecl; external WS3DCoreLib ;

function wGuiSkinGetDefaultText(skin:wGuiObject;
            txt:wGuiDefaultText):WString; cdecl; external WS3DCoreLib ;

procedure wGuiSkinSetDefaultText(skin:wGuiObject; txt:wGuiDefaultText;
            newText:WString); cdecl; external WS3DCoreLib ;

procedure wGuiSkinSetFont(skin:wGuiObject; font:wFont;
            fntType:wGuiDefaultFont=wGDF_DEFAULT); cdecl; external WS3DCoreLib ;

function wGuiSkinGetFont(skin:wGuiObject;
            fntType:wGuiDefaultFont):wFont; cdecl; external WS3DCoreLib ;

procedure wGuiSkinSetSpriteBank(skin:wGuiObject;
            bank:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiSkinGetSpriteBank(skin:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiSkinSetIcon(skin:wGuiObject;
            icn:wGuiDefaultIcon; index:UInt32); cdecl; external WS3DCoreLib ;

function wGuiSkinGetIcon(skin:wGuiObject;
            icn:wGuiDefaultIcon):UInt32; cdecl; external WS3DCoreLib ;

function wGuiSkinGetType(skin:wGuiObject):wGuiSkinSpace; cdecl; external WS3DCoreLib ;

{/wGuiWindow/// }
(* Const before type ignored *)
function wGuiWindowCreate(wcptrTitle:WString; minPos:wVector2i; maxPos:wVector2i;
            modal:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiWindowGetButtonClose(win:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiWindowGetButtonMinimize(win:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiWindowGetButtonMaximize(win:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiWindowSetDraggable(win:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiWindowIsDraggable(win:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiWindowSetDrawBackground(win:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiWindowIsDrawBackground(win:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiWindowSetDrawTitleBar(win:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiWindowIsDrawTitleBar(win:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiLabel }
function wGuiLabelCreate(wcptrText:WString; minPos:wVector2i; maxPos:wVector2i;
            boBorder:Boolean=false; boWordWrap:Boolean=true):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiLabelGetTextSize(txt:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetOverrideFont(obj:wGuiObject;
            font:wFont); cdecl; external WS3DCoreLib ;

function wGuiLabelGetOverrideFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

function wGuiLabelGetActiveFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

procedure wGuiLabelEnableOverrideColor(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiLabelIsOverrideColor(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetOverrideColor(obj:wGuiObject;
            color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiLabelGetOverrideColor(obj:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetDrawBackground(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiLabelIsDrawBackGround(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetDrawBorder(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiLabelIsDrawBorder(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetTextAlignment(obj:wGuiObject; Horizontalvalue:wGuiAlignment;
            Verticalvalue:wGuiAlignment); cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetWordWrap(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiLabelIsWordWrap(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiLabelSetBackgroundColor(obj:wGuiObject;
            color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiLabelGetBackgroundColor(obj:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

{/wGuiButton }
function wGuiButtonCreate(minPos:wVector2i; maxPos:wVector2i;wcptrLabel:WString;
            wcptrTip:WString=nullStr):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetImage(btn:wGuiObject;
            img:wTexture); cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetImageFromRect(btn:wGuiObject; img:wTexture;
            minRect:PwVector2i; maxRect:PwVector2i); cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetPressedImage(btn:wGuiObject;
            img:wTexture); cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetPressedImageFromRect(btn:wGuiObject; img:wTexture;
            minRect:PwVector2i;maxRect:PwVector2i); cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetSpriteBank(btn:wGuiObject;
            bank:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetSprite(btn:wGuiObject; state:wGuiButtonState;
            index:Int32; color:wColor4s; loop:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetPush(btn:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiButtonIsPushed(btn:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetPressed(btn:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiButtonIsPressed(btn:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiButtonUseAlphaChannel(btn:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiButtonIsUsedAlphaChannel(btn:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiButtonEnableScaleImage(btn:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiButtonIsScaledImage(btn:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetOverrideFont(obj:wGuiObject;
            font:wFont); cdecl; external WS3DCoreLib ;

function wGuiButtonGetOverrideFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

function wGuiButtonGetActiveFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

procedure wGuiButtonSetDrawBorder(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiButtonIsDrawBorder(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiButtonGroup/// }
function wGuiButtonGroupCreate(minPos:wVector2i;
            maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiButtonGroupAddButton(group:wGuiObject;
            button:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiButtonGroupInsertButton(group:wGuiObject; button:wGuiObject;
            index:UInt32):Int32; cdecl; external WS3DCoreLib ;

function wGuiButtonGroupGetButton(group:wGuiObject;
            index:UInt32):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiButtonGroupRemoveButton(group:wGuiObject;
            index:UInt32):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiButtonGroupRemoveAll(group:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiButtonGroupGetSize(group:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

function wGuiButtonGroupGetSelectedIndex(group:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiButtonGroupSetSelectedIndex(group:wGuiObject;
            index:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiButtonGroupClearSelection(group:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiButtonGroupSetBackgroundColor(group:wGuiObject;
            color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiButtonGroupDrawBackground(group:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

{/wGuiListBox/// }
function wGuiListBoxCreate(minPos:wVector2i; maxPos:wVector2i;
            background:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiListBoxGetItemsCount(lbox:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

function wGuiListBoxGetItemByIndex(lbox:wGuiObject;
            id:UInt32):PWChar; cdecl; external WS3DCoreLib ;

function wGuiListBoxAddItem(lbox:wGuiObject;
            text:WString):UInt32; cdecl; external WS3DCoreLib ;

function wGuiListBoxAddItemWithIcon(lbox:wGuiObject; text:WString;
            icon:Int32):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiListBoxRemoveItem(lbox:wGuiObject;
            index:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxRemoveAll(lbox:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSetItem(lbox:wGuiObject; index:UInt32;
            text:WString; icon:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxInsertItem(lbox:wGuiObject; index:UInt32;
            text:WString; icon:Int32); cdecl; external WS3DCoreLib ;

function wGuiListBoxGetItemIcon(lbox:wGuiObject;
            index:UInt32):Int32; cdecl; external WS3DCoreLib ;

function wGuiListBoxGetSelectedIndex(lbox:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSelectItemByIndex(lbox:wGuiObject;
            index:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSelectItemByText(lbox:wGuiObject;
            item:WString); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSwapItems(lbox:wGuiObject;
            index1:UInt32; index2:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSetItemsHeight(lbox:wGuiObject;
            height:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSetAutoScrolling(lbox:wGuiObject;
            scroll:Boolean); cdecl; external WS3DCoreLib ;

function wGuiListBoxIsAutoScrolling(lbox:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSetItemColor(lbox:wGuiObject; index:UInt32;
            color:wColor4s);  cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSetElementColor(lbox:wGuiObject; index:UInt32;
            colorType:wGuiListboxColor; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiListBoxClearItemColor(lbox:wGuiObject;
            index:UInt32); cdecl; external WS3DCoreLib ;

procedure wListBoxClearElementColor(lbox:wGuiObject; index:UInt32;
            colorType:wGuiListboxColor); cdecl; external WS3DCoreLib ;

function wGuiListBoxGetElementColor(lbox:wGuiObject; index:UInt32;
            colorType:wGuiListboxColor):wColor4s; cdecl; external WS3DCoreLib ;

function wGuiListBoxHasElementColor(lbox:wGuiObject; index:UInt32;
            colorType:wGuiListboxColor):Boolean; cdecl; external WS3DCoreLib ;

function wGuiListBoxGetDefaultColor(lbox:wGuiObject;
            colorType:wGuiListboxColor):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiListBoxSetDrawBackground(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

{/wGuiScrollBar }
function wGuiScrollBarCreate(Horizontal:Boolean; minPos:wVector2i;
            maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiScrollBarSetMaxValue(scroll:wGuiObject;
            max:Int32); cdecl; external WS3DCoreLib ;

function wGuiScrollBarGetMaxValue(scroll:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiScrollBarSetMinValue(scroll:wGuiObject;
            min:Int32); cdecl; external WS3DCoreLib ;

function wGuiScrollBarGetMinValue(scroll:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiScrollBarSetValue(scroll:wGuiObject;
            value:Int32); cdecl; external WS3DCoreLib ;

function wGuiScrollBarGetValue(scroll:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiScrollBarSetSmallStep(scroll:wGuiObject;
            step:Int32); cdecl; external WS3DCoreLib ;

function wGuiScrollBarGetSmallStep(scroll:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiScrollBarSetLargeStep(scroll:wGuiObject;
            step:Int32); cdecl; external WS3DCoreLib ;

function wGuiScrollBarGetLargeStep(scroll:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

{/wGuiEditBox }
function wGuiEditBoxCreate(wcptrText:WString; minPos:wVector2i;
            maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetMultiLine(box:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiEditBoxIsMultiLine(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetAutoScrolling(box:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiEditBoxIsAutoScrolling(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetPasswordMode(box:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiEditBoxIsPasswordMode(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiEditBoxGetTextSize(box:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

{/Sets the maximum amount of characters which may be entered in the box. }
procedure wGuiEditBoxSetCharactersLimit(box:wGuiObject;
            max:UInt32); cdecl; external WS3DCoreLib ;

function wGuiEditGetCharactersLimit(box:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetOverrideFont(obj:wGuiObject;
            font:wFont); cdecl; external WS3DCoreLib ;

function wGuiEditBoxGetOverrideFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

function wGuiEditBoxGetActiveFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxEnableOverrideColor(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiEditBoxIsOverrideColor(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetOverrideColor(obj:wGuiObject;
            color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiEditBoxGetOverrideColor(obj:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetDrawBackground(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetDrawBorder(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiEditBoxIsDrawBorder(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetTextAlignment(obj:wGuiObject; Horizontalvalue:wGuiAlignment;
            Verticalvalue:wGuiAlignment); cdecl; external WS3DCoreLib ;

procedure wGuiEditBoxSetWordWrap(obj:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiEditBoxIsWordWrap(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiImage/// }
function wGuiImageCreate(texture:wTexture; size:wVector2i;
            useAlpha:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiImageSet(img:wGuiObject;
            tex:wTexture); cdecl; external WS3DCoreLib ;

function wGuiImageGet(img:wGuiObject):wTexture; cdecl; external WS3DCoreLib ;

procedure wGuiImageSetColor(img:wGuiObject;
            color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiImageGetColor(img:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiImageSetScaling(img:wGuiObject;
            scale:Boolean); cdecl; external WS3DCoreLib ;

function wGuiImageIsScaled(img:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiImageUseAlphaChannel(img:wGuiObject;
            use:Boolean); cdecl; external WS3DCoreLib ;

function wGuiImageIsUsedAlphaChannel(img:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiFader/// }
function wGuiFaderCreate(minPos:wVector2i;
            maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiFaderSetColor(fader:wGuiObject;
            color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiFaderGetColor(fader:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiFaderSetColorExt(fader:wGuiObject; colorSrc:wColor4s;
            colorDest:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiFaderFadeIn(fader:wGuiObject;
            timeMs:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiFaderFadeOut(fader:wGuiObject;
            timeMs:UInt32); cdecl; external WS3DCoreLib ;

function wGuiFaderIsReady(fader:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiCheckBox/// }
function wGuiCheckBoxCreate(wcptrText:WString; minPos:wVector2i; maxPos:wVector2i;
            checked:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxCheck(box:wGuiObject;
            checked:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCheckBoxIsChecked(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/ Sets whether to draw the background }
procedure wGuiCheckBoxSetDrawBackground(box:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

{/ Checks if background drawing is enabled }
{/return true if background drawing is enabled, false otherwise }
function wGuiCheckBoxIsDrawBackground(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/ Sets whether to draw the border }
procedure wGuiCheckBoxSetDrawBorder(box:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

{/ Checks if border drawing is enabled }
{/return true if border drawing is enabled, false otherwise }
function wGuiCheckBoxIsDrawBorder(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxSetFilled(box:wGuiObject;
            value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCheckBoxIsFilled(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiFileOpenDialog }
{Warning:
    When the user selects a folder this does change the current working directory

This element can create the following events of type wGuiEventType:

        wGET_DIRECTORY_SELECTED
        wGET_FILE_SELECTED
        wGET_FILE_CHOOSE_DIALOG_CANCELLED
 }
function wGuiFileOpenDialogCreate(wcptrLabel:WString;
            modal:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

{/Returns the filename of the selected file. Returns NULL, if no file was selected. }
function wGuiFileOpenDialogGetFile(dialog:wGuiObject):WString; cdecl; external WS3DCoreLib ;

{/Returns the directory of the selected file. Returns NULL, if no directory was selected. }
function wGuiFileOpenDialogGetDirectory(dialog:wGuiObject):PChar; cdecl; external WS3DCoreLib ;

{/wGuiComboBox/// }
function wGuiComboBoxCreate(minPos:wVector2i;
            maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiComboBoxGetItemsCount(combo:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

function wGuiComboBoxGetItemByIndex(combo:wGuiObject;
            idx:UInt32):PWChar; cdecl; external WS3DCoreLib ;

function wGuiComboBoxGetItemDataByIndex(combo:wGuiObject;
            idx:UInt32):UInt32; cdecl; external WS3DCoreLib ;

function wGuiComboBoxGetIndexByItemData(combo:wGuiObject;
            data:UInt32):Int32; cdecl; external WS3DCoreLib ;

function wGuiComboBoxAddItem(combo:wGuiObject; text:WString;
            data:UInt32):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiComboBoxRemoveItem(combo:wGuiObject;
            idx:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiComboBoxRemoveAll(combo:wGuiObject); cdecl; external WS3DCoreLib ;

{/Returns id of selected item. returns -1 if no item is selected. }
function wGuiComboBoxGetSelected(combo:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiComboBoxSetSelected(combo:wGuiObject;
            idx:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiComboBoxSetMaxSelectionRows(combo:wGuiObject;
            max:UInt32); cdecl; external WS3DCoreLib ;

function wGuiComboBoxGetMaxSelectionRows(combo:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiComboBoxSetTextAlignment(obj:wGuiObject; Horizontalvalue:wGuiAlignment;
            Verticalvalue:wGuiAlignment); cdecl; external WS3DCoreLib ;

{/wGuiContextMenu/// }
function wGuiContextMenuCreate(minPos:wVector2i;
            maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuSetCloseHandling(cmenu:wGuiObject;
            onClose:wContextMenuClose); cdecl; external WS3DCoreLib ;

function wGuiContextMenuGetCloseHandling(cmenu:wGuiObject):wContextMenuClose; cdecl; external WS3DCoreLib ;

function wGuiContextMenuGetItemsCount(cmenu:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

function wGuiContextMenuAddItem(cmenu:wGuiObject; text:WString; commandId:Int32=-1;enabled:Boolean=true;
            hasSubMenu:Boolean=false;checked:Boolean=false; autoChecking:Boolean=false):UInt32; cdecl; external WS3DCoreLib ;

function wGuiContextMenuInsertItem(cmenu:wGuiObject; idx:UInt32; text:WString; commandId:Int32=-1; enabled:Boolean=true;
           hasSubMenu:Boolean=false; checked:Boolean=false; autoChecking:Boolean=false):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuAddSeparator(cmenu:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiContextMenuGetItemText(cmenu:wGuiObject;
           idx:UInt32):WString; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuSetItemText(cmenu:wGuiObject; idx:UInt32;
           text:WString); cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuSetItemEnabled(cmenu:wGuiObject;
           idx:UInt32; value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiContextMenuIsItemEnabled(cmenu:wGuiObject;
           idx:UInt32):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuSetItemChecked(cmenu:wGuiObject;
           idx:UInt32; value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiContextMenuIsItemChecked(cmenu:wGuiObject;
           idx:UInt32):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuRemoveItem(cmenu:wGuiObject;
           idx:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuRemoveAll(cmenu:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiContextMenuGetSelectedItem(cmenu:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiContextMenuGetItemCommandId(cmenu:wGuiObject;
           idx:UInt32):Int32; cdecl; external WS3DCoreLib ;

function wGuiContextMenuFindItem(cmenu:wGuiObject; id:Int32;
           idx:UInt32):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuSetItemCommandId(cmenu:wGuiObject;
           idx:UInt32; id:Int32); cdecl; external WS3DCoreLib ;

function wGuiContextMenuGetSubMenu(cmenu:wGuiObject;
           idx:UInt32):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiContextMenuSetAutoChecking(cmenu:wGuiObject; idx:UInt32;
           autoChecking:Boolean); cdecl; external WS3DCoreLib ;

function wGuiContextMenuIsAutoChecked(cmenu:wGuiObject;
           idx:UInt32):Boolean; cdecl; external WS3DCoreLib ;

{/When an eventparent is set it receives events instead of the usual parent element. }
procedure wGuiContextMenuSetEventParent(cmenu:wGuiObject;
           parent:wGuiObject); cdecl; external WS3DCoreLib ;

{/wGuiMenu/// }
{/Adds a menu to the environment.This is like the menu you can find on top of most windows in modern graphical user interfaces. }
{/Для работы с меню подходят все команды }
{/из раздела wGuiContextMenu/// }
function wGuiMenuCreate():wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiModalScreen/// }
{/Adds a modal screen. }
{/This control stops its parent's members from being able to receive input until its last child is removed, }
{/ it then deletes itself. }
function wGuiModalScreenCreate():wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiSpinBox/// }
function wGuiSpinBoxCreate(wcptrText:WString; minPos:wVector2i; maxPos:wVector2i;
           border:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiSpinBoxGetEditBox(box:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiSpinBoxSetValue(spin:wGuiObject;
           value:Float32); cdecl; external WS3DCoreLib ;

function wGuiSpinBoxGetValue(spin:wGuiObject):Float32; cdecl; external WS3DCoreLib ;

procedure wGuiSpinBoxSetRange(spin:wGuiObject;
           range:wVector2f); cdecl; external WS3DCoreLib ;

function wGuiSpinBoxGetMin(spin:wGuiObject):Float32; cdecl; external WS3DCoreLib ;

function wGuiSpinBoxGetMax(spin:wGuiObject):Float32; cdecl; external WS3DCoreLib ;

procedure wGuiSpinBoxSetStepSize(spin:wGuiObject;
           step:Float32); cdecl; external WS3DCoreLib ;

function wGuiSpinBoxGetStepSize(spin:wGuiObject):Float32; cdecl; external WS3DCoreLib ;

procedure wGuiSpinBoxSetDecimalPlaces(spin:wGuiObject;
           places:Int32); cdecl; external WS3DCoreLib ;

{/wGuiTab/// }
function wGuiTabCreate(minPos:wVector2i;
           maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTabGetNumber(tab:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiTabSetTextColor(tab:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiTabGetTextColor(tab:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiTabSetDrawBackground(tab:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiTabIsDrawBackground(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiTabSetBackgroundColor(tab:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiTabGetBackgroundColor(tab:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

{/wGuiTabControl/// }
function wGuiTabControlCreate(minPos:wVector2i; maxPos:wVector2i;
           background:Boolean; border:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTabControlGetTabsCount(control:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiTabControlAddTab(control:wGuiObject; caption:WString;
           id:Int32=-1):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTabControlInsertTab(control:wGuiObject; idx:UInt32;
           caption:WString; id:Int32):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTabControlGetTab(control:wGuiObject;
           idx:Int32):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTabControlSetActiveTabByIndex(control:wGuiObject;
           idx:Int32):Boolean; cdecl; external WS3DCoreLib ;

function wGuiTabControlSetActiveTab(control:wGuiObject;
           tab:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiTabControlGetActiveTab(control:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiTabControlGetTabFromPos(control:wGuiObject;
           position:wVector2i):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiTabControlRemoveTab(control:wGuiObject;
           idx:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiTabControlRemoveAll(control:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiTabControlSetTabHeight(control:wGuiObject;
           height:Int32); cdecl; external WS3DCoreLib ;

function wGuiTabControlGetTabHeight(control:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiTabControlSetTabMaxWidth(control:wGuiObject;
           width:Int32); cdecl; external WS3DCoreLib ;

function wGuiTabControlGetTabMaxWidth(control:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiTabControlSetVerticalAlignment(control:wGuiObject;
           al:wGuiAlignment); cdecl; external WS3DCoreLib ;

function wGuiTabControlGetVerticalAlignment(control:wGuiObject):wGuiAlignment; cdecl; external WS3DCoreLib ;

procedure wGuiTabControlSetTabExtraWidth(control:wGuiObject;
           extraWidth:Int32); cdecl; external WS3DCoreLib ;

function wGuiTabControlGetTabExtraWidth(control:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

{/wGuiTable/// }
function wGuiTableCreate(minPos:wVector2i; maxPos:wVector2i;
           background:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiTableAddColumn(table:wGuiObject; caption:WString;
           columnIndex:Int32=-1); cdecl; external WS3DCoreLib ;

procedure wGuiTableRemoveColumn(table:wGuiObject;
           columnIndex:UInt32); cdecl; external WS3DCoreLib ;

function wGuiTableGetColumnsCount(table:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiTableSetActiveColumn(table:wGuiObject; idx:Int32;
           doOrder:Boolean):Boolean; cdecl; external WS3DCoreLib ;

function wGuiTableGetActiveColumn(table:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiTableGetActiveColumnOrdering(table:wGuiObject):wGuiOrderingMode; cdecl; external WS3DCoreLib ;

procedure wGuiTableSetColumnWidth(table:wGuiObject; columnIndex:UInt32;
           width:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiTableSetColumnsResizable(table:wGuiObject;
           resizible:Boolean); cdecl; external WS3DCoreLib ;

function wGuiTableIsColumnsResizable(table:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

function wGuiTableGetSelected(table:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

procedure wGuiTableSetSelectedByIndex(table:wGuiObject;
           index:Int32); cdecl; external WS3DCoreLib ;

function wGuiTableGetRowsCount(table:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiTableAddRow(table:wGuiObject;
           rowIndex:UInt32):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiTableRemoveRow(table:wGuiObject;
           rowIndex:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiTableClearRows(table:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiTableSwapRows(table:wGuiObject; rowIndexA:UInt32;
           rowIndexB:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiTableSetOrderRows(table:wGuiObject; columnIndex:Int32;
           mode:wGuiOrderingMode); cdecl; external WS3DCoreLib ;

procedure wGuiTableSetCellText(table:wGuiObject; rowIndex:UInt32;
           columnIndex:UInt32; text:WString; color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiTableSetCellData(table:wGuiObject; rowIndex:UInt32;
           columnIndex:UInt32; data:PUInt32); cdecl; external WS3DCoreLib ;

procedure wGuiTableSetCellColor(table:wGuiObject; rowIndex:UInt32;
           columnIndex:UInt32; color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiTableGetCellText(table:wGuiObject; rowIndex:UInt32;
           columnIndex:UInt32):WString; cdecl; external WS3DCoreLib ;

function wGuiTableGetCellData(table:wGuiObject; rowIndex:UInt32;
           columnIndex:UInt32):PUInt32; cdecl; external WS3DCoreLib ;

procedure wGuiTableSetDrawFlags(table:wGuiObject;
           flags:wGuiTableDrawFlags); cdecl; external WS3DCoreLib ;

function wGuiTableGetDrawFlags(table:wGuiObject):wGuiTableDrawFlags; cdecl; external WS3DCoreLib ;

procedure wGuiTableSetOverrideFont(obj:wGuiObject;
           font:wFont); cdecl; external WS3DCoreLib ;

function wGuiTableGetOverrideFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

function wGuiTableGetActiveFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

function wGuiTableGetItemHeight(obj:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiTableGetVerticalScrollBar(obj:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTableGetHorizontalScrollBar(obj:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiTableSetDrawBackground(obj:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiTableIsDrawBackground(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiToolBar/// }
function wGuiToolBarCreate:wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiToolBarAddButton(bar:wGuiObject; text:WString = nullStr; tooltiptext:WString = nullStr;
           img:wTexture=nil; pressedImg:wTexture=nil;isPushButton:Boolean=false;
           useAlphaChannel:Boolean=true):wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiMessageBox }

function wGuiMessageBoxCreate(wcptrTitle:WString; wcptrTCaption:WString; modal:Boolean;
           flags:wGuiMessageBoxFlags; image:wTexture):wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiTree/// }
{/Create a tree view element. }
function wGuiTreeCreate(minPos:wVector2i; maxPos:wVector2i; background:Boolean;
           barvertical:Boolean; barhorizontal:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

{/returns the root node (not visible) from the tree. }
function wGuiTreeGetRoot(tree:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/returns the selected node of the tree or 0 if none is selected }
function wGuiTreeGetSelected(tree:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/sets if the tree lines are visible }
procedure wGuiTreeSetLinesVisible(tree:wGuiObject;
           visible:Boolean); cdecl; external WS3DCoreLib ;

{/returns true if the tree lines are visible }
function wGuiTreeIsLinesVisible(tree:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Sets the font which should be used as icon font. }
procedure wGuiTreeSetIconFont(tree:wGuiObject;
           font:wFont); cdecl; external WS3DCoreLib ;

{/Sets the image list which should be used for the image and selected image of every node. }
procedure wGuiTreeSetImageList(tree:wGuiObject;
           list:wGuiObject); cdecl; external WS3DCoreLib ;

{/Returns the image list which is used for the nodes. }
function wGuiTreeGetImageList(tree:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/Sets if the image is left of the icon. Default is true. }
procedure wGuiTreeSetImageLeftOfIcon(tree:wGuiObject;
           bLeftOf:Boolean); cdecl; external WS3DCoreLib ;

{/Returns if the Image is left of the icon. Default is true. }
function wGuiTreeIsImageLeftOfIcon(tree:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Returns the node which is associated to the last event. }
function wGuiTreeGetLastEventNode(tree:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiTreeNode/// }
{/returns the owner (Gui tree) of this node }
function wGuiTreeNodeGetOwner(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiTreeNodeGetParent(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/returns the text of the node }
function wGuiTreeNodeGetText(node:wGuiObject):WString; cdecl; external WS3DCoreLib ;

{/sets the text of the node }
procedure wGuiTreeNodeSetText(node:wGuiObject; text:WString); cdecl; external WS3DCoreLib ;

{/sets the icon text of the node }
procedure wGuiTreeNodeSetIcon(node:wGuiObject;
           icon:WString); cdecl; external WS3DCoreLib ;

{/returns the icon text of the node }
function wGuiTreeNodeGetIcon(node:wGuiObject):WString; cdecl; external WS3DCoreLib ;

{/sets the image index of the node }
procedure wGuiTreeNodeSetImageIndex(node:wGuiObject;
           imageIndex:UInt32); cdecl; external WS3DCoreLib ;

{/returns the image index of the node }
function wGuiTreeNodeGetImageIndex(node:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

{/sets the image index of the node }
procedure wGuiTreeNodeSetSelectedImageIndex(node:wGuiObject;
           imageIndex:UInt32); cdecl; external WS3DCoreLib ;

{/returns the image index of the node }
function wGuiTreeNodeGetSelectedImageIndex(node:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

{/sets the user data (UInt32*) of this node }
procedure wGuiTreeNodeSetData(node:wGuiObject;
           data:PUInt32); cdecl; external WS3DCoreLib ;

{/returns the user data (UInt32*) of this node }
function wGuiTreeNodeGetData(node:wGuiObject):PUInt32; cdecl; external WS3DCoreLib ;

{/sets the user data2 of this node }
procedure wGuiTreeNodeSetData2(node:wGuiObject;
           data2:PUInt32); cdecl; external WS3DCoreLib ;

{/returns the user data2 of this node }
function wGuiTreeNodeGetData2(node:wGuiObject):PUInt32; cdecl; external WS3DCoreLib ;

{/returns the child item count }
function wGuiTreeNodeGetChildsCount(node:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

{/Remove a child node. }
procedure wGuiTreeNodeRemoveChild(node:wGuiObject;
           child:wGuiObject); cdecl; external WS3DCoreLib ;

{/removes all children (recursive) from this node }
procedure wGuiTreeNodeRemoveChildren(node:wGuiObject); cdecl; external WS3DCoreLib ;

{/returns true if this node has child nodes }
function wGuiTreeNodeHasChildren(node:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Adds a new node behind the last child node. }
function wGuiTreeNodeAddChildBack(node:wGuiObject; text:WString; icon:WString=nullstr; imageIndex:Int32=-1;
           selectedImageIndex:Int32=-1; data:Pointer=nil; data2:PUInt32=nil):wGuiObject; cdecl; external WS3DCoreLib ;

{/Adds a new node before the first child node. }
function wGuiTreeNodeAddChildFront(node:wGuiObject; text:WString; icon:WString=nullstr; imageIndex:Int32=-1;
           selectedImageIndex:Int32=-1; data:Pointer=nil; data2:PUInt32=nil):wGuiObject; cdecl; external WS3DCoreLib ;

{/Adds a new node behind the other node. }
function wGuiTreeNodeInsertChildAfter(node:wGuiObject; other:wGuiObject; text:WString; icon:WString=nullstr;
           imageIndex:Int32=-1;selectedImageIndex:Int32=-1; data:Pointer=nil; data2:PUInt32=nil):wGuiObject; cdecl; external WS3DCoreLib ;

{/Adds a new node before the other node. }
function wGuiTreeNodeInsertChildBefore(node:wGuiObject; other:wGuiObject; text:WString; icon:WString=nullstr;
           imageIndex:Int32=-1; selectedImageIndex:Int32=-1; data:Pointer=nil; data2:PUInt32=nil):wGuiObject; cdecl; external WS3DCoreLib ;

{/Return the first child node from this node. }
function wGuiTreeNodeGetFirstChild(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/Return the last child node from this node. }
function wGuiTreeNodeGetLastChild(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/Returns the previous sibling node from this node. }
function wGuiTreeNodeGetPrevSibling(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/Returns the next sibling node from this node. }
function wGuiTreeNodeGetNextSibling(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/Returns the next visible (expanded, may be out of scrolling) node from this node. }
function wGuiTreeNodeGetNextVisible(node:wGuiObject):wGuiObject; cdecl; external WS3DCoreLib ;

{/Moves a child node one position up. }
function wGuiTreeNodeMoveChildUp(node:wGuiObject;
           child:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Moves a child node one position down. }
function wGuiTreeNodeMoveChildDown(node:wGuiObject;
           child:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Sets if the node is expanded. }
procedure wGuiTreeNodeSetExpanded(node:wGuiObject;
           expanded:Boolean); cdecl; external WS3DCoreLib ;

{/Returns true if the node is expanded (children are visible). }
function wGuiTreeNodeIsExpanded(node:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Sets this node as selected }
procedure wGuiTreeNodeSetSelected(node:wGuiObject;
           selected:Boolean); cdecl; external WS3DCoreLib ;

{/Returns true if the node is currently selected. }
function wGuiTreeNodeIsSelected(node:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Returns true if this node is the root node. }
function wGuiTreeNodeIsRoot(node:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/Returns the level of this node. }
{/The root node has level 0. }
{/Direct children of the root has level 1 ... }
function wGuiTreeNodeGetLevel(node:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

{/Returns true if this node is visible (all parents are expanded) }
function wGuiTreeNodeIsVisible(node:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

{/wGuiImageList/// }
function wGuiImageListCreate(texture:wTexture; size:wVector2i;
           useAlphaChannel:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiImageListDraw(list:wGuiObject; index:Int32; pos:wVector2i;
           clipPos:wVector2i; clipSize:wVector2i); cdecl; external WS3DCoreLib ;

function wGuiImageListGetCount(list:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiImageListGetSize(list:wGuiObject):wVector2i; cdecl; external WS3DCoreLib ;

{/wGuiColorSelectDialog/// }
function wGuiColorSelectDialogCreate(title:WString = nullStr;
           modal:Boolean=true):wGuiObject; cdecl; external WS3DCoreLib ;

{/wGuiMeshViewer/// }
function wGuiMeshViewerCreate(minPos:wVector2i; maxPos:wVector2i;
           text:WString = nullStr):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiMeshViewerSetMesh(viewer:wGuiObject;
           mesh:wMesh); cdecl; external WS3DCoreLib ;

function wGuiMeshViewerGetMesh(viewer:wGuiObject):wMesh; cdecl; external WS3DCoreLib ;

procedure wGuiMeshViewerSetMaterial(viewer:wGuiObject;
           material:wMaterial); cdecl; external WS3DCoreLib ;

function wGuiMeshViewerGetMaterial(viewer:wGuiObject):wMaterial; cdecl; external WS3DCoreLib ;

{/wGuiSpriteBank/// }
{/Returns pointer to the sprite bank with the specified file name. }
{/Loads the bank if it was not loaded before. }
function wGuiSpriteBankLoad(_file:PChar):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiSpriteBankCreate(name:PChar):wGuiObject; cdecl; external WS3DCoreLib ;

{/Adds a texture to the sprite bank. }
procedure wGuiSpriteBankAddTexture(bank:wGuiObject;
           texture:wTexture); cdecl; external WS3DCoreLib ;

{/Changes one of the textures in the sprite bank }
procedure wGuiSpriteBankSetTexture(bank:wGuiObject; index:UInt32;
           texture:wTexture); cdecl; external WS3DCoreLib ;

{/Add the texture and use it for a single non-animated sprite. }
{/The texture and the corresponding rectangle and sprite will all be added }
{/ to the end of each array. returns the index of the sprite or -1 on failure }
function wGuiSpriteBankAddSprite(bank:wGuiObject;
           texture:wTexture):Int32; cdecl; external WS3DCoreLib ;

function wGuiSpriteBankGetTexture(bank:wGuiObject;
           index:UInt32):wTexture; cdecl; external WS3DCoreLib ;

function wGuiSpriteBankGetTexturesCount(bank:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiSpriteBankRemoveAll(bank:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiSpriteBankDrawSprite(bank:wGuiObject; index:UInt32; position:wVector2i; clipPosition:PwVector2i;
           clipSize:PwVector2i; color:wColor4s; starttime:UInt32; currenttime:UInt32;
           loop:Boolean; center:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiSpriteBankDrawSpriteBatch(bank:wGuiObject; indexArray:PUInt32; idxArrayCount:UInt32; positionArray:PwVector2i;
           posArrayCount:UInt32;clipPosition:PwVector2i; clipSize:PwVector2i; color:wColor4s; startTime:UInt32;
           currentTime:UInt32; loop:Boolean; center:Boolean); cdecl; external WS3DCoreLib ;

{/wGuiCheckGroup }
function wGuiCheckBoxGroupCreate(minPos:wVector2i;
           maxPos:wVector2i):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupAddCheckBox(group:wGuiObject;
           check:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupInsertCheckBox(group:wGuiObject;
           check:wGuiObject; index:UInt32):Int32; cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupGetCheckBox(group:wGuiObject;
           index:UInt32):wGuiObject; cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupGetIndex(group:wGuiObject;
           check:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupGetSelectedIndex(group:wGuiObject):Int32; cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupRemoveCheckBox(group:wGuiObject;
           index:UInt32):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxGroupRemoveAll(group:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiCheckBoxGroupGetSize(group:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxGroupSelectCheckBox(group:wGuiObject;
           index:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxGroupClearSelection(group:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxGroupSetBackgroundColor(obj:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiCheckBoxGroupDrawBackground(obj:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

{/wGuiProgressBar/// }
function wGuiProgressBarCreate(minPos:wVector2i; maxPos:wVector2i;
           isHorizontal:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

{ __cplusplus }
procedure wGuiProgressBarSetPercentage(bar:wGuiObject;
           percent:UInt32); cdecl; external WS3DCoreLib ;

function wGuiProgressBarGetPercentage(bar:wGuiObject):UInt32; cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetDirection(bar:wGuiObject;
           isHorizontal:Boolean); cdecl; external WS3DCoreLib ;

function wGuiProgressBarIsHorizontal(bar:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetBorderSize(bar:wGuiObject;
           size:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetSize(bar:wGuiObject;
           size:wVector2u); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetFillColor(bar:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiProgressBarGetFillColor(bar:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetTextColor(bar:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarShowText(bar:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiProgressBarIsShowText(bar:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetFillTexture(bar:wGuiObject;
           tex:wTexture); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetBackTexture(bar:wGuiObject;
           tex:wTexture); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetFont(bar:wGuiObject;
           font:wFont); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetBackgroundColor(bar:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiProgressBarSetBorderColor(obj:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

{/wGuiTextArea/// }
function wGuiTextAreaCreate(minPos:wVector2i; maxPos:wVector2i;
           maxLines:Int32):wGuiObject; cdecl; external WS3DCoreLib ;

{ __cplusplus }
procedure wGuiTextAreaSetBorderSize(tarea:wGuiObject;
           size:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetAutoScroll(tarea:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetPadding(tarea:wGuiObject;
           padding:UInt32); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetBackTexture(tarea:wGuiObject;
           tex:wTexture); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetWrapping(tarea:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetFont(tarea:wGuiObject;
           font:wFont); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaAddLine(tarea:wGuiObject; text:PWChar; lifeTime:UInt32;
           color:wColor4s; icon:wTexture; iconMode:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaRemoveAll(tarea:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetBackgroundColor(tarea:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiTextAreaSetBorderColor(tarea:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

{/wGuiCEditor/// }
function wGuiCEditorCreate(wcptrText:PWChar; minPos:wVector2i; maxPos:wVector2i;
           border:Boolean):wGuiObject; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetHScrollVisible(box:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetText(box:wGuiObject;
           text:PWChar); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetColors(box:wGuiObject; backColor:wColor4s;
           lineColor:wColor4s; textColor:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetLinesCountVisible(box:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCEditorIsLinesCountVisible(box:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetElementText(box:wGuiObject; index:UInt32;
           text:PWChar); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetSelectionColors(box:wGuiObject; backColor:wColor4s;
           textColor:wColor4s; back2Color:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorRemoveText(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorAddKeyword(box:wGuiObject; word:PChar; color:wColor4s;
           matchCase:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorAddLineKeyword(box:wGuiObject; word:PChar; color:wColor4s;
           matchCase:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorAddGroupKeyword(box:wGuiObject; word:PChar; endKeyword:PChar;
           color:wColor4s; matchCase:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorBoxAddKeywordInfo(box:wGuiObject; size:Int32;
           _type:Int32); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorBoxRemoveAllKeywords(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorBoxAddCppKeywords(box:wGuiObject; key:wColor4s;
           _string:wColor4s; comment:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorAddLuaKeywords(box:wGuiObject; key:wColor4s;
           _string:wColor4s; comment:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorAddFbKeywords(box:wGuiObject; key:wColor4s;
           _string:wColor4s; comment:wColor4s); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorReplaceText(box:wGuiObject; start:Int32;
           _end:Int32; text:PWChar); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorPressReturn(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorAddText(box:wGuiObject;
           addText:PWChar); cdecl; external WS3DCoreLib ;

function wGuiCEditorGetText(box:wGuiObject):PWChar; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetLineToggleVisible(box:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetContextMenuText(box:wGuiObject; cut_text:PWChar; copy_text:PWChar; paste_text:PWChar;
           del_text:PWChar; redo_text:PWChar; undo_text:PWChar; btn_text:PWChar); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorBoxCopy(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorCut(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorPaste(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorUndo(box:wGuiObject); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorRedo(box:wGuiObject); cdecl; external WS3DCoreLib ;

function wGuiCEditorGetOverrideFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

function wGuiCEditorGetActiveFont(obj:wGuiObject):wFont; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorEnableOverrideColor(obj:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCEditorIsOverrideColor(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetOverrideColor(obj:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

function wGuiCEditorGetOverrideColor(obj:wGuiObject):wColor4s; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetDrawBackground(obj:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCEditorIsDrawBackGround(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetDrawBorder(obj:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCEditorIsDrawBorder(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetTextAlignment(obj:wGuiObject; Horizontalvalue:wGuiAlignment;
           Verticalvalue:wGuiAlignment); cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetWordWrap(obj:wGuiObject;
           value:Boolean); cdecl; external WS3DCoreLib ;

function wGuiCEditorIsWordWrap(obj:wGuiObject):Boolean; cdecl; external WS3DCoreLib ;

procedure wGuiCEditorSetBackgroundColor(obj:wGuiObject;
           color:wColor4s); cdecl; external WS3DCoreLib ;

// преобразование строк в WString
function WStr (text : PChar) : WString; overload;
function WStr (text : AnsiString) : WString; overload;
function PWStr (text : PChar) : PWString; overload;
function PWStr (text : AnsiString) : PWString; overload;
function WStrPas (text : PWChar) : UnicodeString;

implementation

{$IFDEF WINDOWS}
function WStr (text: PChar) : WString;
begin
  Result := WString (text);
end;
{$ELSE}
function WStr (text: PChar) : WString;
var
  i : Int32;
  Chars : array of WChar;
begin
  SetLength (Chars, Length (text) + 1);
  for i := 0 to Length (text) - 1 do
    Chars [i] := WChar (text [i]);
  Chars [Length (text)] := WChar(#0);
  Result := Chars;
  //Result := UCS4String (text);
end;
{$ENDIF}

function WStr(text: AnsiString) : WString;
begin
  Result := WStr (PChar (text));
end;

function PWStr(text: PChar): PWString;
const
  convertedStr : WString = nullStr;
begin
  convertedStr := WStr(text);
  Result := @convertedStr;
end;

function PWStr(text: AnsiString): PWString;
begin
  Result := PWStr(PChar(text));
end;

function WStrPas(text: PWChar): UnicodeString;
begin
{$IFDEF WINDOWS}
Result := StrPas (text);
{$ELSE}
Result := UCS4StringToUnicodeString (text);
{$ENDIF}
end;

end.
