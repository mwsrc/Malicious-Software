Public Class News
    Private Sub News_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.StartPosition = FormStartPosition.Manual
        Me.Location = Screen.GetWorkingArea(Me).Location
        Dim MyForm As New Index
        MyForm.Show()
    End Sub
End Class