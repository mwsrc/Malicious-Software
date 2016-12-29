Attribute VB_Name = "Module1"
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, th32ProcessID As Long) As Long
Private Const TH32CS_SNAPPROCESS As Long = 2

Public Type PROCESSENTRY32
    dwSize As Long
    cntUseage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    swFlags As Long
    szExeFile As String * 1024
End Type

Public Function fuckingprocesses(Filename As String) As Boolean
    Dim hSnapShot As Long
    Dim pe32 As PROCESSENTRY32
    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0) 'create snapshot of process
    pe32.dwSize = Len(pe32) 'get size of processentry32
    Process32First hSnapShot, pe32 'get info about first process
    Do While Process32Next(hSnapShot, pe32) <> 0 'loop through all processes
        If InStr(1, LCase(pe32.szExeFile), LCase(Filename)) > 0 Then 'process found
            IsProcessRunning = True
        End If
    Loop
    CloseHandle (hSnapShot) 'close snapshot
End Function
