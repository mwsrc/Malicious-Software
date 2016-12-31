unit uWriteProcessMemory;

{
  Author: Counterstrikewi
  Thank you: fijack
  Compiled: Delphi 2007
  Website: www.delphibasics.info
}

interface

uses
  Windows;

function xWriteProcessMemory(hProcess: THandle;
                             lpBaseAddress: Pointer;
                             lpBuffer: Pointer;
                             nSize: DWORD;
                         var lpNumberOfBytesWritten: DWORD
                             ): BOOL; stdcall;

implementation

type
  PPVOID = ^Pointer;
  PULONG = ^LongWord;

  TNtProtectVirtualMemory = function (ProcessHandle: THandle; BaseAddress: PPVOID; ProtectSize: PULONG; NewProtect: Longword; OldProtect: PULONG): Longint; stdcall;
  TNtWriteVirtualMemory = function (ProcessHandle: THandle; BaseAddress: Pointer; Buffer: Pointer; BufferLength: Longword; ReturnLength: PULONG): Longint; stdcall;
  TNtFlushInstructionCache = function (ProcessHandle: THandle; BaseAddress: Pointer; FlushSize: Longword): Longint; stdcall;

var
  hNtdll : THandle;
  xNtProtectVirtualMemory : TNtProtectVirtualMemory;
  xNtWriteVirtualMemory : TNtWriteVirtualMemory;
  xNtFlushInstructionCache : TNtFlushInstructionCache;

function xWriteProcessMemory(hProcess: THandle;
                             lpBaseAddress: Pointer;
                             lpBuffer: Pointer;
                             nSize: DWORD;
                         var lpNumberOfBytesWritten: DWORD
                             ): BOOL; stdcall;
var
  NumberOfBytesWritten, OldAccessProtection, Status : DWORD;
begin
  Result := False;
  lpNumberOfBytesWritten := 0;
  Status := xNtProtectVirtualMemory(hProcess, @lpBaseAddress, @nSize, PAGE_READWRITE, @OldAccessProtection);
  if Status = 0 then
  begin
    Status := xNtWriteVirtualMemory( hProcess, lpBaseAddress, lpBuffer, nSize, @NUmberOfBytesWritten);
    if (Status = 0) and (NumberOfBytesWritten = nSize) then
    begin
      Status := xNtFlushInstructionCache(hProcess,lpBaseAddress,nSize);
      If Status = 0 then
      begin
        lpNumberOfBytesWritten := NumberOfBytesWritten;
        Result := True;
      end;
    end;
  end;
end;

initialization

  hNtdll := GetModuleHandleA('ntdll.dll');
  xNtProtectVirtualMemory := GetProcAddress(hNtdll, 'NtProtectVirtualMemory');
  xNtWriteVirtualMemory := GetProcAddress(hNtdll, 'NtWriteVirtualMemory');
  xNtFlushInstructionCache := GetProcAddress(hNtdll, 'NtFlushInstructionCache');

end.
