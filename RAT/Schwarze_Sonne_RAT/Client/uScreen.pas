unit uScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn,winsock, ExtCtrls,ZLIB,StreamManager;

type
  TForm4 = class(TForm)
    stat1: TStatusBar;
    PngBitBtn1: TPngBitBtn;
    btn1: TButton;
    img1: TImage;
    tmr1: TTimer;
    procedure PngBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    sStop:Boolean;
    sScreenShotStr:string;
    MyFirstBmp:TMemoryStream;
    MySecondBmp:TMemoryStream;
    MyTempStream:TMemoryStream;
    MyCompareBmp:TMemoryStream;
    unPackStream:TMemoryStream;
    procedure ProcessData();

    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses uFilemanager;

{$R *.dfm}

procedure TForm4.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if PngBitBtn1.Caption = 'Start' then begin
sStop := False;
Data := '24|' + Stat1.Panels[0].Text +  '||' + #10;
Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
PngBitBtn1.Caption := 'Stop';
//tmr1.Enabled := True;
end else begin
  sStop := True;
  //tmr1.Enabled := false;
  PngBitBtn1.Caption := 'Start';
end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
sStop := True;
end;
procedure StringToStream(AString: string; ADest: TStream);
// Takes a string and appends it to a stream.
var len: longint;
begin
  len := Length(AString);
  ADest.WriteBuffer(len, SizeOf(len));
  ADest.WriteBuffer(AString[1], len);
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
procedure TForm4.ProcessData();
var
  Len:Integer;
  Data:string;
  Buffer: Array[0..1000] Of Char;
  rFile:Array[0..8000] Of Char;
  sDat:string;
  MySize:Integer;
  T:string;
  TransFeredSize:integer;
  BytesSize,Total,derr:integer;
begin
sDat := '';
MyFirstBmp := TMemoryStream.Create;
MySecondBmp := TMemoryStream.Create;
MyCompareBmp := TMemoryStream.Create;
UnPackStream := TMemoryStream.Create;
MyTempStream := TMemoryStream.Create;
MySize := 0;
Sleep(1000);
T := 'ST' + #10;
send(StrToInt(Stat1.Panels[2].Text),T[1],Length(t),0);
Repeat
  if sStop = false then begin
  Len := Recv(StrToInt(Stat1.Panels[2].Text),Buffer, SizeOf(Buffer), 0);
  If (Len <= 0) Then Break;
  Data := String(Buffer);
  ZeroMemory(@Buffer, SizeOf(Buffer));
  sDat := data;
      if (Copy(sDat,1,2) = 'SI') or (Copy(sDat,1,2) = 'GI') then begin
         OutputDebugString(pchar('SI ODER GI DRINNE' + ' = ' + sdat));
         Delete(sDat,1,2);
         MySize := StrToInt(sDat);
         t := 'OK' + #10;
         send(StrToInt(stat1.Panels.Items[2].Text),T[1],Length(T),0);
      end;
      if (Copy(sDat,1,2) = 'OL') then begin
          MyTempStream := TMemoryStream.Create;
          TransferedSize := 0;
          BytesSize := 0;
          T := 'ok';
          If (BytesSize < mysize) Then
          Begin
            Total := 1;
            Repeat
              FillChar(rFile, SizeOf(rFile), 0);
              dErr := Recv(StrToInt(Stat1.Panels[2].Text), rFile, SizeOf(rFile), 0);
              If dErr = -1 Then Break;
              if mysize < (derr + total) then begin
                MyTempStream.Write(rFile,mysize - total + 1);
                OutputDebugString(PChar(string(rfile)));
                Inc(Total, derr);
              end else begin
                Inc(Total, dErr);
                MyTempStream.Write(rFile,dErr);
              end;
              TransferedSize := Total;
              Send(StrToInt(Stat1.Panels[2].Text), t[1], length(t), 0);
            Until (Total >= mySize);
         end;
         stringtostream(sDat,MyTempStream);
         MyTempStream.Position := 0;
         UnPackStream.Clear;
         //LHAExpand(MyTempStream, UnPackStream);
         DecompressStream(MyTempStream,unPackStream);
         UnPackStream.Position := 0;
         if MyFirstBmp.Size = 0 then begin
           MyFirstBmp.CopyFrom(UnPackStream, 0);
           MyFirstBmp.Position := 0;
           Img1.Picture.Bitmap.LoadFromStream(MyFirstBmp);
         end else begin
           MyCompareBmp.Clear;
           MySecondBmp.Clear;
           MyCompareBmp.CopyFrom(UnPackStream, 0);
           ResumeStream(MyFirstBmp, MySecondBmp, MyCompareBmp);
           Img1.Picture.Bitmap.LoadFromStream(MySecondBmp);
         end;
         MySize := 0;
         t := 'GT' + #10;
         send(StrToInt(stat1.Panels.Items[2].Text),T[1],Length(T),0);
         UnPackStream.Clear;
         MyTempStream.Clear;
      end;
  end else begin
    Break;
  end;
until 1=2;
MyFirstBmp.Free;
MySecondBmp.Free;
MyCompareBmp.Free;
UnPackStream.Free;
MyTempStream.Free;
end;
end.
