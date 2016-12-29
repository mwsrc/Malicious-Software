Public Class form1
    ' define the local key and vector byte arrays
    Private ReadOnly key() As Byte = _
      {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, _
      15, 16, 17, 18, 19, 20, 21, 22, 23, 24}
    'Private ReadOnly iv() As Byte = {8, 7, 6, 5, 4, 3, 2, 1}
    Private ReadOnly iv() As Byte = {255, 70, 60, 50, 40, 30, 20, 10}
    ' instantiate the class with the arrays
    Private des As New cTripleDES(key, iv)

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox2.Text = des.Encrypt(TextBox1.Text)
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox2.Text = des.Decrypt(TextBox1.Text)
    End Sub
End Class

