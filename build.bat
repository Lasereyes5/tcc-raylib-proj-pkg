@echo off
title Lain

cd %~dp0\..\..
if not exist obj mkdir obj
if not exist lib mkdir lib

cd obj
set RAYLIB_SRC=..\src
set RAYLIB_DEFINES=-D_DEFAULT_SOURCE -DPLATFORM_DESKTOP_WIN32 -DGRAPHICS_API_OPENGL_33
set RAYLIB_C_FILES="%RAYLIB_SRC%\rcore.c" "%RAYLIB_SRC%\rshapes.c" "%RAYLIB_SRC%\rtextures.c" "%RAYLIB_SRC%\rtext.c" "%RAYLIB_SRC%\rmodels.c" "%RAYLIB_SRC%\raudio.c" "%RAYLIB_SRC%\rglfw.c"
set RAYLIB_INCLUDE_FLAGS=-I"%RAYLIB_SRC%" -I"%RAYLIB_SRC%\external\glfw\include" -I"%RAYLIB_SRC%\external\glfw\deps\mingw"

set cc="%~dp0\tcc\tcc.exe"
set ar="%~dp0\tcc\tcc.exe" -ar
set files=%RAYLIB_C_FILES%
set includes=%RAYLIB_INCLUDE_FLAGS% -I"%~dp0include\winapi" -I"%~dp0include" -includetccFix.h
set defines=%RAYLIB_DEFINES%
set args=%includes% %defines% %files%

REM %cc% %args% -c
windres "%RAYLIB_SRC%\raylib.dll.rc" -O coff -o "%RAYLIB_SRC%\raylib.dll.rc.res"
windres "%RAYLIB_SRC%\raylib.rc" -O coff -o "%RAYLIB_SRC%\raylib.rc.res"
%cc% "%RAYLIB_SRC%\raylib.rc.res" -r -o "raylib.rc.o"

cd ..\lib
%ar% rcs libraylib.a ..\obj\*.o
%cc% -o raylib.o -r ..\obj\*.o


REM build raylib.dll

set raylib_root=%~dp0\..\..
set deps_root=%~dp0\deps

set deps_libm=%deps_root%\msvcrt.def %deps_root%\s_fabsf.c
set deps_win10_user32=%deps_root%\user33.c -DUSER33_WIN8_1
set deps=%deps_root%\user32.def %deps_libm% %deps_win10_user32% %deps_root%\kernel32.def
set libs=%deps% -lshell32 -lwinmm -lgdi32 -lopengl32

pushd %deps_root%
"%~dp0\tcc\tcc.exe" -impdef msvcrt.dll -o msvcrt.def
"%~dp0\tcc\tcc.exe" -impdef user32.dll -o user32.def
"%~dp0\tcc\tcc.exe" -impdef kernel32.dll -o kernel32.def
popd

%cc% %args% %libs% %RAYLIB_SRC%\raylib.dll.rc.res -shared -o raylib.dll -DBUILD_LIBTYPE_SHARED
