@ECHO OFF
REM --------------Set your paths here----------------------
set FPC_PATH=C:\lazarus\fpc\3.0.4
set LazUtils=C:\lazarus\components\lazutils

REM -- path to freepascal compiler (fpc) -- 
set FPC_BIN=%FPC_PATH%\bin\i386-win32
rem set FPC_BIN=%FPC_PATH%\bin\x86_64-win64

set FPC_CONSOLE=%FPC_PATH%\units\i386-win32\rtl-console
rem set FPC_CONSOLE=%FPC_PATH%\units\x86-win64\rtl-console

set TARGET=-TWin32 -Pi386
rem set TARGET=-TWin64 -Px86_64

set FLAGS=-Xs -XX -CX -Sh -Mobjfpc -O2
cd ../Examples

del *.exe
del *.bak
del *.lps
del *.o
del *.ppu
del *.a
del *.dbg
%FPC_BIN%\fpc 01_HelloWorld %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 02_2DImages %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 03_BitmapFont %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 04_3DModel %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 05_BSPMap %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 06_Billboards %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 07_ParticleSystem %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 08_ShadowAndLights %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 10_TerrainAndFog %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 11_Animators %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 12_Collision %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 15_CustomMesh %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 19_Node_SelectedByCamera %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 20_Node_RayHittingSurface %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 22_IndiciesAndVerticies %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 30_Water_Animated %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 37_Materials_Shader %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include
%FPC_BIN%\fpc 41_Animation_Blending %FLAGS% %TARGET% -Fl%LazUtils%;../Include -Fu%LazUtils%;%FPC_CONSOLE%;../Include


del *.o
del *.ppu
del *.a

cd..
cd Include

del *.o
del *.ppu
del *.a

ECHO -----------------------------
ECHO Press ENTER to continue...
pause > nul
