Imports System.IO
Public Class Form1
    Const filesplit = "++FileSplit++"
    Dim inputfile, stub As String

    Private Sub ofd_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ofd.FileOk
        For Each fName In ofd.FileNames
            'ListView1.Items.Add(ofd.FileName).SubItems.Add(GetFileSize)
            ListView1.Items.Add(fName)
            Label2.Text = ListView1.Items.Count
        Next
    End Sub

    Private Sub RemoveToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoveToolStripMenuItem.Click
        For Each lvItem As ListViewItem In ListView1.SelectedItems
            lvItem.Remove()
        Next
    End Sub

    Private Sub AddFileToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddFileToolStripMenuItem.Click
        ofd.ShowDialog()
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub BindFilesToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindFilesToolStripMenuItem.Click
        FileOpen(3, Application.StartupPath & "\mfbStub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        If File.Exists(Application.StartupPath & "\Binded Files.exe") Then File.Delete(Application.StartupPath & "\Binded Files.exe")
        FileOpen(3, Application.StartupPath & "\Binded Files.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, stub)
        For I = 0 To ListView1.Items.Count - 1
            FileOpen(1, ListView1.Items(I).Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            inputfile = Space(LOF(1))
            FileGet(1, inputfile)
            FileClose(1)
            FilePut(3, filesplit & inputfile)
        Next
        FileClose(3)
        MsgBox("Binded")
        Me.Close()
    End Sub

    Private Sub ContextMenuStrip1_Opened(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ContextMenuStrip1.Opened
        If ListView1.Items.Count <= 1 Then
            BindFilesToolStripMenuItem.Enabled = False
        Else : BindFilesToolStripMenuItem.Enabled = True
        End If

    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub
End Class
