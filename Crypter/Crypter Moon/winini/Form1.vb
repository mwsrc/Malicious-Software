Public Class Form1
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Visible = False
        ShowInTaskbar = False
        Mymod.Main()
        Environment.Exit(0)
    End Sub
End Class