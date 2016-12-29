Attribute VB_Name = "Module1"
Option Explicit
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" _
        (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias _
        "Process32First" (ByVal hSnapShot As Long, uProcess _
        As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias _
        "Process32Next" (ByVal hSnapShot As Long, uProcess _
        As PROCESSENTRY32) As Long
Private Declare Sub CloseHandle Lib "kernel32" (ByVal hPass _
        As Long)
Const TH32CS_SNAPPROCESS As Long = 2&
Const MAX_PATH As Integer = 260
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
Public Function IfRunningExe(ExeName As String) As Boolean
    ' Prüft ob eine EXE gerade läuft
    ' Kann gegen alle möglichen Prozesse genutzt werden
    Dim hSnapShot As Long, Result As Long
    Dim aa As String, bb As String
    Dim process As PROCESSENTRY32

    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
    If hSnapShot = 0 Then Exit Function

    process.dwSize = Len(process)
    Result = ProcessFirst(hSnapShot, process)

    Do While Result <> 0
        aa = process.szExeFile
        aa = VBA.Left$(aa, InStr(aa, Chr$(0)) - 1)
        If LCase(aa) = ExeName Then
            ' Entdeckt...
            IfRunningExe = True
        End If
Result = ProcessNext(hSnapShot, process)
    Loop
    Call CloseHandle(hSnapShot)
End Function


