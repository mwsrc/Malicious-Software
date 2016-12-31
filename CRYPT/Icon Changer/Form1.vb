Imports System.IO
Imports fLaSh.Dissembler
Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        OpenFileDialog1.DefaultExt = "exe"
        OpenFileDialog1.Filter = "exe files (*.exe)|*.exe"
        OpenFileDialog1.FilterIndex = 1
        If OpenFileDialog1.ShowDialog(Me) = DialogResult.OK Then
            TextBox1.Text = String.Empty
            TextBox1.Text = OpenFileDialog1.FileName
        End If
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        OpenFileDialog1.DefaultExt = "ico"
        OpenFileDialog1.Filter = "icon files (*.ico)|*.ico"
        OpenFileDialog1.FilterIndex = 1
        If OpenFileDialog1.ShowDialog(Me) = DialogResult.OK Then
            TextBox2.Text = String.Empty
            TextBox2.Text = OpenFileDialog1.FileName
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        If TextBox1.Text = "" Then Exit Sub

        If TextBox2.Text = "" Then Exit Sub

        Dim oIconFilenathu As New IconFile(TextBox2.Text)
        Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
        groupIconResource.SaveTo(TextBox1.Text)
        MsgBox("Icon Changed Successfully!")

    End Sub

    Private Sub PictureBox3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If File.Exists(TextBox2.Text) Then
            Dim nathu As New Bitmap(TextBox2.Text)
            PictureBox2.Image = nathu
        End If
    End Sub

    Private Sub PictureBox2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.Click
        Process.Start("www.hackforums.net")
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Form2.Show()
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        For Fadein = 0.0 To 1.1 Step 0.1
            Me.Opacity = Fadein
            Me.Refresh()
            Threading.Thread.Sleep(100)
        Next
        Dim Location As String = "dissembler LIB.dll"
        My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.dissembler_LIB, False)
    End Sub
    Private Sub Form_Unload(ByVal Cancel As Integer)
        Dim deletefile As String
        deletefile = "dissembler LIB.dll"
        If System.IO.File.Exists(deletefile) = True Then
            System.IO.File.Delete(deletefile)
        End If

    End Sub
End Class
