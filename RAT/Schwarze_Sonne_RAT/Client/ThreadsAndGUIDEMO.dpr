program miniRAT;


uses
  Forms,
  userv in 'userv.pas',
  uConn in 'uConn.pas',
  MainU in 'MainU.pas' {MainForm},
  uSettings in 'uSettings.pas' {Form1},
  uFilemanager in 'uFilemanager.pas' {Form2},
  uFlag in 'uFlag.pas',
  uTransferView in 'uTransferView.pas' {Form3},
  uScreen in 'uScreen.pas' {Form4},
  uProcess in 'uProcess.pas' {Form5},
  uWindow in 'uWindow.pas' {Form6},
  uCamspy in 'uCamspy.pas' {Form7},
  uAbout in 'uAbout.pas' {Form8},
  uBuild in 'uBuild.pas' {Form9},
  uKeylogger in 'uKeylogger.pas' {Form10},
  uRegistryeditor in 'uRegistryeditor.pas' {Form11},
  StreamManager in 'StreamManager.pas',
  uScreenNor in 'uScreenNor.pas' {Form12};

{$R *.RES}
begin
  Application.Initialize;
  Application.Title := 'Schwarze Sonne RAT';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.
