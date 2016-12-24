unit untScreenShot;
interface
uses
  Windows,classes,graphics;

const
  WM_CAP_START = $0400;
  WM_CAP_DRIVER_CONNECT = $0400 + 10;
  WM_CAP_DRIVER_DISCONNECT = $0400 + 11;
  WM_CAP_SAVEDIB = $0400 + 25;
  WM_CAP_GRAB_FRAME = $0400 + 60;
  WM_CAP_STOP = $0400 + 68;
var
x,y:integer;
CaptureWindow: dword;
function CaptureWND(hWindow:HWND;Ratio:Extended;bitCount:integer;var x,y:integer):HBITMAP;

procedure GetScreenToBmp(DrawCur:Boolean;StreamName:TMemoryStream);
function GetBitmapFromDesktop:HBitmap;
function GetBitmapFromWebcam: HBitmap;
function SaveBitmapToFile(HBM: HBitmap;BitCount: word): tmemorystream;
function CompareString(s1,s2: string; Len: dword): string;
procedure CompareStream(MyFirstStream,MySecondStream,MyCompareStream:TMemorystream);
function capCreateCaptureWindowA(lpszWindowName: pchar; dwStyle: dword; x, y, nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall external 'AVICAP32.DLL';
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
  d:TMemoryStream;
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

MyFirstStream.Clear;
MyFirstStream.CopyFrom(MySecondStream,0);
MySecondStream.Position:=0;
end;
function SaveBitmapToFile(HBM: HBitmap;BitCount: word): tmemorystream;
const
  BMType = $4D42;
type
  TBitmap = record
    bmType: Integer;
    bmWidth: Integer;
    bmHeight: Integer;
    bmWidthBytes: Integer;
    bmPlanes: Byte;
    bmBitsPixel: Byte;
    bmBits: Pointer;
  end;
var
  BM: TBitmap;
  BFH: TBitmapFileHeader;
  BIP: PBitmapInfo;
  DC: HDC;
  HMem: THandle;
  Buf: Pointer;
  ColorSize, DataSize: Longint;
  stream: tmemorystream;

  function AlignDouble(Size: Longint): Longint;
  begin
    Result := (Size + 31) div 32 * 4;
  end;

begin
  if GetObject(HBM, SizeOf(TBitmap), @BM) = 0 then Exit;



  //BitCount := 4;
  if (BitCount <> 24) then ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount) else ColorSize := 0;

  DataSize := AlignDouble(bm.bmWidth * BitCount) * bm.bmHeight;
  GetMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);

  if BIP <> nil then begin
    with BIP^.bmiHeader do begin
      biSize := SizeOf(TBitmapInfoHeader);
      biWidth := bm.bmWidth;
      biHeight := bm.bmHeight;
      biPlanes := 1;
      biBitCount := BitCount;
      biCompression := 0;
      biSizeImage := DataSize;
      biXPelsPerMeter := 0;
      biYPelsPerMeter := 0;
      biClrUsed := 0;
      biClrImportant := 0;
    end;

    with BFH do begin
      bfOffBits := SizeOf(BFH) + SizeOf(TBitmapInfo) + ColorSize;
      bfReserved1 := 0;
      bfReserved2 := 0;
      bfSize := longint(bfOffBits) + DataSize;
      bfType := BMType;
    end;

    HMem := GlobalAlloc(gmem_Fixed, DataSize);
    if HMem <> 0 then begin
      Buf := GlobalLock(HMem);
      DC := GetDC(0);
      if GetDIBits(DC, hbm, 0, bm.bmHeight,Buf, BIP^, dib_RGB_Colors) <> 0 then begin

        Stream := TMemoryStream.Create;
        Stream.WriteBuffer(BFH, SizeOf(BFH));
        Stream.WriteBuffer(PChar(BIP)^, SizeOf(TBitmapInfo) + ColorSize);
        Stream.WriteBuffer(Buf^, DataSize);
        result := TMemoryStream.Create;
        stream.SaveToStream(result); 
        stream.Free;
      end;
      ReleaseDC(0, DC);
      GlobalUnlock(HMem);
      GlobalFree(HMem);
    end;

  end;
  FreeMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  DeleteObject(HBM);
end;
function CaptureWND(hWindow:HWND;Ratio:Extended;bitCount:integer;var x,y:integer):HBITMAP;
var  BmpInfo:BITMAPINFO; DC1,DC2:hDC; p:Pointer;  old:hgdiobj;
begin
    if hWindow = 0 then hWindow := GetDesktopWindow();
    DC1 := GetDC(hWindow);
    x := GetDeviceCaps(DC1,HORZRES);
    y := GetDeviceCaps(DC1,VERTRES);

    ZeroMemory(@BmpInfo.bmiHeader, sizeof(BITMAPINFOHEADER));
    BmpInfo.bmiHeader.biWidth := round(x * RATIO);
    BmpInfo.bmiHeader.biHeight := round(y * RATIO);
    BmpInfo.bmiHeader.biPlanes := 1;
    BmpInfo.bmiHeader.biBitCount := bitCount;
    BmpInfo.bmiHeader.biSize := sizeof(BITMAPINFOHEADER);
    DC2 := CreateCompatibleDC(0);
    Result := CreateDIBSection(DC2,BmpInfo, DIB_RGB_COLORS,p, 0, 0);
    Old := SelectObject(DC2, Result);
    if(RATIO <> 1)then
     begin
        SetStretchBltMode(DC2, HALFTONE); SetBrushOrgEx(DC2, 0, 0, nil);
        StretchBlt(DC2, 0, 0, BmpInfo.bmiHeader.biWidth, BmpInfo.bmiHeader.biHeight, DC1, 0, 0, x, y, SRCCOPY);
     end
    else BitBlt(DC2, 0, 0, BmpInfo.bmiHeader.biWidth, BmpInfo.bmiHeader.biHeight, DC1, 0, 0, SRCCOPY);
    SelectObject(DC2,Old);
    DeleteDC(DC2); ReleaseDC(hWindow, DC1);
    x := BmpInfo.bmiHeader.biWidth;
    y := BmpInfo.bmiHeader.biHeight;
end;
function GetBitmapFromDesktop:HBitmap;
var
  DC, MemDC: HDC;
  Bitmap, OBitmap: HBitmap;
  BitmapWidth, BitmapHeight: integer;
  Capture:hbitmap;
  p:HBITMAP;

begin
  Result := CaptureWND(0,1,24,x,y);
  //Result := Bitmap;
end;

function GetBitmapFromFile(BitmapPath: string): HBitmap;
begin
  Result := LoadImage(GetModuleHandle(nil), pchar(BitmapPath), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
end;

function GetBitmapFromWebcam: HBitmap;
begin
  CaptureWindow := capCreateCaptureWindowA('CaptureWindow', WS_CHILD or WS_VISIBLE, 0, 0, 0, 0, GetDesktopWindow, 0);
  if CaptureWindow <> 0 then
  begin
    SendMessage(CaptureWindow, WM_CAP_DRIVER_CONNECT, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_GRAB_FRAME, 0, 0);
    SendMessage(CaptureWindow, WM_CAP_SAVEDIB, 0, longint(pchar('~~tmp.bmp')));
    SendMessage(CaptureWindow, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    SendMessage(CaptureWindow, $0010, 0, 0);
    CaptureWindow := 0;
    Result := GetBitmapFromFile('~~tmp.bmp');
    DeleteFile(pchar('~~tmp.bmp'));
  end
  else
  begin
    Result := 234;
  end;
end;
function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  if Length(s1) <> Length(s2) then exit;
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s1[i] <> s2[i] then begin
      Result[i] := s2[i];
    end else begin
      Result[i] := '%';
    end;
  end;
end;

end.
