Imports System.IO
Public Class Form1

    Dim strin As String = "Omegle Spam"
    Private Declare Function GetForegroundWindow Lib "user32.dll" () As Int32
    Private Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hwnd As Int32, ByVal lpString As String, ByVal cch As Int32) As Int32
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        WebBrowser1.Navigate("omegle.com")

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Tid As Integer
        Tid = TextBox3.Text
        Timer1.Interval = Tid

        If GetActiveWindowTitle() = strin Then
            Dim X As Integer
            Dim Y As Integer
            X = TextBox1.Text
            Y = TextBox2.Text

            Windows.Forms.Cursor.Position = New Point(X, Y)
            Do_LMouseClick()

            Timer1.Start()

        Else
            MsgBox("Please have Omegle Spam as your focused window during the spam season")


        End If
    End Sub
    Private Function GetActiveWindowTitle() As String
        Dim MyStr As String
        MyStr = New String(Chr(0), 100)
        GetWindowText(GetForegroundWindow, MyStr, 100)
        MyStr = MyStr.Substring(0, InStr(MyStr, Chr(0)) - 1)
        Return MyStr
    End Function

    Private Sub RichTextBox3_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RichTextBox3.TextChanged

    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim Tid As Integer
        Tid = TextBox4.Text
        Timer2.Interval = Tid
        Dim nisse As String
        nisse = " "
        Dim Katt As String
        Katt = RichTextBox1.Text
        SendKeys.Send(Katt)
        SendKeys.Send("{ENTER}")
        SendKeys.Send(nisse)
        On Error Resume Next
        Timer1.Stop()
        Timer2.Start()

    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        Dim Tid As Integer
        Tid = TextBox5.Text
        Timer3.Interval = Tid
        Dim Katt As String
        Katt = RichTextBox2.Text
        Dim nisse As String
        nisse = " "
        SendKeys.Send(Katt)
        SendKeys.Send("{ENTER}")
        SendKeys.Send(nisse)
        On Error Resume Next
        Timer2.Stop()
        Timer3.Start()
    End Sub

    Private Sub Timer3_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        Dim Tid As Integer
        Tid = TextBox6.Text
        Timer4.Interval = Tid
        Dim nisse As String
        nisse = " "
        Dim Katt As String
        Katt = RichTextBox3.Text
        SendKeys.Send(Katt)
        SendKeys.Send("{ENTER}")
        SendKeys.Send(nisse)
        On Error Resume Next
        Timer3.Stop()
        Timer4.Start()
    End Sub

    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick

        Dim nisse As String
        nisse = " "
        Dim Katt As String
        Katt = RichTextBox4.Text
        SendKeys.Send(Katt)
        SendKeys.Send("{ENTER}")
        SendKeys.Send(nisse)
        On Error Resume Next
        Timer4.Stop()
        Timer5.Start()
    End Sub

    Private Sub Timer5_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5.Tick

        Dim nisse As String
        nisse = " "

        WebBrowser1.Navigate("omegle.com")
        SendKeys.Send("{ENTER}")
        SendKeys.Send("{ENTER}")
        Timer5.Stop()
        Timer7.Start()
    End Sub

    Private Sub WebBrowser1_DocumentCompleted(ByVal sender As System.Object, ByVal e As System.Windows.Forms.WebBrowserDocumentCompletedEventArgs) Handles WebBrowser1.DocumentCompleted

    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Timer6.Start()
    End Sub

    Private Sub Timer6_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer6.Tick
        Label5.Text = Cursor.Position.ToString

    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Timer6.Stop()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Timer1.Stop()
        Timer2.Stop()
        Timer3.Stop()
        Timer4.Stop()
        Timer5.Stop()

    End Sub



    'declaration to enter user32.dll removing invalid entry point error

    Declare Sub mouse_event Lib "user32.dll" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)


    'function to call mouse click

    Sub Do_LMouseClick()
        Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
        Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
    End Sub
    'constant for this code

    Private Const BM_CLICK = &HF5



    'some other helpful constants (optional)
    Public Const MOUSEEVENTF_LEFTDOWN = &H2
    Public Const MOUSEEVENTF_LEFTUP = &H4
    Public Const MOUSEEVENTF_MIDDLEDOWN = &H20
    Public Const MOUSEEVENTF_MIDDLEUP = &H40
    Public Const MOUSEEVENTF_RIGHTDOWN = &H8
    Public Const MOUSEEVENTF_RIGHTUP = &H10
    Public Const MOUSEEVENTF_MOVE = &H1

    Private Sub Timer7_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer7.Tick
        If GetActiveWindowTitle() = strin Then
            Dim X As Integer
            Dim Y As Integer
            X = TextBox1.Text
            Y = TextBox2.Text

            Windows.Forms.Cursor.Position = New Point(X, Y)
            Do_LMouseClick()
            Timer7.Stop()
            Timer1.Start()

        End If
    End Sub



    Private Sub RichTextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RichTextBox1.TextChanged

    End Sub

 
    Private Sub TextBox6_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox6.TextChanged

    End Sub

    Private Sub TextBox3_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox3.TextChanged

    End Sub
End Class
