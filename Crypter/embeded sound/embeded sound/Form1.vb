Imports System.Media

Public Class Form1

    Dim mode As Integer = 1

    Public Sub play()
        Dim a As System.Reflection.Assembly = System.Reflection.Assembly.GetExecutingAssembly()
        Dim s As System.IO.Stream = a.GetManifestResourceStream("embeded_sound.Sound.wav")
        Dim player As SoundPlayer = New SoundPlayer(s)
        If mode = 1 Then
            player.Play()
        ElseIf mode = 2 Then
            player.PlayLooping()
        ElseIf mode = 3 Then
            player.Stop()
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        mode = 1
        Call play()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        mode = 2
        Call play()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        mode = 3
        Call play()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

End Class
