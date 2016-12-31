Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Call CloneIt(TextBox1.Text)
        If (CheckBox1.Checked) Then
            Call IconIt(TextBox3.Text)
        End If
        MsgBox("Done")
    End Sub

    Private Sub CloneIt(ByVal SourceFile As String)
        Shell(App_Path() & "res\\res.exe -extract " & SourceFile & "," & App_Path() & "res\\info.res" & ",VERSIONINFO,,")
        Shell(App_Path() & "res\\res.exe -delete " & TextBox2.Text & "," & App_Path() + "res\\res.exe" & ",VERSIONINFO,,")
        Shell(App_Path() & "res\\res.exe -addoverwrite " & TextBox2.Text & "," & TextBox2.Text & "," & App_Path() & "res\\info.res" & ",VERSIONINFO,1,")
    End Sub

    Private Sub IconIt(ByVal SourceIcon As String)
        Shell(App_Path() & "res\\res.exe -addoverwrite " & TextBox2.Text & ", " & TextBox2.Text & ", " & SourceIcon & ", " & "icongroup, 1,0")
    End Sub

    Public Function App_Path() As String
        Return System.AppDomain.CurrentDomain.BaseDirectory()
    End Function

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        OpenFileDialog1.DefaultExt = "exe"
        OpenFileDialog1.Filter = "exe files (*.exe)|*.exe"
        OpenFileDialog1.FilterIndex = 1
        If OpenFileDialog1.ShowDialog(Me) = DialogResult.OK Then
            TextBox1.Text = String.Empty
            TextBox1.Text = OpenFileDialog1.FileName
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        OpenFileDialog2.DefaultExt = "exe"
        OpenFileDialog2.Filter = "exe files (*.exe)|*.exe"
        OpenFileDialog2.FilterIndex = 1
        If OpenFileDialog2.ShowDialog(Me) = DialogResult.OK Then
            TextBox2.Text = String.Empty
            TextBox2.Text = OpenFileDialog2.FileName
        End If
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        OpenFileDialog3.DefaultExt = "ico"
        OpenFileDialog3.Filter = "Icon files (*.ico)|*.ico"
        OpenFileDialog3.FilterIndex = 1
        If OpenFileDialog3.ShowDialog(Me) = DialogResult.OK Then
            TextBox3.Text = String.Empty
            TextBox3.Text = OpenFileDialog3.FileName
        End If
    End Sub
End Class
