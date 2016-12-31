Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Public Class Form1

    Private Sub cmdstart_Click(sender As Object, e As EventArgs) Handles cmdstart.Click
        Me.cmdstop.Enabled = True
        Me.cmdstart.Enabled = False
        Me.txttarget.Enabled = False
        If (Me.txttarget.Text.Substring((Me.txttarget.Text.Length - 1)) <> "/") Then
            Me.txttarget.Text = (Me.txttarget.Text & "/")
        End If
        Me.target = Me.txttarget.Text
        Me.w_flinks = New BackgroundWorker
        If Not Me.w_flinks.IsBusy Then
            Me.w_flinks.WorkerSupportsCancellation = True
            Me.w_flinks.WorkerReportsProgress = True
            AddHandler Me.w_flinks.DoWork, New DoWorkEventHandler(AddressOf Me.w_flinks_DoWork)
            AddHandler Me.w_flinks.RunWorkerCompleted, New RunWorkerCompletedEventHandler(AddressOf Me.w_flinks_RunWorkerCompleted)
            AddHandler Me.w_flinks.ProgressChanged, New ProgressChangedEventHandler(AddressOf Me.w_flinks_ProgressChanged)
            Me.w_flinks.RunWorkerAsync()
        End If
    End Sub

    Private Sub cmdstop_Click(sender As Object, e As EventArgs) Handles cmdstop.Click
        If Me.w_flinks.IsBusy Then
            Me.w_flinks.CancelAsync()
        End If
    End Sub

    Private Sub cmdUnload_Click(sender As Object, e As EventArgs) Handles cmdUnload.Click
        Me.Close()
    End Sub
    Public Sub ListViewMakeRowdata(ByVal lvw As ListView, ByVal item_title As String, ByVal ParamArray subitem_titles As String())
        lvw.BeginInvoke(New ListViewMakeRowdelegate(AddressOf Me.ListViewMakeRowdataInvoke), New Object() {lvw, item_title, subitem_titles})
    End Sub

    Public Sub ListViewMakeRowdataInvoke(ByVal lvw As ListView, ByVal item_title As String, ByVal ParamArray subitem_titles As String())
        Dim item As ListViewItem = lvw.Items.Add(item_title)
        Dim upperBound As Integer = subitem_titles.GetUpperBound(0)
        Dim i As Integer = subitem_titles.GetLowerBound(0)
        Do While (i <= upperBound)
            item.SubItems.Add(subitem_titles(i))
            i += 1
        Loop
    End Sub

    Private Sub lstfsites_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstfsites.SelectedIndexChanged
        Try
            Process.Start(Me.lstfsites.SelectedItems.Item(0).Text)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            ProjectData.ClearProjectError()
        End Try
    End Sub
    Public Function readresponse(ByVal sqlurl As String) As String
        Dim request As HttpWebRequest = DirectCast(WebRequest.Create(sqlurl), HttpWebRequest)
        request.AllowAutoRedirect = True
        request.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Win32)"
        Dim response As HttpWebResponse = DirectCast(request.GetResponse, HttpWebResponse)
        Return Conversions.ToString(CInt(response.StatusCode))
    End Function

    Private Sub w_flinks_DoWork(sender As Object, e As DoWorkEventArgs) Handles w_flinks.DoWork
        Dim reader As New StreamReader((AppDomain.CurrentDomain.BaseDirectory & "\admin.txt"))
        Do While (reader.Peek > -1)
            Try
                If Me.w_flinks.CancellationPending Then
                    Exit Do
                End If
                Dim str As String = reader.ReadLine
                Me.w_flinks.ReportProgress(0)
                Me.trysite = (Me.target & str)
                Dim str2 As String = Me.readresponse(Me.trysite)
                Me.ListViewMakeRowdata(Me.lstfsites, (Me.target & str), New String() {str2})
                Continue Do
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                If Not Information.Err.Description.Contains("404") Then
                    If (((((Information.Err.Description.Contains("500") Or Information.Err.Description.Contains("501")) Or Information.Err.Description.Contains("502")) Or Information.Err.Description.Contains("503")) Or Information.Err.Description.Contains("504")) Or Information.Err.Description.Contains("505")) Then
                        Interaction.MsgBox(Information.Err.Description, MsgBoxStyle.Information, "Login Page Finder")
                        ProjectData.ClearProjectError()
                        Exit Do
                    End If
                    Information.Err.Description = Strings.Replace(Information.Err.Description, "The remote server returned an error:", Strings.Space(1), 1, -1, CompareMethod.Binary)
                    Me.ListViewMakeRowdata(Me.lstfsites, Me.trysite, New String() {Information.Err.Description})
                End If
                ProjectData.ClearProjectError()
                Continue Do
            End Try
        Loop
    End Sub

    Private Sub w_flinks_ProgressChanged(sender As Object, e As ProgressChangedEventArgs) Handles w_flinks.ProgressChanged
        Me.StatusStrip1.Items.Item(0).Text = ("Trying : " & Me.trysite)
    End Sub

    Private Sub w_flinks_RunWorkerCompleted(sender As Object, e As RunWorkerCompletedEventArgs) Handles w_flinks.RunWorkerCompleted
        Me.cmdstart.Enabled = True
        Me.cmdstop.Enabled = False
        Interaction.MsgBox("Finished", MsgBoxStyle.Information, "Login Page Finder")
        Me.txttarget.Enabled = True
    End Sub

    Private target As String
    Private trysite As String

    ' Nested Types
    Public Delegate Sub ListViewMakeRowdelegate(ByVal lvw As ListView, ByVal item_title As String, ByVal subitem_titles As String())

End Class
