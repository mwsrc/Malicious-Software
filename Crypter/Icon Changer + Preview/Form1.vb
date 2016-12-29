Imports System.IO
Public Class Form1 'BY EGYFOU
    Dim fichier, icone As String
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        PictureBox1.BackColor = Color.White 'Changer L'icone
        fichier = TextBox1.Text
        icone = TextBox2.Text
        IconInjector.InjectIcon(fichier, icone)
        MsgBox("L'icone à bien été changé ici :" & TextBox1.Text, MsgBoxStyle.OkOnly, "Réussi!")
        TextBox1.Clear()
        TextBox2.Clear()
        Button4.Show()
        Button3.Hide()


    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Button3.Show() 'Preview
        Button4.Hide()
        icone = TextBox2.Text
        PictureBox1.Image = Image.FromFile(icone)
        Label2.Text = ""


    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.Text = "Icon changer By egyfou"
        Button3.Hide()
        Button4.Show()
    End Sub

    Private Sub TextBox1_MouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles TextBox1.MouseClick
        With ofd1 'Ouvrir l'executable
            .FileName = ""
            .Filter = "Executable (*.exe)|*.exe"
            .Title = "Browse..."
            .ShowDialog()
            TextBox1.Text = .FileName
        End With
    End Sub

    Private Sub TextBox2_MouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles TextBox2.MouseClick
        With ofd1 'ouvrir l'icone
            .FileName = ""
            .Filter = "Icon (*.ico)|*.ico"
            .Title = "Browse..."
            .ShowDialog()
            TextBox2.Text = .FileName
        End With
    End Sub
End Class