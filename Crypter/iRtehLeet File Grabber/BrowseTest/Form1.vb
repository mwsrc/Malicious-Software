Imports System.IO
Public Class Form1
    Private Function Filesize(ByRef File As String) As String
        Dim bytes As String
        Dim Size As String
        bytes = CStr(FileLen(File))
        If CDbl(bytes) > 1024 Then
            Size = " KB"
            bytes = CStr(CDbl(bytes) / 1024)
        Else
            Size = " Bytes"
        End If
        If CDbl(bytes) > 1024 Then
            Size = " MB"
            bytes = CStr(CDbl(bytes) / 1024)
        End If
        Filesize = System.Math.Round(CDbl(bytes), 2) & Size
    End Function
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        OpenFileDialog1.ShowDialog()
        TextBox1.Text = OpenFileDialog1.FileName
        Label1.Text = Filesize(TextBox1.Text)
        Dim strDateTime As String
        strDateTime = FileDateTime(TextBox1.Text)
        Label2.Text = strDateTime
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        If TextBox1.Text.Contains(".exe") = False Then
            MsgBox("You haven't selected a file yet!")
        Else
            MsgBox(TextBox1.Text)
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim FileToDelete As String
        If TextBox1.Text.Contains(".exe") = False Then
            MsgBox("You haven't selected a file yet!")
        End If
        FileToDelete = TextBox1.Text

        If System.IO.File.Exists(FileToDelete) = True Then

            If Microsoft.VisualBasic.MsgBox("Are you sure you want to delete the file located at:" + vbNewLine + TextBox1.Text + vbNewLine + "Warning: You will not be able to retrieve this file once it is deleted", MsgBoxStyle.YesNo) = MsgBoxResult.Yes Then
                System.IO.File.Delete(FileToDelete)
            Else

                MsgBox("File was not deleted.")
            End If
        End If
    End Sub
End Class
