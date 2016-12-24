program CryptoGear;

uses
  Forms,
  UnitTest in 'UnitTest.pas' {Form1},
  uCryptoGear in 'uCryptoGear.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
