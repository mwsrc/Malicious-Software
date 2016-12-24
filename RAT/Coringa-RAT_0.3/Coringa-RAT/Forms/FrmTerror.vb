Imports System.IO
Imports System.Threading
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class FrmTerror

    Public sk As MdClient
   
    Private Sub FrmTerror_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If File.Exists(Application.StartupPath & "\Terror-Padrão\01.jpg") Then
            txtLocal.Text = Application.StartupPath & "\Terror-Padrão\01.jpg"
        End If
    End Sub

    Private Sub btnPorcurar_Click(sender As Object, e As EventArgs) Handles btnPorcurar.Click
        Try
            Dim AddItem As New OpenFileDialog
            AddItem.Title = "ADICIONAR ARQUIVOS"
            AddItem.Filter = "ARQUIVOS (*.gif)|*.gif|ARQUIVOS (*.jpg)|*.jpg|ARQUIVOS (*.jpeg)|*.jpeg|ARQUIVOS (*.png)|*.png|ARQUIVOS (*.bmp)|*.bmp|TODOS ARQUIVOS (*.*)|*.*"
            If AddItem.ShowDialog = Windows.Forms.DialogResult.OK Then
                Dim img As Image
                Dim img2 As Bitmap
                img = Image.FromFile(AddItem.FileName)
                img2 = New Bitmap(img)
                img.Dispose()
                PicPrevia.Image = img2
                txtLocal.Text = AddItem.FileName
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        If txtLocal.Text = Nothing Then
            MsgBox("ESCOLHA SUA IMAGEM OU PROCURE UMA PARA ENVIAR", MsgBoxStyle.Exclamation, "Informações")
        Else

            If File.Exists(txtLocal.Text) Then
                
                Dim cM As Boolean = True
                Dim buffer As Byte() = MdFN.SB(Convert.ToBase64String(MdFN.ZIP(File.ReadAllBytes(txtLocal.Text), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("EnviarImagemTerrorrr" & MdSokserver.Y & New FileInfo(txtLocal.Text).Extension & MdSokserver.Y)
                stream.Write(MdFN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)

                sk.Send(stream.ToArray)
            Else
                MsgBox("ESTA IMAGEM NÃO EXISTE TENTE OUTRA", MsgBoxStyle.Critical, "Informações")
            End If

        End If

    End Sub

    Private Sub RB01_CheckedChanged(sender As Object, e As EventArgs) Handles RB01.CheckedChanged
        If RB01.Checked = True Then
            txtLocal.Text = Application.StartupPath & "\Terror-Padrão\01.jpg"
        End If
    End Sub

    Private Sub RB02_CheckedChanged(sender As Object, e As EventArgs) Handles RB02.CheckedChanged
        If RB02.Checked = True Then
            txtLocal.Text = Application.StartupPath & "\Terror-Padrão\02.jpg"
        End If
    End Sub

    Private Sub RB03_CheckedChanged(sender As Object, e As EventArgs) Handles RB03.CheckedChanged
        If RB03.Checked = True Then
            txtLocal.Text = Application.StartupPath & "\Terror-Padrão\03.jpg"
        End If
    End Sub

    Private Sub RB04_CheckedChanged(sender As Object, e As EventArgs) Handles RB04.CheckedChanged
        If RB04.Checked = True Then
            txtLocal.Text = Application.StartupPath & "\Terror-Padrão\04.jpg"
        End If
    End Sub

    Private Sub RB05_CheckedChanged(sender As Object, e As EventArgs) Handles RB05.CheckedChanged
        If RB05.Checked = True Then
            txtLocal.Text = Application.StartupPath & "\Terror-Padrão\05.jpg"
        End If
    End Sub

    Private Sub PictureBox1_Click(sender As Object, e As EventArgs) Handles PictureBox1.Click
        txtLocal.Text = Application.StartupPath & "\Terror-Padrão\01.jpg"
        RB01.Checked = True
    End Sub

    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        txtLocal.Text = Application.StartupPath & "\Terror-Padrão\02.jpg"
        RB02.Checked = True
    End Sub

    Private Sub PictureBox4_Click(sender As Object, e As EventArgs) Handles PictureBox4.Click
        txtLocal.Text = Application.StartupPath & "\Terror-Padrão\03.jpg"
        RB03.Checked = True
    End Sub

    Private Sub PictureBox3_Click(sender As Object, e As EventArgs) Handles PictureBox3.Click
        txtLocal.Text = Application.StartupPath & "\Terror-Padrão\04.jpg"
        RB04.Checked = True
    End Sub

    Private Sub PictureBox6_Click(sender As Object, e As EventArgs) Handles PictureBox6.Click
        txtLocal.Text = Application.StartupPath & "\Terror-Padrão\05.jpg"
        RB05.Checked = True
    End Sub
End Class