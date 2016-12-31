Public Class FRM_ScreenShot

    Private Sub BTN_TakeScreenShot_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_TakeScreenShot.Click
        Try
            Dim path As String = Nothing
            Dim SaveFileDialog1 As New SaveFileDialog
            With SaveFileDialog1
                If .ShowDialog = DialogResult.OK Then
                    path = .FileName
                End If
            End With

            Dim DirectoryA As String = path & ".jpg"
            Dim ScreenSize As Size = New Size(My.Computer.Screen.Bounds.Width, My.Computer.Screen.Bounds.Height)
            Dim BMP As New Bitmap(My.Computer.Screen.Bounds.Width, My.Computer.Screen.Bounds.Height)
            Dim g As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(BMP)
            g.CopyFromScreen(New Point(0, 0), New Point(0, 0), ScreenSize)
            BMP.Save(DirectoryA)
            MsgBox("SAVED TO " & DirectoryA, MsgBoxStyle.Information)
        Catch ex As System.Exception
            MsgBox(ex.Message)
        End Try
    End Sub

End Class
