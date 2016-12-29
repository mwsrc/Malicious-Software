Public Class userinfo

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Form1.ListView1.Items.Count = 5 Then
            MessageBox.Show("Public versions are only allowed 5 users!" + vbNewLine + vbNewLine + "You have reached the mamimum ammount of users!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If TextBox1.Text.Contains("@") = False Then
            MessageBox.Show("You did not enter a valid Email address!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox1.Text = ""
            Exit Sub
        ElseIf TextBox2.Text.Count <= 0 Then
            MessageBox.Show("You did not enter password!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox2.Text = ""
            Exit Sub
        End If
        Dim str(2) As String
        Dim itm As ListViewItem
        str(0) = TextBox1.Text
        str(1) = TextBox2.Text
        itm = New ListViewItem(str)
        Form1.ListView1.Items.Add(itm)
        Me.Close()
    End Sub
End Class