unit UnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  uCryptoGear, StdCtrls;

function FileToByteArray(sPath: string): TByteArray;

type
  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    edtKey: TEdit;
    grpMode: TGroupBox;
    rbECB: TRadioButton;
    rbCBC: TRadioButton;
    grpIV: TGroupBox;
    edtIV: TEdit;
    GroupBox3: TGroupBox;
    edtPath: TEdit;
    btnBrowse: TButton;
    dlgOpen: TOpenDialog;
    btnEncrypt: TButton;
    btnDecrypt: TButton;
    lblSite: TLabel;
    lblAbout: TLabel;
    procedure btnEncryptClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnEncryptClick(Sender: TObject);
var
  CryptoGear: CCryptoGear;
  FileData: TByteArray;
  OutFile:  TMemoryStream;
  mode: Byte;
  sDebug: AnsiString;
  sOutPath: string;
begin

  if rbECB.Checked = true then mode := MODE_ECB
  else mode := MODE_CBC;

  FileData := FileToByteArray(edtPath.Text);

  CryptoGear := CCryptoGear.Initialize(edtKey.Text, mode, StrToInt(edtIV.Text));
  CryptoGear.Encrypt(FileData);

  sOutPath := edtPath.Text + '.encrypted';

  OutFile := TMemoryStream.Create;
  OutFile.WriteBuffer(FileData[0], Length(FileData));
  OutFile.SaveToFile(sOutPath);
  outFile.Free;

  MessageBox(Self.WindowHandle, PChar('File Encrypted!' + #13#10 + 'Saved as: ' + sOutPath), 'Done!', MB_ICONINFORMATION );
end;

procedure TForm1.btnDecryptClick(Sender: TObject);
var
  CryptoGear: CCryptoGear;
  FileData: TByteArray;
  OutFile:  TMemoryStream;
  mode: Byte;
  sOutPath: string;
begin

  if rbECB.Checked = true then mode := MODE_ECB
  else mode := MODE_CBC;

  FileData := FileToByteArray(edtPath.Text);

  CryptoGear := CCryptoGear.Initialize(edtKey.Text, mode, StrToInt(edtIV.Text));
  CryptoGear.Decrypt(FileData);

  sOutPath := edtPath.Text + '.decrypted';

  OutFile := TMemoryStream.Create;
  OutFile.WriteBuffer(FileData[0], Length(FileData));
  OutFile.SaveToFile(sOutPath);
  OutFile.Free;

  MessageBox(Self.WindowHandle, PChar('File Decrypted!' + #13#10 + 'Saved as: ' + sOutPath), 'Done!', MB_ICONINFORMATION );
end;

procedure TForm1.btnBrowseClick(Sender: TObject);
begin
  dlgOpen.Title := 'Select a file to add in binder list';
  dlgOpen.Filter := '';

  if dlgOpen.Execute() then begin
    edtPath.Text := dlgOpen.FileName;
  end;
end;


function FileToByteArray(sPath: string): TByteArray;
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(sPath, fmOpenRead);
  SetLength(Result, FileStream.Size);
  FileStream.ReadBuffer(Result[0], FileStream.Size);
  FileStream.Free;
end;

end.
