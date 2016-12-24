Attribute VB_Name = "ModProcess"
Option Explicit

Private Declare Function LookupAccountSid Lib "advapi32.dll" Alias "LookupAccountSidA" (ByVal lpSystemName As String, ByVal sID As Long, ByVal Name As String, cbName As Long, ByVal ReferencedDomainName As String, cbReferencedDomainName As Long, peUse As Integer) As Long
Private Declare Function WTSEnumerateProcesses Lib "wtsapi32.dll" Alias "WTSEnumerateProcessesA" (ByVal hServer As Long, ByVal Reserved As Long, ByVal Version As Long, ByRef ppProcessInfo As Long, ByRef pCount As Long) As Long
Private Declare Sub WTSFreeMemory Lib "wtsapi32.dll" (ByVal pMemory As Long)
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function Module32First Lib "kernel32.dll" (ByVal hSnapshot As Long, ByRef lppe As MODULEENTRY32) As Long
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32.dll" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Private Declare Function CloseHandle Lib "kernel32.dll" (ByVal hObject As Long) As Long
Private Declare Function OpenProcess Lib "kernel32.dll" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function GetProcessMemoryInfo Lib "psapi.dll" (ByVal hProcess As Long, ppsmemCounters As PROCESS_MEMORY_COUNTERS, ByVal cb As Long) As Long
Private Declare Function Process32First Lib "kernel32.dll" (ByVal hSnapshot As Long, ByRef lppe As PROCESSENTRY32) As Long
Private Declare Function Process32Next Lib "kernel32.dll" (ByVal hSnapshot As Long, ByRef lppe As PROCESSENTRY32) As Long
Private Declare Function OpenProcessToken Lib "advapi32" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As Luid) As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As Any, ReturnLength As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function NtSuspendProcess Lib "ntdll.dll" (ByVal hProc As Long) As Long
Private Declare Function NtResumeProcess Lib "ntdll.dll" (ByVal hProc As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32.dll" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMORYSTATUS) As Long
Private Declare Function NtQuerySystemInformation Lib "ntdll" (ByVal dwInfoType As Long, ByVal lpStructure As Long, ByVal dwSize As Long, ByVal dwReserved As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As Long, ByRef lpdwProcessId As Long) As Long
Private Declare Function GetModuleFileNameEx Lib "psapi.dll" Alias "GetModuleFileNameExA" (ByVal hProcess As Long, ByVal hModule As Long, ByVal lpFilename As String, ByVal nSize As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long

Private Const TH32CS_SNAPPROCESS                As Long = &H2&
Private Const WTS_CURRENT_SERVER_HANDLE         As Long = 0&
Private Const TH32CS_SNAPMODULE                 As Long = &H8&
Private Const PROCESS_QUERY_INFORMATION         As Long = (&H400)
Private Const SYNCHRONIZE                       As Long = &H100000
Private Const STANDARD_RIGHTS_REQUIRED          As Long = &HF0000
Private Const PROCESS_ALL_ACCESS                As Long = (STANDARD_RIGHTS_REQUIRED Or SYNCHRONIZE Or &HFFF)
Private Const PROCESS_TERMINATE                 As Long = (&H1)

Private Const TOKEN_ADJUST_PRIVILEGES           As Long = &H20
Private Const TOKEN_QUERY                       As Long = &H8
Private Const SE_PRIVILEGE_ENABLED              As Long = &H2
Private Const SE_DEBUG_NAME                     As String = "SeDebugPrivilege"

Private Const SYSTEM_BASICINFORMATION           As Long = 0&
Private Const SYSTEM_PERFORMANCEINFORMATION     As Long = 2&
Private Const SYSTEM_TIMEINFORMATION            As Long = 3&
Private Const NO_ERROR                          As Long = 0&

Private Type LARGE_INTEGER
    dwLow As Long
    dwHigh As Long
End Type

Private Type SYSTEM_BASIC_INFORMATION
    dwUnknown1 As Long
    uKeMaximumIncrement As Long
    uPageSize As Long
    uMmNumberOfPhysicalPages As Long
    uMmLowestPhysicalPage As Long
    uMmHighestPhysicalPage As Long
    uAllocationGranularity As Long
    pLowestUserAddress As Long
    pMmHighestUserAddress As Long
    uKeActiveProcessors As Long
    bKeNumberProcessors As Byte
    bUnknown2 As Byte
    wUnknown3 As Integer
End Type

Private Type SYSTEM_PERFORMANCE_INFORMATION
    liIdleTime As LARGE_INTEGER
    dwSpare(0 To 75) As Long
End Type

Private Type SYSTEM_TIME_INFORMATION
    liKeBootTime As LARGE_INTEGER
    liKeSystemTime As LARGE_INTEGER
    liExpTimeZoneBias  As LARGE_INTEGER
    uCurrentTimeZoneId As Long
    dwReserved As Long
End Type

Private Type WTS_PROCESS_INFO
    SessionID           As Long
    ProcessID           As Long
    pProcessName        As Long
    pUserSid            As Long
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

Private Type MEMORYSTATUS
    dwLength As Long
    dwMemoryLoad As Long
    dwTotalPhys As Long
    dwAvailPhys As Long
    dwTotalPageFile As Long
    dwAvailPageFile As Long
    dwTotalVirtual As Long
    dwAvailVirtual As Long
End Type

Private Const MAX_PATH As Long = 260

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
    szExeFile As String * MAX_PATH
End Type

Public Type ProcessInfo
    PID As Long
    Name As String
    FileName As String
    Account As String
    Memory As Long
    ThreatCount As Long
End Type

Private Type Luid
    lowpart                     As Long
    highpart                    As Long
End Type

Private Type LUID_AND_ATTRIBUTES
    pLuid                       As Luid
    Attributes                  As Long
End Type

Private Type TOKEN_PRIVILEGES
    PrivilegeCount              As Long
    Privileges(1)               As LUID_AND_ATTRIBUTES
End Type

Private liOldIdleTime As LARGE_INTEGER
Private liOldSystemTime As LARGE_INTEGER

Public Function GetWindowPID(ByVal hwnd As Long) As Long
    Call GetWindowThreadProcessId(hwnd, GetWindowPID)
End Function

Public Function GetWindowPath(ByVal hwnd As Long) As String
    Dim ProcessID As Long
    Dim hProcess As Long
    Dim sPath As String * MAX_PATH
    Dim lRet As Long
    
    If GetWindowThreadProcessId(hwnd, ProcessID) Then
        GetWindowPath = GetProcessModule(ProcessID)
    End If
End Function

Public Function KillProcess(ByVal ProcessID As Long) As Boolean
    Dim hProcess As Long
    hProcess = OpenProcess(PROCESS_TERMINATE, False, ProcessID)
    If hProcess <> 0 Then
        KillProcess = (TerminateProcess(hProcess, 0) = 1)
        CloseHandle hProcess
    End If
End Function

Public Function SuspendProcess(ByVal ProcessID As Long, ByVal bSuspend As Boolean) As Boolean
    Dim hProcess As Long
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, ProcessID)
    If hProcess <> 0 Then
        If bSuspend Then
          SuspendProcess = (NtSuspendProcess(hProcess) = 0)
        Else
          SuspendProcess = (NtResumeProcess(hProcess) = 0)
        End If
        
        CloseHandle hProcess
    End If
End Function

Public Function GetProcessCount() As Long
    Dim lpMem As Long
    If WTSEnumerateProcesses(WTS_CURRENT_SERVER_HANDLE, 0&, 1, lpMem, GetProcessCount) Then
        WTSFreeMemory lpMem
    End If
End Function

Public Function GetProcessList(FileList() As ProcessInfo) As Boolean

   Dim RetVal As Long
   Dim lCount As Long
   Dim i As Long
   Dim lpBuffer As Long
   Dim P As Long
   Dim udtProcessInfo As WTS_PROCESS_INFO

   If WTSEnumerateProcesses(WTS_CURRENT_SERVER_HANDLE, 0&, 1, lpBuffer, lCount) Then
        P = lpBuffer
        
        ReDim FileList(lCount - 1)
        
        For i = 0 To lCount - 1

            CopyMemory udtProcessInfo, ByVal P, LenB(udtProcessInfo)

            FileList(i).PID = udtProcessInfo.ProcessID

            If udtProcessInfo.ProcessID = 0 Then
                FileList(i).Name = "Proceso inactivo del sistema" '"[System Process]"
                FileList(i).Account = "SYSTEM"
            Else
                FileList(i).Name = GetStringFromLP(udtProcessInfo.pProcessName)
                FileList(i).Account = GetAcount(udtProcessInfo.pUserSid)
                FileList(i).FileName = GetProcessModule(udtProcessInfo.ProcessID)
                FileList(i).Memory = GetProcessMemoryUsage(udtProcessInfo.ProcessID)
                
            End If
            FileList(i).ThreatCount = GetPocessThreatCount(udtProcessInfo.ProcessID)
            P = P + LenB(udtProcessInfo)
        Next i

        WTSFreeMemory lpBuffer
        GetProcessList = True
    Else
        MsgBox "Error occurred calling WTSEnumerateProcesses.", vbCritical, "Error " & Err.LastDllError
    End If
    End Function

Function GetAcount(sID As Long) As String

    On Error Resume Next
    Dim RetName As String
    Dim RetDomain As String
    RetName = String(255, 0)
    RetDomain = String(255, 0)
    LookupAccountSid vbNullString, sID, RetName, 255, RetDomain, 255, 0
    'GetAcount = Left$(RetDomain, InStr(RetDomain, vbNullChar) - 1) & "\" & Left$(RetName, InStr(RetName, vbNullChar) - 1)
    GetAcount = Left$(RetName, InStr(RetName, vbNullChar) - 1)
End Function
    

Private Function GetProcessModule(ByVal ProcessID As Long) As String

    Dim hProcess As Long
    Dim sPath As String * MAX_PATH
    Dim lRet As Long
    
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, ProcessID)
    
    If hProcess Then
        lRet = GetModuleFileNameEx(hProcess, 0, sPath, MAX_PATH)
        If lRet Then
            GetProcessModule = Left$(sPath, lRet)
            GetProcessModule = Replace$(GetProcessModule, "\SystemRoot", Environ("WINDIR"))
            GetProcessModule = Replace$(GetProcessModule, "\??\", vbNullString)
        End If
        CloseHandle (hProcess)
    End If
        
End Function




Private Function GetProcessModule2(ByVal ProcessID As Long) As String
    
    Dim hToolHelp As Long
    Dim M As MODULEENTRY32

    hToolHelp = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, ProcessID)
    M.dwSize = Len(M)
    If Module32First(hToolHelp, M) Then
        'GetProcessModule = Left$(M.szExeFile, InStr(M.szExeFile, vbNullChar) - 1)
        'GetProcessModule = Replace$(GetProcessModule, "\SystemRoot", Environ("WINDIR"))
        'GetProcessModule = Replace$(GetProcessModule, "\??\", vbNullString)
    End If
    CloseHandle hToolHelp
    
End Function




Private Function GetProcessMemoryUsage(ByVal ProcessID As Long) As Long

    Dim PMC As PROCESS_MEMORY_COUNTERS
    Dim hProcess As Long
  
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 0, ProcessID)
    If hProcess Then
        PMC.cb = LenB(PMC)
        Call GetProcessMemoryInfo(hProcess, PMC, PMC.cb)
        Call CloseHandle(hProcess)
 
        GetProcessMemoryUsage = PMC.WorkingSetSize / 1024
    End If
End Function

Public Function GetPocessThreatCount(ByVal ProcessID As Long) As Long

    Dim P As PROCESSENTRY32
    Dim Cnt As Long
    Dim hToolHelp As Long
    
    hToolHelp = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
 
    P.dwSize = Len(P)

    If Process32First(hToolHelp, P) Then
        If ProcessID = P.th32ProcessID Then
            GetPocessThreatCount = P.cntThreads
        Else
            Do While Process32Next(hToolHelp, P)
                If ProcessID = P.th32ProcessID Then
                    GetPocessThreatCount = P.cntThreads
                    Exit Do
                End If
            Loop
        End If
    End If

    CloseHandle hToolHelp

End Function

Private Function GetStringFromLP(ByVal StrPtr As Long) As String
    Dim b           As Byte
    Dim tempStr     As String
    Dim bufferStr   As String
    Dim Done        As Boolean

    Done = False
    Do
        ' Get the byte/character that StrPtr is pointing to.
        CopyMemory b, ByVal StrPtr, 1
        If b = 0 Then                           ' If you've found a null character, then you're done.
            Done = True
        Else
            tempStr = Chr$(b)                   'Get the character for the byte's value
            bufferStr = bufferStr & tempStr     'Add it to the string
            StrPtr = StrPtr + 1                 'Increment the pointer to next byte/char
        End If
    Loop Until Done
    GetStringFromLP = bufferStr
End Function


Public Function GetUsageCPU() As Long
    Dim SysBaseInfo As SYSTEM_BASIC_INFORMATION
    Dim SysPerfInfo As SYSTEM_PERFORMANCE_INFORMATION
    Dim SysTimeInfo As SYSTEM_TIME_INFORMATION
    Dim dbIdleTime As Currency
    Dim dbSystemTime As Currency
    Dim Ret As Long
    GetUsageCPU = -1
    
    'get number of processors in the system
    Ret = NtQuerySystemInformation(SYSTEM_BASICINFORMATION, VarPtr(SysBaseInfo), LenB(SysBaseInfo), 0&)

    'get new system time
    Ret = NtQuerySystemInformation(SYSTEM_TIMEINFORMATION, VarPtr(SysTimeInfo), LenB(SysTimeInfo), 0&)

    'get new CPU's idle time
    Ret = NtQuerySystemInformation(SYSTEM_PERFORMANCEINFORMATION, VarPtr(SysPerfInfo), LenB(SysPerfInfo), ByVal 0&)

    'CurrentValue = NewValue - OldValue
    dbIdleTime = LI2Currency(SysPerfInfo.liIdleTime) - LI2Currency(liOldIdleTime)
    dbSystemTime = LI2Currency(SysTimeInfo.liKeSystemTime) - LI2Currency(liOldSystemTime)
    'CurrentCpuIdle = IdleTime / SystemTime
    If dbSystemTime <> 0 Then dbIdleTime = dbIdleTime / dbSystemTime
    'CurrentCpuUsage% = 100 - (CurrentCpuIdle * 100) / NumberOfProcessors
    dbIdleTime = 100 - dbIdleTime * 100 / SysBaseInfo.bKeNumberProcessors + 0.5
    GetUsageCPU = Int(dbIdleTime)
    'store new CPU's idle and system time
    liOldIdleTime = SysPerfInfo.liIdleTime
    liOldSystemTime = SysTimeInfo.liKeSystemTime
    
End Function
Private Function LI2Currency(liInput As LARGE_INTEGER) As Currency
    CopyMemory LI2Currency, liInput, LenB(liInput)
End Function

Public Function AdjustPrivileges() As Boolean
    Dim lToken              As Long
    Dim tTOKEN_PRIVILEGES   As TOKEN_PRIVILEGES
    Dim lProcessID          As Long
    
    lProcessID = GetCurrentProcess
    If Not OpenProcessToken(lProcessID, TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY, lToken) = 0 Then
        With tTOKEN_PRIVILEGES
            If LookupPrivilegeValue(vbNullString, SE_DEBUG_NAME, .Privileges(0).pLuid) = 0 Then
                Exit Function
            End If
            .PrivilegeCount = 1
            .Privileges(0).Attributes = SE_PRIVILEGE_ENABLED
        End With
        If Not AdjustTokenPrivileges(lToken, 0, tTOKEN_PRIVILEGES, Len(tTOKEN_PRIVILEGES), 0&, 0&) = 0 Then
            AdjustPrivileges = True
        End If
    End If
End Function

Public Function GetFreeMem() As Long
    Dim tMS As MEMORYSTATUS

    tMS.dwLength = Len(tMS)
    Call GlobalMemoryStatus(tMS)
    
    GetFreeMem = 100 - tMS.dwMemoryLoad
End Function

