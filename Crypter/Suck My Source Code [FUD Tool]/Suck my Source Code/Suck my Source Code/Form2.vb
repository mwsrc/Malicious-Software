Public Class Form2
    Dim rndStr As String
    Dim rndZahl As String
    Dim rndType As String
    Private Sub ZufallBuchstaben()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 23
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            rndStr = SB.ToString
        Next x
    End Sub

    Private Sub ZufallZahl()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 7
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "1234567890"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            rndZahl = SB.ToString
        Next x
    End Sub
    Private Sub ZufallType()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 1
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "12345"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            Select Case SB.ToString
                Case 1
                    rndType = "String"
                Case 2
                    rndType = "Integer"
                Case 3
                    rndType = "Single"
                Case 4
                    rndType = "Double"
                Case 5
                    rndType = "Long"
            End Select
        Next x
    End Sub

    Private Sub ComboBoxTrashMethods_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBoxTrashMethods.SelectedIndexChanged
        If ComboBoxTrashMethods.Text = "Simple Goto's" Then
            txtCode.Text = "Goto %RANDOM%" & vbNewLine & "%RANDOM%:"
        ElseIf ComboBoxTrashMethods.Text = "Simple String Delcarations" Then
            txtCode.Text = "Dim %RANDOM% As %RANDOMTYPE%" & vbNewLine & "%RANDOM% = %RANDOMNUMBER%"
        ElseIf ComboBoxTrashMethods.Text = "Simple if's" Then
            txtCode.Text = "if %RANDOMNUMBER% = %RANDOMNUMBER% +1 then end"
        ElseIf ComboBoxTrashMethods.Text = "For Loops" Then
            txtCode.Text = "Dim %RANDOM% As integer" & vbNewLine & "for %RANDOM% = %RANDOMNUMBER% to %RANDOMNUMBER% + 5" & vbNewLine & "Application.DoEvents()" & vbNewLine & "Next %RANDOM%"
        ElseIf ComboBoxTrashMethods.Text = "Do While Loops" Then
            txtCode.Text = "Dim %RANDOM% as integer" & vbNewLine & "%RANDOM% = %RANDOMNUMBER%" & vbNewLine & "Do while %RANDOM% < %RANDOMNUMBER% + 10" & vbNewLine & "%RANDOM% = %RANDOM%+1" & vbNewLine & "Application.DoEvents()" & vbNewLine & "Loop"
        End If
    End Sub


    Private Sub btnPreviewCode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPreviewCode.Click
        ZufallBuchstaben()
        ZufallZahl()
        ZufallType()
        MsgBox(txtCode.Text.Replace("%RANDOM%", rndStr).Replace("%RANDOMNUMBER%", rndZahl).Replace("%RANDOMTYPE%", rndType))
    End Sub

    Private Sub btnDrop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrop.Click
        Dim item As New ListViewItem
        item.Text = txtCode.Text
        Form1.lstTrash.Items.Add(item)
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim item As New ListViewItem
        item.Text = txtCode.Text
        Form1.lstTrash.Items.Add(item)
    End Sub
End Class