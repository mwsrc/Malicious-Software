Attribute VB_Name = "Sandbox"
Private Declare Function CreateToolHelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Const MAX_PATH As Integer = 260
Private Type PROCESSENTRY32
dwSize As Long
cntUsage As Long
th32ProcessID As Long
th32DefaultHeapID As Long
th32ModuleID As Long
cntThreads As Long
th32ParentProcessID As Long
pcPriClassBase As Long
dwFlags As Long
szExeFile As String * MAX_PATH
End Type
Public i%

Private Function Sandboxie() As Boolean
Dim hSnapshot As Long, Exp As Long, lNext As Long, PID As Long, Parent As Long, szExename As String, uProcess As PROCESSENTRY32
hSnapshot = CreateToolHelpSnapshot(2&, 0&)
If hSnapshot = 0 Then Exit Function
uProcess.dwSize = Len(uProcess)
lNext = ProcessFirst(hSnapshot, uProcess)
Do While lNext
i = InStr(1, uProcess.szExeFile, Chr(0))
szExename = LCase$(Left$(uProcess.szExeFile, i - 1))
PID = uProcess.th32ProcessID
If szExename = "explorer.exe" Then Exp = uProcess.th32ProcessID
If PID = GetCurrentProcessId Then Parent = uProcess.th32ParentProcessID
If Parent <> Exp Then Sandbox = True Else Sandbox = False
lNext = ProcessNext(hSnapshot, uProcess)
Loop
End Function

Public Function Sunbelt() As Boolean
If App.EXEName = "file" Then
If App.Path = "C:\" Then
End
Else
End If
End If
End Function
