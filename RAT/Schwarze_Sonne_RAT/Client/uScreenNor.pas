unit uScreenNor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn, ExtCtrls,winsock;

type
  TForm12 = class(TForm)
    TrackBar2: TTrackBar;
    stat1: TStatusBar;
    PngBitBtn1: TPngBitBtn;
    lbl2: TLabel;
    pb1: TProgressBar;
    img1: TImage;
    btn1: TButton;
    procedure PngBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sStop:boolean;
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.PngBitBtn1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
if PngBitBtn1.Caption = 'Start' then begin
sStop := False;
Data := '50|' + Stat1.Panels[0].Text +  '|' + IntToStr(TrackBar2.Position) +'|' + #10;
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

end.
