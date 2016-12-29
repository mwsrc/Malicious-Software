Attribute VB_Name = "mdlProcess"
Option Explicit

Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccessas As Long, ByVal bInheritHandle As Long, ByVal dwProcId As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetModuleFileNameExA Lib "psapi" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Private Declare Function EnumProcessModules Lib "psapi" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Private Declare Function GetModuleInformation Lib "psapi" (ByVal hProcess As Long, ByVal hModule As Long, lpmodinfo As MODULEINFO, ByVal cb As Long) As Long
Private Declare Function GetProcessMemoryInfo Lib "psapi" (ByVal hProcess As Long, ppsmemCounters As PROCESS_MEMORY_COUNTERS, ByVal cb As Long) As Long
Private Declare Function SetPriorityClass Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long) As Long
Private Declare Function GetPriorityClass Lib "kernel32" (ByVal hProcess As Long) As Long
Private Declare Function CreateRemoteThread Lib "kernel32" (ByVal hProcess As Long, lpThreadAttributes As Any, ByVal dwStackSize As Long, lpStartAddress As Long, lpParameter As Any, ByVal dwCreationFlags As Long, lpThreadId As Long) As Long
Private Declare Function GetModuleHandleA Lib "kernel32" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function Module32First Lib "kernel32" (ByVal hSnapShot As Long, uProcess As MODULEENTRY32) As Long
Private Declare Function Module32Next Lib "kernel32" (ByVal hSnapShot As Long, uProcess As MODULEENTRY32) As Long


Private Type MODULEENTRY32
    dwSize As Long
    th32ModuleID As Long
    th32ProcessID As Long
    GlblcntUsage As Long
    ProccntUsage As Long
    modBaseAddr As Long
    modBaseSize As Long
    hModule As Long
    szModule As String * 256
    szExePath As String * 260
End Type

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
    szExeFile As String * 260
End Type

Private Type PROCESS_MEMORY_COUNTERS
   cb As Long
   PageFaultCount As Long
   PeakWorkingSetSize As Long
   WorkingSetSize As Long
   QuotaPeakPagedPoolUsage As Long
   QuotaPagedPoolUsage As Long
   QuotaPeakNonPagedPoolUsage As Long
   QuotaNonPagedPoolUsage As Long
   PagefileUsage As Long
   PeakPagefileUsage As Long
End Type

Private Type MODULEINFO
   lpBaseOfDLL As Long
   SizeOfImage As Long
   EntryPoint As Long
End Type

Private i%

Public Function GetModules(PID As Long) As String
Dim lOpen As Long, hModules As Long, sModules(1 To 1000) As Long, cbNeeded As Long, sName As String, ModInfo As MODULEINFO, lModInfo As Long, sBuff As String

lOpen = OpenProcess(&H400 Or &H10, 0, PID)
hModules = EnumProcessModules(lOpen, sModules(1), 1024 * 4, cbNeeded)
hModules = cbNeeded
sBuff = Space(260)

GetModules = PID & Chr(0) & Left(sBuff, GetModuleFileNameExA(lOpen, 0, sBuff, 260)) & Chr(255)

For i = 1 To hModules - 1
    sName = Space(260)
    GetModuleFileNameExA lOpen, sModules(i), sName, 260
    GetModuleInformation lOpen, sModules(i), ModInfo, Len(ModInfo)
    If ModInfo.lpBaseOfDLL > 0 Then GetModules = GetModules & LPSTRToVBString(sName) & Chr(0) & ModInfo.SizeOfImage & Chr(0) & ModInfo.lpBaseOfDLL & Chr(255)
Next i

Call CloseHandle(lOpen)
Call CloseHandle(hModules)
End Function

Public Function GetProcesses() As String
Dim hSnapShot As Long, lNext As Long, PID As Long, szExename As String, uProcess As PROCESSENTRY32
Dim lOpen As Long, lName As Long, sBuff As String, sExePath As String
Dim PROMEM As PROCESS_MEMORY_COUNTERS

hSnapShot = CreateToolhelp32Snapshot(2&, 0&)
If hSnapShot = 0 Then Exit Function
uProcess.dwSize = Len(uProcess)
lNext = Process32First(hSnapShot, uProcess)

Do While lNext
    i = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, i - 1))
    lOpen = OpenProcess(&H400 Or &H10, 0, uProcess.th32ProcessID)
    sBuff = Space(260)
    sExePath = Left(sBuff, GetModuleFileNameExA(lOpen, 0, sBuff, 260))
    GetProcessMemoryInfo lOpen, PROMEM, Len(PROMEM)
    If sExePath = vbNullString Then sExePath = "System"
    GetProcesses = GetProcesses & szExename & Chr(0) & uProcess.th32ProcessID & Chr(0) & sExePath & Chr(0) & PROMEM.WorkingSetSize & Chr(0) & GetProcessPriority(uProcess.th32ProcessID) & Chr(255)
    lNext = Process32Next(hSnapShot, uProcess)
Loop
    Call CloseHandle(hSnapShot)
    Call CloseHandle(lOpen)
End Function

Public Function KillByPID(PID As Long) As Long
KillByPID = TerminateProcess(OpenProcess(&H1F0FFF, 0, PID), 0)
End Function

Private Function GetProcessPriority(PID As Long) As Long
Dim lOpen As Long, lClass As Long
lOpen = OpenProcess(&H400 Or &H10, 0, PID)
lClass = GetPriorityClass(lOpen)
Select Case (lClass)
    Case &H20:  GetProcessPriority = 0
    Case &H40:  GetProcessPriority = 1
    Case &H80:  GetProcessPriority = 2
    Case &H100: GetProcessPriority = 3
    Case Else:  GetProcessPriority = 4
End Select
Call CloseHandle(lOpen)
End Function

Public Function SetProcessPriority(PID As Long, lPriority As Long) As Long
Dim lOpen As Long, lClass As Long
lOpen = OpenProcess(&H1F0FFF, 0, PID)
SetProcessPriority = SetPriorityClass(lOpen, lPriority)
Call CloseHandle(lOpen)
End Function

Public Function UnInjectDll(Strdll As String, PID As Long) As Long
Dim MODE32 As MODULEENTRY32, LngBaseAddr As Long, RetVal As Long, LngCT32S As Long, LngProcess As Long, FreelibAdr As Long, RemThread As Long
On Error GoTo ErrTrap
    LngCT32S = CreateToolhelp32Snapshot(&H8, PID)
    MODE32.dwSize = Len(MODE32)
    RetVal = Module32First(LngCT32S, MODE32)
    Do While RetVal
        If Strdll = Left(MODE32.szExePath, InStr(MODE32.szExePath, Chr(0)) - 1) Then LngBaseAddr = MODE32.modBaseAddr
        RetVal = Module32Next(LngCT32S, MODE32)
    Loop
    CloseHandle LngCT32S
    LngProcess = OpenProcess(&H1F0FFF, False, PID)
    FreelibAdr = GetProcAddress(GetModuleHandleA("kernel32"), "FreeLibrary")
    RemThread = CreateRemoteThread(LngProcess, ByVal 0, 0, ByVal FreelibAdr, ByVal LngBaseAddr, 0, 0)
    CloseHandle LngProcess
    CloseHandle RemThread
    UnInjectDll = 1
    Exit Function
ErrTrap:
    UnInjectDll = 0
End Function


