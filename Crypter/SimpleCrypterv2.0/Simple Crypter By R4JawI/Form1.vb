Public Class Form1

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        RichTextBox1.SelectAll()
        RichTextBox1.Copy()
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim e1 As New OpenFileDialog

        e1.Filter = "(*.EXE)|*.EXE"

        If e1.ShowDialog = Windows.Forms.DialogResult.OK Then

            TextBox1.Text = e1.FileName

        End If

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click

        RichTextBox1.Text = Encrypt(Convert.ToBase64String(IO.File.ReadAllBytes(TextBox1.Text)), TextBox2.Text, TextBox3.Text)

    End Sub

    Public Function Encrypt(ByVal input As String, ByVal Key1 As String, ByVal Key2 As Integer)

        Try


            Dim x As Int64
            Dim y As Integer = -555

            For i = 1 To input.Length Step 1

                x = AscW(Mid(input, i)) + CUInt(Key1 + Key2 Mod y)

                Encrypt = Encrypt & ChrW(x)

            Next



        Catch ex As Exception

        End Try





    End Function


 


    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click

        RichTextBox1.Text = My.Resources.String1
    End Sub

    Private Sub Label2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label2.Click

    End Sub
End Class
