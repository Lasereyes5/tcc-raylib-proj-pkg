@echo off
title Lain

set raylib_root=%~dp0\..\..
set dir_root=%~dp0

set lib_template=lib_tpl
set lib_dir=raylib-6.1-dev_win64_win8_1_tcc
set lib_info=CHANGELOG LICENSE README.md
set lib_headers=raylib.h raymath.h rlgl.h

cd "%dir_root%"
if not exist "%lib_dir%" mkdir "%lib_dir%"
xcopy /y /s "%lib_template%" "%lib_dir%"
cd "%lib_dir%"
if not exist tcc mkdir tcc
if not exist lib mkdir lib
if not exist include mkdir include
if not exist deps mkdir deps

copy /y "%dir_root%\tcc" tcc
xcopy /y "%raylib_root%\lib" lib
copy /y "%raylib_root%\src\raylib.rc.res" lib
for %%i in (%lib_headers%) do copy /y "%raylib_root%\src\%%i" include
for %%i in (%lib_info%) do copy /y "%raylib_root%\%%i" .
copy /y "%dir_root%\deps\s_fabsf.c" deps
copy /y "%dir_root%\deps\user33.c" deps
cd deps
tcc -impdef msvcrt.dll -o msvcrt.def
tcc -impdef user32.dll -o user32.def
tcc -impdef kernel32.dll -o kernel32.def
