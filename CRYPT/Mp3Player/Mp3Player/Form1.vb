Public Class Form1

    Private Sub import_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles import.Click
        importdiag.ShowDialog()
    End Sub

    Private Sub importdiag_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles importdiag.FileOk
        For Each track As String In importdiag.FileNames
            playlist.Items.Add(track)
        Next
    End Sub


    Private Sub play_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles play.Click
        AxWindowsMediaPlayer1.URL = playlist.SelectedItem
    End Sub

    Private Sub stopbutton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles stopbutton.Click
        AxWindowsMediaPlayer1.Ctlcontrols.stop()
    End Sub

    Private Sub pause_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles pause.Click
        AxWindowsMediaPlayer1.Ctlcontrols.pause()
    End Sub

    Private Sub AxWindowsMediaPlayer1_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AxWindowsMediaPlayer1.Enter

    End Sub
End Class
