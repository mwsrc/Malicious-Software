Imports System.IO

Public Class Form1

    Dim options(), text1 As String
    Dim buttons, ico As Object
    Const FileSplit = "@your_momma_sucks_donkeyballs@"

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        text1 = Space(LOF(1))
        FileGet(1, text1)
        FileClose(1)
        options = Split(text1, FileSplit)
        If options(3) = 1 Then
            buttons = MessageBoxButtons.OK
        End If
        If options(3) = 2 Then
            buttons = MessageBoxButtons.OKCancel
        End If
        If options(3) = 3 Then
            buttons = MessageBoxButtons.YesNo
        End If
        If options(3) = 4 Then
            buttons = MessageBoxButtons.AbortRetryIgnore
        End If
        If options(3) = 5 Then
            buttons = MessageBoxButtons.YesNoCancel
        End If
        If options(3) = 6 Then
            buttons = MessageBoxButtons.RetryCancel
        End If

        If options(4) = 1 Then
            ico = MessageBoxIcon.Error
        End If
        If options(4) = 2 Then
            ico = MessageBoxIcon.Exclamation
        End If
        If options(4) = 3 Then
            ico = MessageBoxIcon.Question
        End If
        If options(4) = 4 Then
            ico = MessageBoxIcon.Information
        End If
       
        MessageBox.Show(options(1), options(2), buttons, ico)
        Me.Close()
        End
    End Sub
End Class
