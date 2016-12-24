unit uSettings;

interface

uses
  Windows, Messages, SysUtils, inifiles,Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, MainU;

type
  TForm1 = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    PngBitBtn1: TPngBitBtn;
    procedure PngBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Function IsNum(S: String): Bool;
Var
  I: Word;
Begin
  If S = '' Then
  Begin
    Result := False;
    Exit;
  End;
  
  Result := True;
  For I := 1 To Length(S) Do
    If (Pos(S[I], ' 0123456789') = 0) Then
    Begin
      Result := False;
      Break;
    End;
End;

procedure TForm1.PngBitBtn1Click(Sender: TObject);
var
  Ini: TIniFile;
begin
if IsNum(edt1.Text) then begin
  StartListening(strtoint(edt1.Text));
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
    Ini.WriteString('Options', 'Port', edt1.Text);
    Ini.WriteString('Options', 'Password', edt2.Text);
  finally
    Ini.Free;
  end;
  close;
end else begin
  ShowMessage('Please set a valid Port');
end;
end;

end.
