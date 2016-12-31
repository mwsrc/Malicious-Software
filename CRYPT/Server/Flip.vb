Imports System.IO

Public Class Flip
    Dim shake As Integer = 0

    Sub flip()
        Dim FileName As String = Environment.CurrentDirectory & "\scrn.bmp"

        ScreenCapture.CurrentScreen() 'Capture the Current Screen

        If File.Exists(FileName) Then
            File.Delete(FileName)
        End If

        ScreenCapture.oBitMap.Save(FileName) 'Saves it to a File
        ScreenCapture.oBitMap = Nothing

        Dim fs As New System.IO.FileStream(FileName, IO.FileMode.Open, IO.FileAccess.Read)
        Dim imgCurrentPhoto As Image = Image.FromStream(fs)
        Me.BackgroundImage = imgCurrentPhoto
        fs.Dispose()
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If shake = 0 Then

            Me.Location.X.Equals(New Point(10))
            Me.Location.Y.Equals(New Point(10))
            shake = 10
        Else
            shake = 0
            Me.Location.X.Equals(New Point(0))
            Me.Location.Y.Equals(New Point(0))

        End If
    End Sub
End Class