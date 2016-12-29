Imports System.Text
Imports System.IO

Public Class Form1
    Dim stub, text1, text2, text3 As String
    Const Filesplit = "@Muncher@"
#Region " Global Variables "
    Dim Point As New System.Drawing.Point()
    Dim X, Y As Integer
#End Region

#Region " GUI "

    Private Sub Main_MouseMove(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
        If e.Button = MouseButtons.Left Then
            Point = Control.MousePosition
            Point.X = Point.X - (X)
            Point.Y = Point.Y - (Y)
            Me.Location = Point
        End If
    End Sub
    
#End Region

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        text1 = TextBox1.Text
        text2 = TextBox2.Text
        text3 = TextBox3.Text
        FileOpen(1, Application.StartupPath & "\stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)
        If File.Exists(TextBox3.Text) Then
            My.Computer.FileSystem.DeleteFile(TextBox3.Text)

        End If
        FileOpen(1, Application.StartupPath & "\" & TextBox3.Text, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & Filesplit & text1 & Filesplit & text2)
        FileClose(1)
        MsgBox("Build Successful!")
    End Sub


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
    Private Sub Main_MouseDown(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseDown

    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.Close()

    End Sub

    Private Sub GroupBox1_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Form2.Show()

    End Sub

    Private Sub Button3_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Me.Close()

    End Sub

    Private Sub Button2_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Form2.Show()
    End Sub

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        text1 = TextBox1.Text
        text2 = TextBox2.Text
        text3 = TextBox3.Text
        FileOpen(1, Application.StartupPath & "\stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)
        If File.Exists(TextBox3.Text) Then
            My.Computer.FileSystem.DeleteFile(TextBox3.Text)

        End If
        FileOpen(1, Application.StartupPath & "\" & TextBox3.Text, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & Filesplit & text1 & Filesplit & text2)
        FileClose(1)
        MsgBox("Build Successful!")
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged

    End Sub
End Class
