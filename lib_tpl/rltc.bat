@echo off
title Lain

if "%~1"=="" (
	echo raylib tcc compile script ^(without linking^)
	echo usage:
	echo 	rltc [compiler arguments]
	exit /b
)

"%~dp0\tcc\tcc.exe" "-I%~dp0include" %*