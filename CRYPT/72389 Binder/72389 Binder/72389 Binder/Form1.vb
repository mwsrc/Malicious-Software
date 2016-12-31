Public Class Form1

    Const FileSplit = "@@Egymania@@"
    Dim punkbitch1, punkbitch2 As String
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        OpenFileDialog1.ShowDialog()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        OpenFileDialog2.ShowDialog()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        OpenFileDialog3.ShowDialog()
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog1.FileOk
        TextBox1.Text = OpenFileDialog1.FileName
        punkbitch1 = OpenFileDialog1.FileName.Substring(OpenFileDialog1.FileName.LastIndexOf("\") + 1)
    End Sub

    Private Sub OpenFileDialog2_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog2.FileOk
        TextBox2.Text = OpenFileDialog2.FileName
        punkbitch2 = OpenFileDialog2.FileName.Substring(OpenFileDialog2.FileName.LastIndexOf("\") + 1)
    End Sub

    Private Sub OpenFileDialog3_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog3.FileOk
        TextBox3.Text = OpenFileDialog3.FileName
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        If TextBox1.Text = "" Then
            MsgBox("You need to select a file!")
            Exit Sub
        ElseIf TextBox2.Text = "" Then
            MsgBox("You need to select a file!")
            Exit Sub
        ElseIf TextBox3.Text = "" Then
            MsgBox("You need to select a file!")
            Exit Sub
        End If
        Dim stub, joesmomma, joesdaddy As String

        Dim b As Byte() = My.Resources.stub
        Dim BlueCar As String = Application.StartupPath & "\Stub.exe"
        Dim TempFile As System.IO.FileStream = IO.File.Create(BlueCar)
        TempFile.Write(b, 0, b.Length)
        TempFile.Close()

        FileOpen(1, TextBox1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        joesmomma = Space(LOF(1))
        FileGet(1, joesmomma)
        FileClose(1)

        FileOpen(2, TextBox2.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        joesdaddy = Space(LOF(2))
        FileGet(2, joesdaddy)
        FileClose(2)

        FileOpen(3, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        FileOpen(3, TextBox3.Text, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, stub & FileSplit & joesmomma & FileSplit & joesdaddy & FileSplit & punkbitch1 & FileSplit & punkbitch2)
        FileClose(3)
        System.IO.File.Delete(Application.StartupPath & ("\Stub.exe"))
        MsgBox("File Binded")
        Me.Close()

    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Me.Close()
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("https://www.meziamus.com/")
    End Sub
End Class
