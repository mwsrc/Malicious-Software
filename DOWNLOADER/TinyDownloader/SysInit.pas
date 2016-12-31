unit SysInit;

interface

procedure _InitExe;
procedure _halt0;  
procedure halt;  
function RandInt(rCount:integer):integer;

var
  ModuleIsLib  : Boolean; 
  TlsIndex     : Integer = -1; 
  TlsLast      : Byte; 

const
  PtrToNil     : Pointer = nil; 

implementation

procedure _InitExe;
asm
end;

function rdtsc:Integer; asm rdtsc end;
function RandInt(rCount:integer):integer;
begin
result:=rdtsc mod rCount;
end;

procedure ExitProcess(uExitCode: INTEGER); stdcall; external 'kernel32.dll' name 'ExitProcess';
procedure halt;
begin
ExitProcess(0);
end;

procedure _halt0;
begin
Halt
end;

end. 
