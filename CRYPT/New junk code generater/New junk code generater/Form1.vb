Imports System.Text


Public Class Form1
    Dim randomNumbers() As String
    Dim randomStrings() As String
    Dim subvalue As Short = 3
    Dim sectionValue As Short = 2

    Dim stringValue As Integer
    Dim numberValue As Integer
    Dim subsProgress As Integer
    Dim functionsProgress As Integer

    Dim sections As Integer
    Dim subs As Integer
    Dim randomNumber1 As Integer
    Dim randomSubs As Integer
    Dim randomSubsProgress As Integer
    Dim randomSubsCodeLine As Integer
    Dim randomFunctionCodeLine As Integer
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CODE SELECTION
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Public Sub codeSelection()


        Dim random As New Random
        Dim ranNum As Integer
        ranNum = random.Next(1, 32)
        Select Case ranNum
            Case 1
                Dim var1 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                textbox1.AppendText(var1 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var1 = String.Empty
            Case 2
                Dim var2 As String = "Dim " & randomStrings(randomNumber) & " As String = " & """" & randomStrings(randomNumber) & """"
                textbox1.AppendText(var2 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var2 = String.Empty

            Case 3
                Dim var3 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                textbox1.AppendText(var3 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)

                var3 = String.Empty
            Case 4
                Dim var4 As String = "Dim " & randomStrings(randomNumber) & " As Long = " & randomNumbers(randomNumber)
                textbox1.AppendText(var4 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var4 = String.Empty

            Case 5
                Dim var5 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                textbox1.AppendText(var5 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var5 = String.Empty

            Case 6
                Dim var6 As String = "Dim " & randomStrings(randomNumber) & " As Boolean = True"
                textbox1.AppendText(var6 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var6 = String.Empty

            Case 7
                Dim var7 As String = "Dim " & randomStrings(randomNumber) & " As Boolean = False"
                textbox1.AppendText(var7 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var7 = String.Empty

            Case 8
                Dim var8 As String = "Dim " & randomStrings(randomNumber) & " As Long = " & randomNumbers(randomNumber)
                textbox1.AppendText(var8 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var8 = String.Empty

            Case 9
                Dim var9 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                textbox1.AppendText(var9 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var9 = String.Empty

            Case 10
                Dim var10 As String = "Dim " & randomStrings(randomNumber) & " As Int64 = " & randomNumbers(randomNumber)
                textbox1.AppendText(var10 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var10 = String.Empty

            Case 11
                Dim var11 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                textbox1.AppendText(var11 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var11 = String.Empty

            Case 12
                Dim var12 As String = "Dim " & randomStrings(randomNumber) & " As Long = " & randomNumbers(randomNumber)
                textbox1.AppendText(var12 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var12 = String.Empty

            Case 13
                Dim var13 As String = "Dim " & randomStrings(randomNumber) & " As Object = " & randomNumbers(randomNumber)
                textbox1.AppendText(var13 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var13 = String.Empty

            Case 14
                Dim var14 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                textbox1.AppendText(var14 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var14 = String.Empty

            Case 15
                Dim var15 As String = "Dim " & randomStrings(randomNumber) & " As ULong = " & randomNumbers(randomNumber)
                textbox1.AppendText(var15 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var15 = String.Empty

            Case 16
                Dim var16 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                textbox1.AppendText(var16 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var16 = String.Empty
            Case 17
                Dim var17 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                textbox1.AppendText(var17 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var17 = String.Empty

            Case 18
                Dim var18 As String = "Dim " & randomStrings(randomNumber) & " As UInt64 = " & randomNumbers(randomNumber)
                textbox1.AppendText(var18 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var18 = String.Empty

            Case 19
                Dim var19 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                textbox1.AppendText(var19 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var19 = String.Empty

            Case 20
                Dim var20 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                textbox1.AppendText(var20 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var20 = String.Empty

            Case 21
                Dim var21 As String = "Dim " & randomStrings(randomNumber) & "(" & ")" & " As String = " & "{" & """" & randomStrings(randomNumber) & """" & "," & """" & randomStrings(randomNumber) & """" & "}"
                textbox1.AppendText(var21 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var21 = String.Empty

            Case 22

                Dim var14 As String = "Dim " & randomStrings(randomNumber) & " As Object = " & randomNumbers(randomNumber)
                Dim var101 As String = "Dim " & randomStrings(randomNumber) & " As Int64 = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var22 As String = "Try" & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & _
           ControlChars.NewLine & var101 & ControlChars.NewLine & "Catch " & randomStrings(randomNumber) & " As Exception" & _
           ControlChars.NewLine & var14 & ControlChars.NewLine & "End Try"
                textbox1.AppendText(var22 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var22 = String.Empty

            Case 23
                Dim var6 As String = "Dim " & randomStrings(randomNumber) & " As Boolean = True"
                System.Threading.Thread.Sleep(1)
                Dim var3 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var1 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var18 As String = "Dim " & randomStrings(randomNumber) & " As Object = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var23 As String = "Do" & ControlChars.NewLine & var1 & ControlChars.NewLine & var18 & ControlChars.NewLine & var6 & ControlChars.NewLine & var3 & ControlChars.NewLine & _
           messyBox(randomStrings(randomNumber) & randomNumbers(randomNumber)) & ControlChars.NewLine & "Loop"
                textbox1.AppendText(var23 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var23 = String.Empty

            Case 24
                Dim var14 As String = "Dim " & randomStrings(randomNumber) & " As Single = " & randomNumbers(randomNumber)
                Dim var6 As String = "Dim " & randomStrings(randomNumber) & " As Boolean = True"
                System.Threading.Thread.Sleep(1)
                Dim var3 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var1 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var18 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var23 As String = "Do" & ControlChars.NewLine & var1 & ControlChars.NewLine & var18 & ControlChars.NewLine & var6 & ControlChars.NewLine & var3 & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & ControlChars.NewLine
                Dim var101 As String = "Dim " & randomStrings(randomNumber) & " As Int64 = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var22 As String = "Try" & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & _
           ControlChars.NewLine & var101 & ControlChars.NewLine & "Catch " & randomStrings(randomNumber) & " As Exception" & _
           ControlChars.NewLine & var14 & ControlChars.NewLine & "End Try"
                System.Threading.Thread.Sleep(1)
                Dim var7 As String = "Dim " & randomStrings(randomNumber) & " As Boolean = False"
                System.Threading.Thread.Sleep(1)
                Dim var11 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var24 As String = "Do While " & randomNumbers(randomNumber) & " <> " & randomNumbers(randomNumber) & ControlChars.NewLine & var23 & ControlChars.NewLine & var22 & ControlChars.NewLine & var7 & ControlChars.NewLine & var11 & ControlChars.NewLine & _
            "Loop" & ControlChars.NewLine & "Loop"
                textbox1.AppendText(var24 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var24 = String.Empty

            Case 25
                Dim var12 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                Dim var25 As String = "If " & randomNumbers(randomNumber) & " = " & randomNumbers(randomNumber) & " Then" & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & ControlChars.NewLine & var12 & ControlChars.NewLine & "End If"
                textbox1.AppendText(var25 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var25 = String.Empty

            Case 26
                Dim var12 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var26 As String = "If " & randomNumbers(randomNumber) & " <> " & randomNumbers(randomNumber) & " Then" & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & ControlChars.NewLine & var12 & ControlChars.NewLine & "End If"
                textbox1.AppendText(var26 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var26 = String.Empty
            Case 27
                Dim var14 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                Dim var3 As String = "Dim " & randomStrings(randomNumber) & " As Double = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var6 As String = "Dim " & randomStrings(randomNumber) & " As Boolean = True"
                System.Threading.Thread.Sleep(1)
                Dim var18 As String = "Dim " & randomStrings(randomNumber) & " As UInt64 = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var11 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var101 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var232 As String = "Do" & ControlChars.NewLine & var11 & ControlChars.NewLine & var18 & ControlChars.NewLine & var6 & ControlChars.NewLine & var3 & ControlChars.NewLine & _
           messyBox(randomStrings(randomNumber)) & ControlChars.NewLine & "Loop"
                System.Threading.Thread.Sleep(1)
                Dim var222 As String = "Try" & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & _
           ControlChars.NewLine & var101 & ControlChars.NewLine & "Catch " & randomStrings(randomNumber) & " As Exception" & _
           ControlChars.NewLine & var14 & ControlChars.NewLine & "End Try"
                System.Threading.Thread.Sleep(1)
                Dim var212 As String = "Dim " & randomStrings(randomNumber) & "(" & ")" & " As String = " & "{" & """" & randomStrings(randomNumber) & """" & "," & """" & randomStrings(randomNumber) & """" & "}"
                System.Threading.Thread.Sleep(1)
                Dim var27 As String = "While True" & ControlChars.NewLine & var212 & ControlChars.NewLine & var222 & ControlChars.NewLine & var232 & ControlChars.NewLine & "End While"
                textbox1.AppendText(var27 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var27 = String.Empty

            Case 28
                Dim var12 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                Dim var15 As String = "Dim " & randomStrings(randomNumber) & " As ULong = " & randomNumbers(randomNumber)
                Dim var28 As String = "While " & randomNumbers(randomNumber) & " <> " & randomNumbers(randomNumber) & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & ControlChars.NewLine & var12 & ControlChars.NewLine & var15 & ControlChars.NewLine & "End While"
                textbox1.AppendText(var28 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var28 = String.Empty

            Case 29
                Dim var29 As String = "Do Until " & randomNumbers(randomNumber) & " >= " & randomNumbers(randomNumber) & ControlChars.NewLine & "Loop"
                textbox1.AppendText(var29 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var29 = String.Empty

            Case 30
                Dim var10 As String = "Dim " & randomStrings(randomNumber) & " As Int64 = " & randomNumbers(randomNumber)
                Dim var30 As String = "Do Until " & randomNumbers(randomNumber) & " = " & randomNumbers(randomNumber) & ControlChars.NewLine & var10 & ControlChars.NewLine & "Loop"
                textbox1.AppendText(var30 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var30 = String.Empty
            Case 31
                Dim var1 As String = "Dim " & randomStrings(randomNumber) & " As Object = " & randomNumbers(randomNumber)
                Dim var14 As String = "Dim " & randomStrings(randomNumber) & " As Object = " & randomNumbers(randomNumber)
                Dim var101 As String = "Dim " & randomStrings(randomNumber) & " As Int64 = " & randomNumbers(randomNumber)
                System.Threading.Thread.Sleep(1)
                Dim var22 As String = "Try" & ControlChars.NewLine & messyBox(randomStrings(randomNumber)) & _
           ControlChars.NewLine & var101 & ControlChars.NewLine & "Catch " & randomStrings(randomNumber) & " As Exception" & _
           ControlChars.NewLine & var1 & ControlChars.NewLine & "End Try"
                Dim var17 As String = "Dim " & randomStrings(randomNumber) & " As Decimal = " & randomNumbers(randomNumber)
                Dim var13 As String = "Dim " & randomStrings(randomNumber) & " As Object = " & randomNumbers(randomNumber)
                Dim var12 As String = "Dim " & randomStrings(randomNumber) & " As Integer = " & randomNumbers(randomNumber)
                Dim var15 As String = messyBox(randomStrings(randomNumber))
                Dim var16 As String = "If " & randomNumbers(randomNumber) & " <= " & randomNumbers(randomNumber) & " Then" & ControlChars.NewLine & var17 & ControlChars.NewLine & "Else" & ControlChars.NewLine & var13 & ControlChars.NewLine & "End If"
                Dim var31 As String = "Select Case True" & ControlChars.NewLine & "Case True" & ControlChars.NewLine & var14 & ControlChars.NewLine & var22 & ControlChars.NewLine & "Case False" & ControlChars.NewLine & var15 & ControlChars.NewLine & var12 & ControlChars.NewLine & "End Select"
                textbox1.AppendText(var31 & ControlChars.NewLine)
                System.Threading.Thread.Sleep(1)
                var31 = String.Empty
            
        End Select
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ GENERATES RANDOM ARRAY INDEX'S
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Public Function randomNumber()
        Dim randomNumGenerator As New Random
        System.Threading.Thread.Sleep(20)
        randomNumber1 = randomNumGenerator.Next(0, 1501)
        Return randomNumber1
    End Function
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\  MAKES TITLE
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Public Function title() As String
        Dim abcd As String = "'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
        Dim mark As String = "'"
        Dim a As String = "'    |==\     /==|     /=====\     |--------\"
        Dim b As String = "'    |   \   /   |    /  ---  \    |   ====  \"
        Dim c As String = "'    |    \ /    |   |   | |   |   |   |  |  |"
        Dim a1 As String = "'    |  |\   /|  |   |   | |   |   |   |  |  |"
        Dim b1 As String = "'    |  | \ / |  |   |   | |   |   |   |  |  |"
        Dim c1 As String = "'    |  |  -  |  |    \  ---  /    |   ++++  /"
        Dim d1 As String = "'    ````     ````     \=====/     |--------/"
        Return abcd & ControlChars.NewLine & abcd & ControlChars.NewLine & abcd & ControlChars.NewLine & abcd & ControlChars.NewLine & _
            mark & ControlChars.NewLine & mark & ControlChars.NewLine & mark & ControlChars.NewLine & mark & ControlChars.NewLine & _
            a & ControlChars.NewLine & b & ControlChars.NewLine & c & ControlChars.NewLine & _
            a1 & ControlChars.NewLine & b1 & ControlChars.NewLine & c1 & ControlChars.NewLine & _
             d1 & ControlChars.NewLine & mark & ControlChars.NewLine & mark & ControlChars.NewLine & mark & ControlChars.NewLine & _
            abcd & ControlChars.NewLine & abcd & ControlChars.NewLine & abcd & ControlChars.NewLine

    End Function
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CREATES A MESSAGEBOX
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Public Function messyBox(ByVal messy As String)
        Dim mess As String = String.Empty
        Dim random As New Random
        Dim randomnum As Integer
        randomnum = random.Next(1, 40)
        Select Case randomnum
            Case 1 To 20
                mess = "MsgBox" & "(" & """" & messy & """" & ")"
            Case 20 To 40
                mess = "MessageBox.Show" & "(" & """" & messy & """" & ")"
        End Select
        Return mess
    End Function
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ FORM CLOSING
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If codeWorker.IsBusy = True Then
            codeWorker.CancelAsync()
        End If
        If stringWorker.IsBusy = True Then
            stringWorker.CancelAsync()
        End If
        End
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ FORM LOAD
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub Form1_Load(ByVal sender As System.Object, _
            ByVal e As System.EventArgs) Handles MyBase.Load
        Button1.Enabled = False
        Button4.Enabled = False
        Button5.Enabled = False

        CheckForIllegalCrossThreadCalls = False
        subValueNumeric.Value = subvalue
        sectionValueNumeric.Value = sectionValue

        stringWorker.RunWorkerAsync()
        System.Threading.Thread.Sleep(1000)
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CREATES RANDOM WORDS
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub stringWorker1_DoWork(ByVal sender As Object, _
            ByVal e As System.ComponentModel.DoWorkEventArgs) Handles stringWorker.DoWork

        Dim rand As New Random()
        Dim numOFwords As Integer = 1501
        Dim genword(numOFwords - 1) As String
        Dim letter_num As Integer
        Dim letters() As Char = "0123456789".ToCharArray()
        For i As Integer = 0 To numOFwords - 1
            numberValue = i
            stringWorker.ReportProgress(0)
            Dim string_builder As New StringBuilder()
            Dim randomNumGen As New Random
            Dim randomNum As Integer
            randomNum = randomNumGen.Next(1, 10)
            Dim numLetters As Integer = randomNum
            For j As Integer = 1 To numLetters
                letter_num = rand.Next(0, _
                     letters.Length - 1)
                string_builder.Append(letters(letter_num))
                System.Threading.Thread.Sleep(0.7)
            Next j
            genword(i) = string_builder.ToString()
        Next i
        randomNumbers = genword


        Dim rand1 As New Random()
        Dim numOFwords1 As Integer = 1501
        Dim genword1(numOFwords1 - 1) As String
        Dim letter_num1 As Integer
        Dim letters1() As Char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".ToCharArray()
        For i As Integer = 0 To numOFwords1 - 1
            stringValue = i
            stringWorker.ReportProgress(0)
            Dim string_builder As New StringBuilder()
            Dim randomNumGen As New Random
            Dim randomNum As Integer
            randomNum = randomNumGen.Next(15, 130)
            Dim numLetters As Integer = randomNum
            For j As Integer = 1 To numLetters
                letter_num1 = rand1.Next(0, _
                     letters1.Length - 1)
                string_builder.Append(letters1(letter_num1))
                System.Threading.Thread.Sleep(0.5)
            Next j
            genword1(i) = string_builder.ToString()
        Next i
        randomStrings = genword1


    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ REPORTS PROGRESS IN PROGRESSBAR
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub stringWorker1_ProgressChanged(ByVal sender As Object, _
        ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles stringWorker.ProgressChanged
        Try
            Dim progressBarValue As Integer
            progressBarValue = stringValue + numberValue
            ProgressBar1.Maximum = 3000
            ProgressBar1.Value = progressBarValue
            Label1.Text = ProgressBar1.Value.ToString
           
            If ProgressBar1.Value = 1500 Then
                Label2.Text = "Almost finished......"
            End If
           

        Catch ex As Exception

        End Try
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CLEANS UP WORKER
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub stringWorker1_RunWorkerCompleted(ByVal sender As Object, _
            ByVal e As System.ComponentModel.RunWorkerCompletedEventArgs) Handles stringWorker.RunWorkerCompleted
        Beep()
        ProgressBar1.Value = 0
        Label2.Text = ""
        stringValue = 0
        numberValue = 0
        Label1.Text = ""
        Button1.Enabled = True
        Button4.Enabled = True
        Button5.Enabled = True

        Button1.Focus()
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CREATES CODE
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub codeWorker_DoWork(ByVal sender As Object, _
        ByVal e As System.ComponentModel.DoWorkEventArgs) Handles codeWorker.DoWork
        Dim selectClass As Integer
        Dim randomOne As New Random
        selectClass = randomOne.Next(1, 100)
        Select Case selectClass
            Case 1 To 50
                Do Until sections = sectionValueNumeric.Value
                    sections = sections + 1
                    If textbox1.Text = "" Then
                        textbox1.AppendText(title() & ControlChars.NewLine)
                        textbox1.AppendText("Public Class " & randomStrings(randomNumber) & ControlChars.NewLine)
                    Else
                        textbox1.AppendText("Partial Class " & randomStrings(randomNumber) & ControlChars.NewLine)
                    End If
                    Do Until subs = subValueNumeric.Value
                        subs = subs + 1
                        Dim selectsub As Integer
                        Dim randomTwo As New Random
                        selectsub = randomTwo.Next(1, 100)
                        Select Case selectsub
                            Case 1 To 50
                                textbox1.AppendText("Public Sub " & randomStrings(randomNumber) & "()" & ControlChars.NewLine)
                                Dim selectlines As Integer
                                Dim randomThree As New Random
                                selectlines = randomThree.Next(10, 20)
                                Dim randomLines As Integer
                                Do Until randomLines = selectlines
                                    codeWorker.ReportProgress(0)
                                    randomLines = randomLines + 1
                                    subsProgress = randomLines
                                    codeSelection()
                                    System.Threading.Thread.Sleep(5)
                                    randomNumber1 = 0
                                Loop
                                textbox1.AppendText("End Sub" & ControlChars.NewLine & ControlChars.NewLine)
                                randomLines = 0
                                selectlines = 0
                            Case 51 To 100
                                textbox1.AppendText("Public Function " & randomStrings(randomNumber) & "()" & ControlChars.NewLine)
                                Dim selectlines As Integer
                                Dim randomThree As New Random
                                selectlines = randomThree.Next(10, 25)
                                Dim randomLines As Integer
                                Do Until randomLines = selectlines
                                    codeWorker.ReportProgress(0)
                                    randomLines = randomLines + 1
                                    functionsProgress = randomLines
                                    codeSelection()
                                    System.Threading.Thread.Sleep(5)
                                    randomNumber1 = 0
                                Loop
                                textbox1.AppendText("Return " & randomNumbers(randomNumber) & ControlChars.NewLine)
                                textbox1.AppendText("End Function" & ControlChars.NewLine & ControlChars.NewLine)
                                randomLines = 0
                                selectlines = 0
                        End Select
                    Loop
                    subs = 0
                    textbox1.AppendText("End Class" & ControlChars.NewLine & ControlChars.NewLine)
                Loop
            Case 51 To 100
                Do Until sections = sectionValueNumeric.Value
                    sections = sections + 1
                    If textbox1.Text = "" Then
                        textbox1.AppendText(title() & ControlChars.NewLine)
                        textbox1.AppendText("Module " & randomStrings(randomNumber) & ControlChars.NewLine)
                    Else
                        textbox1.AppendText("Module " & randomStrings(randomNumber) & ControlChars.NewLine)
                    End If
                    Do Until subs = subValueNumeric.Value
                        subs = subs + 1
                        Dim selectsub As Integer
                        Dim randomTwo As New Random
                        selectsub = randomTwo.Next(1, 100)
                        Select Case selectsub
                            Case 1 To 50
                                textbox1.AppendText("Public Sub " & randomStrings(randomNumber) & "()" & ControlChars.NewLine)
                                Dim selectlines As Integer
                                Dim randomThree As New Random
                                selectlines = randomThree.Next(10, 20)
                                Dim randomLines As Integer
                                Do Until randomLines = selectlines
                                    codeWorker.ReportProgress(0)
                                    randomLines = randomLines + 1
                                    subsProgress = randomLines
                                    codeSelection()
                                    System.Threading.Thread.Sleep(5)
                                    randomNumber1 = 0
                                Loop
                                textbox1.AppendText("End Sub" & ControlChars.NewLine & ControlChars.NewLine)
                                randomLines = 0
                                selectlines = 0
                            Case 51 To 100
                                textbox1.AppendText("Public Function " & randomStrings(randomNumber) & "()" & ControlChars.NewLine)
                                Dim selectlines As Integer
                                Dim randomThree As New Random
                                selectlines = randomThree.Next(10, 25)
                                Dim randomLines As Integer
                                Do Until randomLines = selectlines
                                    codeWorker.ReportProgress(0)
                                    randomLines = randomLines + 1
                                    functionsProgress = randomLines
                                    codeSelection()
                                    System.Threading.Thread.Sleep(5)
                                    randomNumber1 = 0
                                Loop
                                textbox1.AppendText("Return " & randomNumbers(randomNumber) & ControlChars.NewLine)
                                textbox1.AppendText("End Function" & ControlChars.NewLine & ControlChars.NewLine)
                                randomLines = 0
                                selectlines = 0
                        End Select
                    Loop
                    subs = 0
                    textbox1.AppendText("End Module" & ControlChars.NewLine & ControlChars.NewLine)
                Loop

        End Select


    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ REPORTS CODE PROGRESS
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub codeWorker_ProgressChanged(ByVal sender As Object, _
    ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles codeWorker.ProgressChanged
        Try
            Dim progressBarValue As Integer
            progressBarValue = subsProgress + functionsProgress
            ProgressBar1.Maximum = 30
            ProgressBar1.Value = progressBarValue

        Catch ex As Exception

        End Try
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CLEANS UP CODE WORKER
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub codeWorker_RunWorkerCompleted(ByVal sender As Object, _
    ByVal e As System.ComponentModel.RunWorkerCompletedEventArgs) Handles codeWorker.RunWorkerCompleted
        subsProgress = 0
        functionsProgress = 0
        ProgressBar1.Value = 0

        sections = 0
        subs = 0
        randomSubsCodeLine = 0
        randomFunctionCodeLine = 0
        randomSubsProgress = 0
        randomSubs = 0
        Beep()
        Button1.Enabled = True
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ STARTS CODE WORKER
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text <> "" Then
            TextBox1.Text = ""
        End If
        codeWorker.RunWorkerAsync()
        Button1.Enabled = False
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CLEARS TEXTBOX
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        TextBox1.Text = ""
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ SAVES CODE TO A VB FILE
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim sfd As New SaveFileDialog
        Dim path As String
        With sfd
            sfd.DefaultExt = "vb"
            sfd.Filter = "Visual Basic File (*.vb)|*.vb"
            sfd.FilterIndex = 1
            sfd.FileName = ""
            If sfd.ShowDialog(Me) = 1 Then
                path = sfd.FileName
                My.Computer.FileSystem.WriteAllText(path, TextBox1.Text, True)
                MsgBox("Junk Code Saved")
            End If
        End With
        Button1.Focus()
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CHANGES BUTTON IMAGES START
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    Private Sub Button1_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.MouseHover
        Button1.BackgroundImage = My.Resources.Metal_L
    End Sub

    Private Sub Button1_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.MouseLeave
        Button1.BackgroundImage = My.Resources.MetalCyan_D
    End Sub

    Private Sub Button4_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.MouseHover
        Button4.BackgroundImage = My.Resources.Metal_L
    End Sub

    Private Sub Button4_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.MouseLeave
        Button4.BackgroundImage = My.Resources.MetalCyan_D
    End Sub

    Private Sub Button5_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.MouseHover
        Button5.BackgroundImage = My.Resources.Metal_L
    End Sub

    Private Sub Button5_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.MouseLeave
        Button5.BackgroundImage = My.Resources.MetalCyan_D
    End Sub
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    '\\\\\\ CHANGES BUTTON IMAGES END
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
End Class
