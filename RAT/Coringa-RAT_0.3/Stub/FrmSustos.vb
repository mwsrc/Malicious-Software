Imports System.Diagnostics
Imports System.Windows.Forms
Imports System.Timers

Public Class FrmSustos

    Private Sub FrmSustos_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim PARADA As New Stopwatch
            PARADA.Start()
            Do While PARADA.ElapsedMilliseconds < 3000
                Application.DoEvents()
            Loop
            PARADA.Stop()
            Me.Close()
        Catch ex As Exception
        Finally
            Me.Close()
        End Try
    End Sub

End Class