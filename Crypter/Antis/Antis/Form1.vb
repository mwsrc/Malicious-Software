Imports System.Threading
Imports System.Environment

Public Class Form1

    Private Declare Function GetDiskFreeSpaceEx Lib "kernel32" Alias "GetDiskFreeSpaceExA" _
       (ByVal lpDirectoryName As String, ByRef lpFreeBytesAvailableToMe As Long, _
       ByRef lpTotalNumberOfBytes As Long, ByRef lpTotalNumberOfFreeBytes As Long) As Integer


#Region "Anti Functions (X8)"
    Public Function AntiEmulator() As Boolean
        Dim timenow As Long
        Dim timeaftersleep As Long
        timenow = TickCount
        Thread.Sleep(500)
        timeaftersleep = TickCount
        If timeaftersleep - timenow < 500 Then
            MsgBox("AntiEmulator detected", MsgBoxStyle.Critical)
            AntiEmulator = True
        Else
            AntiEmulator = False
            MsgBox("AntiEmulator not detected")
        End If
    End Function
    Public Function AntiWireshark()
        Dim ProcessList As System.Diagnostics.Process()
        ProcessList = System.Diagnostics.Process.GetProcesses()
        Dim Proc As System.Diagnostics.Process
        For Each Proc In ProcessList
            If Proc.MainWindowTitle.Contains("Wireshark") = True Then
                MsgBox("Wireshark Detected", MsgBoxStyle.Critical)
            End If
        Next
    End Function
    Public Function antiSandboxie() As Boolean
        If Process.GetProcessesByName("SbieSvc").Length >= 1 Then
            MsgBox("Sandboxie Detected!", MsgBoxStyle.Critical)
            Return True
        Else
            MsgBox("Sandboxie isn't Detected!", MsgBoxStyle.Information, "Not Detected!")
            Return False
        End If
    End Function
    Public Function antiVpc() As Boolean
        If Process.GetProcessesByName(("vpcmap")).Length >= 4 And Process.GetProcessesByName(("vmsrvc")).Length >= 4 Then
            MsgBox("Virtual PC found!", MsgBoxStyle.Critical)
            Return True
        Else
            MsgBox("No Virtual PC found!")
            Return False
        End If
    End Function
    Public Function AntiVMware() As Boolean
        If Process.GetProcessesByName("vmwareservice").Length >= 1 Then
            MsgBox("VMware PC found!", MsgBoxStyle.Critical)
            Return True
        Else
            MsgBox("VMware PC Not found!")
            Return False
        End If
    End Function
    Public Function VirtualBox() As Boolean
        If Process.GetProcessesByName("VBoxservice").Length >= 1 Then
            MsgBox("Sun VirtualBox found!", MsgBoxStyle.Critical)
            Return True
        Else
            MsgBox("Sun VirtualBox Not found!")
            Return False
        End If
    End Function
    Private Function antiAnubis() As Boolean
        Dim folder As String = Application.StartupPath
        Dim getFile As String = folder & "\sample.exe"
        If Application.ExecutablePath = getFile Then
            MsgBox("Anubis is Detected!", MsgBoxStyle.Critical)
            Return True
        Else
            MsgBox("Anubis isn't Detected!")
            Return False
        End If
    End Function
    Public Function HardDriveSize() As Boolean
        Dim DriveOrFolder As String = "c:"
        Dim FreeBytesAvailableToMe As Long
        Dim TotalBytes As Long
        Dim FreeBytes As Long
        Dim FetchResult As Integer
        FetchResult = GetDiskFreeSpaceEx(DriveOrFolder, FreeBytesAvailableToMe, TotalBytes, FreeBytes)
        If TotalBytes >= 20000000000 Then
            MsgBox("Good")
            Return True
        Else : Return False
        End If
    End Function
#End Region
    
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If CheckBox1.Checked = True Then AntiEmulator()
        If CheckBox2.Checked = True Then antiSandboxie()
        If CheckBox3.Checked = True Then antiVpc()
        If CheckBox4.Checked = True Then antiAnubis()
        If CheckBox5.Checked = True Then AntiVMware()
        If CheckBox6.Checked = True Then AntiWireshark()
        If CheckBox7.Checked = True Then VirtualBox()
        If CheckBox8.Checked = True Then HardDriveSize()
    End Sub

#Region "notify icon crap"
    Sub size_Changed() Handles Me.SizeChanged
        sizer()
    End Sub
    Sub sizer()
        If Me.WindowState = FormWindowState.Minimized Then
            nf1.Visible = True
            ShowInTaskbar = False
        End If
        If Me.WindowState = FormWindowState.Normal Then
            nf1.Visible = False
            ShowInTaskbar = True
        End If
    End Sub
#End Region

    Private Sub RestoreToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RestoreToolStripMenuItem.Click
        If Me.WindowState = FormWindowState.Minimized Then Me.WindowState = FormWindowState.Normal
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub nf1_MouseDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles nf1.MouseDoubleClick
        sizer()
    End Sub

    Private Sub CheckAntisNowToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckAntisNowToolStripMenuItem.Click
        Button1.Select()
    End Sub
End Class
