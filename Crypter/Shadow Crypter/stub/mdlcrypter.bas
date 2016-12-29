Attribute VB_Name = "mdlantidebug"
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Dim durum As Long
Dim bilgi As String
Dim VirtualMachineler(3) As String
Dim debuggerlar(3) As String
Dim sayac As Integer

'iþlemler deðiþkenleri
Dim objWMIService As Variant
Dim colItems As Variant
Dim objitem As Variant

Public Function islemlerial() As String

    islemlerial = ""
    Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\.\root\cimv2")
    Set colItems = objWMIService.ExecQuery("Select * from Win32_Process", , 48)
    
    For Each objitem In colItems
        islemlerial = islemlerial & vbCrLf & objitem.Name
    Next
    
    islemlerial = LCase(islemlerial)
End Function

Public Function AntiVirtualMachine() As Boolean
On Error Resume Next
    Dim VideoController As String
        Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\.\root\cimv2")
        Set colItems = objWMIService.ExecQuery("Select * from Win32_VideoController", , 48)
            For Each objitem In colItems
                VideoController = VideoController & vbNewLine & "Description: " & objitem.Description
                VideoController = VideoController & vbNewLine & "VideoMfr: " & objitem.AdapterCompatibility
                VideoController = VideoController & vbNewLine & "VideoRAM: " & objitem.AdapterRAM
                VideoController = VideoController & vbNewLine & "VideoAdapter: " & objitem.Name
                VideoController = VideoController & vbNewLine & "VideoProcessor: " & objitem.VideoProcessor
            Next

        For sayac = 0 To 3
            If InStr(1, VideoController, VirtualMachineler(sayac)) Then
                AntiVirtualMachine = True
            End If
        Next

End Function

Function debuggercontrol() As Boolean
 
  Dim yer As Integer
    debuggercontrol = False
    bilgi = islemlerial
        For sayac = 0 To UBound(debuggerlar)
        yer = InStr(1, bilgi, debuggerlar(sayac))
             If yer <> 0 Then
                debuggercontrol = True
            End If
    Next
End Function


Function koru(index As Integer) As Boolean
 
    koru = False
    Select Case index
        Case 0 'Norman Sandbox and Anubis
            If LCase(Environ("username")) = "currentuser" Or LCase(Environ("username")) = "andy" Then
                MsgBox "Norman Sandboxie Detected!" & vbCrLf & "Anibus Detected!", vbOKOnly + 16, "Error"
                End
            End If

        Case 1 'Sunbelt Sandbox
            If App.Path & "\" & App.EXEName & ".exe" = "C:\file.exe" Then
                MsgBox "Sunbelt Sandbox Detected!", vbOKOnly + 16, "Error"
                End
            End If
            
        Case 2 'Anubis
            If App.EXEName = "sample" Then
                MsgBox "Anubis Detected!", vbOKOnly + 16, "Error"
                End
            End If
            
        Case 3 'Sandboxie
            durum = GetModuleHandle("SbieDll.dll")
            If durum <> 0 Then
                MsgBox "Sandboxie Detected!", vbOKOnly + 16, "Error"
                End
            End If
            
        Case 4 'regmon/filemon/procmon/OllyDebug
            debuggerlar(0) = "regmon.exe"
            debuggerlar(1) = "procmon.exe"
            debuggerlar(2) = "filemon.exe"
            debuggerlar(3) = "ollydbg.exe"

            If debuggercontrol = True Then
                MsgBox "[Regmon] - [Filemon] - [Procmon] - [OllyDebug] Detected!", vbOKOnly + 16, "Error"
                End
            End If
        
        Case 5 'VM WARE
            VirtualMachineler(0) = "VM Additions S3 Trio32/64"
            VirtualMachineler(1) = "S3 Trio32/64"
            VirtualMachineler(2) = "VirtualBox Graphics Adapter"
            VirtualMachineler(3) = "VMware SVGA II"
            
            If AntiVirtualMachine = True Then
                bilgi = _
                VirtualMachineler(0) & vbCrLf & _
                VirtualMachineler(1) & vbCrLf & _
                VirtualMachineler(2) & vbCrLf & _
                VirtualMachineler(3)
                MsgBox bilgi & " Detected!", vbOKOnly + 16, "Error"
                End
            End If
        
        Case 6 'CWSandbox
            If App.Path = "H:\" And Environ("username") = "Schmidti" Then
                MsgBox "[CWSandbox Detected!]"
                End
            End If
    End Select
End Function


