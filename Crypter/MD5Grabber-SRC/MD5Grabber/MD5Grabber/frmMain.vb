Public Class frmMain
#Region " MD5 Hash Function."
    Public Function MD5CalcFile(ByVal strPath As String) As String
        Dim objReader As System.IO.Stream
        Dim objMD5 As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim arrHash() As Byte
        objReader = New System.IO.FileStream(strPath, IO.FileMode.Open, IO.FileAccess.Read)
        arrHash = objMD5.ComputeHash(objReader)
        objReader.Close()
        objReader = Nothing
        objMD5 = Nothing
        Return ByteArrayToString(arrHash)
    End Function
    Private Function ByteArrayToString(ByVal arrInput() As Byte) As String
        Dim strOutput As New System.Text.StringBuilder(arrInput.Length)
        For i As Integer = 0 To arrInput.Length - 1
            strOutput.Append(arrInput(i).ToString("X2"))
        Next
        Return strOutput.ToString().ToLower
    End Function
#End Region
#Region " Opacity Slider."
    Private Sub Slider1_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Slider1.ValueChanged
        Opacity = Slider1.Value / 100
    End Sub
#End Region
#Region " Browse File."
    Private Sub ButtonX2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX2.Click
        ButtonX1.Enabled = True
        ButtonX2.Enabled = False
        Dim ofd As New OpenFileDialog
        With ofd
            .Title = "Select File..."
            .ShowDialog()
            TextBoxX2.Text = .FileName
        End With
    End Sub
#End Region
#Region " Grab Hash."
    Private Sub ButtonX1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX1.Click
        If TextBoxX2.Text = "" Then
            ButtonX1.Enabled = False
            ButtonX2.Enabled = False
            MessageBox.Show("Invalid File!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error, MessageBoxDefaultButton.Button1)
        Else
            TextBoxX1.Text = MD5CalcFile(TextBoxX2.Text)
        End If
    End Sub
#End Region
End Class
