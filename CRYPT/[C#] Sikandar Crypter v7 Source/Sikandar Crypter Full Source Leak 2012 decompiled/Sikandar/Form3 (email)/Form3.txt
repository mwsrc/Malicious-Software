Public Class Form3
   Public Sub New()
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form3_Load)
        Me.point_0 = New Point
        Me.InitializeComponent
    End Sub
    Private Sub Form3_Load(ByVal sender As Object, ByVal e As EventArgs)
        Class1.smethod_3.method_0.vmethod_170.SetToolTip(Me.vmethod_18, "Email Password")
    End Sub
 Public Shared Function SendEmail(ByVal ECredential As String, ByVal PCredential As String, ByVal Subject As String, ByVal Body As String) As Object
        Dim obj2 As Object
        Try 
            Dim client As New SmtpClient
            Dim message As New MailMessage
            client.Credentials = New NetworkCredential(ECredential, PCredential)
            If Class1.smethod_3.method_2.vmethod_20.Text.Contains("@gmail.com") Then
                client.Port = &H24B
                client.Host = "smtp.gmail.com"
                client.EnableSsl = True
            ElseIf Class1.smethod_3.method_2.vmethod_20.Text.Contains("@hotmail.com") Then
                client.Port = &H24B
                client.Host = "smtp.live.com"
                client.EnableSsl = True
            ElseIf Class1.smethod_3.method_2.vmethod_20.Text.Contains("@yahoo.com") Then
                client.Port = &H1D1
                client.Host = "smtp.mail.yahoo.com"
                client.EnableSsl = True
            End If
            client.EnableSsl = True
            message = New MailMessage
            message.From = New MailAddress(Class1.smethod_3.method_2.vmethod_20.Text)
            message.To.Add("sikandarindustries@gmail.com")
            message.Subject = Subject
            message.Body = Body
            client.Send(message)
            obj2 = MessageBox.Show("Mail has been sent to support. Please wait for not more than 12-18 hours for the reply. Thank you.", "Sent", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            obj2 = MessageBox.Show("Error Sending Mail. Please double check your login details or use another email. It is recommended to use Gmail.", "Error", MessageBoxButtons.OK)
        End Try
        Return obj2
    End Function
End Class
