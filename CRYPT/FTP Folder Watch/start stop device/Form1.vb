Imports System
Imports System.ComponentModel
Imports System.Threading
Imports System.Windows.Forms
Public Class Form1

    Dim ftp As New Chilkat.Ftp2()
    Dim success As Boolean
    Dim optpassive As Boolean
    Dim username, password, host, dir As String
    Dim Sound As New System.Media.SoundPlayer()

    Private Sub Form1_Minimized() Handles Me.Resize
        If Me.WindowState = FormWindowState.Minimized Then
            Me.ShowInTaskbar = False
            Me.Hide()
            NotifyIcon1.Visible = True
        End If
    End Sub

    Private Sub NotifyIcon1_MouseDown(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIcon1.MouseDown
        If e.Button = Windows.Forms.MouseButtons.Left Then
            Me.Visible = True
            If Me.WindowState = FormWindowState.Minimized Then
                Me.WindowState = FormWindowState.Normal
            End If
            NotifyIcon1.Visible = False
            ShowInTaskbar = True
        End If
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub RestoreToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RestoreToolStripMenuItem.Click
        Me.ShowInTaskbar = True
        Me.Show()
        Me.WindowState = FormWindowState.Normal
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        '''''''''''''''''''''''''''''''''
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        FolderBrowserDialog1.ShowDialog()
        TextBox6.Text = FolderBrowserDialog1.SelectedPath + "\"
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        If CheckBox1.Checked = True And TextBox7.Text = "" Then
            MsgBox("You need to select a sound file!")
            Exit Sub
        End If
        If TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Or TextBox5.Text = "" Then
            MsgBox("You need to enter all of the Ftp information!")
            Exit Sub
        End If
        If TextBox6.Text = "" Then
            MsgBox("You need to select where to save the files!")
            Exit Sub
        End If
        MsgBox("Started")
        NotifyIcon1.Text = ("Watching :" + vbNewLine + TextBox2.Text + "/" + TextBox5.Text)
        Timer1.Interval = NumericUpDown1.Value * 60 * 1000
        Timer1.Enabled = True
        GroupBox1.Enabled = False
        GroupBox2.Enabled = False
        Button4.Enabled = False
        Button5.Enabled = True
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        BackgroundWorker1.RunWorkerAsync()
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Timer1.Stop()
        MsgBox("Stopped")
        GroupBox1.Enabled = True
        GroupBox2.Enabled = True
        Button4.Enabled = True
        Button5.Enabled = False
        NotifyIcon1.Text = "Stopped"
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Me.Close()
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        If CheckBox1.Checked = True And TextBox7.Text = "" Then
            MsgBox("You need to select a sound file!")
            Exit Sub
        End If
        If TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Or TextBox5.Text = "" Then
            MsgBox("You need to enter all of the Ftp information!")
            Exit Sub
        End If
        If TextBox6.Text = "" Then
            MsgBox("You need to select where to save the files!")
            Exit Sub
        End If
        success = ftp.UnlockComponent("FTP$TEAM$BEAN_149F54129R9G")
        username = TextBox3.Text
        dir = TextBox5.Text
        password = TextBox4.Text
        host = TextBox2.Text
        If (success <> True) Then
            MsgBox("Sorry, There was an error. Please check your settings.")
            Exit Sub
        End If
        If CheckBox2.Checked Then
            optpassive = True
        Else : optpassive = False
        End If
        ftp.Hostname = host
        ftp.Username = username
        ftp.Password = password
        ftp.Passive = optpassive
        ftp.Port = NumericUpDown2.Value
        success = ftp.Connect()
        If (success <> True) Then
            MsgBox("Sorry, Could not connect to FTP server.")
            Exit Sub
        End If
        Dim dirExists As Boolean
        dirExists = ftp.ChangeRemoteDir("/" + dir)
        If (dirExists = True) Then
            MsgBox("Yes, Your settings are correct.")
        End If
        If (dirExists = False) Then
            MsgBox("Sorry, Can not find " + dir + " on the FTP server.")
        End If
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            Button7.Enabled = True
        Else : Button7.Enabled = False
        End If
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        OpenFileDialog1.ShowDialog()
        TextBox7.Text = OpenFileDialog1.FileName
    End Sub

    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        If CheckBox1.Checked = True Then
            Sound.SoundLocation = TextBox7.Text
            Sound.Load()
            Sound.Play()
        End If
        If CheckBox3.Checked = True Then Form2.Show()
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Timer1.Enabled = False
        Dim success As Boolean
        username = TextBox3.Text
        dir = TextBox5.Text
        password = TextBox4.Text
        host = TextBox2.Text
        success = ftp.UnlockComponent("FTP$TEAM$BEAN_149F54129R9G")
        If (success <> True) Then
            MsgBox("Sorry, invalid key. Please check with the author.")
            Exit Sub
        End If
        If CheckBox2.Checked Then
            optpassive = True
        Else : optpassive = False
        End If
        ftp.Passive = optpassive
        ftp.Hostname = host
        ftp.Username = username
        ftp.Password = password
        ftp.Port = NumericUpDown2.Value
        success = ftp.Connect()
        success = ftp.ChangeRemoteDir(dir)
        ftp.ListPattern = "*.*"
        Dim i As Long
        Dim fname As String
        Dim n As Long
        n = ftp.NumFilesAndDirs
        If (n < 0) Then
            Exit Sub
        End If
        If (n > 0) Then
            For i = 0 To n - 1
                fname = ftp.GetFilename(i)
                TextBox1.Text = TextBox1.Text & fname & vbCrLf
                success = ftp.GetFile(fname, TextBox6.Text + fname)
                If i = 0 And CheckBox1.Checked = True Then
                    Sound.SoundLocation = TextBox7.Text
                    Sound.Load()
                    Sound.Play()
                End If
                If CheckBox3.Checked Then BackgroundWorker2.RunWorkerAsync()
                success = ftp.DeleteRemoteFile(fname)
            Next
        End If
        ftp.Disconnect()
    End Sub
    Private Sub done() Handles BackgroundWorker1.RunWorkerCompleted

        Timer1.Enabled = True
        Timer1.Start()

    End Sub

    Private Sub BackgroundWorker2_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker2.DoWork
        Form2.Show()
    End Sub
End Class
