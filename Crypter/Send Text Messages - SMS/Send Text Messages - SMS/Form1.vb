Public Class Form1
    'Code From: Temitope Elemeje
    'Email: elemejetope@yahoo.com

    'If you don't have a Username and Password; you can signup for an account at www.budgetsip.biz
    ' Feel Free to contact me if you need help. 

    Private Sub btnSendSMS_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSendSMS.Click

        'Replace "username" with your Budgetsip Account username
        'Replace "password" with your Budgetsip Account password
        'if you don't have a budgetsip account, signup @ www.budgetsip.biz or contact me: elemejetope@yahoo.com

        lblResponse.Text = SendSMS(txtFrom.Text, txtTo.Text, txtMessage.Text, "username", "password")
        txtFrom.Text = ""
        txtTo.Text = ""

    End Sub

    Private Sub txtMessage_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtMessage.TextChanged

        lblCount.Text = Len(txtMessage.Text) & " chars"

    End Sub



    Public Function SendSMS(ByVal strFrom As String, ByVal strTo As String, ByVal strMessage As String, ByVal strUsername As String, ByVal strPassword As String) As String

        Dim strResponse, strURL As String
        Dim GetURL As New System.Net.WebClient

        strURL = "https://www.budgetsip.com/myaccount/sendsms.php?username=" & strUsername & "&password=" & strPassword & "&from=" & strFrom & "&to=" & strTo & "&text=" & strMessage


        Dim data As System.IO.Stream = GetURL.OpenRead(strURL)

        Dim reader As New System.IO.StreamReader(data)
        strResponse = reader.ReadToEnd()
        data.Close()
        reader.Close()

        If InStr(strResponse, "Success", CompareMethod.Text) > 0 Then
            'Sucess
            strResponse = "Successfull"
        ElseIf InStr(strResponse, "Error", CompareMethod.Text) > 0 Then
            'Failure
            strResponse = "Failed"
        End If

        Return strResponse

    End Function

End Class
