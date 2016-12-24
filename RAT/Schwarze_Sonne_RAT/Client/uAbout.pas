unit uAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Buttons, PngBitBtn;

type
  TForm8 = class(TForm)
    lbl1: TLabel;
    img1: TImage;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl8: TLabel;
    PngBitBtn1: TPngBitBtn;
    procedure PngBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.PngBitBtn1Click(Sender: TObject);
begin
close;
end;

end.
