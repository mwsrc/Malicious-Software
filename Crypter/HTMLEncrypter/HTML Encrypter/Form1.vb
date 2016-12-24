Imports HTML_Encrypter.My
Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Threading
Imports System.Windows.Forms

Public Class Form1
    Public Sub New()
        Form1.__ENCAddToList(Me)
        Me.InitializeComponent()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Me.TextBox1.Text <> "") Then

            Try
                Me.WebBrowser1.Document.GetElementById("code").SetAttribute("value", TextBox1.Text)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError()
            End Try

            Dim enumerator As IEnumerator
            Try
                enumerator = Me.WebBrowser1.Document.GetElementsByTagName("input").GetEnumerator
                Do While enumerator.MoveNext
                    Dim htmlElement As HtmlElement = CType(enumerator.Current, HtmlElement)
                    If (htmlElement.GetAttribute("type") = "submit") Then
                        htmlElement.InvokeMember("click")
                        Dim iMilliSeconds As Integer = 1000
                        Me.iSEC(iMilliSeconds)
                        Me.TextBox2.Text = Me.WebBrowser1.Document.GetElementById("ecode").InnerText
                        Dim text As String = Me.TextBox2.Text
                        Dim str2 As String = Nothing
                        str2 = [text].Replace("<!-- HTML Encryption provided by iWEBTOOL.com -->", "<!-- Dr-Dark Noir -->")
                        Me.TextBox2.Text = str2
                    End If
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If (If((Not disposing OrElse (Me.components Is Nothing)), 0, 1) <> 0) Then
                Me.components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If (Me.TextBox2.Text <> "") Then
            Clipboard.SetText(Me.TextBox2.Text)
            MsgBox("Copied", MsgBoxStyle.Information, "Information")
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If (Me.TextBox2.Text <> "") Then
            Dim dialog As New SaveFileDialog With { _
                .FileName = "", _
                .Title = "Save As ...", _
                .Filter = "HTML Document(*.html)|*.html|All Files|*.*" _
            }
            If (dialog.ShowDialog = DialogResult.OK) Then
                MyProject.Computer.FileSystem.WriteAllText(dialog.FileName, Me.TextBox2.Text, False)
                MessageBox.Show(dialog.FileName, "DONE!")
            End If
        End If
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        MyProject.Forms.About.ShowDialog()
    End Sub
    Public Sub iSEC(ByRef iMilliSeconds As Integer)
        Dim num3 As Integer = CInt(Math.Round(CDbl((CDbl(iMilliSeconds) / 500))))
        Dim i As Integer = 1
        Do While (i <= num3)
            Thread.Sleep(500)
            Application.DoEvents()
            i += 1
        Loop
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Try
            Me.WebBrowser1.Document.GetElementById("code").SetAttribute("value", TextBox1.Text)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub WebBrowser1_DocumentCompleted(sender As Object, e As WebBrowserDocumentCompletedEventArgs) Handles WebBrowser1.DocumentCompleted
        Me.TextBox1.Enabled = True
        Me.TextBox2.Enabled = True
        Me.Button1.Enabled = True
    End Sub
End Class
