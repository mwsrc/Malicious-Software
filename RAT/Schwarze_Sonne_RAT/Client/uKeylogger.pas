unit uKeylogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, PngBitBtn,winsock;

type
  TForm10 = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    redt1: TRichEdit;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    stat1: TStatusBar;
    redt2: TRichEdit;
    PngBitBtn4: TPngBitBtn;
    pb1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure PngBitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.FormCreate(Sender: TObject);
begin
redt1.Text := '';
redt2.Text := '';
end;

procedure TForm10.PngBitBtn1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Data := '30|'+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);

    PngBitBtn2.Enabled := True;
    PngBitBtn1.Enabled := False;
end;

procedure TForm10.PngBitBtn2Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Data := '31|'+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);

  PngBitBtn1.Enabled := True;
  PngBitBtn2.Enabled := False;
end;

procedure TForm10.PngBitBtn4Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Data := '42|' + Stat1.Panels[0].Text+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;

end.
