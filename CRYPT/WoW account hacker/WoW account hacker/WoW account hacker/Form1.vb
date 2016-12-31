Option Explicit On
Public Class Form1

    Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

    Public Sub Hack()
        If user1name.Text = "Your account name" Then
            MsgBox("Please enter your Account Name", MsgBoxStyle.Exclamation)
        ElseIf user1pass.Text = "password" Then
            MsgBox("Please enter your Account Password", MsgBoxStyle.Exclamation)
        ElseIf victimname.Text = "Victims account name" Then
            MsgBox("Please enter the victims Name", MsgBoxStyle.Exclamation)
        ElseIf user1gmail.Text = "Your gamil username" Then
            MsgBox("Please enter your gmail Username", MsgBoxStyle.Exclamation)
        ElseIf user1gmailpass.Text = "password" Then
            MsgBox("Please enter your gmail Password", MsgBoxStyle.Exclamation)
        Else
            ProgressBar1.Minimum = 0
            ProgressBar1.Maximum = 100
            Dim intMin As Integer = 0
            Dim intMax As Integer = 100
            Do Until intMin = intMax
                Sleep(250)
                ProgressBar1.Value = intMin
                intMin = intMin + 5
            Loop
            MsgBox("Can not connect to server. Error code 204, Invalid parameters")
        End If
    End Sub

    Private Sub hackit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles hackit.Click
        Hack()
    End Sub


    Private Sub About_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles About.Click
        AboutForm.Show()
    End Sub
End Class
