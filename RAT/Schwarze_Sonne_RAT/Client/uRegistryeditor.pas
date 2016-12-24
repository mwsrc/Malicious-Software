unit uRegistryeditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, PngImageList, StdCtrls,winsock;

type
  TForm11 = class(TForm)
    ImgRegistryEditor: TPngImageList;
    pmPoppupRegistry2: TPopupMenu;
    New1: TMenuItem;
    Key1: TMenuItem;
    MenuItem20: TMenuItem;
    BinaryValue1: TMenuItem;
    MultiStringValue1: TMenuItem;
    REGSZValue1: TMenuItem;
    DWORDValue1: TMenuItem;
    MenuItem21: TMenuItem;
    DeleteRegValue: TMenuItem;
    RegRename: TMenuItem;
    tv1: TTreeView;
    lvwRegedit: TListView;
    stat1: TStatusBar;
    edt1: TEdit;
    pmPoppupRegistry3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    pmPoppupRegistry1: TPopupMenu;
    MenuRegDeleteKey1: TMenuItem;
    function GetPath(Node: TTreeNode):string;
    procedure tv1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}
function TForm11.GetPath(Node: TTreeNode):string;
begin
  repeat
    Result := Node.Text + '\' + Result;
    Node   := Node.Parent;
  until not Assigned(Node);
end;
procedure TForm11.tv1DblClick(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if tv1.Selected <> nil then
  begin
    lvwRegedit.Clear;
    Edt1.Text := getpath(tv1.Selected);
    Sock := StrToInt(Stat1.Panels[0].Text);
    Data := '35|' + edt1.Text + #10;
    Send(Sock, Data[1], Length(Data), 0);
    //Servidor.Connection.Writeln('listvalues|' + EditPathRegistro.Text);
  end;
end;

end.
