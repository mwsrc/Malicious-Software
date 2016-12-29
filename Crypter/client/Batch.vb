Public Class Batch

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If My.Computer.FileSystem.DirectoryExists(Environment.CurrentDirectory & "\test.bat") Then

            My.Computer.FileSystem.DeleteFile(Environment.CurrentDirectory & "\test.bat")

        End If
        My.Computer.FileSystem.WriteAllText(Environment.CurrentDirectory & "\test.bat", TextBox1.Text, True)
        Shell(Environment.CurrentDirectory & "\test.bat")
     End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form1.senddata("37*" & TextBox1.Text)
    End Sub
End Class