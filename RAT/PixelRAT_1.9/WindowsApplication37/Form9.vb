Imports Microsoft.Win32

Public Class Form9
    Dim Username, Password, ID As String
    Sub AntiWireShark()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "wireshark"
                    generaldee(i).Kill()
                    MsgBox("I'm asumming you're trying to crack this program with WireShark. Fuck Right Off.")
                    End
                Case Else
            End Select
        Next
    End Sub
    Sub AntiFiddler()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "fiddler"
                    generaldee(i).Kill()
                    MsgBox("I'm asumming you're trying to crack this program with Fiddler. Fuck Right Off.")
                    End
                Case Else
            End Select
        Next
    End Sub
    Sub AntiOllydbg()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "ollydbg"
                    generaldee(i).Kill()
                    MsgBox("I'm asuming you're trying to crack this program with OllyDBG. Fuck Right Off.")
                    End
                Case Else
            End Select
        Next

    End Sub
    Sub Login()
        On Error Resume Next
        If IsConnectionAvailable() = False Then
            MsgBox("Please connect to the internet before using this program.", 0 + 16, "Error")
            Exit Sub
        End If

        Dim Username As String = TextBox1.Text
        Dim Password As String = TextBox2.Text
        Dim ID As String = createID()

        Dim wc As New System.Net.WebClient
        Dim http As String = wc.DownloadString("http://pixelrat.site90.com/" & Username & "HWID.html")

        If http.Contains(ID) Then
            Call AntiWireShark()
            Call AntiFiddler()
            Call AntiOllydbg()
            Dim wc2 As New System.Net.WebClient
            Dim http2 As String = wc2.DownloadString("http://pixelrat.site90.com/" & Username & "HWIDp.html")

            If http2.Contains(Password) Then
                CreateReg()
                RememberMe()
                BackgroundWorker1.ReportProgress(100)
                Exit Sub
            Else
                MsgBox("Invalid Password, the program will now exit.", 0 + 16, "Error")
                End
            End If
        Else
            MsgBox("Invalid Username or your License has been deactived (Or the Server may be offline), the program will now exit.", 0 + 16, "Error")
            End
        End If
    End Sub
    Sub FirstTimeUse()
        Dim regKey As RegistryKey
        regKey = Registry.CurrentUser.OpenSubKey("Software\PixelRAT\", True)
        If regKey.GetValue("Agree") = 1 Then
            Form1.Show()
            Me.Hide()
        Else
            Form7.Show()
            Me.Hide()
        End If
        regKey.Close()
    End Sub
    Sub CreateReg()
        On Error Resume Next
        My.Computer.Registry.CurrentUser.CreateSubKey("Software\PixelRAT")
    End Sub
    Sub RememberMe()
        On Error Resume Next
        If CheckBox1.Checked = True Then
            Dim regKey As RegistryKey
            regKey = Registry.CurrentUser.OpenSubKey("Software\PixelRAT\", True)
            regKey.SetValue("Username", TextBox1.Text)
            regKey.Close()
        End If

        If CheckBox2.Checked = True Then
            Dim regKey As RegistryKey
            regKey = Registry.CurrentUser.OpenSubKey("Software\PixelRAT\", True)
            regKey.SetValue("Password", TextBox2.Text)
            regKey.Close()
        End If
    End Sub
    Dim Dragging As Boolean

    ' Stores the offset where the picturebox is clicked.
    Dim PointClicked As Point
    Private Sub Picturebox27_MouseDown(ByVal sender As Object, _
      ByVal e As System.Windows.Forms.MouseEventArgs)
        If e.Button = MouseButtons.Left Then
            Dragging = True
            PointClicked = New Point(e.X, e.Y)
        Else
            Dragging = False
        End If

    End Sub
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        BackgroundWorker1.RunWorkerAsync()
        Timer1.Stop()
    End Sub
    Private Function IsConnectionAvailable() As Boolean
        'Call url
        Dim url As New System.Uri("http://www.google.com/")
        'Request for request
        Dim req As System.Net.WebRequest
        req = System.Net.WebRequest.Create(url)
        Dim resp As System.Net.WebResponse
        Try
            resp = req.GetResponse()
            resp.Close()
            req = Nothing
            Return True
        Catch ex As Exception
            req = Nothing
            Return False
        End Try
    End Function
    Public Function createID() As String
        Dim regPID As RegistryKey
        regPID = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion", False)
        Dim regGUID As RegistryKey
        regGUID = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Cryptography", False)


        'Removes/Replaces the "-" in the ProductId/MachineGUID with blanks.
        'Example: 456a4sda-asdjklasjd-123 turns into 456a4sdaasdjklasjd123.
        Dim Pid As Object
        Pid = Replace(regPID.GetValue("ProductId"), "-", "")

        Dim GUID As Object
        GUID = Replace(regGUID.GetValue("MachineGUID"), "-", "")


        Dim lenPID As Integer
        'Number of characters in ProductId.
        lenPID = Len(Pid)
        Dim lenGUID As Integer
        'Number of characters in MachineGUID.
        lenGUID = Len(GUID)


        Dim tempValue As String
        Dim strPID As String
        Dim strGUID As String
        Dim hardwareID As String


        'Continues conversion to the end of the string length.
        For x = 1 To lenPID
            tempValue = Hex((Asc(Mid(Pid, x, 1)) Xor 23) Xor 14)
            'Puts the ProductId and Xor'd Values together.
            'ProductId first, then Xor'd Values come after.
            'Note: This makes the ID longer.
            strPID = strPID & tempValue
        Next x
        'Reverses the character/string order of ProductId.
        strPID = StrReverse(strPID)

        'Continues conversion to the end of the string length.
        For x = 1 To lenGUID
            tempValue = Hex((Asc(Mid(GUID, x, 1)) Xor 23) Xor 14)
            'Puts the MachineGUID and Xor'd Values together.
            'MachineGUID first, then Xor'd values come after.
            'Note: This makes the ID longer.
            strGUID = strGUID & tempValue
        Next x

        'Reverses the character/string order of MachineGUID.
        strGUID = StrReverse(strGUID)
        'Reverses MachineGUID back first, then adds the reversed
        'character/string order of ProductId.
        hardwareID = StrReverse(strGUID & strPID)
        createID = hardwareID
    End Function

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        BackgroundWorker1.RunWorkerAsync()
    End Sub
    Private Sub Form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        On Error Resume Next
        Dim regKey As RegistryKey
        regKey = Registry.CurrentUser.OpenSubKey("Software\PixelRAT\", True)
        TextBox1.Text = regKey.GetValue("Username")
        CheckBox1.Checked = True
        regKey.Close()

        Dim regKey2 As RegistryKey
        regKey2 = Registry.CurrentUser.OpenSubKey("Software\PixelRAT\", True)
        TextBox2.Text = regKey2.GetValue("Password")
        CheckBox2.Checked = True
        regKey2.Close()
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Login()
    End Sub

    Private Sub BackgroundWorker1_ProgressChanged(ByVal sender As Object, ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles BackgroundWorker1.ProgressChanged
        If e.ProgressPercentage = 100 Then
            FirstTimeUse()
        End If
    End Sub

End Class