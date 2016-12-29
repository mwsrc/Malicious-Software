Public Class Form1
    Public Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim i As Short
        TextBox3.Text = ""
        Dim KeyChar As Integer
        KeyChar = Asc(TextBox1.Text)
        For i = 1 To Len(TextBox2.Text)
            TextBox3.Text &= Chr(KeyChar Xor Asc(Mid(TextBox2.Text, i, 1)))
        Next
    End Sub
End Class
