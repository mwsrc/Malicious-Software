'+-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-+'
'| Tool : Dev-Point Downloader         |'
'| Coder : Adel Rehan                  |'
'| Forum : www.dev-point.com\AdelRehan |'
'| FaceBook : Facebook.com\Adel759     |'
'+-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-+'

Imports System.Text.RegularExpressions
Imports System.Net
Imports System.Text
Imports System.ComponentModel
Imports System.IO
Imports System.IO.IsolatedStorage

Public Class MainForm

    Dim WithEvents WC As New Net.WebClient
    Dim WithEvents BackGroundWorker1 As New BackgroundWorker
    Delegate Sub GetLinksDelegat(ByVal sender As Object, ByVal e As DoWorkEventArgs)

    Dim FileID As String
    Dim FileUrl As String
    Dim FileName As String

    Private Sub btnDownload_Click(sender As Object, e As EventArgs) Handles btnDownload.Click
        If Regex.IsMatch(txtUrl.Text, "^((http://|https://|)upload.dev-point.com/)", RegexOptions.IgnoreCase) = True Then
            BackGroundWorker1.RunWorkerAsync()
        Else
            MessageBox.Show("Video link is not valid", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub BackGroundWorker1_DoWork(ByVal sender As Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles BackGroundWorker1.DoWork
        If InvokeRequired Then
            Dim x As New GetLinksDelegat(AddressOf BackGroundWorker1_DoWork)
            Invoke(x, New Object() {sender, e})
            Exit Sub
        End If

        Dim Request As HttpWebRequest = System.Net.HttpWebRequest.Create(txtUrl.Text)
        Request.UserAgent = "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)"
        Dim Response As HttpWebResponse = Request.GetResponse()
        Dim SourceCode As String = New StreamReader(Response.GetResponseStream(), System.Text.Encoding.Default).ReadToEnd()

        FileName = Regex.Match(SourceCode, "<title>(.+?)</title>", RegexOptions.IgnoreCase).Value
        FileName = FileName.Replace("<title>Devpoint Cloud - ", String.Empty).Replace("</title>", String.Empty)

        FileID = txtUrl.Text.Split("/").GetValue(3)
        FileUrl = "https://upload.dev-point.com/plugins/imageviewer/site/direct.php?s=" & FileID

        Dim SaveFileDialog1 As New SaveFileDialog
        SaveFileDialog1.FileName = FileName
        If SaveFileDialog1.ShowDialog = DialogResult.OK Then
            WC.DownloadFileAsync(New Uri(FileUrl), SaveFileDialog1.FileName)
        End If
    End Sub

    Private Sub WC_DownloadProgressChanged(ByVal sender As Object, ByVal e As System.Net.DownloadProgressChangedEventArgs) Handles WC.DownloadProgressChanged
        prgbDownload.Value = e.ProgressPercentage
    End Sub

    Private Sub WC_DownloadFileCompleted(ByVal sender As Object, ByVal e As System.ComponentModel.AsyncCompletedEventArgs) Handles WC.DownloadFileCompleted
        MessageBox.Show("Download Completed", "Done!", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
End Class
