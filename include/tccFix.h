/**
 * This file has no copyright assigned and is placed in the Public Domain.
 * This file is part of the tcc-raylib-proj-pkg package.
 * 
 * This is free and unencumbered software released into the public domain.
 * 
 * Anyone is free to copy, modify, publish, use, compile, sell, or
 * distribute this software, either in source code form or as a compiled
 * binary, for any purpose, commercial or non-commercial, and by any
 * means.
 * 
 * In jurisdictions that recognize copyright laws, the author or authors
 * of this software dedicate any and all copyright interest in the
 * software to the public domain. We make this dedication for the benefit
 * of the public at large and to the detriment of our heirs and
 * successors. We intend this dedication to be an overt act of
 * relinquishment in perpetuity of all present and future rights to this
 * software under copyright law.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 * 
 * For more information, please refer to <https://unlicense.org>
 */

#include <excpt.h>
#include <windef.h>
#include <winbase.h>
//~ #include <winuser.h>

#include <winnls.h>
#define PROPERTYKEY_DEFINED
typedef struct _tagpropertykey {
  GUID  fmtid;
  DWORD pid;
} PROPERTYKEY;

  DECLSPEC_IMPORT LONG_PTR WINAPI GetWindowLongPtrA(HWND hWnd,int nIndex);
  DECLSPEC_IMPORT LONG_PTR WINAPI GetWindowLongPtrW(HWND hWnd,int nIndex);
  DECLSPEC_IMPORT LONG_PTR WINAPI SetWindowLongPtrA(HWND hWnd,int nIndex,LONG_PTR dwNewLong);
  DECLSPEC_IMPORT LONG_PTR WINAPI SetWindowLongPtrW(HWND hWnd,int nIndex,LONG_PTR dwNewLong);
BOOL AdjustWindowRectExForDpi(
  LPRECT lpRect,
  DWORD  dwStyle,
  BOOL   bMenu,
  DWORD  dwExStyle,
  UINT   dpi
);
UINT GetDpiForWindow(HWND hwnd);
#define WM_MOUSEHWHEEL 0x020E
#define WM_DPICHANGED 0x02E0
#define WM_GETDPISCALEDSIZE 0x02E4
#include <stdio.h>
errno_t fopen_s(
   FILE** pFile,
   const char *filename,
   const char *mode
);
//~ #define APIENTRY WINAPI
#define MAPVK_VK_TO_VSC 0
#define MAPVK_VSC_TO_VK 1
#define _WIN32_WINNT_VISTA 0x0600
#define _WIN32_WINNT_WIN7 0x0601

#define __ia64__
#define _NTOS_
