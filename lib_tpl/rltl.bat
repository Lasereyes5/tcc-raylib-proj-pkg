@echo off
title Lain

if "%~1"=="" (
	echo raylib tcc link script ^(with compiling^)
	echo usage:
	echo 	rltl [compiler arguments]
	exit /b
)

set lib_root=%~dp0
set deps_root=%~dp0\deps

set cc="%lib_root%\tcc\tcc.exe"
set files= %*
set includes="-I%lib_root%\include"
set deps_libm="%deps_root%\msvcrt.def" "%deps_root%\s_fabsf.c"
set deps_win10_user32="%deps_root%\user33.c" -DUSER33_WIN8_1
set deps="%deps_root%\user32.def" %deps_libm% %deps_win10_user32% "%deps_root%\kernel32.def"
set libs="%lib_root%\lib\libraylib.a" "%lib_root%\lib\raylib.rc.res" %deps% -lshell32 -lwinmm -lgdi32 -lopengl32
REM set defines=-D
set args=%includes% %files% %libs% %defines%

%cc% %args%