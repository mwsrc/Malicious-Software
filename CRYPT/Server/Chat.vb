Public Class Chat

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Form1.sendstream2("7*[noob]" & TextBox2.Text)
        TextBox1.Text &= "[noob]" & TextBox2.Text
        TextBox2.Text = ""
    End Sub


    Private Sub TextBox2_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox2.KeyPress
        If Asc(e.KeyChar) = Keys.Enter Then
            Form1.sendstream2("7*[noob]" & TextBox2.Text)
            TextBox1.Text &= "[noob]" & TextBox2.Text
            TextBox2.Text = ""
        End If
    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox2.TextChanged

    End Sub
End Class