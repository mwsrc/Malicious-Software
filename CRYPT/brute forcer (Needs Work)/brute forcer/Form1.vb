Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        BackgroundWorker1.RunWorkerAsync()
    End Sub

    Dim password As String
    Dim list As String = password
    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        For i1 = 32 To 127 'Char 1
            For i2 = 32 To 127 'Char 2
                For i3 = 32 To 127 'Char 3
                    For i4 = 32 To 127 'Char 4
                        For i5 = 32 To 127 'Char 5
                            If BackgroundWorker1.CancellationPending = True Then
                                Exit Sub
                            End If
                            list = Chr(i1) & Chr(i2) & Chr(i3) & Chr(i4) & Chr(i5) & vbCrLf
                            BackgroundWorker1.ReportProgress(0)
                        Next
                    Next
                Next
            Next
        Next
    End Sub
    Sub report() Handles BackgroundWorker1.ProgressChanged
        If list.Contains("AAA") = True Then
            BackgroundWorker1.CancelAsync()
            MsgBox("Found!")
        End If
        Exit Sub
    End Sub
End Class
