

Public Class FormGMail

    Private _url As String = String.Empty
    Private _pnt As Int16 = 0
    Private _html As String = String.Empty

    Private Sub DisableControls()

        TextBoxUsername.Enabled = False
        TextBoxPassword.Enabled = False

        ButtonSignin.Enabled = False
        ButtonCancel.Enabled = False
        ButtonDownload.Enabled = False

        TextBoxMy.ResetText()
        TextBoxMost.ResetText()

        DataGridViewGMail.Enabled = False

    End Sub
    Private Sub ButtonCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCancel.Click

        DisableControls()

        _pnt = 0

        TextBoxUsername.Enabled = True
        TextBoxPassword.Enabled = True

        ButtonSignin.Enabled = True
        ButtonCancel.Enabled = True

        DataGridViewGMail.Rows.Clear()
        ToolStripStatusLabelDescription.Text = "Ready."

        Try
            WebBrowserGMail.Navigate("http://mail.google.com/mail/?logout&hl=en")
            _url = "http://www.gmail.com"
            WebBrowserGMail.Navigate(_url)
            ButtonDownload.Enabled = False
            ButtonCancel.Enabled = False
        Catch ex As Exception
            ButtonCancel.Enabled = True
            MessageBox.Show(ex.Message, Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        TextBoxUsername.Focus()

    End Sub
    Private Sub WebBrowserGMail_DocumentCompleted(ByVal sender As Object, ByVal e As System.Windows.Forms.WebBrowserDocumentCompletedEventArgs) Handles WebBrowserGMail.DocumentCompleted

        If _pnt = 1 Then ButtonDownload.Enabled = True
        If _pnt = 3 Then
            _html = String.Empty
            _html = WebBrowserGMail.Document.Body.InnerHtml.ToString()

            Dim _tmpstr As String = String.Empty

            Dim Fpnt As Int32 = 0
            Dim SPnt As Int32 = 0

            Fpnt = InStr(_html, "DIV class=count>") : Fpnt += 15
            _tmpstr = _html.Substring(Fpnt, 15).ToString()
            SPnt = InStr(_tmpstr, "</DIV>")
            TextBoxMy.Text = _tmpstr.Substring(0, (SPnt - 1)).ToString()

            Fpnt = InStr(_html, "DIV class=row nJ=" & """" & "1" & """") : Fpnt += 49
            _tmpstr = _html.Substring(Fpnt, 15).ToString()
            SPnt = InStr(_tmpstr, "</DIV>")
            TextBoxMost.Text = _tmpstr.Substring(0, (SPnt - 1)).ToString()

            For index As Integer = 0 To Convert.ToInt32(TextBoxMy.Text) - 1
                DataGridViewGMail.Rows.Add()

                If index = 10 Then index = 10

                _tmpstr = String.Empty
                _tmpstr = "INPUT id=CCL" + index.ToString() + " type=checkbox"

                Fpnt = 0 : SPnt = 0
                Fpnt = InStr(_html, _tmpstr)

                If index >= 0 And index <= 9 Then Fpnt += 57
                If index >= 10 And index <= 99 Then Fpnt += 58
                If index >= 100 And index <= 999 Then Fpnt += 59
                If index >= 1000 And index <= 9999 Then Fpnt += 60
                If index >= 10000 And index <= 99999 Then Fpnt += 61

                _tmpstr = _html.Substring(Fpnt, 100).ToString()

                Dim _tmppnt As Int32 = 0
                _tmppnt = InStr(_tmpstr, ">")
                SPnt = InStr(_tmpstr, "<")

                DataGridViewGMail.Rows(index).Cells(0).Value = _tmpstr.Substring(_tmppnt, (SPnt - _tmppnt) - 1)
                DataGridViewGMail.Rows(index).Cells(1).Value = _tmpstr.Substring(0, (_tmppnt - 1))
            Next

        End If

    End Sub
    Private Sub WebBrowserGMail_ProgressChanged(ByVal sender As Object, ByVal e As System.Windows.Forms.WebBrowserProgressChangedEventArgs) Handles WebBrowserGMail.ProgressChanged

        On Error Resume Next

        With PrgStatus
            .Maximum = e.MaximumProgress
            .Value = e.CurrentProgress
        End With

        If e.CurrentProgress = 0 Then
            ToolStripStatusLabelDescription.Text = "Ready ....."
        Else
            ToolStripStatusLabelDescription.Text = "Wait ....."
        End If

    End Sub
    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub
    Private Sub ButtonSignin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonSignin.Click

        If TextBoxUsername.Text.Trim().Length = 0 Then
            MessageBox.Show("Set Username", Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            TextBoxUsername.Focus()
            Exit Sub
        End If

        If TextBoxPassword.Text.Trim().Length = 0 Then
            MessageBox.Show("Set Password", Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            TextBoxPassword.Focus()
            Exit Sub
        End If

        Me.Cursor = Cursors.WaitCursor

        Try
            ButtonSignin.Enabled = False
            ButtonCancel.Enabled = False

            _pnt = 1
            With WebBrowserGMail
                .Document.GetElementById("Email").Focus()
                .Document.GetElementById("Email").InnerText = TextBoxUsername.Text.Trim()
                .Document.GetElementById("Passwd").Focus()
                .Document.GetElementById("Passwd").InnerText = TextBoxPassword.Text.Trim()
                .Document.GetElementById("signIn").RaiseEvent("onClick")
            End With
            SendKeys.Send("{ENTER}")

            ButtonDownload.Enabled = True
            ButtonCancel.Enabled = True

        Catch ex As Exception
            MessageBox.Show(ex.Message, Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)

            TextBoxUsername.Enabled = True
            TextBoxPassword.Enabled = True

            ButtonSignin.Enabled = True
            ButtonCancel.Enabled = True

            TextBoxMy.ResetText()
            TextBoxMost.ResetText()

            DataGridViewGMail.Enabled = False

        End Try

        Me.Cursor = Cursors.Default

    End Sub
    Private Sub FormGMail_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Try
            _url = "http://www.gmail.com"
            WebBrowserGMail.Navigate(_url)
            ButtonDownload.Enabled = False
        Catch ex As Exception
            MessageBox.Show(ex.Message, Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub
    Private Sub ButtonDownload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonDownload.Click

        _pnt = 2

        Try
            ButtonDownload.Enabled = False
            _url = String.Empty
            _url = "http://mail.google.com/mail/contacts/ui/ContactManager"
            WebBrowserGMail.Navigate(_url)
            _pnt = 3
        Catch ex As Exception
            MessageBox.Show(ex.Message, Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
            ButtonDownload.Enabled = True
        End Try

        ButtonSignin.Enabled = True
        ButtonCancel.Enabled = True

    End Sub

End Class