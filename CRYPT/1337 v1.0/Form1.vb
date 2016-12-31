Imports System.Net
Imports System.IO
Imports System.Net.Mail

Public Class Form1



    Dim host As String
    Dim port As Integer
    Dim counter As Integer

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ButtonX2.Enabled = False
        TextBoxX2.Text = "0"
        counter = 0
    End Sub



    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        'Set the host and port and counter
        counter = counter + 1 'counter is for the timer
        TextBoxX2.Text = counter
        host = TextBoxX1.Text
        port = TextBoxX2.Text
        ' Next part creates a socket to try and connect on with the given user information.

        Dim hostadd As System.Net.IPAddress = System.Net.Dns.GetHostEntry(host).AddressList(0)
        Dim EPhost As New System.Net.IPEndPoint(hostadd, port)
        Dim s As New System.Net.Sockets.Socket(System.Net.Sockets.AddressFamily.InterNetwork, _
        System.Net.Sockets.SocketType.Stream, System.Net.Sockets.ProtocolType.Tcp)
        Try
            s.Connect(EPhost)
        Catch
        End Try
        If Not s.Connected Then
            ListBox1.Items.Add("Port " + port.ToString + " is not open")
        Else
            ListBox1.Items.Add("Port " + port.ToString + " is open")
            ListBox2.Items.Add(port.ToString)
        End If
        LabelX5.Text = "Open Ports: " + ListBox2.Items.Count.ToString
    End Sub

    Private Sub ButtonX1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX1.Click
        ListBox2.Items.Add("Scanning: " + TextBoxX1.Text)
        ListBox2.Items.Add("-------------------")
        ButtonX2.Enabled = True
        ButtonX1.Enabled = False
        Timer1.Enabled = True
        Timer1.Start()
    End Sub

    Private Sub ButtonX2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX2.Click
        'stop button
        Timer1.Stop()
        Timer1.Enabled = False
        ButtonX1.Enabled = True
        ButtonX2.Enabled = False
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim ofd As New OpenFileDialog
        ofd.Filter = "Exe Files|*.exe"
        ofd.ShowDialog()
        TextBox3.Text = ofd.FileName
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim sfd As New SaveFileDialog
        sfd.Filter = "Exe Files|*.exe"
        sfd.ShowDialog()
        Dim filesize As Double = Val(NumericUpDown1.Value)
        IO.File.Copy(TextBox3.Text, sfd.FileName)
        If RadioButton1.Checked Then
            filesize = filesize * 1024
        End If
        If RadioButton2.Checked Then
            filesize = filesize * 1048576
        End If
        Dim filetopump = IO.File.OpenWrite(sfd.FileName)
        Dim size = filetopump.Seek(0, IO.SeekOrigin.[End])
        While size < filesize
            filetopump.WriteByte(0)
            size += 1
        End While
        filetopump.Close()
        MsgBox("Successfully Pumped!")
    End Sub

    Private Sub ButtonX5_Click1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX5.Click
        Try
            If TextSite.Text.Contains("http://") Then
                Dim iphe As IPHostEntry = Dns.GetHostEntry(TextSite.Text.Replace("http://", String.Empty))
                TextIp.Text = iphe.AddressList(0).ToString()
            Else
                Dim iphe As IPHostEntry = Dns.GetHostEntry(TextSite.Text)
                TextIp.Text = iphe.AddressList(0).ToString()
            End If
        Catch ex As Exception
            MsgBox(ex)
        End Try
    End Sub

    Private Sub ButtonX3_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX3.Click
        Dim Proc As Process = New Process
        Dim top As String = "netsh.exe"
        Proc.StartInfo.Arguments = ("firewall set opmode enable")
        Proc.StartInfo.FileName = top
        Proc.StartInfo.UseShellExecute = False
        Proc.StartInfo.RedirectStandardOutput = True
        Proc.StartInfo.CreateNoWindow = True
        Proc.Start()
        Proc.WaitForExit()
    End Sub

    Private Sub ButtonX4_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX4.Click
        Dim Proc As Process = New Process
        Dim top As String = "netsh.exe"
        Proc.StartInfo.Arguments = ("firewall set opmode disable")
        Proc.StartInfo.FileName = top
        Proc.StartInfo.UseShellExecute = False
        Proc.StartInfo.RedirectStandardOutput = True
        Proc.StartInfo.CreateNoWindow = True
        Proc.Start()
        Proc.WaitForExit()
    End Sub

    'the declare function
    Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long

    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        mciSendString("Set CDAudio Door Open Wait", 0&, 0&, 0&)
    End Sub

    Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button9.Click
        mciSendString("Set CDAudio Door Closed Wait", 0&, 0&, 0&)
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click
        If My.Computer.Network.Ping((TextBox4.Text), 1000) Then
            MsgBox("Server pinged successfully.")
        Else
            MsgBox("Ping request timed out.")
        End If
    End Sub

    Private Sub Button11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button11.Click
        Process.Start("http://www.google.com/#hl=en&q=" & txtSearch.Text)
    End Sub

    Dim NewPoint As New System.Drawing.Point()
    Dim X, Y As Integer

    Private Sub Button12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button12.Click
        TextBox5.Text = My.User.Name
        TextBox6.Text = My.Computer.Name
        TextBox7.Text = My.Computer.Info.AvailablePhysicalMemory
        TextBox8.Text = My.Computer.Info.AvailableVirtualMemory
        TextBox9.Text = My.Computer.Info.OSFullName
        TextBox10.Text = My.Computer.Info.OSPlatform
        TextBox11.Text = My.Computer.Info.OSVersion
        TextBox12.Text = My.Computer.Info.TotalPhysicalMemory
        TextBox13.Text = My.Computer.Info.TotalVirtualMemory
        TextBox14.Text = My.Computer.Clipboard.GetText
        TextBox15.Text = My.Computer.Clock.LocalTime
        TextBox16.Text = My.Computer.FileSystem.CurrentDirectory
        TextBox17.Text = My.Computer.Keyboard.CapsLock
        TextBox18.Text = My.Computer.Keyboard.NumLock
        TextBox19.Text = My.Computer.Keyboard.ScrollLock
        TextBox20.Text = My.Computer.Mouse.WheelExists
        ComboBox1.Items.AddRange(System.IO.Directory.GetLogicalDrives)
        ComboBox1.Text = ComboBox1.Items(0)
        TextBox21.Text = My.Computer.Info.InstalledUICulture.ToString
        Dim Husam As New System.Net.WebClient
        Dim ip As String
        ip = System.Text.Encoding.ASCII.GetString(( _
        Husam.DownloadData("Http://whatismyip.com/automation/n09230945.asp")))
        TextBox22.Text = ip
        Dim iphe As IPHostEntry = Dns.GetHostEntry("")
        TextBox23.Text = iphe.AddressList(0).ToString()
    End Sub

    Private Sub Button13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button13.Click
        TextBox5.Clear()
        TextBox6.Clear()
        TextBox7.Clear()
        TextBox8.Clear()
        TextBox9.Clear()
        TextBox10.Clear()
        TextBox11.Clear()
        TextBox12.Clear()
        TextBox13.Clear()
        TextBox14.Clear()
        TextBox15.Clear()
        TextBox16.Clear()
        TextBox17.Clear()
        TextBox18.Clear()
        TextBox19.Clear()
        TextBox20.Clear()
        TextBox21.Clear()
        TextBox22.Clear()
        ComboBox1.Text = ""
        ComboBox1.Items.Clear()
        TextBox23.Clear()
    End Sub

    Private Sub Button14_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button14.Click
        Opacity = 0
        Dim Bounds As Rectangle
        Dim Capture As System.Drawing.Bitmap
        Dim Graph As Graphics
        Bounds = Screen.PrimaryScreen.Bounds
        Capture = New System.Drawing.Bitmap(Bounds.Width, Bounds.Height, System.Drawing.Imaging.PixelFormat.Format32bppPArgb)
        Graph = Graphics.FromImage(Capture)
        Graph.CopyFromScreen(Bounds.X, Bounds.Y, 0, 0, Bounds.Size, CopyPixelOperation.SourceCopy)
        PictureBox2.Image = Capture
        Opacity = 100
    End Sub

    Private Sub Button15_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button15.Click
        Dim pic As Image
        SaveFileDialog1.DefaultExt = "*.bmp"
        SaveFileDialog1.Filter = "Bmp Files|*.bmp"
        pic = PictureBox2.Image
        SaveFileDialog1.ShowDialog()
        On Error Resume Next
        pic.Save(SaveFileDialog1.FileName)
    End Sub

    Private Sub startbtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles startbtn.Click
        Timer2.Start()
    End Sub

    Private Sub stopbtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles stopbtn.Click
        Timer2.Stop()
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        Dim MyMailMessage As New MailMessage()
        MyMailMessage.From = New MailAddress(usernamebox.Text)
        MyMailMessage.To.Add(tobox.Text)
        MyMailMessage.Subject = (subjectbox.Text)
        MyMailMessage.Body = messagebox.Text
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(usernamebox.Text, passwordbox.Text)
        SMTPServer.EnableSsl = True
        Label33.Text = Val(Label33.Text + 1)
        SMTPServer.Send(MyMailMessage)
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If passwordbox.PasswordChar = "*" Then
            passwordbox.PasswordChar = Nothing
        ElseIf passwordbox.PasswordChar = Nothing Then
            passwordbox.PasswordChar = "*"
        End If
    End Sub

    Private Function Filesize(ByRef File As String) As String
        Dim bytes As String
        Dim Size As String
        bytes = CStr(FileLen(File))
        If CDbl(bytes) > 1024 Then
            Size = " KB"
            bytes = CStr(CDbl(bytes) / 1024)
        Else
            Size = " Bytes"
        End If
        If CDbl(bytes) > 1024 Then
            Size = " MB"
            bytes = CStr(CDbl(bytes) / 1024)
        End If
        Filesize = System.Math.Round(CDbl(bytes), 2) & Size
    End Function

    Private Sub Button16_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button16.Click
        OpenFileDialog2.ShowDialog()
        TextBox24.Text = OpenFileDialog2.FileName
        Label49.Text = Filesize(TextBox24.Text)
        Dim strDateTime As String
        strDateTime = FileDateTime(TextBox24.Text)
        Label50.Text = strDateTime
    End Sub

    Private Sub Button17_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button17.Click
        If TextBox24.Text.Contains(".exe") = False Then
            MsgBox("You haven't selected a file yet!")
        Else
            MsgBox(TextBox24.Text)
        End If
    End Sub

    Private Sub Button18_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button18.Click
        Dim FileToDelete As String
        If TextBox24.Text.Contains(".exe") = False Then
            MsgBox("You haven't selected a file yet!")
        End If
        FileToDelete = TextBox24.Text

        If System.IO.File.Exists(FileToDelete) = True Then

            If Microsoft.VisualBasic.MsgBox("Are you sure you want to delete the file located at:" + vbNewLine + TextBox24.Text + vbNewLine + "Warning: You will not be able to retrieve this file once it is deleted", MsgBoxStyle.YesNo) = MsgBoxResult.Yes Then
                System.IO.File.Delete(FileToDelete)
            Else

                MsgBox("File was not deleted.")
            End If
        End If
    End Sub

    Private Sub Button19_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button19.Click
        SaveFileDialog2.Filter = "Webpage|*.html"
        SaveFileDialog2.ShowDialog()
        If SaveFileDialog2.FileName <> "" Then
            FileOpen(1, SaveFileDialog2.FileName, OpenMode.Output)
            PrintLine(1, one.Text)
            PrintLine(1, "<title>" + TextBox25.Text + "</title>")
            PrintLine(1, two.Text)
            PrintLine(1, TextBox29.Text)
            PrintLine(1, ");")
            PrintLine(1, three.Text)
            PrintLine(1, "<center><font color=#00FFFF>" + TextBox27.Text + "</font></center>")
            PrintLine(1, "<center><font color=#00FFFF>" + TextBox28.Text + "</font></center>")
            PrintLine(1, "<embed src=""http://www.youtube.com/v/" + TextBox26.Text + "&autoplay=1"" type=""application/x-shockwave-flash"" wmode=""transparent"" width=""1"" height=""1""></embed>")
            PrintLine(1, "</body>")
            PrintLine(1, "</html>")
            FileClose(1)

        End If
    End Sub

    Private Sub Button20_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button20.Click
        If IsWebConnected() Then
            PictureBox4.BackgroundImage = My.Resources.Ok
            PictureBox4.BackgroundImageLayout = ImageLayout.Center
            Label59.Text = "You Are Connected To The Internet"
        Else
            PictureBox4.BackgroundImage = My.Resources.Delete
            PictureBox4.BackgroundImageLayout = ImageLayout.Center
            Label59.Text = "You Are Not Connected To The Internet"
        End If
    End Sub

    Private Sub Button21_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button21.Click
        Form2.Show()
    End Sub

    Private Sub LabelX6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LabelX6.Click
        Process.Start("www.hackforums.net")
    End Sub

    Private Sub LabelX7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LabelX7.Click
        Process.Start("www.leetcoders.org")
    End Sub
End Class


