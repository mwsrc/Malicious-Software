Imports System
Imports System.Web

Public Class Form1
    Dim webbrowser As New WebBrowser
    Dim gdatabrow As New WebBrowser
    Dim passcracking As New WebBrowser


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        loadList()

        look.Text = "Connecting..."
        look.Enabled = False
        checkHost.Start()
        webbrowser.Navigate("http://www.md5crack.com")
        gdatabrow.Navigate("http://gdataonline.com/seekhash.php")
        passcracking.Navigate("http://www.passcracking.com/index.php")

    End Sub

    Private Sub md5crack()
        webbrowser.Document.GetElementById("term").SetAttribute("value", Trim(txtHash.Text))
        webbrowser.Document.GetElementById("crackbtn").InvokeMember("click")
        md5c.Start()
    End Sub
    Private Sub gdataonline()
        gdatabrow.Document.GetElementById("hash").SetAttribute("value", Trim(txtHash.Text))
        gdatabrow.Document.Forms(0).InvokeMember("submit")
        gdata.Start()
    End Sub
    Private Sub pcracking()
        passcracking.Document.GetElementById("datafromuser").SetAttribute("value", Trim(txtHash.Text))
        passcracking.Document.Forms(0).InvokeMember("submit")
        passcrack.Start()
    End Sub

    Private Sub md5c_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles md5c.Tick
        If webbrowser.Document.Body.InnerText.Contains("Your Results") Then

            Dim t2find As New System.Text.RegularExpressions.Regex("\("".*""\)")
            Dim storage As String = Me.webbrowser.Document.Body.InnerText
            Dim result As String = t2find.Match(storage).Value
            Dim reslen As Integer = result.Length

            If String.IsNullOrEmpty(result) Then

                listView.Items(0).SubItems.Add("Not Found")
            Else
                Dim pText As String = result.Substring(2, reslen - 4)
                listView.Items(0).SubItems.Add(pText)
            End If
            md5c.Stop()
            webbrowser.Navigate("http://www.md5crack.com")

        End If
    End Sub


    Private Sub look_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles look.Click

        loadList()

        checkHost.Start()

        md5crack()
        gdataonline()
        pcracking()

    End Sub

    Private Sub checkHost_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles checkHost.Tick
        If webbrowser.ReadyState = WebBrowserReadyState.Complete AndAlso gdatabrow.ReadyState = WebBrowserReadyState.Complete AndAlso passcracking.ReadyState = WebBrowserReadyState.Complete Then
            'If passcracking.ReadyState = WebBrowserReadyState.Complete Then
            System.Threading.Thread.Sleep(2000)
            look.Text = "Hash Lookup!"

            look.Enabled = True
            checkHost.Stop()
        End If
    End Sub

    Private Sub gdata_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles gdata.Tick
        If gdatabrow.Document.Body.InnerText.Contains("RESULTS:") Then

            Dim t2find As New System.Text.RegularExpressions.Regex(txtHash.Text & ".*\s")
            Dim storage As String = Me.gdatabrow.Document.Body.InnerText
            Dim result As String = t2find.Match(storage).Value
            Dim reslen As Integer = result.Length

            Dim pText As String = result.Substring(32, reslen - 32)
            If pText.Contains("?????") Then
                listView.Items(1).SubItems.Add("Not Found")
            Else
                listView.Items(1).SubItems.Add(pText)
            End If


            gdata.Stop()
            gdatabrow.Navigate("http://gdataonline.com/seekhash.php")

        End If
    End Sub

    Private Sub loadList()
        listView.Clear()
        listView.Columns.Add("Website").Width = 100
        listView.Columns.Add("Result").Width = 156

        listView.Items.Add("md5crack")
        listView.Items.Add("gdataonline")
        listView.Items.Add("passcracking")
    End Sub

    Private Sub Form1_FormClosing(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
        webbrowser.Dispose()
        gdatabrow.Dispose()
        passcracking.Dispose()
    End Sub

    Private Sub passcrack_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles passcrack.Tick
        If passcracking.Document.Body.InnerText.Contains(txtHash.Text) Then

            Dim t2find As New System.Text.RegularExpressions.Regex("<TD\sbgColor=#ff0000>.*<\/TD>")
            Dim storage As String = passcracking.Document.Body.InnerHtml
            Dim result As String = t2find.Match(storage).Value
            Dim reslen As Integer = result.Length



            If String.IsNullOrEmpty(result) Then
                listView.Items(2).SubItems.Add("Not Found")
            Else
                Dim pText As String = result.Substring(20, reslen - 25)
                listView.Items(2).SubItems.Add(pText)
            End If
            passcrack.Stop()
            passcracking.Navigate("http://www.passcracking.com/index.php")

        End If
    End Sub
End Class
