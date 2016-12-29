Public Class chat

    Private Sub TextBox2_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox2.KeyPress
        If Asc(e.KeyChar) = Keys.Enter Then
            Form1.senddata("666*[hacker] " & TextBox2.Text & Environment.NewLine)
            TextBox1.Text &= "[Haxor]" & TextBox2.Text & Environment.NewLine
            TextBox2.Text = ""
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Form1.senddata("38")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form1.senddata("666*" & TextBox2.Text & Environment.NewLine)
        TextBox1.Text &= "[Haxor]" & TextBox2.Text & Environment.NewLine
        TextBox2.Text = ""

    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox2.TextChanged

    End Sub
End Class