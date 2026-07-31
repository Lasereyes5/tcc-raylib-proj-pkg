@echo off
title Lain

set raylib_root=%~dp0\..\..
set deps_root=%~dp0\deps

cd example
set cc="%~dp0\tcc\tcc.exe"
set files=example.c
set includes="-I%raylib_root%\src"
set deps_libm="%deps_root%\msvcrt.def" "%deps_root%\s_fabsf.c"
set deps_win10_user32="%deps_root%\user33.c" -DUSER33_WIN8_1
set deps="%deps_root%\user32.def" %deps_libm% %deps_win10_user32% "%deps_root%\kernel32.def"
set libs="%raylib_root%\lib\libraylib.a" %deps% -lshell32 -lwinmm -lgdi32 -lopengl32
REM set defines=-D
set args=%includes% %files% %libs% %defines%
REM -Wl,-subsystem=gui

pushd %deps_root%
"%~dp0\tcc\tcc.exe" -impdef msvcrt.dll -o msvcrt.def
"%~dp0\tcc\tcc.exe" -impdef user32.dll -o user32.def
"%~dp0\tcc\tcc.exe" -impdef kernel32.dll -o kernel32.def
popd

%cc% %args%