VERSION 5.00
Begin VB.Form FrmNotify 
   BackColor       =   &H0099FF99&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   855
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3255
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   855
   ScaleWidth      =   3255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackColor       =   &H00009900&
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   3105
      TabIndex        =   2
      Top             =   30
      Width           =   135
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00009900&
      Caption         =   "Transferencia completa"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   250
      Left            =   0
      TabIndex        =   1
      Top             =   10
      Width           =   3255
   End
   Begin VB.Image Image1 
      Height          =   360
      Left            =   120
      Stretch         =   -1  'True
      Top             =   360
      Width           =   360
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H0099FF99&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   600
      TabIndex        =   0
      Top             =   435
      Width           =   525
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00009900&
      Height          =   855
      Left            =   0
      Top             =   0
      Width           =   3255
   End
End
Attribute VB_Name = "FrmNotify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Label3_Click()
    ShowHide Me
End Sub
