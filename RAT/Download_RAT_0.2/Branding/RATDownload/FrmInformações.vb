Public Class FrmInformações

    

    Private Sub lbURL_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles lbURL.LinkClicked
        Process.Start(lbURL.Text, AppWinStyle.NormalFocus)
    End Sub
End Class