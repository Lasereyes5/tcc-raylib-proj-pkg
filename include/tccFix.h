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
