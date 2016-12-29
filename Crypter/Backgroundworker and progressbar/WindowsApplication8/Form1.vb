Public Class Form1
    Dim i As Integer

    Sub Button1_Click() Handles Button1.Click
        Button1.Enabled = False
        Button2.Enabled = True
        NumericUpDown1.Enabled = False
        ProgressBar1.Maximum = NumericUpDown1.Value
        ToolStripProgressBar1.Maximum = NumericUpDown1.Value
        BackgroundWorker1.RunWorkerAsync()
    End Sub

    Sub BackgroundWorker1_DoWork() Handles BackgroundWorker1.DoWork
        Do Until i = NumericUpDown1.Value
            If BackgroundWorker1.CancellationPending = True Then Exit Sub
            i = i + 1
            BackgroundWorker1.ReportProgress(0)
            System.Threading.Thread.Sleep(1)
        Loop
    End Sub

    Sub report() Handles BackgroundWorker1.ProgressChanged
        sslabel.Text = "Counting to " & NumericUpDown1.Value
        ProgressBar1.Value = i
        ToolStripProgressBar1.Value = i
        sslabel1.Text = i & " / " & NumericUpDown1.Value
    End Sub

    Sub done() Handles BackgroundWorker1.RunWorkerCompleted
        MessageBox.Show("Done counting to " & i, "DONE!", _
                        MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
        ToolStripProgressBar1.Value = 0
        ProgressBar1.Value = 0
        sslabel1.Text = "0"
        i = 0
        sslabel.Text = "Idle"
        Button1.Enabled = True
        Button2.Enabled = False
        NumericUpDown1.Enabled = True
    End Sub

    Sub Button2_Click() Handles Button2.Click
        BackgroundWorker1.CancelAsync()
    End Sub

    Sub NumericUpDown1_ValueChanged() Handles NumericUpDown1.ValueChanged
        AcceptButton = Button1
    End Sub

    Sub byebye() Handles MyBase.FormClosing
        BackgroundWorker1.CancelAsync()
        End
    End Sub

End Class
