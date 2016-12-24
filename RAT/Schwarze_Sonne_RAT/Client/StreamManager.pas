unit StreamManager;

interface
uses  Windows,Classes,Graphics;
procedure GetScreenToBmp(DrawCur:Boolean;StreamName:TMemoryStream);
procedure CompareStream(MyFirstStream,MySecondStream,MyCompareStream:TMemorystream);
procedure ResumeStream(MyFirstStream,MySecondStream,MyCompareStream:TMemorystream);
implementation
procedure GetScreenToBmp(DrawCur:Boolean;StreamName:TMemoryStream);
var
Mybmp:Tbitmap;
Cursorx, Cursory: integer;
dc: hdc;
Mycan: Tcanvas;
R: TRect;
DrawPos: TPoint;
MyCursor: TIcon;
hld: hwnd;
Threadld: dword;
mp: tpoint;
pIconInfo: TIconInfo;
begin
Mybmp := Tbitmap.Create;
Mycan := TCanvas.Create;
dc := GetWindowDC(0);
try
Mycan.Handle := dc;
R := Rect(0, 0,  GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN));
Mybmp.Width := R.Right;
Mybmp.Height := R.Bottom;
Mybmp.Canvas.CopyRect(R, Mycan, R);
finally
releaseDC(0, DC);
end;
Mycan.Handle := 0;
Mycan.Free;

if DrawCur then
begin
GetCursorPos(DrawPos);
MyCursor := TIcon.Create;
getcursorpos(mp);
hld := WindowFromPoint(mp);
Threadld := GetWindowThreadProcessId(hld, nil);
AttachThreadInput(GetCurrentThreadId, Threadld, True);
MyCursor.Handle := Getcursor();
AttachThreadInput(GetCurrentThreadId, threadld, False);
GetIconInfo(Mycursor.Handle, pIconInfo);
cursorx := DrawPos.x - round(pIconInfo.xHotspot);
cursory := DrawPos.y - round(pIconInfo.yHotspot);
Mybmp.Canvas.Draw(cursorx, cursory, MyCursor);
DeleteObject(pIconInfo.hbmColor);
DeleteObject(pIconInfo.hbmMask);
Mycursor.ReleaseHandle;
MyCursor.Free;
end;
Mybmp.PixelFormat:=pf8bit;
Mybmp.SaveToStream(StreamName);
Mybmp.Free;

end;
procedure CompareStream(MyFirstStream,MySecondStream,MyCompareStream:TMemorystream);
var
  I: Integer;
  P1, P2, P3: ^Char;
begin
MySecondStream.Clear;
MyCompareStream.Clear;
GetScreenToBmp(False,MySecondStream);
  P1 := MyFirstStream.Memory;
  P2 := MySecondStream.Memory;
  MyCompareStream.SetSize(MyFirstStream.Size);
  P3 := MyCompareStream.Memory;

  for I := 0 to MyFirstStream.Size - 1 do
  begin
    if P1^ = P2^ then
      P3^ := '0'
    else
      P3^ := P2^;
    Inc(P1);
    Inc(P2);
    Inc(P3);
  end;

MyFirstStream.Clear;
MyFirstStream.CopyFrom(MySecondStream,0);
end;
procedure ResumeStream(MyFirstStream,MySecondStream,MyCompareStream:TMemorystream);
var
  I: Integer;
  P1, P2, P3: ^Char;
begin
 P1 := MyFirstStream.Memory;
  MySecondStream.SetSize(MyFirstStream.Size);
  P2 := MySecondStream.Memory;
  P3 := MyCompareStream.Memory;

  for I := 0 to MyFirstStream.Size - 1 do
  begin
    if P3^ = '0' then
      P2^ := p1^
    else
      P2^ := P3^;
    Inc(P1);
    Inc(P2);
    Inc(P3);
  end;
//---------------------------------------------
MyFirstStream.Clear;
MyFirstStream.CopyFrom(MySecondStream,0);
MySecondStream.Position:=0;
end;

end.
 