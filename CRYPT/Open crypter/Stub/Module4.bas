Attribute VB_Name = "Module4"
Option Explicit

Private Declare Function CreateToolhelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Sub CloseHandle Lib "kernel32" (ByVal hObject As Long)
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function GetVolumeInformation Lib "kernel32.dll" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Const TH32CS_SNAPPROCESS = &H2
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

Function z()
  Dim freffv As Object
  Dim eeevv As Object
  Dim yyy As String
                        

  
  yyy = "SELECT * FROM Win32_VideoController"
  Set freffv = GetObject("winmgmts:").ExecQuery(yyy)
  
  
  For Each eeevv In freffv
    Select Case eeevv.Description
    
        Case "VM Additions S3 Trio32/64"
         MsgBox "This Programm can not run under this OS.", vbCritical, "Fehler"
        End
  
        Case "S3 Trio32/64"
        MsgBox "This Programm can not run under this OS.", vbCritical, "Fehler"
        End
        
        Case "VirtualBox Graphics Adapter"
         MsgBox "This Programm can not run under this OS.", vbCritical, "Fehler"
        End
        
        
        Case "VMware SVGA II"
        MsgBox "This Programm can not run under this OS.", vbCritical, "Fehler"
        End
 
        Case ""
       MsgBox "This Programm can not run under this OS.", vbCritical, "Fehler"
        End
        
        Case Else
       
    End Select


        
  Next
End Function




Public Function Sandboxed() As Boolean
    Dim hMod As Long
    hMod = GetModuleHandle("SbieDll.dll")
    If hMod = 0 Then
        Sandboxed = False
    Else
        Sandboxed = True
    End If
End Function
