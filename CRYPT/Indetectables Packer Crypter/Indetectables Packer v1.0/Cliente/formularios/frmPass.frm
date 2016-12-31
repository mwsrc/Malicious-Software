VERSION 5.00
Begin VB.Form frmPass 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Log-In"
   ClientHeight    =   2520
   ClientLeft      =   5160
   ClientTop       =   4665
   ClientWidth     =   4800
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2520
   ScaleWidth      =   4800
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Log-In"
      Height          =   1575
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   4575
      Begin Proyecto1.Button Button1 
         Height          =   375
         Left            =   3240
         TabIndex        =   7
         Top             =   1080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         ButtonStyle     =   8
         BackColor       =   -2147483647
         BackColorPressed=   -2147483647
         BackColorHover  =   -2147483647
         BorderColor     =   -2147483647
         BorderColorPressed=   -2147483647
         BorderColorHover=   -2147483647
         ForeColor       =   16777215
         ForeColorPressed=   16777215
         ForeColorHover  =   16777215
         Caption         =   "OK"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   960
         PasswordChar    =   "*"
         TabIndex        =   5
         Top             =   720
         Width           =   3495
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   960
         TabIndex        =   3
         Top             =   480
         Width           =   3495
      End
      Begin VB.Label Label2 
         Caption         =   "Inserte Password/Nombre de Usuario"
         ForeColor       =   &H0000C000&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1200
         Width           =   2895
      End
      Begin VB.Label lblPass 
         Caption         =   "Password:"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   735
      End
      Begin VB.Label lblUser 
         Caption         =   "Usuario:"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   615
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "Indetectables Packer v1.0"
      BeginProperty Font 
         Name            =   "My Puma"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4575
   End
End
Attribute VB_Name = "frmPass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Button1_Click()

If Text1.Text = "WRSoft" And Text2.Text = "759123coder" Then
    MsgBox "Te lo has ganado, Puedes disfrutar del Software, las cosas se ganan!." & vbNewLine & "Att: [W]HITE~[R]00T & DARK_J4V13R" & vbNewLine & "Pronto vendra otras versiones con un nivel de crackeo más avanzado!" & vbNewLine & "Visita Www.Indetectables.Net", vbInformation
    Form1.Show
Unload Me

Else
    MsgBox "             ERROR" & vbNewLine & "Contraseña Incorrecta!", vbCritical
    Label2.Caption = "Contraseña Incorrecta!"
    Label2.ForeColor = vbRed
    Text1.Text = Clear
    Text2.Text = Clear
End If
End Sub
