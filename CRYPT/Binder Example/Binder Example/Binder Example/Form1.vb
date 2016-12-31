Imports System.IO
Public Class Form1

    Const FileSplit = "(-Two-Binded-Files-From-Nathan72389s-Free-Example-Binder-)"

#Region "Buttons"
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim ofd1 As New OpenFileDialog
        ofd1.Filter = "*.exe | *.exe"
        If ofd1.ShowDialog = DialogResult.OK Then TextBox1.Text = ofd1.FileName
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim ofd2 As New OpenFileDialog
        ofd2.Filter = "*.exe | *.exe"
        If ofd2.ShowDialog = DialogResult.OK Then TextBox2.Text = ofd2.FileName
    End Sub


    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        If TextBox1.Text = "" Or TextBox2.Text = "" Then
            MessageBox.Show("Please Open 2 Files", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        BackgroundWorker1.RunWorkerAsync()
    End Sub
#End Region

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        Try
            Dim stub, file1, file2 As String
            FileOpen(1, TextBox1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            file1 = Space(LOF(1))
            FileGet(1, file1)
            FileClose(1)
            FileOpen(2, TextBox2.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            file2 = Space(LOF(2))
            FileGet(2, file2)
            FileClose(2)
            FileOpen(3, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            stub = Space(LOF(3))
            FileGet(3, stub)
            FileClose(3)
            FileOpen(3, Application.StartupPath & "\Binded Files.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
            FilePut(3, stub & FileSplit & file1 & FileSplit & file2)
            FileClose(3)
            MessageBox.Show("Binded", "Binded", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        Catch ex As Exception
            MessageBox.Show("There were errors" & vbCrLf & "No files were created.", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Sub report() Handles BackgroundWorker1.RunWorkerCompleted
        Me.Close()
    End Sub
End Class
