Public Class Form1

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        SaveFileDialog2.ShowDialog()
        If SaveFileDialog2.FileName <> "" Then
            FileOpen(1, SaveFileDialog2.FileName, OpenMode.Output)
            PrintLine(1, TextBox1.Text)
            FileClose(1)
        End If
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        SaveFileDialog1.ShowDialog()
        If SaveFileDialog1.FileName <> "" Then
            FileOpen(1, SaveFileDialog1.FileName, OpenMode.Output)
            PrintLine(1, TextBox1.Text)
            FileClose(1)
        End If
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        TextBox1.Text = "@echo off"
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        My.Computer.Clipboard.SetText(TextBox1.Text)
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = TextBox1.Text + vbNewLine + "time 00:00"
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox1.Text = TextBox1.Text + vbNewLine + "start http://www.Google.com/"
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.Icon = My.Resources.Bat
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        TextBox1.Text = TextBox1.Text + vbNewLine + ":: Delete Notepad" del /f /q "%systemroot%\notepad.exe""
    End Sub
End Class
