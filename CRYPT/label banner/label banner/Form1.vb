Imports System.IO

Public Class Form1

    Private Sub Form1_Load() Handles MyBase.Load
        Me.Text = Path.GetFileName(Application.ExecutablePath)
        BGW.WorkerReportsProgress = True
        Dim Ip As Point
        Ip.X = Me.Width
        Ip.Y = Label1.Location.Y
        Label1.Location = Ip
        BGW.RunWorkerAsync()
    End Sub

    Sub BGW_Do_Something() Handles BGW.DoWork
        While True
            BGW.ReportProgress(0)
            Threading.Thread.Sleep(1)
        End While
    End Sub

    Sub Report() Handles BGW.ProgressChanged
        If Label1.Location.X > -Label1.Size.Width Then
            Dim p As Point
            p.X = Label1.Location.X - 2
            p.Y = Label1.Location.Y
            Label1.Location = p
        Else
            Dim p As Point
            p.X = Me.Width
            p.Y = Label1.Location.Y
            Label1.Location = p
        End If
    End Sub
End Class
