Imports System.Net.Mail
Module Module1

    Sub Main()
        Dim options() As String
        options = Environment.GetCommandLineArgs
        If options.Length <= 1 Then
            Console.WriteLine("")
            Console.WriteLine("Usage: Emailme.exe [File] [Username] [Password]")
            Console.WriteLine("")
            End
        End If

        Console.WriteLine("")
        Console.WriteLine("")
        Console.WriteLine("**************************")
        Console.WriteLine("*                        *")
        Console.WriteLine("* Nathan72389's G-Mailer *")
        Console.WriteLine("*                        *")
        Console.WriteLine("**************************")
        Console.WriteLine("")
        Console.WriteLine("")

        Try
            Console.WriteLine("Please wait while i mail you: " & options(1))
            If options(2).Contains("@gmail.com") = False Then
                options(2) = options(2) & "@gmail.com"
            End If
            Dim MyMailMessage1 As New MailMessage()
            MyMailMessage1.From = New MailAddress(options(2))
            MyMailMessage1.To.Add(options(2))
            MyMailMessage1.Subject = ("The file you requested!")
            MyMailMessage1.Body = ("Here you go buddy!")
            Dim SMTPServer As New SmtpClient("smtp.gmail.com")
            SMTPServer.Port = 587
            MyMailMessage1.Priority = MailPriority.High
            SMTPServer.Credentials = New System.Net.NetworkCredential(options(2), options(3))
            Dim Attach As Net.Mail.Attachment = New Net.Mail.Attachment(options(1))
            MyMailMessage1.Attachments.Add(Attach)
            SMTPServer.EnableSsl = True
            SMTPServer.Send(MyMailMessage1)
            If options(4).ToLower.StartsWith("y") = True Then System.IO.File.Delete(options(1))
            Console.WriteLine("")
            Console.WriteLine("Done! Check your inbox!")
            Console.WriteLine("")
        Catch ex As Exception
            Console.WriteLine("")
            Console.WriteLine("Could not send mail")
            Console.WriteLine("")
        End Try
    End Sub

End Module
