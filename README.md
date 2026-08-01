# tcc-raylib-proj-pkg
a helper package about compile and pack raylib on win7, win 8, win8.1 with tcc.

### Usage

Copy the whole package into the directory `project/` inside the raylib repo directory, then modify and run scripts as your needs.

The package contains some windows bat script helping compile and pack the raylib :

- `build.bat` : Build raylib with tcc.
	- This script calls external windres from gcc, you can complete your custom path of windres or add the path into environment variable `PATH`.
- `cpl.bat` : Build raylib example program with built raylib and dependency codes.
	- Modify this script if need to compile other programs.
- `cpylib bat` : Pack the built raylib with dependency codes and tcc.
- `lib_tpl/` : Lib template directory for packing built raylib, just contains several windows bat scripts.

### Example

Run following commands in package directory:
```bat
build
cpl && example/example.exe
cpylib
```

### Tips

These scripts currently used on win8.1, if need to build or pack on other version of windows, find `-DUSER33_WIN8_1` in all scripts (also include scripts in `lib_tpl/` ) and replace them to `-DUSER33_WIN8` or just remove them for win7.

- `-DUSER33_WIN8_1` are located at line : `set deps_win10_user32=... -DUSER33_WIN8_1`
- for win10 or higher version of windows, just remove the line `set deps_win10_user32=...`, since these are made for lower versions of windows could compatiably support some win10 (or higher) only winapi.