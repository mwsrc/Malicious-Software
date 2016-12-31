{
  This software is Copyright (c) 2016 by Doddy Hackman.
  This is free software, licensed under:
  The Artistic License 2.0
  The Artistic License
  Preamble
  This license establishes the terms under which a given free software Package may be copied, modified, distributed, and/or redistributed. The intent is that the Copyright Holder maintains some artistic control over the development of that Package while still keeping the Package available as open source and free software.
  You are always permitted to make arrangements wholly outside of this license directly with the Copyright Holder of a given Package. If the terms of this license do not permit the full use that you propose to make of the Package, you should contact the Copyright Holder and seek a different licensing arrangement.
  Definitions
  "Copyright Holder" means the individual(s) or organization(s) named in the copyright notice for the entire Package.
  "Contributor" means any party that has contributed code or other material to the Package, in accordance with the Copyright Holder's procedures.
  "You" and "your" means any person who would like to copy, distribute, or modify the Package.
  "Package" means the collection of files distributed by the Copyright Holder, and derivatives of that collection and/or of those files. A given Package may consist of either the Standard Version, or a Modified Version.
  "Distribute" means providing a copy of the Package or making it accessible to anyone else, or in the case of a company or organization, to others outside of your company or organization.
  "Distributor Fee" means any fee that you charge for Distributing this Package or providing support for this Package to another party. It does not mean licensing fees.
  "Standard Version" refers to the Package if it has not been modified, or has been modified only in ways explicitly requested by the Copyright Holder.
  "Modified Version" means the Package, if it has been changed, and such changes were not explicitly requested by the Copyright Holder.
  "Original License" means this Artistic License as Distributed with the Standard Version of the Package, in its current version or as it may be modified by The Perl Foundation in the future.
  "Source" form means the source code, documentation source, and configuration files for the Package.
  "Compiled" form means the compiled bytecode, object code, binary, or any other form resulting from mechanical transformation or translation of the Source form.
  Permission for Use and Modification Without Distribution
  (1) You are permitted to use the Standard Version and create and use Modified Versions for any purpose without restriction, provided that you do not Distribute the Modified Version.
  Permissions for Redistribution of the Standard Version
  (2) You may Distribute verbatim copies of the Source form of the Standard Version of this Package in any medium without restriction, either gratis or for a Distributor Fee, provided that you duplicate all of the original copyright notices and associated disclaimers. At your discretion, such verbatim copies may or may not include a Compiled form of the Package.
  (3) You may apply any bug fixes, portability changes, and other modifications made available from the Copyright Holder. The resulting Package will still be considered the Standard Version, and as such will be subject to the Original License.
  Distribution of Modified Versions of the Package as Source
  (4) You may Distribute your Modified Version as Source (either gratis or for a Distributor Fee, and with or without a Compiled form of the Modified Version) provided that you clearly document how it differs from the Standard Version, including, but not limited to, documenting any non-standard features, executables, or modules, and provided that you do at least ONE of the following:
  (a) make the Modified Version available to the Copyright Holder of the Standard Version, under the Original License, so that the Copyright Holder may include your modifications in the Standard Version.
  (b) ensure that installation of your Modified Version does not prevent the user installing or running the Standard Version. In addition, the Modified Version must bear a name that is different from the name of the Standard Version.
  (c) allow anyone who receives a copy of the Modified Version to make the Source form of the Modified Version available to others under
  (i) the Original License or
  (ii) a license that permits the licensee to freely copy, modify and redistribute the Modified Version using the same licensing terms that apply to the copy that the licensee received, and requires that the Source form of the Modified Version, and of any works derived from it, be made freely available in that license fees are prohibited but Distributor Fees are allowed.
  Distribution of Compiled Forms of the Standard Version or Modified Versions without the Source
  (5) You may Distribute Compiled forms of the Standard Version without the Source, provided that you include complete instructions on how to get the Source of the Standard Version. Such instructions must be valid at the time of your distribution. If these instructions, at any time while you are carrying out such distribution, become invalid, you must provide new instructions on demand or cease further distribution. If you provide valid instructions or cease distribution within thirty days after you become aware that the instructions are invalid, then you do not forfeit any of your rights under this license.
  (6) You may Distribute a Modified Version in Compiled form without the Source, provided that you comply with Section 4 with respect to the Source of the Modified Version.
  Aggregating or Linking the Package
  (7) You may aggregate the Package (either the Standard Version or Modified Version) with other packages and Distribute the resulting aggregation provided that you do not charge a licensing fee for the Package. Distributor Fees are permitted, and licensing fees for other components in the aggregation are permitted. The terms of this license apply to the use and Distribution of the Standard or Modified Versions as included in the aggregation.
  (8) You are permitted to link Modified and Standard Versions with other works, to embed the Package in a larger work of your own, or to build stand-alone binary or bytecode versions of applications that include the Package, and Distribute the result without restriction, provided the result does not expose a direct interface to the Package.
  Items That are Not Considered Part of a Modified Version
  (9) Works (including, but not limited to, modules and scripts) that merely extend or make use of the Package, do not, by themselves, cause the Package to be a Modified Version. In addition, such works are not considered parts of the Package itself, and are not subject to the terms of this license.
  General Provisions
  (10) Any use, modification, and distribution of the Standard or Modified Versions is governed by this Artistic License. By using, modifying or distributing the Package, you accept this license. Do not use, modify, or distribute the Package, if you do not accept this license.
  (11) If your Modified Version has been derived from a Modified Version made by someone other than you, you are nevertheless required to ensure that your Modified Version complies with the requirements of this license.
  (12) This license does not grant you the right to use any trademark, service mark, tradename, or logo of the Copyright Holder.
  (13) This license includes the non-exclusive, worldwide, free-of-charge patent license to make, have made, use, offer to sell, sell, import and otherwise transfer the Package with respect to any patent claims licensable by the Copyright Holder that are necessarily infringed by the Package. If you institute patent litigation (including a cross-claim or counterclaim) against any party alleging that the Package constitutes direct or contributory patent infringement, then this Artistic License to you shall terminate on the date that such litigation is filed.
  (14) Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
}

// Unit : DH Auxiliar Tools
// Version : 1.0
// (C) Doddy Hackman 2016

unit DH_Auxiliar_Tools;

interface

uses Windows, Registry, SysUtils, StrUtils, TlHelp32, ComObj, ShellApi, ActiveX;

type
  T_DH_Auxiliar_Tools = class
  private

  public
    constructor Create;
    destructor Destroy; override;
    function hide_file(filename: string): bool;
    function normal_file(filename: string): bool;
    function get_cwd(): string;
    function add_startup(name, filename: string): bool;
    function delete_startup(name: string): bool;
    function read_file(archivo: String): AnsiString;
    function copy_file(archivo1: string; archivo2: string): bool;
    function move_file(archivo1: string; archivo2: string): bool;
    function delete_file(archivo: string): bool;
    function create_directory(dir: string): bool;
    function get_application_name(): string;
    function get_application_path(): string;
    function get_windows_path(): string;
    function get_systemdrive_path(): string;
    function get_temp_path(): string;
    function hex_encode(texto, opcion: string): string;
    function dh_password_generate(cantidad: integer): string;
    function xor_now(texto: string; clave: integer): string;
    function reverse_string(texto: string): string;
    function open_port_in_firewall(title, path: string; port: word): bool;
    function function_open_port_in_firewall(title, path: string;
      port: word): bool;
    function remove_port_in_firewall(const name: string): bool;
    function function_remove_port_in_firewall(const name: string): bool;
    function change_datetime_file(filename: string; option: string;
      date_now: string): bool;
    function check_admin_status(): boolean;
    function check_uac_status(): boolean;
    function uac_trick(filename, load_hidden: string): boolean;
  end;

implementation

constructor T_DH_Auxiliar_Tools.Create;
begin
  inherited Create;
  //
end;

destructor T_DH_Auxiliar_Tools.Destroy;
begin
  inherited Destroy;
end;

function T_DH_Auxiliar_Tools.hide_file(filename: string): bool;
begin
  try
    begin
      if (FileExists(filename) or DirectoryExists(filename)) then
      begin
        SetFileAttributes(Pchar(filename), FILE_ATTRIBUTE_HIDDEN);
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    end;
  except
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.normal_file(filename: string): bool;
begin
  try
    begin
      if (FileExists(filename) or DirectoryExists(filename)) then
      begin
        SetFileAttributes(Pchar(filename), FILE_ATTRIBUTE_NORMAL);
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    end;
  except
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.add_startup(name, filename: string): bool;
begin
  try
    begin
      if (FileExists(filename)) and not(name = '') then
      begin
        filename := StringReplace(filename, '/', '\',
          [rfReplaceAll, rfIgnoreCase]);
        with TRegistry.Create do
          try
            RootKey := HKEY_LOCAL_MACHINE;
            OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True);
            WriteString(name, filename);
          finally
            CloseKey;
            Free;
          end;
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    end;
  except
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.delete_startup(name: string): bool;
var
  Registry: TRegistry;
begin
  if not(name = '') then
  begin
    try
      begin
        with TRegistry.Create do
          try
            RootKey := HKEY_LOCAL_MACHINE;
            OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', False);
            DeleteValue(name);
          finally
            CloseKey;
            Free;
          end;
        Result := True;
      end;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.get_cwd(): string;
var
  dir: string;
begin
  dir := GetCurrentDir;
  if not(dir = '') then
  begin
    Result := dir;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.read_file(archivo: String): AnsiString;
var
  open_file: File;
  tipo: byte;
begin
  if (FileExists(archivo)) then
  begin
    tipo := FileMode;
    try
      FileMode := 0;
      AssignFile(open_file, archivo);
{$I-}
      Reset(open_file, 1);
{$I+}
      if IoResult = 0 then
        try
          SetLength(Result, FileSize(open_file));
          if Length(Result) > 0 then
          begin
{$I-}
            BlockRead(open_file, Result[1], Length(Result));
{$I+}
            if IoResult <> 0 then
              Result := '';
          end;
        finally
          CloseFile(open_file);
        end;
    except
      begin
        FileMode := tipo;
        Result := 'Error';
      end;
    end;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.copy_file(archivo1: string;
  archivo2: string): bool;
begin
  if (FileExists(archivo1)) and not(archivo2 = '') then
  begin
    try
      begin
        CopyFile(Pchar(archivo1), Pchar(archivo2), False);
        if (FileExists(archivo2)) then
        begin
          Result := True;
        end
        else
        begin
          Result := False;
        end;
      end;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.move_file(archivo1: string;
  archivo2: string): bool;
begin
  if (FileExists(archivo1)) and not(archivo2 = '') then
  begin
    try
      begin
        MoveFile(Pchar(archivo1), Pchar(archivo2));
        if (FileExists(archivo2)) then
        begin
          Result := True;
        end
        else
        begin
          Result := False;
        end;
      end;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.delete_file(archivo: string): bool;
begin
  if (FileExists(archivo)) then
  begin
    try
      begin
        if (DeleteFile(archivo)) then
        begin
          if (FileExists(archivo)) then
          begin
            Result := True;
          end
          else
          begin
            Result := False;
          end;
        end
        else
        begin
          Result := False;
        end;
      end
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.create_directory(dir: string): bool;
begin
  if not(dir = '') then
  begin
    try
      begin
        if not(DirectoryExists(dir)) then
        begin
          CreateDir(dir);
        end;
        ChDir(dir);
        Result := True;
      end;
    except
      begin
        Result := False;
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.get_application_name(): string;
var
  name: string;
begin
  name := ExtractFileName(paramstr(0));
  if not(name = '') then
  begin
    Result := name;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.get_application_path(): string;
var
  path: string;
begin
  path := paramstr(0);
  if not(path = '') then
  begin
    Result := path;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.get_windows_path(): string;
var
  path: string;
begin
  path := GetEnvironmentVariable('WINDIR');
  if not(path = '') then
  begin
    Result := path;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.get_systemdrive_path(): string;
var
  path: string;
begin
  path := GetEnvironmentVariable('SYSTEMDRIVE');
  if not(path = '') then
  begin
    Result := path;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.get_temp_path(): string;
var
  path: string;
begin
  path := GetEnvironmentVariable('TEMP');
  if not(path = '') then
  begin
    Result := path;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.hex_encode(texto, opcion: string): string;
// Thanks to Taqyon
// Based on http://www.vbforums.com/showthread.php?346504-DELPHI-Convert-String-To-Hex
var
  i: integer;
  code: string;
  cantidad: integer;

begin

  i := 0;
  cantidad := 0;
  code := '';
  Result := '';

  if not(texto = '') and not(opcion = '') then
  begin
    if (opcion = 'encode') then
    begin
      cantidad := Length(texto);
      for i := 1 to cantidad do
      begin
        code := IntToHex(ord(texto[i]), 2);
        Result := Result + code;
      end;
    end

    else if (opcion = 'decode') then
    begin
      cantidad := Length(texto);
      for i := 1 to cantidad div 2 do
      begin
        code := char(StrToInt('$' + Copy(texto, (i - 1) * 2 + 1, 2)));
        Result := Result + code;
      end;
    end
    else
    begin
      Result := 'Error';
    end;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.dh_password_generate(cantidad: integer): string;

const
  opciones: array [1 .. 3] of string = ('mayus', 'minus', 'numbers');

var
  numero: integer;
  i: integer;
  code: string;

begin

  numero := 0;
  i := 0;
  code := '';
  Result := '';

  if not(cantidad > 0) then
  begin
    for i := 1 to cantidad do
    begin
      numero := Random(4 - 1) + 1;

      if (opciones[numero] = 'mayus') then
      begin
        code := code + Chr(ord('A') + Random(26));
      end;
      if (opciones[numero] = 'minus') then
      begin
        code := code + Chr(ord('a') + Random(26));
      end;
      if (opciones[numero] = 'numbers') then
      begin
        code := code + Chr(ord('0') + Random(10));
      end;
    end;
    Result := code;
  end
  else
  begin
    Result := 'Error';
  end;

end;

function T_DH_Auxiliar_Tools.xor_now(texto: string; clave: integer): string;
var
  numero: integer;
  contenido: string;
begin
  contenido := '';
  numero := 0;
  Result := '';
  if not(texto = '') and (clave > 0) then
  begin
    for numero := 1 to Length(texto) do
    begin
      contenido := contenido + char(integer(texto[numero]) xor clave);
    end;
    Result := contenido;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.reverse_string(texto: string): string;
begin
  if not(texto = '') then
  begin
    Result := ReverseString(texto);
  end
  else
  begin
    Result := 'Error';
  end;
end;

function T_DH_Auxiliar_Tools.change_datetime_file(filename: string;
  option: string; date_now: string): bool;
var
  handle_time: THandle;
  datetime_new: TDateTime;
  datetime_ready: TSystemTime;
  update_datetime1: TFileTime;
begin
  if (FileExists(filename) and not(option = '') and not(date_now = '')) then
  begin
    datetime_new := StrToDateTime(date_now);
    handle_time := CreateFile(Pchar(filename), FILE_WRITE_ATTRIBUTES,
      FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING,
      FILE_ATTRIBUTE_NORMAL, 0);

    DateTimeToSystemTime(datetime_new, datetime_ready);

    SystemTimeToFileTime(datetime_ready, update_datetime1);

    if (option = 'all') then
    begin
      SetFileTime(handle_time, @update_datetime1, @update_datetime1,
        @update_datetime1);
    end
    else if (option = 'created') then
    begin
      SetFileTime(handle_time, @update_datetime1, nil, nil);
    end
    else if (option = 'modified') then
    begin
      SetFileTime(handle_time, nil, nil, @update_datetime1);
    end
    else if (option = '') then
    begin
      SetFileTime(handle_time, nil, @update_datetime1, nil);
    end
    else
    begin
      SetFileTime(handle_time, @update_datetime1, @update_datetime1,
        @update_datetime1);
    end;

    CloseHandle(handle_time);
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function convert_path(path: string): string;
var
  drive: string;
  change_to: string;
  new_path: string;
begin
  if not(Pos('%SystemDrive%', path) > 0) then
  begin
    drive := ExtractFileDrive(path);
    change_to := '%SystemDrive%';
    new_path := path;
    new_path := StringReplace(new_path, drive, change_to,
      [rfReplaceAll, rfIgnoreCase]);
    new_path := StringReplace(new_path, '/', '\', [rfReplaceAll, rfIgnoreCase]);
    Result := new_path;
  end
  else
  begin
    Result := path;
  end;
end;

function T_DH_Auxiliar_Tools.function_open_port_in_firewall(title, path: string;
  port: word): bool;

// Function based in : http://stackoverflow.com/questions/20066467/how-to-open-port-in-win7-firewall-using-delphi
// Thanks to RRUZ

const
  NET_FW_PROFILE2_DOMAIN = 1;
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC = 4;

  NET_FW_IP_PROTOCOL_TCP = 6;
  NET_FW_ACTION_ALLOW = 1;
  NET_FW_RULE_DIR_IN = 1;
  NET_FW_RULE_DIR_OUT = 2;
var
  ole_now: OleVariant;
  object_now: OleVariant;
  integer_now: integer;
  rule_now: OleVariant;
begin
  if not(title = '') and not(path = '') and not(port < 0) then
  begin
    try
      begin
        path := convert_path(path);
        integer_now := NET_FW_PROFILE2_PUBLIC or NET_FW_PROFILE2_PRIVATE;
        ole_now := CreateOleObject('HNetCfg.FwPolicy2');
        object_now := ole_now.Rules;
        rule_now := CreateOleObject('HNetCfg.FWRule');
        rule_now.name := title;
        rule_now.Description := title;
        rule_now.Applicationname := path;
        rule_now.Protocol := NET_FW_IP_PROTOCOL_TCP;
        rule_now.LocalPorts := port;
        rule_now.Direction := NET_FW_RULE_DIR_IN;
        rule_now.Enabled := True;
        rule_now.Grouping := '';
        rule_now.Profiles := integer_now;
        rule_now.Action := NET_FW_ACTION_ALLOW;
        object_now.Add(rule_now);
        Result := True;
      end;
    except
      begin
        Result := False;
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.open_port_in_firewall(title, path: string;
  port: word): bool;
var
  response: boolean;
begin
  response := False;
  CoInitialize(nil);
  if (function_open_port_in_firewall(title, path, port)) then
  begin
    response := True;
  end
  else
  begin
    response := False;
  end;
  CoUninitialize;
  Result := response;
end;

function T_DH_Auxiliar_Tools.function_remove_port_in_firewall
  (const name: string): bool;

// Function based in http://stackoverflow.com/questions/27323508/remove-windows-firewall-rule-exception-using-delphi
// Thanks to Ken White

const
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC = 4;
var
  integer_now: integer;
  ole_now1: OleVariant;
  ole_now2: OleVariant;
begin
  if not(name = '') then
  begin
    try
      begin
        integer_now := NET_FW_PROFILE2_PUBLIC or NET_FW_PROFILE2_PRIVATE;
        ole_now1 := CreateOleObject('HNetCfg.FwPolicy2');
        ole_now2 := ole_now1.Rules;
        ole_now2.Remove(name);
        Result := True;
      end;
    except
      begin
        Result := False;
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.remove_port_in_firewall(const name: string): bool;
var
  response: boolean;
begin
  response := False;
  CoInitialize(nil);
  if (function_remove_port_in_firewall(name)) then
  begin
    response := True;
  end
  else
  begin
    response := False;
  end;
  CoUninitialize;
  Result := response;
end;

function IsUserAnAdmin(): bool; external shell32;

function T_DH_Auxiliar_Tools.check_admin_status(): boolean;
begin
  if (Win32MajorVersion >= 6) then
  begin
    if IsUserAnAdmin() then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_Auxiliar_Tools.check_uac_status(): boolean;
var
  Registry: TRegistry;
  status: integer;
begin
  try
    begin
      Registry := TRegistry.Create;
      Registry.RootKey := HKEY_LOCAL_MACHINE;
      Registry.OpenKey
        ('SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\', True);
      status := Registry.ReadInteger('EnableLUA');
      if (status = 1) then
      begin
        Result := True;
      end
      else
      begin
        Result := False;
      end;
      Registry.Free;
    end;
  except
    begin
      Result := True;
    end;
  end;
end;

function T_DH_Auxiliar_Tools.uac_trick(filename, load_hidden: string): boolean;
// Based in http://www.indetectables.net/viewtopic.php?f=93&t=52284
// Thanks to Scorpio
var
  shell_now: TShellExecuteInfo;
begin
  if (FileExists(filename)) then
  begin
    ZeroMemory(@shell_now, SizeOf(shell_now));
    shell_now.cbSize := SizeOf(TShellExecuteInfo);
    shell_now.Wnd := 0;
    shell_now.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
    shell_now.lpVerb := Pchar('runas');
    shell_now.lpFile := 'cmd.exe';
    shell_now.lpParameters := Pchar('/c "' + filename + '"');
    if (load_hidden = '1') then
    begin
      shell_now.nShow := SW_HIDE;
    end;
    if (load_hidden = '0') then
    begin
      shell_now.nShow := SW_NORMAL;
    end;
    Result := ShellExecuteEx(@shell_now);
  end
  else
  begin
    Result := False;
  end;
end;

end.

// The End ?
