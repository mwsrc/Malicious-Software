Public Class Form1

    Public Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Opacity = 0
        Dim Bounds As Rectangle
        Dim Capture As System.Drawing.Bitmap
        Dim Graph As Graphics
        Bounds = Screen.PrimaryScreen.Bounds
        Capture = New System.Drawing.Bitmap(Bounds.Width, Bounds.Height, System.Drawing.Imaging.PixelFormat.Format32bppPArgb)
        Graph = Graphics.FromImage(Capture)
        Graph.CopyFromScreen(Bounds.X, Bounds.Y, 0, 0, Bounds.Size, CopyPixelOperation.SourceCopy)
        PictureBox1.Image = Capture
        Opacity = 100

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        End
    End Sub

    Public Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim pic As Image
        SaveFileDialog1.DefaultExt = "*.bmp"
        SaveFileDialog1.Filter = "Bmp Files|*.bmp"
        pic = PictureBox1.Image
        SaveFileDialog1.ShowDialog()
        On Error Resume Next
        pic.Save(SaveFileDialog1.FileName)

    End Sub
End Class
