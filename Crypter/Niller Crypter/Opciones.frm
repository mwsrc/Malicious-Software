VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form opc 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Opciones - Niller Crypter"
   ClientHeight    =   4245
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   8385
   BeginProperty Font 
      Name            =   "Myriad Pro"
      Size            =   9
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   8385
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Icono"
      Height          =   1695
      Left            =   6600
      TabIndex        =   56
      Top             =   120
      Width           =   1455
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   480
         ScaleHeight     =   465
         ScaleWidth      =   465
         TabIndex        =   61
         Top             =   360
         Width           =   495
      End
      Begin MSComDlg.CommonDialog CD 
         Left            =   -240
         Top             =   1680
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.TextBox icontxt 
         Enabled         =   0   'False
         Height          =   330
         Left            =   120
         TabIndex        =   58
         Top             =   1080
         Width           =   1215
      End
      Begin VB.CheckBox iconcheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Cambiar"
         Height          =   225
         Left            =   240
         TabIndex        =   57
         Top             =   840
         Width           =   1095
      End
   End
   Begin VB.Frame Frame5 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Extras"
      Height          =   855
      Left            =   4920
      TabIndex        =   51
      Top             =   120
      Width           =   1215
      Begin VB.CheckBox f2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Melt"
         Height          =   255
         Left            =   120
         TabIndex        =   52
         Top             =   240
         Width           =   975
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   53
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "EOF"
         Height          =   255
         Left            =   360
         TabIndex        =   54
         Top             =   480
         Width           =   375
      End
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Guardar"
      Height          =   375
      Left            =   3720
      TabIndex        =   46
      Top             =   3840
      Width           =   1695
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00C0C0C0&
      Height          =   1575
      Left            =   120
      TabIndex        =   34
      Top             =   2160
      Width           =   3255
      Begin VB.CheckBox todos 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Todos"
         Height          =   255
         Left            =   2400
         TabIndex        =   55
         Top             =   0
         Width           =   855
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Threat Expert"
         Height          =   255
         Index           =   9
         Left            =   1560
         TabIndex        =   45
         Top             =   1200
         Width           =   1575
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Anubis"
         Height          =   255
         Index           =   8
         Left            =   1560
         TabIndex        =   44
         Top             =   960
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sandboxie"
         Height          =   255
         Index           =   7
         Left            =   1560
         TabIndex        =   43
         Top             =   720
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "CW-Sanbox"
         Height          =   255
         Index           =   6
         Left            =   1560
         TabIndex        =   42
         Top             =   480
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "JoeBox"
         Height          =   255
         Index           =   5
         Left            =   1560
         TabIndex        =   41
         Top             =   240
         Width           =   1575
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "RegShot"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   40
         Top             =   1200
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "OllyDBG"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   39
         Top             =   960
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "VMWare"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   38
         Top             =   720
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Virtual-Box"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   37
         Top             =   480
         Width           =   1335
      End
      Begin VB.CheckBox anticheckn 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Virtual-PC"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   36
         Top             =   240
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Anti-Debugger"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   0
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0C0&
      Height          =   1815
      Left            =   6240
      TabIndex        =   27
      Top             =   1920
      Width           =   2055
      Begin VB.CheckBox d4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Outpost Firewall"
         Height          =   255
         Left            =   120
         TabIndex        =   60
         Top             =   1200
         Width           =   1815
      End
      Begin VB.CheckBox d5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Avira Antivir"
         Height          =   255
         Left            =   120
         TabIndex        =   33
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CheckBox d3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Firewall Windows"
         Height          =   255
         Left            =   120
         TabIndex        =   32
         Top             =   960
         Width           =   1815
      End
      Begin VB.CheckBox d2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Restaurar Sistema"
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   720
         Width           =   1815
      End
      Begin VB.CheckBox d1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Adm. de Tareas"
         Height          =   255
         Left            =   120
         TabIndex        =   30
         Top             =   480
         Width           =   1815
      End
      Begin VB.CheckBox d0 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Regedit"
         Height          =   255
         Left            =   120
         TabIndex        =   29
         Top             =   240
         Width           =   975
      End
      Begin VB.Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Deshabilitar"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   0
         Width           =   975
      End
   End
   Begin VB.Frame marco 
      BackColor       =   &H00C0C0C0&
      Height          =   1575
      Left            =   3480
      TabIndex        =   16
      Top             =   2160
      Width           =   2655
      Begin VB.OptionButton e9 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Serpent"
         Height          =   255
         Left            =   1440
         TabIndex        =   59
         Top             =   1200
         Width           =   1095
      End
      Begin VB.OptionButton e3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Gost"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   960
         Width           =   975
      End
      Begin VB.OptionButton e8 
         BackColor       =   &H00C0C0C0&
         Caption         =   "BlowFish"
         Height          =   255
         Left            =   1440
         TabIndex        =   25
         Top             =   960
         Width           =   1095
      End
      Begin VB.OptionButton e7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "TwoFish"
         Height          =   255
         Left            =   1440
         TabIndex        =   24
         Top             =   720
         Width           =   1095
      End
      Begin VB.OptionButton e6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "TEA"
         Height          =   255
         Left            =   1440
         TabIndex        =   23
         Top             =   480
         Width           =   1095
      End
      Begin VB.OptionButton e5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "DES"
         Height          =   255
         Left            =   1440
         TabIndex        =   22
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton e2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "SkipJack"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   720
         Width           =   1095
      End
      Begin VB.OptionButton e1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "XOR"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   480
         Width           =   735
      End
      Begin VB.OptionButton e4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ClsCryptAPI"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   1200
         Width           =   1455
      End
      Begin VB.OptionButton e0 
         BackColor       =   &H00C0C0C0&
         Caption         =   "RC4"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   240
         Value           =   -1  'True
         Width           =   735
      End
      Begin VB.Label label 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Encriptacion"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   0
         Width           =   975
      End
   End
   Begin VB.Frame Errorfake 
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   1935
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      Begin VB.CheckBox errorusechk 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Usar Error"
         Height          =   195
         Left            =   3120
         TabIndex        =   14
         Top             =   0
         Width           =   1215
      End
      Begin VB.OptionButton aboutretry 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Abort,Retry,Ignore"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   2
         Left            =   120
         TabIndex        =   11
         Top             =   720
         Width           =   2055
      End
      Begin VB.OptionButton okcancel 
         BackColor       =   &H00C0C0C0&
         Caption         =   "OK,Cancel"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   10
         Top             =   480
         Width           =   1335
      End
      Begin VB.OptionButton okc 
         BackColor       =   &H00C0C0C0&
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Value           =   -1  'True
         Width           =   735
      End
      Begin VB.CommandButton exclamation 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   3000
         Picture         =   "Opciones.frx":0000
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton information 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   3720
         Picture         =   "Opciones.frx":050E
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton error 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2280
         Picture         =   "Opciones.frx":0AA6
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox msg 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Myriad Pro"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1320
         TabIndex        =   5
         Text            =   "Estoy Usando Niller Crypter"
         Top             =   1080
         Width           =   2895
      End
      Begin VB.TextBox titmsg 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Myriad Pro"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Text            =   "Niller"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.CommandButton probar 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Probar"
         Height          =   375
         Left            =   480
         TabIndex        =   3
         Top             =   1440
         Width           =   1335
      End
      Begin VB.TextBox msgnumber 
         Alignment       =   2  'Center
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3600
         TabIndex        =   2
         Text            =   "16"
         Top             =   1440
         Width           =   615
      End
      Begin VB.CommandButton erroruse 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Usar Error"
         Height          =   375
         Left            =   2040
         TabIndex        =   1
         Top             =   1440
         Width           =   1335
      End
      Begin VB.TextBox boton 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3480
         TabIndex        =   12
         Text            =   "vbOKOnly"
         Top             =   1560
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.TextBox tipo 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3960
         TabIndex        =   13
         Text            =   "vbCritical"
         Top             =   1560
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Mensaje Fake"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   0
         Width           =   1095
      End
   End
   Begin VB.Frame Frame4 
      BackColor       =   &H00C0C0C0&
      Height          =   855
      Left            =   4920
      TabIndex        =   47
      Top             =   1200
      Width           =   1215
      Begin VB.CheckBox f1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "P2P"
         Height          =   255
         Left            =   120
         TabIndex        =   50
         Top             =   240
         Width           =   735
      End
      Begin VB.CheckBox f0 
         BackColor       =   &H00C0C0C0&
         Caption         =   "USB"
         Height          =   255
         Left            =   120
         TabIndex        =   49
         Top             =   480
         Width           =   735
      End
      Begin VB.Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "iSpread"
         Height          =   255
         Left            =   120
         TabIndex        =   48
         Top             =   0
         Width           =   615
      End
   End
End
Attribute VB_Name = "opc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
opc.Hide
End Sub

Private Sub aboutretry_Click(Index As Integer)
boton.Text = "vbAbortRetryIgnore"
End Sub
Private Sub error_Click()
tipo.Text = "vbCritical"
End Sub
Private Sub exclamation_Click()
tipo.Text = "vbExclamation"
End Sub

Private Sub iconshow_Click()
With CD
.DialogTitle = "Elija un Icono"
.Filter = "Iconos|*.ico"
.ShowOpen
If Not CD.Filename = vbNullString Then
icontxt.Text = CD.Filename
iconshow.Picture = LoadPicture(CD.Filename)
End If
End With
End Sub

Private Sub information_Click()
tipo.Text = "vbInformation"
End Sub

Private Sub Label6_Click()
MsgBox "No es necesario marcar esta opcion , el crypter auto-detecta el EOF", vbInformation, Niller.Caption
End Sub

Private Sub okc_Click(Index As Integer)
boton.Text = "vbOKOnly"
End Sub
Private Sub okcancel_Click(Index As Integer)
boton.Text = "vbOKCancel"
End Sub
Private Sub erroruse_Click()
Dim plus As String, mensaje As String, titulo As String, total As String, numero As String
mensaje = msg.Text
titulo = titmsg.Text
plus = " + "
total = boton.Text + plus + tipo.Text
errorusechk.Value = vbChecked
If total = "vbOKOnly + vbCritical" Then
numero = "16"
End If
If total = "vbOKOnly + vbInformation" Then
numero = "64"
End If
If total = "vbOKOnly + vbExclamation" Then
numero = "48"
End If
If total = "vbOKCancel + vbCritical" Then
numero = "17"
End If
If total = "vbOKCancel + vbInformation" Then
numero = "65"
End If
If total = "vbOKCancel + vbExclamation" Then
numero = "49"
End If
If total = "vbAbortRetryIgnore + vbCritical" Then
numero = "18"
End If
If total = "vbAbortRetryIgnore + vbInformation" Then
numero = "66"
End If
If total = "vbAbortRetryIgnore + vbExclamation" Then
numero = "50"
End If
msgnumber.Text = numero
End Sub

Private Sub Picture1_Click()
With CD
.DialogTitle = "Seleccionar Icono"
.Filter = "Icono|*.ico"
.ShowOpen
If Not CD.Filename = vbNullString Then
iconcheckn.Value = vbChecked
icontxt.Text = CD.Filename
Picture1.Picture = LoadPicture(CD.Filename)
End If
End With

End Sub

Private Sub probar_Click()
Dim plus As String, mensaje As String, titulo As String, total As String, numero As String
mensaje = msg.Text
titulo = titmsg.Text
plus = " + "
total = boton.Text + plus + tipo.Text
If total = "vbOKOnly + vbCritical" Then
numero = "16"
End If
If total = "vbOKOnly + vbInformation" Then
numero = "64"
End If
If total = "vbOKOnly + vbExclamation" Then
numero = "48"
End If
If total = "vbOKCancel + vbCritical" Then
numero = "17"
End If
If total = "vbOKCancel + vbInformation" Then
numero = "65"
End If
If total = "vbOKCancel + vbExclamation" Then
numero = "49"
End If
If total = "vbAbortRetryIgnore + vbCritical" Then
numero = "18"
End If
If total = "vbAbortRetryIgnore + vbInformation" Then
numero = "66"
End If
If total = "vbAbortRetryIgnore + vbExclamation" Then
numero = "50"
End If
MsgBox mensaje, numero, titulo
msgnumber.Text = numero
End Sub

Private Sub todos_Click()
If todos.Value = vbChecked Then
anticheckn(0).Value = vbChecked
anticheckn(1).Value = vbChecked
anticheckn(2).Value = vbChecked
anticheckn(3).Value = vbChecked
anticheckn(4).Value = vbChecked
anticheckn(5).Value = vbChecked
anticheckn(6).Value = vbChecked
anticheckn(7).Value = vbChecked
anticheckn(8).Value = vbChecked
anticheckn(9).Value = vbChecked
Else
anticheckn(0).Value = False
anticheckn(1).Value = False
anticheckn(2).Value = False
anticheckn(3).Value = False
anticheckn(4).Value = False
anticheckn(5).Value = False
anticheckn(6).Value = False
anticheckn(7).Value = False
anticheckn(8).Value = False
anticheckn(9).Value = False
End If
End Sub
