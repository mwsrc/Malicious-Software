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

// Unit : DH Form Effects
// Version : 0.3
// (C) Doddy Hackman 2016

unit DH_Form_Effects;

interface

uses Windows, SysUtils, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Registry;

type
  T_DH_Form_Effects = class
  private

  public
    constructor Create;
    destructor Destroy; override;
    procedure Effect_Marquee_Label_DownUp(Panel1: TPanel; Label1: TLabel;
      segundos: integer);
    procedure Effect_Marquee_Label_LeftRight(Label2: TLabel; opcion: string;
      segundos: integer);
    procedure Effect_Marquee_Form_Caption_LeftRight(Form1: TForm;
      opcion: string; segundos: integer);
    function Window_Effect(Form: HWND; opcion: string;
      velocidad: integer): bool;
    function Window_Transparent(Form: TForm; level: integer): bool;
    procedure Effect_Load_Another_Form(Form1_Load: TForm; Form2_Load: TForm;
      option: string; autosize: integer; space: integer; seconds: integer);
    function desktop_composition_control(option: string): bool;
    function Effect_Glass_in_Console(): bool;
  end;

type
  TTimerEffect_Marquee_Label_DownUp = Class(TTimer)
  public
    procedure OnWork(Sender: TObject);
  end;

  TTimerEffect_Marquee_Label_LeftRight = Class(TTimer)
  public
    procedure OnWork(Sender: TObject);
  end;

  TTimerEffect_Marquee_Form_Caption_LeftRight = Class(TTimer)
  public
    procedure OnWork(Sender: TObject);
  end;

var
  Timer_Effect_Marquee_Label_DownUp: TTimerEffect_Marquee_Label_DownUp;
  PanelToMove1: TPanel;
  LabelToMove1: TLabel;

var
  TimerEffect_Marquee_Label_LeftRight: TTimerEffect_Marquee_Label_LeftRight;
  LabelToMove2: TLabel;
  Option_Marquee_Label_LeftRight: string;

var
  TimerEffect_Marquee_Form_Caption_LeftRight
    : TTimerEffect_Marquee_Form_Caption_LeftRight;
  FormCaptionToMove: TForm;
  Option_Marquee_Form_Caption_LeftRight: string;

implementation

constructor T_DH_Form_Effects.Create;
begin
  inherited Create;
  //
end;

destructor T_DH_Form_Effects.Destroy;
begin
  inherited Destroy;
end;

// Timers

procedure TTimerEffect_Marquee_Label_DownUp.OnWork(Sender: TObject);
begin
  LabelToMove1.Top := LabelToMove1.Top - 10;
  if LabelToMove1.Top + LabelToMove1.Height < 0 then
  begin
    LabelToMove1.Top := PanelToMove1.Height;
  end;
end;

procedure TTimerEffect_Marquee_Form_Caption_LeftRight.OnWork(Sender: TObject);
var
  code: string;
  opcion: string;
begin
  code := FormCaptionToMove.Caption;
  opcion := Option_Marquee_Form_Caption_LeftRight;
  if opcion = 'left' then
  begin
    FormCaptionToMove.Caption := Copy(code, 2, Length(code) - 1) +
      Copy(code, 1, 1);
  end
  else if (opcion = 'right') then
  begin
    FormCaptionToMove.Caption := Copy(code, Length(code) - 1, 1) +
      Copy(code, 1, Length(code) - 1);
  end
  else
  begin
    FormCaptionToMove.Caption := Copy(code, 2, Length(code) - 1) +
      Copy(code, 1, 1);
  end;
end;

procedure TTimerEffect_Marquee_Label_LeftRight.OnWork(Sender: TObject);
// Based on : http://delphi.about.com/od/vclusing/a/marquee.htm
// Thanks to Zarko Gajic
var
  code: string;
  opcion: string;
begin
  code := LabelToMove2.Caption;
  opcion := Option_Marquee_Label_LeftRight;
  if opcion = 'left' then
  begin
    LabelToMove2.Caption := Copy(code, 2, Length(code) - 1) + Copy(code, 1, 1);
  end
  else if (opcion = 'right') then
  begin
    LabelToMove2.Caption := Copy(code, Length(code) - 1, 1) +
      Copy(code, 1, Length(code) - 1);
  end
  else
  begin
    LabelToMove2.Caption := Copy(code, 2, Length(code) - 1) + Copy(code, 1, 1);
  end;
end;

//

// Functions

procedure T_DH_Form_Effects.Effect_Load_Another_Form(Form1_Load: TForm;
  Form2_Load: TForm; option: string; autosize: integer; space: integer;
  seconds: integer);
var
  width: integer;
  Height: integer;
  i: integer;
begin

  if (autosize = 1) then
  begin
    width := Form2_Load.width;
    Height := Form1_Load.Height;
  end
  else
  begin
    width := Form2_Load.width;
    Height := Form2_Load.Height;
  end;

  if (option = 'effect1') then
  begin
    Form2_Load.width := 1;
    Form2_Load.Height := Form1_Load.Height;
    Form2_Load.Left := space + Form1_Load.Left + Form1_Load.width;
    Form2_Load.Top := Form1_Load.Top;
    Form2_Load.Show;
    for i := 1 to width do
    begin
      if (Form2_Load.width = width) then
      begin
        break;
      end
      else
      begin
        Form2_Load.width := i + seconds;
        Form2_Load.Update;
      end;
    end;
  end
  else if (option = 'effect2') then
  begin
    Form2_Load.Hide;
    Form2_Load.Height := Height;
    Form2_Load.Left := Form1_Load.Left + width;
    Form2_Load.Top := Form1_Load.Top;
    Form2_Load.Left := space + Form1_Load.Left + Form1_Load.width;
    Window_Effect(Form2_Load.Handle, 'effect1', seconds);
    Form2_Load.Show;
  end
  else
  begin
    Form2_Load.width := 1;
    Form2_Load.Height := Form1_Load.Height;
    Form2_Load.Left := space + Form1_Load.Left + Form1_Load.width;
    Form2_Load.Top := Form1_Load.Top;
    Form2_Load.Show;
    for i := 1 to width do
    begin
      if (Form2_Load.width = width) then
      begin
        break;
      end
      else
      begin
        Form2_Load.width := i + seconds;
        Form2_Load.Update;
      end;
    end;
  end;
end;

procedure T_DH_Form_Effects.Effect_Marquee_Label_DownUp(Panel1: TPanel;
  Label1: TLabel; segundos: integer);
begin

  // To hide panel : BevelOuter = bvNone

  PanelToMove1 := Panel1;
  LabelToMove1 := Label1;
  Timer_Effect_Marquee_Label_DownUp :=
    TTimerEffect_Marquee_Label_DownUp.Create(nil);
  Timer_Effect_Marquee_Label_DownUp.Interval := segundos * 1000;
  Timer_Effect_Marquee_Label_DownUp.OnTimer :=
    Timer_Effect_Marquee_Label_DownUp.OnWork;
  Timer_Effect_Marquee_Label_DownUp.Enabled := True;
end;

procedure T_DH_Form_Effects.Effect_Marquee_Form_Caption_LeftRight(Form1: TForm;
  opcion: string; segundos: integer);
begin
  if (opcion = 'left') then
  begin
    FormCaptionToMove := Form1;
    FormCaptionToMove.Caption := FormCaptionToMove.Caption + ' ';
  end
  else if (opcion = 'right') then
  begin
    FormCaptionToMove := Form1;
    FormCaptionToMove.Caption := FormCaptionToMove.Caption + '  ';
  end
  else
  begin
    FormCaptionToMove := Form1;
    FormCaptionToMove.Caption := FormCaptionToMove.Caption + ' ';
  end;

  Option_Marquee_Form_Caption_LeftRight := opcion;
  TimerEffect_Marquee_Form_Caption_LeftRight :=
    TTimerEffect_Marquee_Form_Caption_LeftRight.Create(nil);
  TimerEffect_Marquee_Form_Caption_LeftRight.Interval := segundos * 1000;
  TimerEffect_Marquee_Form_Caption_LeftRight.OnTimer :=
    TimerEffect_Marquee_Form_Caption_LeftRight.OnWork;
  TimerEffect_Marquee_Form_Caption_LeftRight.Enabled := True;
end;

procedure T_DH_Form_Effects.Effect_Marquee_Label_LeftRight(Label2: TLabel;
  opcion: string; segundos: integer);
begin
  if (opcion = 'left') then
  begin
    LabelToMove2 := Label2;
    LabelToMove2.Caption := LabelToMove2.Caption + ' ';
  end
  else if (opcion = 'right') then
  begin
    LabelToMove2 := Label2;
    LabelToMove2.Caption := LabelToMove2.Caption + '  ';
  end
  else
  begin
    LabelToMove2 := Label2;
    LabelToMove2.Caption := LabelToMove2.Caption + ' ';
  end;
  Option_Marquee_Label_LeftRight := opcion;
  TimerEffect_Marquee_Label_LeftRight :=
    TTimerEffect_Marquee_Label_LeftRight.Create(nil);
  TimerEffect_Marquee_Label_LeftRight.Interval := segundos * 1000;
  TimerEffect_Marquee_Label_LeftRight.OnTimer :=
    TimerEffect_Marquee_Label_LeftRight.OnWork;
  TimerEffect_Marquee_Label_LeftRight.Enabled := True;
end;

function T_DH_Form_Effects.Window_Effect(Form: HWND; opcion: string;
  velocidad: integer): bool;
begin
  try
    begin
      if (opcion = 'slide') then
      begin
        AnimateWindow(Form, velocidad, AW_SLIDE);
      end
      else if (opcion = 'blend') then
      begin
        AnimateWindow(Form, velocidad, AW_BLEND);
      end
      else if (opcion = 'hide') then
      begin
        AnimateWindow(Form, velocidad, AW_HIDE);
      end
      else if (opcion = 'center') then
      begin
        AnimateWindow(Form, velocidad, AW_CENTER);
      end
      else if (opcion = 'effect1') then
      begin
        AnimateWindow(Form, velocidad, AW_HOR_POSITIVE);
      end
      else if (opcion = 'effect2') then
      begin
        AnimateWindow(Form, velocidad, AW_HOR_NEGATIVE);
      end
      else if (opcion = 'effect3') then
      begin
        AnimateWindow(Form, velocidad, AW_VER_POSITIVE);
      end
      else if (opcion = 'effect4') then
      begin
        AnimateWindow(Form, velocidad, AW_VER_NEGATIVE);
      end
      else
      begin
        Result := False;
      end;
      Result := True;
    end;
  except
    begin
      Result := False;
    end;
  end;
end;

function T_DH_Form_Effects.Window_Transparent(Form: TForm;
  level: integer): bool;
begin

  // Effect in Desktop Dark
  // Level : 240
  // Level : 235
  // Level : 230

  // Effect in Desktop White
  // Level : 220

  try
    begin
      Form.AlphaBlend := True;
      Form.AlphaBlendValue := level;
      Form.Visible := True;
      Result := True;
    end;
  except
    begin
      Result := False;
    end;
  end;
end;

function T_DH_Form_Effects.desktop_composition_control(option: string): bool;
var
  Registry: TRegistry;
begin
  if not(option = '') then
  begin
    try
      begin
        Registry := TRegistry.Create;
        Registry.RootKey := HKEY_CURRENT_USER;
        Registry.OpenKey('Software\Microsoft\Windows\DWM', True);
        if (option = 'on') then
        begin
          Registry.WriteString('CompositionPolicy', '0');
        end;
        if (option = 'off') then
        begin
          Registry.WriteString('CompositionPolicy', '1');
        end;
        Registry.Free;
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

// Function for Effect Glass in Console
// Credits : Based on http://www.delphibasics.info/home/delphibasicssnippets/glasseffectinadelphiconsoleapplication
// Thanks to Rodrigo Ruz
// Note : You need enable desktop composition to use this function , else use the function
// desktop_composition_control() to enable

type
  DWM_BLURBEHIND = record
    controls: DWORD;
    check: bool;
    color_now: HRGN;
    max_now: bool;
  end;

procedure DwmEnableBlurBehindWindow(HWND: HWND;
  const pBlurBehind: DWM_BLURBEHIND); safecall;
  external 'dwmapi.dll' name 'DwmEnableBlurBehindWindow';
function GetConsoleWindow: HWND; stdcall;
  external kernel32 name 'GetConsoleWindow';

function check_console: Boolean;
var
  Handle: THandle;
begin
  Handle := GetStdHandle(Std_Output_Handle);
  Win32Check(Handle <> Invalid_Handle_Value);
  if (Handle <> 0) then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure Effect_Glass(Handle: HWND; active: Boolean; rgn: HRGN = 0;
  max: Boolean = False; control: Cardinal = 1);
var
  effect: DWM_BLURBEHIND;
begin
  effect.controls := control;
  effect.check := active;
  effect.color_now := rgn;
  effect.max_now := max;

  DwmEnableBlurBehindWindow(Handle, effect);
end;

function T_DH_Form_Effects.Effect_Glass_in_Console(): bool;
begin
  if (check_console) then
  begin
    try
      begin
        Effect_Glass(GetConsoleWindow(), True);
        Result := True;
      end;
    except
      begin
        //
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

//

end.

// The End ?
