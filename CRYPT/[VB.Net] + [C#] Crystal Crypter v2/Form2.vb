'Made by MammoTh
Imports System.Net
Imports System.Management
Imports System.Text
Imports System.Security.Cryptography
Public Class Form2

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If IsConnectionAvailable() = False Then
            MsgBox("Wrong username or server is down")
            Exit Sub
        End If
        Dim username As String
        username = TextBox2.Text
        Dim cpuInfo As String = String.Empty
        Dim mc As New ManagementClass("win32_processor")
        Dim moc As ManagementObjectCollection = mc.GetInstances()

        For Each mo As ManagementObject In moc
            If cpuInfo = "" Then
                cpuInfo = mo.Properties("processorID").Value.ToString() + System.Environment.MachineName + My.Computer.Info.OSFullName + System.Environment.UserName + My.Computer.Info.OSFullName
                Exit For
            End If
        Next

        Dim HWID As String

        HWID = SimpleCrypt(cpuInfo)
        Dim wc As New WebClient
        Dim strings As String
        strings = wc.DownloadString("http://k0isk0.fileave.com/" + username + ".txt")
        wc.Dispose()

        If strings.Contains(HWID) Then
            Form1.Show()
            Me.Close()
        Else
            MessageBox.Show("Error, HWID Does Not Match!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Me.Close()
        End If
    End Sub

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim cpuInfo As String = String.Empty
        Dim mc As New ManagementClass("win32_processor")
        Dim moc As ManagementObjectCollection = mc.GetInstances()

        For Each mo As ManagementObject In moc
            If cpuInfo = "" Then
                cpuInfo = mo.Properties("processorID").Value.ToString() + System.Environment.MachineName + My.Computer.Info.OSFullName + System.Environment.UserName + My.Computer.Info.OSFullName
                Exit For
            End If
        Next

        Dim HWID As String

        HWID = SimpleCrypt(cpuInfo)

        TextBox1.Text = HWID
    End Sub
    Public Function SimpleCrypt( _
           ByVal Text As String) As String
        ' Encrypts/decrypts the passed string using 
        ' a simple ASCII value-swapping algorithm
        Dim strTempChar As String, i As Integer
        For i = 1 To Len(Text)
            If Asc(Mid$(Text, i, 1)) < 128 Then
                strTempChar = _
          CType(Asc(Mid$(Text, i, 1)) + 128, String)
            ElseIf Asc(Mid$(Text, i, 1)) > 128 Then
                strTempChar = _
          CType(Asc(Mid$(Text, i, 1)) - 128, String)
            End If
            Mid$(Text, i, 1) = _
                Chr(CType(strTempChar, Integer))
        Next i
        Return Text
    End Function
    Public Function IsConnectionAvailable() As Boolean
        Dim username As String
        username = TextBox2.Text
        Dim objUrl As New System.Uri("http://k0isk0.fileave.com/" + username + ".txt")

        Dim objWebReq As System.Net.WebRequest

        objWebReq = System.Net.WebRequest.Create(objUrl)

        Dim objresp As System.Net.WebResponse



        Try

            objresp = objWebReq.GetResponse

            objresp.Close()

            objresp = Nothing

            Return True



        Catch ex As Exception

            objresp = Nothing

            objWebReq = Nothing

            Return False

        End Try

    End Function
    Public Shared Sub Secure()
        Dim TargetProcess1() As Process = Process.GetProcessesByName("Fiddler")
        Dim TargetProcess2() As Process = Process.GetProcessesByName("SimpleAssemblyExplorer")
        Dim TargetProcess3() As Process = Process.GetProcessesByName("Reflector")
        Dim TargetProcess4() As Process = Process.GetProcessesByName("HxD")
        Dim TargetProcess5() As Process = Process.GetProcessesByName("OllyDbg")
        Dim TargetProcess6() As Process = Process.GetProcessesByName("TeamViewer")
        Dim TargetProcess7() As Process = Process.GetProcessesByName("WireShark")
        Dim TargetProcess8() As Process = Process.GetProcessesByName("SbieSvc")
        Dim TargetProcess9() As Process = Process.GetProcessesByName("taskmgr")
        Dim TargetProcess10() As Process = Process.GetProcessesByName("cmd")
        Dim TargetProcess11() As Process = Process.GetProcessesByName("cain")

        Dim ProcessList As System.Diagnostics.Process()
        ProcessList = System.Diagnostics.Process.GetProcesses()
        Dim Proc As System.Diagnostics.Process
        Dim title As String
        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "Fiddler")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "SimpleAssemblyExplorer")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "Red Gate's .NET Reflector")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "HxD")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "OllyDbg")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "TeamViewer")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "Wireshark")) Then
                Proc.Kill()
            End If
        Next

        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "Run Sandboxed")) Then
                Proc.Kill()
            End If
        Next
        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "Windows Task Manager")) Then
                Proc.Kill()
            End If
        Next
        For Each Proc In ProcessList
            title = Proc.MainWindowTitle
            If (String.Equals(title, "C:\Windows\system32\cmd.exe")) Then
                Proc.Kill()
            End If
        Next
        If Not TargetProcess1.Length = 0 Then
            TargetProcess1(0).Kill()
        End If

        If Not TargetProcess2.Length = 0 Then
            TargetProcess2(0).Kill()
        End If

        If Not TargetProcess3.Length = 0 Then
            TargetProcess3(0).Kill()
        End If

        If Not TargetProcess4.Length = 0 Then
            TargetProcess4(0).Kill()
        End If

        If Not TargetProcess5.Length = 0 Then
            TargetProcess5(0).Kill()
        End If

        If Not TargetProcess6.Length = 0 Then
            TargetProcess6(0).Kill()
        End If

        If Not TargetProcess7.Length = 0 Then
            TargetProcess7(0).Kill()
        End If

        If Not TargetProcess9.Length = 0 Then
            TargetProcess9(0).Kill()
        End If
        If Not TargetProcess10.Length = 0 Then
            TargetProcess10(0).Kill()
        End If
        If Not TargetProcess11.Length = 0 Then
            TargetProcess11(0).Kill()
        End If
    End Sub
End Class