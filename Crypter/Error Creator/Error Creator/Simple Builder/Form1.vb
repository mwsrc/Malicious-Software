Imports System.IO

Public Class Form1
    Dim stub, text1, text2 As String
    Dim bt, ico As Integer
    Const FileSplit = "@your_momma_sucks_donkeyballs@"
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If RadioButton1.Checked = True Then
            bt = 1
        End If
        If RadioButton2.Checked = True Then
            bt = 2
        End If
        If RadioButton3.Checked = True Then
            bt = 3
        End If
        If RadioButton4.Checked = True Then
            bt = 4
        End If
        If RadioButton5.Checked = True Then
            bt = 5
        End If
        If RadioButton6.Checked = True Then
            bt = 6
        End If

        If RadioButton8.Checked = True Then
            ico = 1
        End If
        If RadioButton9.Checked = True Then
            ico = 2
        End If
        If RadioButton12.Checked = True Then
            ico = 3
        End If
         If RadioButton14.Checked = True Then
            ico = 4
        End If
        

        text1 = TextBox1.Text
        text2 = TextBox3.Text

        Dim b As Byte() = My.Resources.stub
        Dim TheFIlePath As String = Application.StartupPath & "\Stub.exe"
        Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath)
        TempFile.Write(b, 0, b.Length)
        TempFile.Close()

        FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)
        If File.Exists("Message Box.exe") Then
            My.Computer.FileSystem.DeleteFile("Message Box.exe")
        End If
        FileOpen(1, Application.StartupPath & "\Message Box.exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & FileSplit & text1 & FileSplit & text2 & FileSplit & bt & FileSplit & ico)
        FileClose(1)
        IO.File.Delete(Application.StartupPath & "\Stub.exe")
        MsgBox("Message Box.exe file was created in " & Application.StartupPath)
    End Sub


    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        System.Diagnostics.Process.Start("http://www.natespages.ucoz.com")
    End Sub
End Class
