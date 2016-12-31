Imports System.IO
Imports System.Text

Public Class Form1
    Private Declare Sub Sleep Lib "kernel32" ( _
    ByVal dwMilliseconds As Long)

    Private Sub SkyDarkButton1_Click(sender As Object, e As EventArgs) Handles SkyDarkButton1.Click
        Dim openfd As New OpenFileDialog
        With openfd
            .Filter = "Vbscript (VBS) (*.vbs) | *.vbs"
            .Title = "Choose Your VBS File.."
            .ShowDialog()
        End With
        TextBox1.Text = openfd.FileName
    End Sub

    Private Sub SkyDarkButton2_Click(sender As Object, e As EventArgs) Handles SkyDarkButton2.Click
        If TextBox1.Text = "" Then
            MsgBox("Choose VBS File First ......", MsgBoxStyle.Information)
            End
        End If
        Timer1.Start()
        

    End Sub
    Function RandomKey(minCharacters As Integer, maxCharacters As Integer)
        Dim s As String = "abcdefghijklmnopqrstuvwzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        Static r As New Random
        Dim chactersInString As Integer = r.Next(minCharacters, maxCharacters)
        Dim sb As New StringBuilder
        For i As Integer = 1 To chactersInString
            Dim idx As Integer = r.Next(0, s.Length)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
    Function RandomSep(minCharacters As Integer, maxCharacters As Integer)
        Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+=|\/abcdefghijklmnopqrstuvwz"
        Static r As New Random
        Dim chactersInString As Integer = r.Next(minCharacters, maxCharacters)
        Dim sb As New StringBuilder
        For i As Integer = 1 To chactersInString
            Dim idx As Integer = r.Next(0, s.Length)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
    Function Randomstr(minCharacters As Integer, maxCharacters As Integer)
        Dim s As String = "abcdefghijklmnopqrstuvwzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Static r As New Random
        Dim chactersInString As Integer = r.Next(minCharacters, maxCharacters)
        Dim sb As New StringBuilder
        For i As Integer = 1 To chactersInString
            Dim idx As Integer = r.Next(0, s.Length)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        ProgressBar1.Increment(1.5)
        If ProgressBar1.Value = 30 Then
            Dim key As String = RandomKey(60, 100)
            TextBox2.Text = key
            Dim sep As String = RandomSep(1, 1)
            TextBox3.Text = sep
            Dim temp As String = Path.GetTempFileName() & ".LOG"
            Dim crypt As String = My.Resources.stageone
            crypt = crypt.Replace("%key%", TextBox2.Text)
            crypt = crypt.Replace("%sep%", TextBox3.Text)
            IO.File.AppendAllText("stageone.vbs", crypt)
            IO.File.Copy(IO.Path.GetFullPath(TextBox1.Text), "Temp.vbs", True)
            Sleep(4000)
        End If
        If ProgressBar1.Value = ProgressBar1.Maximum Then
            Dim doit As String = "stageone.vbs"
            Process.Start(doit, ProcessWindowStyle.Hidden).WaitForExit()
            IO.File.Delete("stageone.vbs")
            IO.File.Delete("Temp.vbs")
            Dim thrdbrain As String = My.Resources._3RDBrain
            thrdbrain = thrdbrain.Replace("%key%", TextBox2.Text)
            thrdbrain = thrdbrain.Replace("%sep%", TextBox3.Text)
            Dim final As String = IO.File.ReadAllText("Stageone.txt")
            thrdbrain = thrdbrain.Replace("%Strings%", final)
            thrdbrain = thrdbrain.Replace("%vars%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%1%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%2%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%3%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%4%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%5%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%6%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%7%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%8%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%9%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%10%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%11%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%12%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%13%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%14%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%15%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%16%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%17%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%18%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%19%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%20%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%21%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%22%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%23%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%24%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%25%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%26%", Randomstr(50, 80))
            thrdbrain = thrdbrain.Replace("%27%", Randomstr(50, 80))

            IO.File.AppendAllText("final.vbs", thrdbrain)
            IO.File.Delete("stageone.txt")

            Timer1.Stop()

            MsgBox("VBS File Fully Clean ...... Taakj2005", MsgBoxStyle.Information)
            ProgressBar1.Value = 0

        End If
    End Sub
End Class

